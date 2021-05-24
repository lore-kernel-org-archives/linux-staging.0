Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481F970
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 17:36:29 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id m190so20616865pga.2
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 10:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2PFrLBKSjV93vDkDe3MMz5yssgQhCzdNdJZDXUr3dA=;
        b=cGMEWwLkB3WRMDS2Nzsf6ajs45C1vqzU7DT46SJlnXcR1I+Oox6+Pn+0xZjUjpkhlO
         +2LrnEDUzvPEPhZnxfiM+Jxt6qtrUWJ8TTu2jrBfNX9WYmRnBs0z8syt6+rs/ryck3xw
         t2UJpXhQbKhH8xhUabKDWLYNI5e38wixPH/DBQPvOE6B4oOuTLMgSrrC3c4+V7QHGtD3
         /nNO/leWN7AKJXFnX3lS5Ub+HAPnKCCZJh0KKsY0DYZijOdKhKASrJ4v1Ex1pm32X555
         5T1uCgZeX65fRYGYtP0ga7lQ1JajTFtTkOiETfMXfdVJBSQrjOlzJewHF37zY3+ngZ4L
         GZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2PFrLBKSjV93vDkDe3MMz5yssgQhCzdNdJZDXUr3dA=;
        b=ovr6IpUQD22LJ2OsuYEynUVAkrzfP8aklJKW/b+x6Osvvme6jSWn1CixNMLvjQzF3f
         l6S5gvHplAZaoCEnwLmLpwl2LfsPhpUeLFAVQC1OZpeIjY7MTYj8OoszBpHKB4jkvpvU
         6ENyRviT0vbHaBKlaxsSggaGPfm+VxV1QiV+6l6qsEMDKRkTzO8UnIqNymIGlI9o4QYR
         zegeJmIMCpbdxH32jJH/+eDbWmpD2cz0eRXbioADxlDsZl0F/NdGZfZgoW4SGOeBN++v
         Bx5m/5ODogkCLkBEw3HyumXtfaLTbMdKn2TFONRktRJS+yLJxd568uBa8u5FoBZUc7xu
         18HA==
X-Gm-Message-State: AOAM531XPRcmqmblGMND5mB8mQdv3B4EBMUG8uWsc7r4ZLz/l9aWU79e
	lnfv6zA+n2JMOn33uKcymJg=
X-Google-Smtp-Source: ABdhPJzkvPAxXh9nkkOdcUM/c8/yPtKtXC4SzqXpHCZzkTzyOMeTvqBJtO6sDuXM2+cngYM3hS/x0w==
X-Received: by 2002:aa7:8b56:0:b029:2b9:77be:d305 with SMTP id i22-20020aa78b560000b02902b977bed305mr26113787pfd.61.1621877788544;
        Mon, 24 May 2021 10:36:28 -0700 (PDT)
Received: from andromeda.localdomain ([223.223.153.90])
        by smtp.gmail.com with ESMTPSA id n23sm12128477pff.93.2021.05.24.10.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 10:36:28 -0700 (PDT)
From: Aniket Bhattacharyea <aniketmail669@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aniket Bhattacharyea <aniketmail669@gmail.com>
Subject: [PATCH v2] media: atomisp: Fix whitespace at the beginning of line
Date: Mon, 24 May 2021 23:06:09 +0530
Message-Id: <20210524173609.672153-1-aniketmail669@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes whitespace at the beginning of line by wrapping after
the type name and aligning the arguments with the open parenthesis.
Identified by checkpatch: WARNING: please, no spaces at the start of a 
line.

Signed-off-by: Aniket Bhattacharyea <aniketmail669@gmail.com>
---
Changes in v2:
  - Wrap after the type name instead of replacing whitespace with tabs

 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 135994d44802..d8c9e31314b2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1040,10 +1040,10 @@ static struct camera_sensor_platform_data acpi_gmin_plat = {
 	.get_vcm_ctrl = gmin_get_vcm_ctrl,
 };
 
-struct camera_sensor_platform_data *gmin_camera_platform_data(
-    struct v4l2_subdev *subdev,
-    enum atomisp_input_format csi_format,
-    enum atomisp_bayer_order csi_bayer)
+struct camera_sensor_platform_data *
+gmin_camera_platform_data(struct v4l2_subdev *subdev,
+			  enum atomisp_input_format csi_format,
+			  enum atomisp_bayer_order csi_bayer)
 {
 	u8 pmic_i2c_addr = gmin_detect_pmic(subdev);
 	struct gmin_subdev *gs;
-- 
2.31.1

