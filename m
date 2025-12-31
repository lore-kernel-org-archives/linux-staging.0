Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECBE5B1EB
	for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 05:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767158677; cv=none; b=J9NB94XsqRCRdgU8ZXlB/XdKP8fuTXS3tjIQRMQOG1Bbs7xOaEHIlptYdZ5GBDzjwnhKcmyrp6h0t2yeUi1BaAyrptEN2TmeZmGRZ7qm2SYkUhxNZCbL4Ag8qFSgPo8lh0Q8aApEp4sQB6UO/gygk0ceqCqYPv7R5UKDOk2oiNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767158677; c=relaxed/simple;
	bh=c9ubX7ai/qwqA+ba+ASKq+KnXFMC1M1ULeLSCnqQ5vA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJPz0A+4OLnv+0HsJ4M6lisEo5MHejDQBkyzFPZg0aoFMXlekYrpf9KOc6UgeeuZcCjpYNrRV2DRmuefR2mBF8d2ZLnEOTS8Rjb0IxwLtxYOH6pvjPbn5CndvVIEHNemmGAO1Ju+MROHRyf3ltVEhx7pP1lJG4luBpdq1CAk8Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMfgzcbp; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMfgzcbp"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8035e31d834so8079932b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 21:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767158675; x=1767763475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nZBUgEksAy0wDWZsDFUpREOsS5QTTJSKv9aUl7dZr6M=;
        b=IMfgzcbpWxeGSYTee7E1hlXHjGGrwDYzo3GuVKLGbk99C5lqhz6LJrA+4m8NsyRcfq
         /8VpwScMNYC5/HFyvlQwRJRWILEUzT04k/v4I1Z0QnRDA612rET2TQFetih9e6dJuuu7
         JZxbxQkfx/Kf31LfIWZ+We9syJPhpPioPMrPU826312YeD1lAsox+7UkNpftvih93VGN
         MjnorDisZLlwEiC44rSVIcKHOPU9su42r1a+3GeLPucAkonMR4hzRiXPpQLnM//JEu1a
         FrjaI1MGOF0ClstyC8LGf6WVnkQwHRAKTlg02g+9mltKttpCorXDTHFzIxTbaWk2gQTY
         8sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767158675; x=1767763475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZBUgEksAy0wDWZsDFUpREOsS5QTTJSKv9aUl7dZr6M=;
        b=LpggU0QPw2hrXvgwQJwu13mKX8ivBNS/osab9ubu4IFtYcEIEq2CfDESMBjP5EIWtK
         ITc/hpG76jDaUyBi9rAE/OfrzasUZtUB0FgX0QTLpg1XUloLA9TvkDCQyX2gbuQHDI5l
         mMoit4PtxanfaR0rFXZWLF2ydXF4FjT6tEG9q/mPoC8PBl4UTcCSbF7Bi6QHVkvMZHnB
         +a7+giSHkn1P8fB7DiXVBq5OSG8tqzLkX1EZYLLnX+p1t7DjAZhpJh26+gjLeAAVTTKr
         lDITPZAqvvwCUuw3jJ0xyDFLWEJa7WnhzVeU67Jwfzo3lN2XdJBt/rRxmLHHsxJ8rire
         aYbw==
X-Forwarded-Encrypted: i=1; AJvYcCUbrh7kcAYKYVvZHJn3O02B2qqyjLCoN4M2XqFVVCQxs05IIEfTdaZZhHdRgWVPhXYuIjdsYVVf58rutq1W@lists.linux.dev
X-Gm-Message-State: AOJu0YzCOmaeRiITVLic9+/IhSU2Qn1z0OqgWy1KsiJbwnTxpyVnKx5j
	cVgYcBhDFo/pRjdbwh4dyoJBp1yMF6eALnuYHR3OMO8qITdnUxsaPDI3
X-Gm-Gg: AY/fxX6e/51lpFFfwNaqolVsgncPTzi5S1mEks7aThWmAVCvO669HdiiMI93WSM1Msr
	1U3Yz0ru16LK7kFJVQ/TxKmzed9ubgjtIC04SQluzJGt2iVzflTD0twE8lSYxuXeYQnHjFrSYgg
	DndivpASbdoj7FYMCtfQTZdkKygVAvSg8g93mm6WmFOuz2rBHOrlxitHCZjBRX/zRaywvw/GroL
	0Gq/wJitJC3rVl9AvVmSLt6cNvRD5mdBZjdmPXJVqHoXPgIkLHkQ9aTOdqYacIIKtyU8naoPQYn
	DkhFbtcxYGXiIBX5CB5UFC//auFUmmvUse3KLhxDXN2vAYehmeHxmb6KqH8+HxT7oI8L+r9Nu+2
	janTdN2L69wgN1sC2QPvrP7FL/Ey3SfJr7rWxkc3mvUj3gTqfvm6awFfzmO+cF3h33kGEIOdP0F
	o/FpsyuLZoGqk=
X-Google-Smtp-Source: AGHT+IGyO1jeZ+2WgT5h8ytwtHL7NzTQKQbBl4WgLNbmRrgy9RVIz52E4M5tultTxpJqkmy8KLDOPA==
X-Received: by 2002:aa7:930b:0:b0:7ad:564:bf92 with SMTP id d2e1a72fcca58-7ff657a64f5mr33762165b3a.27.1767158675270;
        Tue, 30 Dec 2025 21:24:35 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423b9asm34388142b3a.28.2025.12.30.21.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 21:24:34 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH] media: atomisp: remove private white balance IOCTLs
Date: Wed, 31 Dec 2025 10:54:27 +0530
Message-ID: <20251231052427.58840-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch resolves a MUST-FIX graduation blocker identified in the
atomisp TODO by removing the private ATOMISP_IOC_G_ISP_WHITE_BALANCE
and ATOMISP_IOC_S_ISP_WHITE_BALANCE and replacing them with standard
V4L2 control handling.

The private IOCTLs were used to set white balance parameters. This
functionality is now mapped to the standard V4L2 controls
V4L2_CID_RED_BALANCE and V4L2_CID_BLUE_BALANCE.

A helper function `atomisp_v4l2_set_wb` is introduced to translate the
V4L2 control values to the driver's internal configuration format.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  5 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 49 ++++++++++++++++---
 2 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 3c8fa3f58..fcf116cc4 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -741,10 +741,7 @@ enum atomisp_burst_capture_options {
 	_IOW('v', BASE_VIDIOC_PRIVATE + 15, struct atomisp_ctc_table)
 
 /* white balance Correction */
-#define ATOMISP_IOC_G_ISP_WHITE_BALANCE \
-	_IOR('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
-#define ATOMISP_IOC_S_ISP_WHITE_BALANCE \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
+
 
 /* fpn table loading */
 #define ATOMISP_IOC_S_ISP_FPN_TABLE \
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f221..5c0a1d92b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1083,6 +1083,38 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
  * applications initialize the id and value fields of a struct v4l2_control
  * and call this ioctl.
  */
+static int atomisp_v4l2_set_wb(struct atomisp_sub_device *asd, int id,
+			       int value)
+{
+	struct atomisp_device *isp = asd->isp;
+	struct atomisp_wb_config config;
+	int ret;
+
+	if (atomisp_css_get_wb_config(asd, &config)) {
+		dev_err(isp->dev, "%s: can't get wb config\n", __func__);
+		return -EINVAL;
+	}
+
+	switch (id) {
+	case V4L2_CID_BLUE_BALANCE:
+		config.b = value << (16 - 8 - config.integer_bits + 1);
+		break;
+	case V4L2_CID_RED_BALANCE:
+		config.r = value << (16 - 8 - config.integer_bits + 1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = atomisp_white_balance_param(asd, 1, &config);
+	if (ret) {
+		dev_err(isp->dev, "%s: set wb config failed\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int atomisp_s_ctrl(struct file *file, void *fh,
 			  struct v4l2_control *control)
 {
@@ -1122,6 +1154,17 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 	case V4L2_CID_ATOMISP_LOW_LIGHT:
 		ret = atomisp_low_light(asd, 1, &control->value);
 		break;
+	case V4L2_CID_AUTO_WHITE_BALANCE:
+		/*
+		 * TODO: Auto White Balance is not supported yet.
+		 * It is currently handled by the ISP.
+		 */
+		ret = 0;
+		break;
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = atomisp_v4l2_set_wb(asd, control->id, control->value);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -1484,13 +1527,7 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		err = atomisp_ctc(asd, 1, arg);
 		break;
 
-	case ATOMISP_IOC_G_ISP_WHITE_BALANCE:
-		err = atomisp_white_balance_param(asd, 0, arg);
-		break;
 
-	case ATOMISP_IOC_S_ISP_WHITE_BALANCE:
-		err = atomisp_white_balance_param(asd, 1, arg);
-		break;
 
 	case ATOMISP_IOC_G_3A_CONFIG:
 		err = atomisp_3a_config_param(asd, 0, arg);
-- 
2.43.0

