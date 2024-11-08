#!/usr/bin/env python
# coding: utf-8

# #### Import Raw Data from Database
#     Name for columns is already changed in this data and Variables are type converted

# In[1]:


from sqlalchemy import create_engine
engine = create_engine("mysql+pymysql://{user}:{pw}@localhost/{db}".format(user='root',pw='Maxima1!',db='project2_360'))


# In[2]:


import pandas as pd
import numpy as np
query="SELECT * FROM cement_data"
raw_cement_data=pd.read_sql_query(query,engine)


# #### EDA

# In[53]:


# count
raw_data_count = len(raw_cement_data)
print("Number of Records:",raw_data_count)


# In[54]:


raw_cement_data.info()


# In[55]:


raw_cement_data.columns


# In[56]:


raw_cement_data.dtypes


# In[57]:


# Duplicate Records
duplicate_count = raw_cement_data.duplicated().sum()
print("No of duplicate records:",duplicate_count)


# In[58]:


raw_cement_data.min()


# In[59]:


raw_cement_data.max()


# In[60]:


raw_cement_data.describe()


# #### First moment business decision

# In[61]:


raw_cement_data.mean()


# In[62]:


raw_cement_data.median()


# In[63]:


raw_cement_data[['mill_tph','clinker_tph', 'gypsum_tph', 'dfa_tph', 'wfa_tph', 'mill_kw', 'mill_il_temp', 'mill_ol_temp', 'mill_ol_be_amp']].mode()


# In[64]:


raw_cement_data[['mill_vent_fan_rpm', 'mill_vent_fan_kw', 'mill_vent_bf_il_draft', 'mill_vent_bf_ol_draft', 'reject', 'sep_rpm', 'sep_kw', 'sep_amp', 'ca_fan_rpm', 'ca_fan_kw', 'mill_folaphone', 'mill_il_draft', 'mill_ol_draft', 'sep_vent_il_draft', 'sep_vent_ol_draft', 'sep_vent_bag_filter_fan_kw', 'sep_vent_bag_filter_fan_rpm', 'residue_45_lu']].mode()


# #### Second moment business decision

# In[65]:


raw_cement_data.var()


# In[66]:


raw_cement_data.std()


# In[67]:


# Range
import pandas as pd

columns_to_calculate_range = [
    'mill_tph', 'clinker_tph', 'gypsum_tph', 'dfa_tph', 'wfa_tph',
    'mill_kw', 'mill_il_temp', 'mill_ol_temp', 'mill_ol_be_amp', 'mill_vent_fan_rpm',
    'mill_vent_fan_kw', 'mill_vent_bf_il_draft', 'mill_vent_bf_ol_draft', 'reject',
    'sep_rpm', 'sep_kw', 'sep_amp', 'ca_fan_rpm', 'ca_fan_kw', 'mill_folaphone',
    'mill_il_draft', 'mill_ol_draft', 'sep_vent_il_draft', 'sep_vent_ol_draft',
    'sep_vent_bag_filter_fan_kw', 'sep_vent_bag_filter_fan_rpm', 'residue_45_lu'
]
# Calculate the range for each column
ranges = []
for column in columns_to_calculate_range:
    col_range = raw_cement_data[column].max() - raw_cement_data[column].min()
    ranges.append(col_range)

# Create a DataFrame to store the results
range_df = pd.DataFrame({'Column': columns_to_calculate_range, 'Range': ranges})

print(range_df)


# #### Third moment business decision
# 

# In[68]:


raw_cement_data.skew()


# #### Fourth moment business decision

# In[69]:


raw_cement_data.kurtosis()


# ### Distribution and Finding Outliers

# In[70]:


import matplotlib.pyplot as plt
from scipy import stats

# List of columns to create Q-Q plots for
columns_cement = [
    'mill_tph', 'clinker_tph', 'gypsum_tph', 'dfa_tph', 'wfa_tph',
    'mill_kw', 'mill_il_temp', 'mill_ol_temp', 'mill_ol_be_amp', 'mill_vent_fan_rpm',
    'mill_vent_fan_kw', 'mill_vent_bf_il_draft', 'mill_vent_bf_ol_draft', 'reject',
    'sep_rpm', 'sep_kw', 'sep_amp', 'ca_fan_rpm', 'ca_fan_kw', 'mill_folaphone',
    'mill_il_draft', 'mill_ol_draft', 'sep_vent_il_draft', 'sep_vent_ol_draft',
    'sep_vent_bag_filter_fan_kw', 'sep_vent_bag_filter_fan_rpm', 'residue_45_lu'
]

# Create subplots
fig, axes = plt.subplots(14, 2, figsize=(20, 100))

# Flatten the axes for easier iteration
axes = axes.flatten()

# Loop through columns and create Q-Q plots
for i, column in enumerate(columns_cement):
    ax = axes[i]

    stats.probplot(raw_cement_data[column], dist='norm', plot=ax)
    ax.set_title(f'Q-Q Plot for {column}', fontsize=16)
    ax.get_lines()[0].set_markerfacecolor('aqua')  # Change marker color
    ax.get_lines()[1].set_color('red')  # Change line color

# Show the plots
plt.show()


# In[71]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats


# In[72]:


# Histogram  - Z-scores
from scipy.stats import zscore

# Calculate Z-scores for the specified columns
zscore_columns = [zscore(raw_cement_data[column]) for column in columns_cement]

# Create subplots
fig, axes = plt.subplots(14, 2, figsize=(20, 100))
axes = axes.flatten()

# Loop through columns and create histograms of Z-scores
for i, column in enumerate(columns_cement):
    ax = axes[i]
    
    sns.histplot(zscore_columns[i], kde=True, ax=ax, color='skyblue')
    ax.set_title(f'Histogram of Z-scores for {column}', fontsize=16)

plt.show()


# In[73]:


# count of outliers using gaussian technique 3std
outliers_count = {}  # Dictionary to store the count of outliers for each column
# Set the threshold for Z-scores
threshold_z = 3
# Calculate the number of outliers for each column
for column in columns_cement:
    z_scores = np.abs(stats.zscore(raw_cement_data[column]))
    outliers_count[column] = np.sum(z_scores > threshold_z)

# Print the number of outliers for each column
for column, count in outliers_count.items():
    print(f"outliers_in_{column}: {count}")
print("Total_outliers:",sum(outliers_count.values()))


# In[74]:


#  Boxplots
fig, axes = plt.subplots(14, 2, figsize=(20, 100))
axes = axes.flatten()

for i, column in enumerate(columns_cement):
    ax = axes[i]
    
    sns.boxplot(data=raw_cement_data, x=column, ax=ax, color='red', orient='h')
    ax.set_title(f'Horizontal Boxplot for {column}', fontsize=16)

plt.show()


# In[75]:


# count of outliers using IQR-based outlier detection
outliers_count = {}  # Dictionary to store the count of outliers for each column

# Set the threshold for IQR-based outlier detection
iqr_threshold = 1.5

# Calculate the number of outliers for each column using IQR
for column in columns_cement:
    Q1 = raw_cement_data[column].quantile(0.25)
    Q3 = raw_cement_data[column].quantile(0.75)
    IQR = Q3 - Q1
    lower_bound = Q1 - iqr_threshold * IQR
    upper_bound = Q3 + iqr_threshold * IQR
    outliers_count[column] = ((raw_cement_data[column] < lower_bound) | (raw_cement_data[column] > upper_bound)).sum()

# Print the number of outliers for each column
for column, count in outliers_count.items():
    print(f"outliers_in_{column}: {count}")
print("Total_outliers:", sum(outliers_count.values()))


# In[76]:


# count of outliers using IQR-based outlier detection  ( Absolute Outliers)
outliers_count = {}  # Dictionary to store the count of outliers for each column

# Set the threshold for IQR-based outlier detection
iqr_threshold = 3

# Calculate the number of outliers for each column using IQR
for column in columns_cement:
    Q1 = raw_cement_data[column].quantile(0.25)
    Q3 = raw_cement_data[column].quantile(0.75)
    IQR = Q3 - Q1
    lower_bound = Q1 - iqr_threshold * IQR
    upper_bound = Q3 + iqr_threshold * IQR
    outliers_count[column] = ((raw_cement_data[column] < lower_bound) | (raw_cement_data[column] > upper_bound)).sum()

# Print the number of outliers for each column
for column, count in outliers_count.items():
    print(f"outliers_in_{column}: {count}")
print("Total_outliers:", sum(outliers_count.values()))


# ## AUTO EDA

# In[3]:


# D-Tale
import dtale
d_allot = dtale.show(raw_cement_data)
d_allot.open_browser()


# In[4]:


# Dataprep
from dataprep.eda import create_report
report_allot = create_report(raw_cement_data, title = 'My Report')
report_allot.show_browser()


# In[5]:


# Pandas Profiling
from pandas_profiling import ProfileReport 
p_allot = ProfileReport(raw_cement_data)
p_allot.to_file("CM_raw.html")

import os
os.getcwd()


# In[ ]:


# SWEETVIZ
import sweetviz as sv
report_allot=sv.analyze(raw_cement_data)
report_allot.show_html()


# In[6]:


from autoviz.AutoViz_Class import AutoViz_Class

# Assuming 'df' is your DataFrame
AV = AutoViz_Class()
report = AV.AutoViz(r"H:\studies\360digitMG\Projects\Cement Manufacturing Automation\Datasets\Year_Mapping_without_column_deletion (1) (2).csv")


# ## REPLACING  OUTLIERS USING IQR 

# In[77]:


# REPLACING ABSOLUTE OUTLIERS USING IQR 

import pandas as pd

# Define a function to replace outliers with IQR method
def replace_outliers_with_iqr(data, column):
    Q1 = raw_cement_data[column].quantile(0.25)
    Q3 = raw_cement_data[column].quantile(0.75)
    IQR = Q3 - Q1
    
    lower_bound = Q1 - 3 * IQR
    upper_bound = Q3 + 3 * IQR
    
    # Replace outliers with bounds
    raw_cement_data[column] = raw_cement_data[column].apply(lambda x: lower_bound if x < lower_bound else upper_bound if x > upper_bound else x)

# List of columns to replace outliers for
columns_cement = [
    'mill_tph', 'clinker_tph', 'gypsum_tph', 'dfa_tph', 'wfa_tph',
    'mill_kw', 'mill_il_temp', 'mill_ol_temp', 'mill_ol_be_amp', 'mill_vent_fan_rpm',
    'mill_vent_fan_kw', 'mill_vent_bf_il_draft', 'mill_vent_bf_ol_draft', 'reject',
    'sep_rpm', 'sep_kw', 'sep_amp', 'ca_fan_rpm', 'ca_fan_kw', 'mill_folaphone',
    'mill_il_draft', 'mill_ol_draft', 'sep_vent_il_draft', 'sep_vent_ol_draft',
    'sep_vent_bag_filter_fan_kw', 'sep_vent_bag_filter_fan_rpm', 'residue_45_lu'
]


# Replace outliers for each column
for column in columns_cement:
    replace_outliers_with_iqr(raw_cement_data, column)



# In[78]:


# count of outliers using IQR-based outlier detection  ( Absolute Outliers)
outliers_count = {}  # Dictionary to store the count of outliers for each column

# Set the threshold for IQR-based outlier detection
iqr_threshold = 3

# Calculate the number of outliers for each column using IQR
for column in columns_cement:
    Q1 = raw_cement_data[column].quantile(0.25)
    Q3 = raw_cement_data[column].quantile(0.75)
    IQR = Q3 - Q1
    lower_bound = Q1 - iqr_threshold * IQR
    upper_bound = Q3 + iqr_threshold * IQR
    outliers_count[column] = ((raw_cement_data[column] < lower_bound) | (raw_cement_data[column] > upper_bound)).sum()

# Print the number of outliers for each column
for column, count in outliers_count.items():
    print(f"outliers_in_{column}: {count}")
print("Total_outliers:", sum(outliers_count.values()))


# In[79]:


# count of outliers using IQR-based outlier detection
outliers_count = {}  # Dictionary to store the count of outliers for each column

# Set the threshold for IQR-based outlier detection
iqr_threshold = 1.5

# Calculate the number of outliers for each column using IQR
for column in columns_cement:
    Q1 = raw_cement_data[column].quantile(0.25)
    Q3 = raw_cement_data[column].quantile(0.75)
    IQR = Q3 - Q1
    lower_bound = Q1 - iqr_threshold * IQR
    upper_bound = Q3 + iqr_threshold * IQR
    outliers_count[column] = ((raw_cement_data[column] < lower_bound) | (raw_cement_data[column] > upper_bound)).sum()

# Print the number of outliers for each column
for column, count in outliers_count.items():
    print(f"outliers_in_{column}: {count}")
print("Total_outliers:", sum(outliers_count.values()))


# In[80]:


# REPLACING  OUTLIERS USING IQR 

import pandas as pd

# Define a function to replace outliers with IQR method
def replace_outliers_with_iqr(data, column):
    Q1 = raw_cement_data[column].quantile(0.25)
    Q3 = raw_cement_data[column].quantile(0.75)
    IQR = Q3 - Q1
    
    lower_bound = Q1 - 1.5 * IQR
    upper_bound = Q3 + 1.5 * IQR
    
    # Replace outliers with bounds
    raw_cement_data[column] = raw_cement_data[column].apply(lambda x: lower_bound if x < lower_bound else upper_bound if x > upper_bound else x)

# List of columns to replace outliers for
columns_cement = [
    'mill_tph', 'clinker_tph', 'gypsum_tph', 'dfa_tph', 'wfa_tph',
    'mill_kw', 'mill_il_temp', 'mill_ol_temp', 'mill_ol_be_amp', 'mill_vent_fan_rpm',
    'mill_vent_fan_kw', 'mill_vent_bf_il_draft', 'mill_vent_bf_ol_draft', 'reject',
    'sep_rpm', 'sep_kw', 'sep_amp', 'ca_fan_rpm', 'ca_fan_kw', 'mill_folaphone',
    'mill_il_draft', 'mill_ol_draft', 'sep_vent_il_draft', 'sep_vent_ol_draft',
    'sep_vent_bag_filter_fan_kw', 'sep_vent_bag_filter_fan_rpm', 'residue_45_lu'
]


# Replace outliers for each column
for column in columns_cement:
    replace_outliers_with_iqr(raw_cement_data, column)



# In[81]:


# count of outliers using IQR-based outlier detection
outliers_count = {}  # Dictionary to store the count of outliers for each column

# Set the threshold for IQR-based outlier detection
iqr_threshold = 1.5

# Calculate the number of outliers for each column using IQR
for column in columns_cement:
    Q1 = raw_cement_data[column].quantile(0.25)
    Q3 = raw_cement_data[column].quantile(0.75)
    IQR = Q3 - Q1
    lower_bound = Q1 - iqr_threshold * IQR
    upper_bound = Q3 + iqr_threshold * IQR
    outliers_count[column] = ((raw_cement_data[column] < lower_bound) | (raw_cement_data[column] > upper_bound)).sum()

# Print the number of outliers for each column
for column, count in outliers_count.items():
    print(f"outliers_in_{column}: {count}")
print("Total_outliers:", sum(outliers_count.values()))


# In[82]:


import matplotlib.pyplot as plt
from scipy import stats

# List of columns to create Q-Q plots for
columns_cement = [
    'mill_tph', 'clinker_tph', 'gypsum_tph', 'dfa_tph', 'wfa_tph',
    'mill_kw', 'mill_il_temp', 'mill_ol_temp', 'mill_ol_be_amp', 'mill_vent_fan_rpm',
    'mill_vent_fan_kw', 'mill_vent_bf_il_draft', 'mill_vent_bf_ol_draft', 'reject',
    'sep_rpm', 'sep_kw', 'sep_amp', 'ca_fan_rpm', 'ca_fan_kw', 'mill_folaphone',
    'mill_il_draft', 'mill_ol_draft', 'sep_vent_il_draft', 'sep_vent_ol_draft',
    'sep_vent_bag_filter_fan_kw', 'sep_vent_bag_filter_fan_rpm', 'residue_45_lu'
]

# Create subplots
fig, axes = plt.subplots(14, 2, figsize=(20, 100))

# Flatten the axes for easier iteration
axes = axes.flatten()

# Loop through columns and create Q-Q plots
for i, column in enumerate(columns_cement):
    ax = axes[i]

    stats.probplot(raw_cement_data[column], dist='norm', plot=ax)
    ax.set_title(f'Q-Q Plot for {column}', fontsize=16)
    ax.get_lines()[0].set_markerfacecolor('aqua')  # Change marker color
    ax.get_lines()[1].set_color('red')  # Change line color

# Show the plots
plt.show()


# In[33]:


# Histogram  - Z-scores
from scipy.stats import zscore

# Calculate Z-scores for the specified columns
zscore_columns = [zscore(raw_cement_data[column]) for column in columns_cement]

# Create subplots
fig, axes = plt.subplots(14, 2, figsize=(20, 100))
axes = axes.flatten()

# Loop through columns and create histograms of Z-scores
for i, column in enumerate(columns_cement):
    ax = axes[i]
    
    sns.histplot(zscore_columns[i], kde=True, ax=ax, color='skyblue')
    ax.set_title(f'Histogram of Z-scores for {column}', fontsize=16)

plt.show()


# In[34]:


# Dataprep
from dataprep.eda import create_report
report_allot = create_report(raw_cement_data, title = 'My Report')
report_allot.show_browser()


# ### EDA

# In[83]:


# count
raw_data_count = len(raw_cement_data)
print("Number of Records:",raw_data_count)


# In[84]:


raw_cement_data.info()


# In[85]:


# Duplicate Records
duplicate_count = raw_cement_data.duplicated().sum()
print("No of duplicate records:",duplicate_count)


# In[86]:


raw_cement_data.min()


# In[87]:


raw_cement_data.max()


# In[88]:


raw_cement_data.mean()


# In[89]:


raw_cement_data.median()


# In[90]:


raw_cement_data[['mill_tph','clinker_tph', 'gypsum_tph', 'dfa_tph', 'wfa_tph', 'mill_kw', 'mill_il_temp', 'mill_ol_temp', 'mill_ol_be_amp']].mode()


# In[91]:


raw_cement_data[['mill_vent_fan_rpm', 'mill_vent_fan_kw', 'mill_vent_bf_il_draft', 'mill_vent_bf_ol_draft', 'reject', 'sep_rpm', 'sep_kw', 'sep_amp', 'ca_fan_rpm', 'ca_fan_kw', 'mill_folaphone', 'mill_il_draft', 'mill_ol_draft', 'sep_vent_il_draft', 'sep_vent_ol_draft', 'sep_vent_bag_filter_fan_kw', 'sep_vent_bag_filter_fan_rpm', 'residue_45_lu']].mode()


# In[92]:


raw_cement_data.var()


# In[93]:


raw_cement_data.std()


# In[94]:


# Range
import pandas as pd

columns_to_calculate_range = [
    'mill_tph', 'clinker_tph', 'gypsum_tph', 'dfa_tph', 'wfa_tph',
    'mill_kw', 'mill_il_temp', 'mill_ol_temp', 'mill_ol_be_amp', 'mill_vent_fan_rpm',
    'mill_vent_fan_kw', 'mill_vent_bf_il_draft', 'mill_vent_bf_ol_draft', 'reject',
    'sep_rpm', 'sep_kw', 'sep_amp', 'ca_fan_rpm', 'ca_fan_kw', 'mill_folaphone',
    'mill_il_draft', 'mill_ol_draft', 'sep_vent_il_draft', 'sep_vent_ol_draft',
    'sep_vent_bag_filter_fan_kw', 'sep_vent_bag_filter_fan_rpm', 'residue_45_lu'
]
# Calculate the range for each column
ranges = []
for column in columns_to_calculate_range:
    col_range = raw_cement_data[column].max() - raw_cement_data[column].min()
    ranges.append(col_range)

# Create a DataFrame to store the results
range_df = pd.DataFrame({'Column': columns_to_calculate_range, 'Range': ranges})

print(range_df)


# In[96]:


raw_cement_data.skew()


# In[97]:


raw_cement_data.kurtosis()


# In[98]:


# count of outliers using gaussian technique 3std
outliers_count = {}  # Dictionary to store the count of outliers for each column
# Set the threshold for Z-scores
threshold_z = 3
# Calculate the number of outliers for each column
for column in columns_cement:
    z_scores = np.abs(stats.zscore(raw_cement_data[column]))
    outliers_count[column] = np.sum(z_scores > threshold_z)

# Print the number of outliers for each column
for column, count in outliers_count.items():
    print(f"outliers_in_{column}: {count}")
print("Total_outliers:",sum(outliers_count.values()))


# In[100]:


from sqlalchemy import create_engine
engine = create_engine("mysql+pymysql://{user}:{pw}@localhost/{db}".format(user='root',pw='Maxima1!',db='project2_360'))


# In[99]:


raw_cement_data.to_sql('Processed_cement_data', con=engine, if_exists='replace', index=False)


# In[ ]:





# #### TRANSFORMATIONS

# In[101]:


# finding columns which have zero and negative values
# Select only numeric columns from the DataFrame
numeric_columns = raw_cement_data.select_dtypes(include=['number'])

# Find columns with zero and negative values
columns_with_zeros = numeric_columns.columns[(numeric_columns <= 0).any()]
columns_with_negatives = numeric_columns.columns[(numeric_columns < 0).any()]

print("Columns with zero or negative values:")
print("Columns with zero values:", columns_with_zeros)
print("Columns with negative values:", columns_with_negatives)


# As 'wfa_tph' column have zeroes  we will go with yeo_johnson transformation for that column and box-Cox for all others.
# 
# And Doing Transformations for all the skewed columns

# In[102]:


from sklearn.preprocessing import PowerTransformer

# Specify the column to transform
column_to_transform = 'gypsum_tph'

# Create a DataFrame for the transformed data
transformed_data = raw_cement_data.copy()

# Initialize the Box-Cox PowerTransformer
power_transformer = PowerTransformer(method='box-cox')

# Apply Box-Cox transformation to the specified column
transformed_data[column_to_transform] = power_transformer.fit_transform(raw_cement_data[[column_to_transform]])

# The transformed data for 'mill_tph' is now stored in 'transformed_data'


# In[103]:


# Apply Box-Cox transformation to the specified column
transformed_data['mill_vent_fan_rpm'] = power_transformer.fit_transform(raw_cement_data[['mill_vent_fan_rpm']])


# In[104]:


# Apply Box-Cox transformation to the specified column
transformed_data['mill_vent_fan_kw'] = power_transformer.fit_transform(raw_cement_data[['mill_vent_fan_kw']])
transformed_data['sep_rpm'] = power_transformer.fit_transform(raw_cement_data[['sep_rpm']])
transformed_data['ca_fan_rpm'] = power_transformer.fit_transform(raw_cement_data[['ca_fan_rpm']])
transformed_data['mill_folaphone'] = power_transformer.fit_transform(raw_cement_data[['mill_folaphone']])
transformed_data['mill_il_draft'] = power_transformer.fit_transform(raw_cement_data[['mill_il_draft']])


# In[105]:


transformed_data['mill_ol_draft'] = power_transformer.fit_transform(raw_cement_data[['mill_ol_draft']])
transformed_data['sep_vent_il_draft'] = power_transformer.fit_transform(raw_cement_data[['sep_vent_il_draft']])
transformed_data['sep_vent_ol_draft'] = power_transformer.fit_transform(raw_cement_data[['sep_vent_ol_draft']])
transformed_data['sep_vent_bag_filter_fan_kw'] = power_transformer.fit_transform(raw_cement_data[['sep_vent_bag_filter_fan_kw']])


# In[106]:


import numpy as np

# Apply a log transformation to the specified column beacuse of near to zero values
transformed_data['sep_vent_bag_filter_fan_rpm'] = np.log1p(raw_cement_data['sep_vent_bag_filter_fan_rpm'])


# In[107]:


## YEO JOHNSON
columns_to_transform = ['wfa_tph']
power_transformer = PowerTransformer(method='yeo-johnson')
transformed_data[columns_to_transform ] = power_transformer.fit_transform(raw_cement_data[columns_to_transform ])


# In[108]:


transformed_data[['mill_tph','clinker_tph', 'gypsum_tph', 'dfa_tph', 'wfa_tph', 'mill_kw', 'mill_il_temp', 'mill_ol_temp', 'mill_ol_be_amp']].head()


# In[109]:


transformed_data[['mill_vent_fan_rpm', 'mill_vent_fan_kw', 'mill_vent_bf_il_draft', 'mill_vent_bf_ol_draft', 'reject', 'sep_rpm', 'sep_kw', 'sep_amp', 'ca_fan_rpm', 'ca_fan_kw', 'mill_folaphone', 'mill_il_draft', 'mill_ol_draft', 'sep_vent_il_draft', 'sep_vent_ol_draft', 'sep_vent_bag_filter_fan_kw', 'sep_vent_bag_filter_fan_rpm', 'residue_45_lu']].head()


# In[110]:


import matplotlib.pyplot as plt
from scipy import stats

# List of columns to create Q-Q plots for
columns_cement = [
    'mill_tph', 'clinker_tph', 'gypsum_tph', 'dfa_tph', 'wfa_tph',
    'mill_kw', 'mill_il_temp', 'mill_ol_temp', 'mill_ol_be_amp', 'mill_vent_fan_rpm',
    'mill_vent_fan_kw', 'mill_vent_bf_il_draft', 'mill_vent_bf_ol_draft', 'reject',
    'sep_rpm', 'sep_kw', 'sep_amp', 'ca_fan_rpm', 'ca_fan_kw', 'mill_folaphone',
    'mill_il_draft', 'mill_ol_draft', 'sep_vent_il_draft', 'sep_vent_ol_draft',
    'sep_vent_bag_filter_fan_kw', 'sep_vent_bag_filter_fan_rpm', 'residue_45_lu'
]

# Create subplots
fig, axes = plt.subplots(14, 2, figsize=(20, 100))

# Flatten the axes for easier iteration
axes = axes.flatten()

# Loop through columns and create Q-Q plots
for i, column in enumerate(columns_cement):
    ax = axes[i]

    stats.probplot(transformed_data[column], dist='norm', plot=ax)
    ax.set_title(f'Q-Q Plot for {column}', fontsize=16)
    ax.get_lines()[0].set_markerfacecolor('aqua')  # Change marker color
    ax.get_lines()[1].set_color('red')  # Change line color

# Show the plots
plt.show()


# In[111]:


# Dataprep
from dataprep.eda import create_report
report_allot = create_report(transformed_data, title = 'My Report')
report_allot.show_browser()


# In[112]:


#  Boxplots
fig, axes = plt.subplots(14, 2, figsize=(20, 100))
axes = axes.flatten()

for i, column in enumerate(columns_cement):
    ax = axes[i]
    
    sns.boxplot(data=transformed_data, x=column, ax=ax, color='red', orient='h')
    ax.set_title(f'Horizontal Boxplot for {column}', fontsize=16)

plt.show()


# In[113]:


# count of outliers using IQR-based outlier detection
outliers_count = {}  # Dictionary to store the count of outliers for each column

# Set the threshold for IQR-based outlier detection
iqr_threshold = 1.5

# Calculate the number of outliers for each column using IQR
for column in columns_cement:
    Q1 = transformed_data[column].quantile(0.25)
    Q3 = transformed_data[column].quantile(0.75)
    IQR = Q3 - Q1
    lower_bound = Q1 - iqr_threshold * IQR
    upper_bound = Q3 + iqr_threshold * IQR
    outliers_count[column] = ((transformed_data[column] < lower_bound) | (transformed_data[column] > upper_bound)).sum()

# Print the number of outliers for each column
for column, count in outliers_count.items():
    print(f"outliers_in_{column}: {count}")
print("Total_outliers:", sum(outliers_count.values()))


# In[114]:


transformed_data.to_sql('transformed_cement_data', con=engine, if_exists='replace', index=False)


# In[ ]:





# In[ ]:




