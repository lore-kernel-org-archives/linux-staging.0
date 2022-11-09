Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C808F62;
	Wed,  9 Nov 2022 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667990568; bh=jUiIEEBr0PQ3TlHP6XT1/IoPO61Uc972/r6uV3hAGxY=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=RuVTcNw0N5jlqQAAeZINsuVULCsmSlYlhS7Vo3ei1ol+8UZ1Gc2J2uegL2yKAB0bP
	 SocErEhvm/g6cXP2dj9gC7KRwU0SOUCMHQ1QJSMTE4dQPB48xrqIRBpYHeUo5tre7T
	 zFt+m+QycfHEpG2wVLMQGfJyj8qnGroEe6Am1+UE=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Wed,  9 Nov 2022 11:42:48 +0100 (CET)
X-EA-Auth: U6c2K4A2f5pmUeNAepVjavyPCN7n3Q4c6Y9CLpNN+n4Tlwq45cabVuBXOf3B2m56oEegsmPlB3mxm+lJktSYOYm45Y3wKp3I
Date: Wed, 9 Nov 2022 16:12:43 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Sven Van Asbroeck <TheSven73@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: fieldbus: use sysfs_emit() in show functions
Message-ID: <Y2uEIzebbM/Fs5Jz@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The show() methods should only use sysfs_emit() when formatting values
to be returned to the user space.
Ref: Documentation/filesystems/sysfs.rst
Issue identified by coccicheck.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Changes in v3:
   1. Include other show functions from the same file in the scope of this
      patch. Feedback from gregkh@linuxfoundation.org
   2. Simplify code comment.

Changes in v2:
   1. Switch to using sysfs_emit instead of scnprintf
   2. Update patch subject and log accordingly
      Feedback from gregkh@linuxfoundation.org


 drivers/staging/fieldbus/dev_core.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/fieldbus/dev_core.c b/drivers/staging/fieldbus/dev_core.c
index 5aab734606ea..5f54f2674bd1 100644
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
@@ -66,11 +66,8 @@ static ssize_t card_name_show(struct device *dev, struct device_attribute *attr,
 {
 	struct fieldbus_dev *fb = dev_get_drvdata(dev);

-	/*
-	 * card_name was provided by child driver, could potentially be long.
-	 * protect against buffer overrun.
-	 */
-	return snprintf(buf, PAGE_SIZE, "%s\n", fb->card_name);
+	/* card_name was provided by child driver. */
+	return sysfs_emit(buf, "%s\n", fb->card_name);
 }
 static DEVICE_ATTR_RO(card_name);

@@ -79,7 +76,7 @@ static ssize_t read_area_size_show(struct device *dev,
 {
 	struct fieldbus_dev *fb = dev_get_drvdata(dev);

-	return sprintf(buf, "%zu\n", fb->read_area_sz);
+	return sysfs_emit(buf, "%zu\n", fb->read_area_sz);
 }
 static DEVICE_ATTR_RO(read_area_size);

@@ -88,7 +85,7 @@ static ssize_t write_area_size_show(struct device *dev,
 {
 	struct fieldbus_dev *fb = dev_get_drvdata(dev);

-	return sprintf(buf, "%zu\n", fb->write_area_sz);
+	return sysfs_emit(buf, "%zu\n", fb->write_area_sz);
 }
 static DEVICE_ATTR_RO(write_area_size);

@@ -116,7 +113,7 @@ static ssize_t fieldbus_type_show(struct device *dev,
 		break;
 	}

-	return sprintf(buf, "%s\n", t);
+	return sysfs_emit(buf, "%s\n", t);
 }
 static DEVICE_ATTR_RO(fieldbus_type);

--
2.34.1



