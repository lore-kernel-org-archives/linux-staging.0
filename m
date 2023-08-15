Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A718026
	for <linux-staging@lists.linux.dev>; Tue, 15 Aug 2023 18:47:50 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76ce59842c1so349668085a.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Aug 2023 11:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692125269; x=1692730069;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUkzcxBX95ON8ima77ZDNX4N/ymonVr14GMExOANhWY=;
        b=iHGlzigdgqt6qKcO8L2bAwYQ4Cy5pru4TkmMhTcq3R17uOZ04fmH3bl20knmRW+KGg
         1Yuo5ng8p3f+cu5Sq/w7aBPdxN9KL3llETkyZhnT7YqbjMcDO2Lj0w3/negM7M3LnDi1
         EhW+ZKcIcvEFE01IZgtGaMBtmHNfge+YMq9mRt7zk+Q2YO/dqZwXJva2VDjfYYpizBxA
         imSKhkGUO5kWf2qYFp62uytwSy8GaqDbcMnYXOemiy5FEOW+6+dPziKOTuQ0RLWAlKfl
         KfPxVi8zsL/uLJdYtN3fdSYwnW2urInybyyx5D61/5owmraXlrR2z6rC+l4WcCbGMdcO
         kzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692125269; x=1692730069;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUkzcxBX95ON8ima77ZDNX4N/ymonVr14GMExOANhWY=;
        b=h1qYYzmrZjGToVTShzRcwhANrerXT5SSN8oo6IQEBplm8uD3wRFenfg64YJxI1WaY5
         PfOihamm4rFCw031rVduql03xr712vENbJEdGOmXBpab0POxY1qp7LoyhrbuDhMtFhhh
         KfdIJpu1EpS/CR2WH71FzoqQsO5wxseadAQQBjyLydHZc9ZLIYPGYusSLAGo4mgMusrd
         VetYFLr4lE1n9/z3DjThjwO6ESLTlfJsMwzWpILFdxIwgKucCRIWAalsEFFc0c1JU7Xb
         TGzj6Jbi+0GsTKRO6ONnLCYNnPElcEtTa+3pmw1SkuoCMSa1q9FcScHVVkxAlAY7uzq8
         JoyQ==
X-Gm-Message-State: AOJu0Yzy1fzfTC+Hxk5asIKQZFDHg2ejp+TR4lZcvf0N2EGJW5sAg3X+
	yQkaQx3gBUv0EyX6DocFqhiAyMaLz7OPAA==
X-Google-Smtp-Source: AGHT+IEzV3XMrb+VmuEwpjkCjCeeSMB6T6VsfFi+bAY0WBPO1p+q8OcjVcQZw6AWErfBf8iettWlDA==
X-Received: by 2002:a05:620a:2807:b0:76d:3272:ab42 with SMTP id f7-20020a05620a280700b0076d3272ab42mr15387824qkp.9.1692125269007;
        Tue, 15 Aug 2023 11:47:49 -0700 (PDT)
Received: from abdel (bras-base-ktnron0692w-grc-13-174-95-13-129.dsl.bell.ca. [174.95.13.129])
        by smtp.gmail.com with ESMTPSA id m19-20020ae9e013000000b0076745f352adsm3898261qkk.59.2023.08.15.11.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 11:47:48 -0700 (PDT)
Date: Tue, 15 Aug 2023 14:47:41 -0400
From: Abdel Alkuor <alkuor@gmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org
Subject: [PATCH v2] staging: sm750fb: fix sii164InitChip function name
Message-ID: <ZNvITXcfVwpJAh6y@abdel>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux Kernel coding style. Found by checkpatch.

Signed-off-by: Abdel Alkuor <alkuor@gmail.com>
---
Changes in v2:
  -Fix alignment mismatch with open parenthesis

 drivers/staging/sm750fb/ddk750_dvi.c    |  2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 22 +++++++++++-----------
 drivers/staging/sm750fb/ddk750_sii164.h | 20 ++++++++++----------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index e0c7ff3352bf..8b81e8642f9e 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -14,7 +14,7 @@
 static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 #ifdef DVI_CTRL_SII164
 	{
-		.init = sii164InitChip,
+		.init = sii164_init_chip,
 		.get_vendor_id = sii164_get_vendor_id,
 		.get_device_id = sii164GetDeviceID,
 #ifdef SII164_FULL_FUNCTIONS
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 3da1796cd7aa..2532b60245ac 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -72,7 +72,7 @@ unsigned short sii164GetDeviceID(void)
  */
 
 /*
- *  sii164InitChip
+ *  sii164_init_chip
  *      This function initialize and detect the DVI controller chip.
  *
  *  Input:
@@ -118,16 +118,16 @@ unsigned short sii164GetDeviceID(void)
  *      0   - Success
  *     -1   - Fail.
  */
-long sii164InitChip(unsigned char edge_select,
-		    unsigned char bus_select,
-		    unsigned char dual_edge_clk_select,
-		    unsigned char hsync_enable,
-		    unsigned char vsync_enable,
-		    unsigned char deskew_enable,
-		    unsigned char deskew_setting,
-		    unsigned char continuous_sync_enable,
-		    unsigned char pll_filter_enable,
-		    unsigned char pll_filter_value)
+long sii164_init_chip(unsigned char edge_select,
+		      unsigned char bus_select,
+		      unsigned char dual_edge_clk_select,
+		      unsigned char hsync_enable,
+		      unsigned char vsync_enable,
+		      unsigned char deskew_enable,
+		      unsigned char deskew_setting,
+		      unsigned char continuous_sync_enable,
+		      unsigned char pll_filter_enable,
+		      unsigned char pll_filter_value)
 {
 	unsigned char config;
 
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index ca330f6a43e2..71a7c1cb42c4 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -16,16 +16,16 @@ enum sii164_hot_plug_mode {
 };
 
 /* Silicon Image SiI164 chip prototype */
-long sii164InitChip(unsigned char edgeSelect,
-		    unsigned char busSelect,
-		    unsigned char dualEdgeClkSelect,
-		    unsigned char hsyncEnable,
-		    unsigned char vsyncEnable,
-		    unsigned char deskewEnable,
-		    unsigned char deskewSetting,
-		    unsigned char continuousSyncEnable,
-		    unsigned char pllFilterEnable,
-		    unsigned char pllFilterValue);
+long sii164_init_chip(unsigned char edgeSelect,
+		      unsigned char busSelect,
+		      unsigned char dualEdgeClkSelect,
+		      unsigned char hsyncEnable,
+		      unsigned char vsyncEnable,
+		      unsigned char deskewEnable,
+		      unsigned char deskewSetting,
+		      unsigned char continuousSyncEnable,
+		      unsigned char pllFilterEnable,
+		      unsigned char pllFilterValue);
 
 unsigned short sii164_get_vendor_id(void);
 unsigned short sii164GetDeviceID(void);
-- 
2.34.1

