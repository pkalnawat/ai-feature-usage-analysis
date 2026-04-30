-- AI Feature Usage & Adoption Analysis

-- Created AI_Feature_User column
-- Logic:
-- Users with high app usage AND high screen time are classified as AI users
-- (Used as a proxy for AI feature adoption)

-- Total users and adoption rate
SELECT 
COUNT(*) AS total_users,
SUM("AI Feature User") AS ai_users,
ROUND(SUM("AI Feature User") * 100.0 / COUNT(*),2) AS adoption_rate_percent
FROM user_behavior;

-- Average App Usage
SELECT 
"AI Feature User",
ROUND(AVG("App Usage Time (min/day)"),2) AS avg_app_usage
FROM user_behavior
GROUP BY "AI Feature User";

-- Average Screen Time
SELECT 
"AI Feature User",
ROUND(AVG("Screen On Time (hours/day)"),2) AS avg_screen_time
FROM user_behavior
GROUP BY "AI Feature User";

-- Average Data Usage
SELECT 
"AI Feature User",
ROUND(AVG("Data Usage (MB/day)"),2) AS avg_data_usage
FROM user_behavior
GROUP BY "AI Feature User";

-- Behavior Class Distribution
SELECT 
"AI Feature User",
"User Behavior Class",
COUNT(*) AS user_count
FROM user_behavior
GROUP BY "AI Feature User", "User Behavior Class";
