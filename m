Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E05D3C26
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659198021; x=1690734021;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KMxqD33OIAG5+LVA9hLBAgj59Xmw6ck7YXvwZ5dHDn4=;
  b=YS4h1jHdVQRjKFv70wtZ8tvJN858xhfITN4SIOwDSJJPE1yxirGi5XHi
   F4SJlNhb80wXqmSJiOzG/17oGqUJRW6cWBQbbCpdxXLLm0njUFVOcbsm/
   PmKfiHS6NG86tJ87u5vuiyhksX2qicrTsLmBOic1Gi0ZvOgMme090KYtq
   FVNhJvQG+W6ttS9IhcFr/2KRP2plR+QC9f1hqUMakA2VDbXQ5488sQpF8
   g/dz9b7Zek3ZBx+3w+w7ag8upS2dTdpC3xHCeTc67mXl+yEEyBiufnv35
   ozUZcI3zUa/Opv34/IxYdA3knMM0Dam20/tDMKc4FgYan6Ebe32jYKJX+
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="271968807"
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="271968807"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 09:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="691026007"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2022 09:20:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 075A4F1; Sat, 30 Jul 2022 19:20:28 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 1/1] media: atomisp_gmin_platform: Unexport and split camera_sensor_csi()
Date: Sat, 30 Jul 2022 19:20:27 +0300
Message-Id: <20220730162027.1011-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera_sensor_csi() is not used outside the module, hence make it
static. While at it, split it to _alloc() and _free() to clearly show
the idea behind the last parameter @flag that is passed to
gmin_csi_cfg().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../include/linux/atomisp_gmin_platform.h     |  2 -
 .../media/atomisp/pci/atomisp_gmin_platform.c | 68 ++++++++++---------
 2 files changed, 37 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
index 58e0ea5355a3..5463d11d4295 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
@@ -26,8 +26,6 @@ struct v4l2_subdev *atomisp_gmin_find_subdev(struct i2c_adapter *adapter,
 int atomisp_gmin_remove_subdev(struct v4l2_subdev *sd);
 int gmin_get_var_int(struct device *dev, bool is_gmin,
 		     const char *var, int def);
-int camera_sensor_csi(struct v4l2_subdev *sd, u32 port,
-		      u32 lanes, u32 format, u32 bayer_order, int flag);
 struct camera_sensor_platform_data *
 gmin_camera_platform_data(
     struct v4l2_subdev *subdev,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index f7fc5137199c..4032239fcb86 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1066,6 +1066,38 @@ static int gmin_flisclk_ctrl(struct v4l2_subdev *subdev, int on)
 	return ret;
 }
 
+static int camera_sensor_csi_alloc(struct v4l2_subdev *sd, u32 port, u32 lanes,
+				   u32 format, u32 bayer_order)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct camera_mipi_info *csi;
+
+	csi = kzalloc(sizeof(*csi), GFP_KERNEL);
+	if (!csi)
+		return -ENOMEM;
+
+	csi->port = port;
+	csi->num_lanes = lanes;
+	csi->input_format = format;
+	csi->raw_bayer_order = bayer_order;
+	v4l2_set_subdev_hostdata(sd, csi);
+	csi->metadata_format = ATOMISP_INPUT_FORMAT_EMBEDDED;
+	csi->metadata_effective_width = NULL;
+	dev_info(&client->dev,
+		 "camera pdata: port: %d lanes: %d order: %8.8x\n",
+		 port, lanes, bayer_order);
+
+	return 0;
+}
+
+static void camera_sensor_csi_free(struct v4l2_subdev *sd)
+{
+	struct camera_mipi_info *csi;
+
+	csi = v4l2_get_subdev_hostdata(sd);
+	kfree(csi);
+}
+
 static int gmin_csi_cfg(struct v4l2_subdev *sd, int flag)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
@@ -1074,8 +1106,11 @@ static int gmin_csi_cfg(struct v4l2_subdev *sd, int flag)
 	if (!client || !gs)
 		return -ENODEV;
 
-	return camera_sensor_csi(sd, gs->csi_port, gs->csi_lanes,
-				 gs->csi_fmt, gs->csi_bayer, flag);
+	if (flag)
+		return camera_sensor_csi_alloc(sd, gs->csi_port, gs->csi_lanes,
+					       gs->csi_fmt, gs->csi_bayer);
+	camera_sensor_csi_free(sd);
+	return 0;
 }
 
 static struct camera_vcm_control *gmin_get_vcm_ctrl(struct v4l2_subdev *subdev,
@@ -1358,35 +1393,6 @@ int gmin_get_var_int(struct device *dev, bool is_gmin, const char *var, int def)
 }
 EXPORT_SYMBOL_GPL(gmin_get_var_int);
 
-int camera_sensor_csi(struct v4l2_subdev *sd, u32 port,
-		      u32 lanes, u32 format, u32 bayer_order, int flag)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct camera_mipi_info *csi = NULL;
-
-	if (flag) {
-		csi = kzalloc(sizeof(*csi), GFP_KERNEL);
-		if (!csi)
-			return -ENOMEM;
-		csi->port = port;
-		csi->num_lanes = lanes;
-		csi->input_format = format;
-		csi->raw_bayer_order = bayer_order;
-		v4l2_set_subdev_hostdata(sd, (void *)csi);
-		csi->metadata_format = ATOMISP_INPUT_FORMAT_EMBEDDED;
-		csi->metadata_effective_width = NULL;
-		dev_info(&client->dev,
-			 "camera pdata: port: %d lanes: %d order: %8.8x\n",
-			 port, lanes, bayer_order);
-	} else {
-		csi = v4l2_get_subdev_hostdata(sd);
-		kfree(csi);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(camera_sensor_csi);
-
 /* PCI quirk: The BYT ISP advertises PCI runtime PM but it doesn't
  * work.  Disable so the kernel framework doesn't hang the device
  * trying.  The driver itself does direct calls to the PUNIT to manage
-- 
2.35.1

