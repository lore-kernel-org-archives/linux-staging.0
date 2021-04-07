Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241916D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:37:16 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id q10so12272026pgj.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DYURKtLO6AtN4f6e54JwN9XZV55wF5BkCRQvFn99ABM=;
        b=ZxX/pDJ/ycCJIAr9JnYgENG2GHwcQVqthIG3lI/ZjHzcciTdYG0WM9Qn5EHVr4dSTR
         d07E5zpEoFac3yoE1GL+shm57oJYCLnrECJ/FrRKR4+0ncnfbb+uSyHKTX1zEo3dtSlE
         rwXz0xlHGvHAPTy1ter8A06UZKn16leAqQaNiZgb/4+KLyiv40okJ/7YVCLixloQrLsT
         SxPsyiQMq0bGeaCpX9XETtV7IANTvFcVBD1U5WY/+d6gnbCW3EsRXB4D1hoARcaZiSQH
         wuHXFV845voBWjKhQdcnKVtbYu+tekOE6gTMik2S5XCme1CUtyXqN93X2sG0w9TsQcnZ
         3m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DYURKtLO6AtN4f6e54JwN9XZV55wF5BkCRQvFn99ABM=;
        b=hT5YNQJrnMZJo62rrPfUru3B9jgbAAfTuJk5AFn/pRlqOzRBFdMqqseLLLxzKVoe4f
         rzYmlb7EuwN6qzQS7v1w6A3PA/kOm0f4Z22Xd92D7+GxWd9vuznXevj66yvSb34vaHDw
         WbExgswd9nzSaANc/TnU1lYqoEzNctPjFXlmgb7nvisFkPH7QWsYOotl35fRtNs9b66T
         1kinMy8bFlCB9owB32V9jMTh8mCchCWPidyqqSC/Z6WoEMWOczRTSy609JIG2teeAl+6
         /I8x7SHEATsDBsl+Gv4/LPWBjVqS3oOyR1H8W6uf/+pMrIKT6j9tvqkkHfGww0vp90m3
         FQcg==
X-Gm-Message-State: AOAM533Ki0WsaT6OcfXU3QZvytd7Yxka0PcsfSLgBGbkR8R/taNCpqdL
	nBgEwfYgEhOIu6dCp7QpyJI=
X-Google-Smtp-Source: ABdhPJz2yOyJ5mHpagT/V01zGJIu58qjTR0EquQjsb+wWJOg/2MywFInIX9gMohojTtConxGWnLuZQ==
X-Received: by 2002:a63:cc05:: with SMTP id x5mr1867032pgf.254.1617777435642;
        Tue, 06 Apr 2021 23:37:15 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id kk6sm4290581pjb.51.2021.04.06.23.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:37:15 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:37:13 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/49] staging: sm750fb: Rename local variables to snake
 case
Message-ID: <031bfc81af290969ddfd06d211de6fc85db283ac.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for local
variables in SII164_FULL_FUNCTIONS block.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_sii164.c | 40 ++++++++++++-------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 869d74f53a6a..758a118e4421 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -304,28 +304,28 @@ void sii164_set_power(unsigned char power_up)
 static
 void sii164_select_hot_plug_detection_mode(enum sii164_hot_plug_mode hot_plug_mode)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
-	detectReg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
 		    ~SII164_DETECT_MONITOR_SENSE_OUTPUT_FLAG;
 	switch (hot_plug_mode) {
 	case SII164_HOTPLUG_DISABLE:
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HIGH;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HIGH;
 		break;
 	case SII164_HOTPLUG_USE_MDI:
-		detectReg &= ~SII164_DETECT_INTERRUPT_MASK;
-		detectReg |= SII164_DETECT_INTERRUPT_BY_HTPLG_PIN;
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_MDI;
+		detect_reg &= ~SII164_DETECT_INTERRUPT_MASK;
+		detect_reg |= SII164_DETECT_INTERRUPT_BY_HTPLG_PIN;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_MDI;
 		break;
 	case SII164_HOTPLUG_USE_RSEN:
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_RSEN;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_RSEN;
 		break;
 	case SII164_HOTPLUG_USE_HTPLG:
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HTPLG;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HTPLG;
 		break;
 	}
 
-	i2c_write_reg(SII164_I2C_ADDRESS, SII164_DETECT, detectReg);
+	i2c_write_reg(SII164_I2C_ADDRESS, SII164_DETECT, detect_reg);
 }
 
 /*
@@ -336,9 +336,9 @@ void sii164_select_hot_plug_detection_mode(enum sii164_hot_plug_mode hot_plug_mo
  */
 void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
-	detectReg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT);
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT);
 
 	/* Depending on each DVI controller, need to enable the hot plug based
 	 * on each individual chip design.
@@ -359,11 +359,11 @@ void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug)
  */
 unsigned char sii164_is_connected(void)
 {
-	unsigned char hotPlugValue;
+	unsigned char hot_plug_value;
 
-	hotPlugValue = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
+	hot_plug_value = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
 		       SII164_DETECT_HOT_PLUG_STATUS_MASK;
-	if (hotPlugValue == SII164_DETECT_HOT_PLUG_STATUS_ON)
+	if (hot_plug_value == SII164_DETECT_HOT_PLUG_STATUS_ON)
 		return 1;
 	else
 		return 0;
@@ -379,11 +379,11 @@ unsigned char sii164_is_connected(void)
  */
 unsigned char sii164_check_interrupt(void)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
-	detectReg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
 		    SII164_DETECT_MONITOR_STATE_MASK;
-	if (detectReg == SII164_DETECT_MONITOR_STATE_CHANGE)
+	if (detect_reg == SII164_DETECT_MONITOR_STATE_CHANGE)
 		return 1;
 	else
 		return 0;
@@ -395,12 +395,12 @@ unsigned char sii164_check_interrupt(void)
  */
 void sii164_clear_interrupt(void)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
 	/* Clear the MDI interrupt */
-	detectReg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT);
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT);
 	i2c_write_reg(SII164_I2C_ADDRESS, SII164_DETECT,
-		    detectReg | SII164_DETECT_MONITOR_STATE_CLEAR);
+		    detect_reg | SII164_DETECT_MONITOR_STATE_CLEAR);
 }
 
 #endif
-- 
2.30.2

