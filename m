Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24B62FB4
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 12:43:14 +0000 (UTC)
IronPort-SDR: ewxd/kAJBWe/RKpHsoe9+lp7EZU2NUIV0yqvOHsQUbXISqG1cV5F6NHokttBkdqE0HR6abyJiE
 BnjPv0t71tdw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202210437"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="202210437"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 05:43:10 -0700
IronPort-SDR: zTs2TTIv13tMyrQ1H+JPD6TKvvOFT1FLZ7z0ukWI+ASbmBLBBN9hQNWz7OMBEtfBLqrQJHnZTP
 TkjxzqXXqECA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="409246039"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 26 May 2021 05:43:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3CD0850E; Wed, 26 May 2021 15:43:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 1/6] i2c: acpi: Export i2c_acpi_find_client_by_adev() for users
Date: Wed, 26 May 2021 15:43:17 +0300
Message-Id: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is at least one user that will gain from the
i2c_acpi_find_client_by_adev() being exported.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-acpi.c | 3 ++-
 include/linux/i2c.h         | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 8ceaa88dd78f..5be37a5efcb4 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -387,7 +387,7 @@ struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_find_adapter_by_handle);
 
-static struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
+struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
 {
 	struct device *dev;
 	struct i2c_client *client;
@@ -402,6 +402,7 @@ static struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
 
 	return client;
 }
+EXPORT_SYMBOL_GPL(i2c_acpi_find_client_by_adev);
 
 static int i2c_acpi_notify(struct notifier_block *nb, unsigned long value,
 			   void *arg)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index e8f2ac8c9c3d..335dc4f5abbb 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -995,6 +995,7 @@ static inline int of_i2c_get_board_info(struct device *dev,
 
 #endif /* CONFIG_OF */
 
+struct acpi_device;
 struct acpi_resource;
 struct acpi_resource_i2c_serialbus;
 
@@ -1005,6 +1006,7 @@ u32 i2c_acpi_find_bus_speed(struct device *dev);
 struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
 				       struct i2c_board_info *info);
 struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
+struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev);
 #else
 static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 					     struct acpi_resource_i2c_serialbus **i2c)
@@ -1024,6 +1026,10 @@ static inline struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle ha
 {
 	return NULL;
 }
+static inline struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
+{
+	return NULL;
+}
 #endif /* CONFIG_ACPI */
 
 #endif /* _LINUX_I2C_H */
-- 
2.30.2

