Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B558829A5
	for <linux-staging@lists.linux.dev>; Fri, 24 Jan 2025 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737690498; cv=none; b=KFc4ynv9vYSaJ2sPDzF6FR74MFUQE7nBFk7CM5WXdgVx1YC+QYCE51S8o7DqRp5yijtoa9UantOLtW257iZNxjUZkFEy6N+3y0Cgc351Z8JhnaaOPYaT6rjNWQvz79PdoQjJCln/Voeu5wjcJhmyQkV2Lm1kTN1iXnUDo1cLgVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737690498; c=relaxed/simple;
	bh=x+6krTd7vBQgTVLsNyLFew4GFFTmUkx39Ed9VosOlP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iYK+Xyy4n2FC/i288Hc1E65Oi3P1AkmgDvjmgCvDNFc9cmI50x2RwCf0fEjojJsEgmQkL5tvHbkSHWTzg12QzaSxNrJbzlyKJ5zVayMw+gbuTcQ2o5D7IvDPRG2pcDyAEV7mPB/UTmCYXAEAE6j0U7btjVB4tlsriv/YNwBTcrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=n3Bv0ytE; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="n3Bv0ytE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1737690482;
	bh=rpIPGTJR+6Ypsg/wR4c/Se0s9WYINCWWZBdP/CEKFlM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=n3Bv0ytEuFCSe6fRwm4Pc+EMi9tfxr2617ITFehxHELHIRLj02kgNnVaQVyzK8OLI
	 5pniI+2/SXVQvX2n+jq8v+t5pAfaBQ5QjvMh48J5j+BS+dCqHsEEtB/k3z9P45LsrV
	 hZRpF9/+tQhU8HPgx6Ud8rVmCy9cKDxyuvlkxqSI=
X-QQ-mid: bizesmtpip2t1737690255txxspcz
X-QQ-Originating-IP: JZYAShpvOZMGv83Uhd9MjErUtp1TZm1lglHmhdFUi44=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Jan 2025 11:44:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 394355359938786983
From: WangYuli <wangyuli@uniontech.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	wangyuli@uniontech.com,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com
Subject: [PATCH] media: atomisp: i2c: Remove unused macro definitions
Date: Fri, 24 Jan 2025 11:44:01 +0800
Message-ID: <78C4C3F9E650FD04+20250124034402.540943-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M7BGKxRTCLhkXxCBCSxPPPxwNwiejG0y0kOGgluhxfCgeMtjAWLIQHQS
	91SgqkLB+aoK+/c2Kz5KUikN3h4pgIQ/hNjZo+rFfuyPOeqzGS8rt0YWm5voQpmVU01gOMe
	VQTRTX4xuR7QtXjk1fl3a+6VgsEmfsifwJUNwmismRwyKtKYQUF0Q5T21dXjNUNQg3h/AH+
	nc2D3iyfjwBBs4VKrRbAx7ewLaZ63u4Az/WRlXfJtCNJP/hbm6gX6t+LciuayTC7E9m/IqY
	g+9bcZHWafhbuPI9rK3fLR/PhnVoyqrDUZYprXwqM2S79asFKW2SXE7ndmEmyGlIQOa26XN
	PygGxCuLUy4eZlQloGtuAL8upl3jgIKk85FteHKbm/LziB8TrQtdVWSsO++OP4vuNnSxNuW
	RQDjkkWgr188lGcACbhqfSqdqIqKfwsKjubZXm8FpPClfn3gqWsysBXcgB3AVxdINVFeDCj
	o2NtnnoM8ufq2jr4a5Yh/zTswhL1qBN4GZDGik+eEuvC5BizUeYv0sbBwAoMxtdT2tzhHhi
	F1Vterp5GBxGJFQhkVtBGV3AiKoV6wp0kBnYvlUb6o1hxC+KLRX0wmK4OjdSM0pYmGFx957
	f9G2idp9MHJUl8eDxYwn4J5GJy04qmVeJnvRwpPitvKn5OXfpEBRRFaraoJFY3QP8VznER/
	ek0fIVIW48DfLeqMS3/xIK3Y/CJGJriCr0rQqH7DIJEvsRgTuHnSCiZNBg95wACX9XubiJZ
	qj3D7jrOo50t09Rk+vmWueIb2HzXvJDY0Rqw6V/3DmmiDlUCH5aELm/x8KCD/GxNVRHyr32
	wYeqD49mZ/+FsavYAQzhIAvRyWYhmd4EjW84Zoq5AU8r6buyplnh/vY4gT7yPw88KZZhKWh
	+aGP3ogCrGb484f9VwyL2tyauoXBCmo8rQhTf0gMwOmZcUwBjLiGoJllIOaVUEorx1wmM6+
	Znb0d3MqSfaqv9M4JlonB8LmOAVP6PafSSc+tSKIF87zAWdnXy6QxyDs87KN1hnrDKqXv1y
	4wlVx/Og==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Delete obsolete macro definitions that are no longer in use in
mt9m114.h to improve code readability and maintainability.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/staging/media/atomisp/i2c/mt9m114.h | 105 +-------------------
 1 file changed, 3 insertions(+), 102 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
index 97820db90827..9c4b85bea765 100644
--- a/drivers/staging/media/atomisp/i2c/mt9m114.h
+++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
@@ -22,29 +22,15 @@
 #include "../include/linux/atomisp_platform.h"
 #include "../include/linux/atomisp.h"
 
-#define V4L2_IDENT_MT9M114 8245
-
-#define MT9P111_REV3
-#define FULLINISUPPORT
-
 /* #defines for register writes and register array processing */
 #define MISENSOR_8BIT		1
 #define MISENSOR_16BIT		2
 #define MISENSOR_32BIT		4
 
-#define MISENSOR_FWBURST0	0x80
-#define MISENSOR_FWBURST1	0x81
-#define MISENSOR_FWBURST4	0x84
-#define MISENSOR_FWBURST	0x88
-
 #define MISENSOR_TOK_TERM	0xf000	/* terminating token for reg list */
 #define MISENSOR_TOK_DELAY	0xfe00	/* delay token for reg list */
-#define MISENSOR_TOK_FWLOAD	0xfd00	/* token indicating load FW */
-#define MISENSOR_TOK_POLL	0xfc00	/* token indicating poll instruction */
 #define MISENSOR_TOK_RMW	0x0010  /* RMW operation */
 #define MISENSOR_TOK_MASK	0xfff0
-#define MISENSOR_AWB_STEADY	BIT(0)	/* awb steady */
-#define MISENSOR_AE_READY	BIT(3)	/* ae status ready */
 
 /* mask to set sensor read_mode via misensor_rmw_reg */
 #define MISENSOR_R_MODE_MASK	0x0330
@@ -55,99 +41,32 @@
 #define MISENSOR_FLIP_DIS	0
 
 /* bits set to set sensor read_mode via misensor_rmw_reg */
-#define MISENSOR_SKIPPING_SET	0x0011
-#define MISENSOR_SUMMING_SET	0x0033
 #define MISENSOR_NORMAL_SET	0x0000
 
 /* sensor register that control sensor read-mode and mirror */
 #define MISENSOR_READ_MODE	0xC834
-/* sensor ae-track status register */
-#define MISENSOR_AE_TRACK_STATUS	0xA800
-/* sensor awb status register */
-#define MISENSOR_AWB_STATUS	0xAC00
-/* sensor coarse integration time register */
-#define MISENSOR_COARSE_INTEGRATION_TIME 0xC83C
 
 /* registers */
-#define REG_SW_RESET                    0x301A
-#define REG_SW_STREAM                   0xDC00
-#define REG_SCCB_CTRL                   0x3100
-#define REG_SC_CMMN_CHIP_ID             0x0000
-#define REG_V_START                     0xc800 /* 16bits */
-#define REG_H_START                     0xc802 /* 16bits */
-#define REG_V_END                       0xc804 /* 16bits */
-#define REG_H_END                       0xc806 /* 16bits */
-#define REG_PIXEL_CLK                   0xc808 /* 32bits */
-#define REG_TIMING_VTS                  0xc812 /* 16bits */
 #define REG_TIMING_HTS                  0xc814 /* 16bits */
 #define REG_WIDTH                       0xC868 /* 16bits */
-#define REG_HEIGHT                      0xC86A /* 16bits */
 #define REG_EXPO_COARSE                 0x3012 /* 16bits */
-#define REG_EXPO_FINE                   0x3014 /* 16bits */
 #define REG_GAIN                        0x305E
-#define REG_ANALOGGAIN                  0x305F
-#define REG_ADDR_ACESSS                 0x098E /* logical_address_access */
-#define REG_COMM_Register               0x0080 /* command_register */
-
-#define SENSOR_DETECTED		1
-#define SENSOR_NOT_DETECTED	0
 
 #define I2C_RETRY_COUNT		5
 #define MSG_LEN_OFFSET		2
 
-#ifndef MIPI_CONTROL
-#define MIPI_CONTROL		0x3400	/* MIPI_Control */
-#endif
-
-/* GPIO pin on Moorestown */
-#define GPIO_SCLK_25		44
-#define GPIO_STB_PIN		47
-
-#define GPIO_STDBY_PIN		49   /* ab:new */
-#define GPIO_RESET_PIN		50
-
 /* System control register for Aptina A-1040SOC*/
 #define MT9M114_PID		0x0
 
 /* MT9P111_DEVICE_ID */
 #define MT9M114_MOD_ID		0x2481
 
-#define MT9M114_FINE_INTG_TIME_MIN 0
-#define MT9M114_FINE_INTG_TIME_MAX_MARGIN 0
-#define MT9M114_COARSE_INTG_TIME_MIN 1
-#define MT9M114_COARSE_INTG_TIME_MAX_MARGIN 6
-
 /* ulBPat; */
 
-#define MT9M114_BPAT_RGRGGBGB	BIT(0)
-#define MT9M114_BPAT_GRGRBGBG	BIT(1)
-#define MT9M114_BPAT_GBGBRGRG	BIT(2)
-#define MT9M114_BPAT_BGBGGRGR	BIT(3)
+#define MT9M114_BPAT_GRGRBGBG	BIT(0)
+#define MT9M114_BPAT_BGBGGRGR	BIT(1)
 
-#define MT9M114_FOCAL_LENGTH_NUM	208	/*2.08mm*/
 #define MT9M114_WAIT_STAT_TIMEOUT	100
-#define MT9M114_FLICKER_MODE_50HZ	1
-#define MT9M114_FLICKER_MODE_60HZ	2
-/*
- * focal length bits definition:
- * bits 31-16: numerator, bits 15-0: denominator
- */
-#define MT9M114_FOCAL_LENGTH_DEFAULT 0xD00064
-
-/*
- * current f-number bits definition:
- * bits 31-16: numerator, bits 15-0: denominator
- */
-#define MT9M114_F_NUMBER_DEFAULT 0x18000a
-
-/*
- * f-number range bits definition:
- * bits 31-24: max f-number numerator
- * bits 23-16: max f-number denominator
- * bits 15-8: min f-number numerator
- * bits 7-0: min f-number denominator
- */
-#define MT9M114_F_NUMBER_RANGE 0x180a180a
 
 /* Supported resolutions */
 enum {
@@ -158,29 +77,11 @@ enum {
 
 #define MT9M114_RES_960P_SIZE_H		1296
 #define MT9M114_RES_960P_SIZE_V		976
-#define MT9M114_RES_720P_SIZE_H		1280
-#define MT9M114_RES_720P_SIZE_V		720
-#define MT9M114_RES_576P_SIZE_H		1024
-#define MT9M114_RES_576P_SIZE_V		576
-#define MT9M114_RES_480P_SIZE_H		768
-#define MT9M114_RES_480P_SIZE_V		480
-#define MT9M114_RES_VGA_SIZE_H		640
-#define MT9M114_RES_VGA_SIZE_V		480
-#define MT9M114_RES_QVGA_SIZE_H		320
-#define MT9M114_RES_QVGA_SIZE_V		240
-#define MT9M114_RES_QCIF_SIZE_H		176
-#define MT9M114_RES_QCIF_SIZE_V		144
-
-#define MT9M114_RES_720_480p_768_SIZE_H 736
-#define MT9M114_RES_720_480p_768_SIZE_V 496
+
 #define MT9M114_RES_736P_SIZE_H 1296
 #define MT9M114_RES_736P_SIZE_V 736
 #define MT9M114_RES_864P_SIZE_H 1296
 #define MT9M114_RES_864P_SIZE_V 864
-#define MT9M114_RES_976P_SIZE_H 1296
-#define MT9M114_RES_976P_SIZE_V 976
-
-#define MT9M114_BIN_FACTOR_MAX			3
 
 #define MT9M114_DEFAULT_FIRST_EXP 0x10
 #define MT9M114_MAX_FIRST_EXP 0x302
-- 
2.45.2

