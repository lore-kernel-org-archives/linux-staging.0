Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDBC2C9E
	for <linux-staging@lists.linux.dev>; Fri,  3 Dec 2021 01:17:46 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso1170044pjb.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Dec 2021 17:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S5UjT1x+zy3iwsBiMwj3JMAV9u9Kypxjd6MKPcTQMHc=;
        b=BMaT/W7WrKFtoe1CqBsqFj04WRZ9RuDhnyOPLu8kXr02Z3VFZsjD4ObHKY9SyDsD4d
         fQugCCV4veq/NTIQklYQSqXNe07o/xxz2JPWaIuozHiKB3U+4rWwRy+uXhXsYPZl1fqX
         UEwCiUrWG4wLbvaV0lg9kGoD5tHbZEETdw3DetMFAUS6iyA3s8YlsuHDZB5aIr3/+4M4
         LsdkRMcoKngbBrIuAvIDOMcHEObFVZk7O0OkNQp4/8UaKYKGgmaFzX9LfvYExW7toqRt
         08w+VfwV5aV0d2gYO9oarNFhN5fFsn/U8Cd1A6/M2jHi5u4+AtvL0mYTmWfGmfC/P9ei
         m5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S5UjT1x+zy3iwsBiMwj3JMAV9u9Kypxjd6MKPcTQMHc=;
        b=DqMN0Pw94kylzOg7NDneoi1M4JnkWnvU/liEcEML6j72w1sQyY49URD8lZsNnBKWBF
         9usgrnetWKSRs7qI+rd7h8cYQgnIqCQdSsrJ8UB0YK65R/70CNbhfA3vQ6DS4gtwRllU
         bbk8Z+LdVJwdX9nA5BT3kFJXO3DUOkwPw/mcpskyVXl/JgcRpQRVTMUG1uM99ykBFwmn
         mfg9obyAzC7VK6xHJxhVru2LIwGYe96cPIr42XuQWfqJIRe1dVVpLWqX4ahofa97QYOu
         Bd6beuS+Hph6bCu+6epwoDfRF5Pqac9j6AoQikSFsHgVCCB4PxV8KoeBsji2PAxF24Xd
         Xhaw==
X-Gm-Message-State: AOAM5325JFkaGM4D5fUnZ89Apt6nHETtadCnTKrgl495dm7W8q9O0Xl2
	gAovBWjfaMibzPkzpWbDim0=
X-Google-Smtp-Source: ABdhPJzzD4O6VzPhb88Fv8cWI+ymLHQKaTFls2WjSxM7k/BGeaQoT4CLmwz5g9kjkc8Rrr5F1NmgtQ==
X-Received: by 2002:a17:902:e88f:b0:141:f982:777 with SMTP id w15-20020a170902e88f00b00141f9820777mr19784878plg.68.1638494265910;
        Thu, 02 Dec 2021 17:17:45 -0800 (PST)
Received: from debian11-dev-61.localdomain (192.243.120.180.16clouds.com. [192.243.120.180])
        by smtp.gmail.com with ESMTPSA id lr6sm631754pjb.0.2021.12.02.17.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 17:17:45 -0800 (PST)
From: davidcomponentone@gmail.com
X-Google-Original-From: yang.guang5@zte.com.cn
To: TheSven73@gmail.com
Cc: dan.carpenter@oracle.com,
	davidcomponentone@gmail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Guang <yang.guang5@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH v3] staging: fieldbus: replace snprintf with sysfs_emit
Date: Fri,  3 Dec 2021 09:17:32 +0800
Message-Id: <36a8d3be94d3575656d08204228eaa921db64c03.1638493815.git.yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yang Guang <yang.guang5@zte.com.cn>

coccinelle report:
./drivers/staging/fieldbus/dev_core.c:73:8-16:
WARNING: use scnprintf or sprintf

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>

---
Changes in v3:
- Add driver name in title.

---

Changes in v2:
- Replace all the show functions in this file.
---
 drivers/staging/fieldbus/dev_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fieldbus/dev_core.c b/drivers/staging/fieldbus/dev_core.c
index 5aab734606ea..9c85bf87a8d7 100644
--- a/drivers/staging/fieldbus/dev_core.c
+++ b/drivers/staging/fieldbus/dev_core.c
@@ -28,7 +28,7 @@ static ssize_t online_show(struct device *dev, struct device_attribute *attr,
 {
 	struct fieldbus_dev *fb = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%d\n", !!fb->online);
+	return sysfs_emit(buf, "%d\n", !!fb->online);
 }
 static DEVICE_ATTR_RO(online);
 
@@ -39,7 +39,7 @@ static ssize_t enabled_show(struct device *dev, struct device_attribute *attr,
 
 	if (!fb->enable_get)
 		return -EINVAL;
-	return sprintf(buf, "%d\n", !!fb->enable_get(fb));
+	return sysfs_emit(buf, "%d\n", !!fb->enable_get(fb));
 }
 
 static ssize_t enabled_store(struct device *dev, struct device_attribute *attr,
@@ -70,7 +70,7 @@ static ssize_t card_name_show(struct device *dev, struct device_attribute *attr,
 	 * card_name was provided by child driver, could potentially be long.
 	 * protect against buffer overrun.
 	 */
-	return snprintf(buf, PAGE_SIZE, "%s\n", fb->card_name);
+	return sysfs_emit(buf, "%s\n", fb->card_name);
 }
 static DEVICE_ATTR_RO(card_name);
 
@@ -79,7 +79,7 @@ static ssize_t read_area_size_show(struct device *dev,
 {
 	struct fieldbus_dev *fb = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%zu\n", fb->read_area_sz);
+	return sysfs_emit(buf, "%zu\n", fb->read_area_sz);
 }
 static DEVICE_ATTR_RO(read_area_size);
 
@@ -88,7 +88,7 @@ static ssize_t write_area_size_show(struct device *dev,
 {
 	struct fieldbus_dev *fb = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%zu\n", fb->write_area_sz);
+	return sysfs_emit(buf, "%zu\n", fb->write_area_sz);
 }
 static DEVICE_ATTR_RO(write_area_size);
 
@@ -116,7 +116,7 @@ static ssize_t fieldbus_type_show(struct device *dev,
 		break;
 	}
 
-	return sprintf(buf, "%s\n", t);
+	return sysfs_emit(buf, "%s\n", t);
 }
 static DEVICE_ATTR_RO(fieldbus_type);
 
-- 
2.30.2

