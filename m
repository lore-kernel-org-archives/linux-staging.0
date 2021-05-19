Received: from mail-m121142.qiye.163.com (mail-m121142.qiye.163.com [115.236.121.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1582C71
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 01:53:10 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
	by mail-m121142.qiye.163.com (Hmail) with ESMTPA id A978A80177;
	Wed, 19 May 2021 09:53:06 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH] staging: iio: fix some formatting issues
Date: Wed, 19 May 2021 09:52:50 +0800
Message-Id: <1621389170-5850-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
	oVCBIfWUFZQxodS1YfGh8YSx1NSEJCSB5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
	hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OSI6Dyo6Cj8cTiovLBECNhdM
	OBRPCjZVSlVKTUlKSENCSkNMT0tCVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
	SU5KVUxPVUlISVlXWQgBWUFJTkhDNwY+
X-HM-Tid: 0a79825397d4b037kuuua978a80177
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

fixing:
CHECK: Alignment should match open parenthesis
#1351: FILE: drivers/staging/iio/addac/adt7316.c:1351:

CHECK: Alignment should match open parenthesis
#1378: FILE: drivers/staging/iio/addac/adt7316.c:1378:

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/staging/iio/addac/adt7316.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index ccbafca..79467f0 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -1348,9 +1348,9 @@ static ssize_t adt7316_show_in_analog_temp_offset(struct device *dev,
 }
 
 static ssize_t adt7316_store_in_analog_temp_offset(struct device *dev,
-						struct device_attribute *attr,
-						const char *buf,
-						size_t len)
+						   struct device_attribute *attr,
+						   const char *buf,
+						   size_t len)
 {
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
@@ -1375,9 +1375,9 @@ static ssize_t adt7316_show_ex_analog_temp_offset(struct device *dev,
 }
 
 static ssize_t adt7316_store_ex_analog_temp_offset(struct device *dev,
-						struct device_attribute *attr,
-						const char *buf,
-						size_t len)
+						   struct device_attribute *attr,
+						   const char *buf,
+						   size_t len)
 {
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
-- 
2.7.4

