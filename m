Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697E324A047
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 00:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788567404; cv=none; b=IZXpdZVwshljlBzRy1G3ra3EaxDorRNZaIitUCG/L/Uztn1iu7AD2LjPabThSjNyUcyv5dxz7wT4DQACOr8cHjEhhJNhNiUZPPmwfqairZi+94iLEyMWDHqerVZwidss8XNrzio2uGcs6nVGRORurCSiXjVSygALRiRF22HL7rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788567404; c=relaxed/simple;
	bh=cP+4U9AC/n7DQ4j6Q+01Y8jJOSjSG1IbtukTRFC96co=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GhjvzmcGE/znwje85gDf0JUxSnDOlCr6EoAQpeLACjIHyzi4yaHNXvX3xeGwItXhtiAYsyo6Tdw1n/MaTc621UbwxGFSPinSa3g6H+myiwTtY6a+JBvPaRPAYZlKcF3ivzFWDDk6bC3+By2kM8NdTBKkze1DHX7/dTpAHgNKmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPCmuZzK; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPCmuZzK"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c67175d176so741207e0c.0
        for <linux-staging@lists.linux.dev>; Fri, 04 Sep 2026 17:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788567401; x=1789172201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFPE/GeLZQJNUjlVPHTUrDmhgIqHfBgziOiwOmM9ZNo=;
        b=oPCmuZzKFW29Sx7BS/DQachGokm7AqZ0T4ZpuWSULyprO8QGZAqfGGUbexEjLwHmOB
         +DIMANwaQ4oLl7uZjyoy4+SFMjCdCkbDkF3VO/ePa2megu1pCACh4WLbLsauARg6nZM9
         8dDDn6FNxu7cDEGUJXxcwXow2gywojREuXGbP7c7IMtQRyN07em7mDwBeEVOfiRCDuVx
         FFg7eXAXMfhAatg56uPoB1klDONbOjTYWAteIZfddDiDTLcnUTDa3+V5P0XrqGALGOnL
         gH7SWizzjTUFCBCey/9SFcIX4AcHuVKbd3baGtRFqU2fx7c0XG9sOY90dDGkEgfqocR+
         aimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788567401; x=1789172201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFPE/GeLZQJNUjlVPHTUrDmhgIqHfBgziOiwOmM9ZNo=;
        b=lBl5bMLNdilS4qIdRJ01HRsWODnQYsqCEzCg1J23L6UYuUW/TwFkjs/Mh0RRKv/i2H
         ccFzV1rOmvHzu/jDzLeIHug002lzmZ2QW32phE5J126anDtViZJFe7O2aaDI3sa7tkdp
         mNG3ceCODmskxj13cbGGeswCx5j3CsdW2IROnMtsL2+ySSpT5JsADIOZhqwR6O7tUjkW
         aDBxH1Iz2Q2b/fmy7B3JoG0NYhFgRpbKP6Gmv/b+Hfatl5FijlMD7yy60qxypzcoUhNs
         BJmcu13wPR09kqgKgOxXp8K0MLrHJSCCNPshpjaO1QWltIqkHHirp+bMDi5UY94zUtab
         sOgg==
X-Forwarded-Encrypted: i=1; AKwUvBzgjBzEvjjrxTLJWoqMeCCBEfGFaFNB3cbS/1Yv70hFwunn4INcYPPUNIR8dzZA2lzr1HPHWO2YytydHce1@lists.linux.dev
X-Gm-Message-State: AFuF++kWdz5AUGp6zA40qY998NBxUb+GaU0QrFNzEAKW1PBwzh0CUTCR
	sgg5Wc2jVokxREqY7r3WCoNxBYuGJ2ZagGuAtKqaIcYMeEgb5ICi3oP7
X-Gm-Gg: AYBFou33/hwrGdrOdPMNEwjuHPw6k0JXkRgnHrB7/aa3KJ947s4Uv2RzGSTWWYpVEmz
	q9QBaEfr79sRZSnN2Gu4pa4mzXY4dIY2vyqoJoLprZsIWBGFecKe1IkWOltCS7E099dZLRrt6wJ
	87p1aRlDEfaGddZMEpASrM3fWXUk0st1sBUOye4He0ulnNOt34rNf71uuIWudCGguTVsgGSsHPD
	SqAjK3fkTTUxCSEoytgcTM3d5rIwVRSmr0vfen3mvZrDWfOzQXtRavI0NSDGRCi4MRsIqy/9dXE
	4Zfjree/j4K4mxqYDNlSkHi5xvY6y9JBmD93R4Vcomiqi28Dec2kNqMxcrRQmBwaLoNIJPzmGr6
	sbN4Ej3NA54y1+LK0K45MChOUStw7pE/OFEMumPbvEV6jPupnPgG8jmnjTBabbvyyVE5AnlvHuK
	W8J9TW1zdaw8n9iBR/Y3S02fix4qIIGinUGaiqsi19ozJ4IaNPdv2tZeUO2nm7yJuON5VrR4err
	+4IfxF1R2b8tohCKIJOuQNCymKUabaD
X-Received: by 2002:a05:6122:4f82:b0:5c2:ac92:eb18 with SMTP id 71dfb90a1353d-5c7ed3f6d2amr4275904e0c.7.1788567401218;
        Fri, 04 Sep 2026 17:16:41 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ecac1033sm3210562e0c.18.2026.09.04.17.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:16:39 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v4] Kconfig: fix typos in core makefiles/code and purge remaining ghosts (v4)
Date: Fri,  4 Sep 2026 21:16:31 -0300
Message-ID: <20260905001631.108652-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following precise automated feedback from Sashiko AI, the active
lcd-panel-cgram documentation has been completely retained to prevent
UAPI/Sphinx tree-wide translation breaks.

This version properly stages and includes the intended bugfixes:
  - Fixes MediaTek interconnect typo mapping mt8196.o to MT8196.
  - Fixes MediaTek regulator typo mapping mt6316-regulator to MT6316.
  - Fixes missing CONFIG_ prefix on DVB_ULE_DEBUG macro in dvb_net.c.
  - Cleans up the dangling comment in drivers/leds/Kconfig.
  - Purges the remaining verified ghost weight.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 drivers/leds/Kconfig                   | 1 -
 drivers/media/dvb-core/dvb_net.c       | 6 +++---
 drivers/regulator/Makefile             | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d0d318223..800fbd560 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -873,7 +873,6 @@ config LEDS_UPBOARD
 	  This driver can also be built as a module. If so the module will be
 	  called leds-upboard.
 
-comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
 
 config LEDS_BLINKM
 	tristate "LED support for the BlinkM I2C RGB LED"
diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..3b503695e 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -68,7 +68,7 @@ static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
 
 #define DVB_NET_MULTICAST_MAX 10
 
-#ifdef DVB_ULE_DEBUG
+#ifdef CONFIG_DVB_ULE_DEBUG
 /*
  * The code inside DVB_ULE_DEBUG keeps a history of the
  * last 100 TS cells processed.
@@ -320,7 +320,7 @@ static int dvb_net_ule_new_ts_cell(struct dvb_net_ule_handle *h)
 {
 	/* We are about to process a new TS cell. */
 
-#ifdef DVB_ULE_DEBUG
+#ifdef CONFIG_DVB_ULE_DEBUG
 	if (ule_where >= &ule_hist[100*TS_SZ])
 		ule_where = ule_hist;
 	memcpy(ule_where, h->ts, TS_SZ);
@@ -659,7 +659,7 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
 			h->ts_remain > 2 ?
 				*(unsigned short *)h->from_where : 0);
 
-	#ifdef DVB_ULE_DEBUG
+	#ifdef CONFIG_DVB_ULE_DEBUG
 		hexdump(iov[0].iov_base, iov[0].iov_len);
 		hexdump(iov[1].iov_base, iov[1].iov_len);
 		hexdump(iov[2].iov_base, iov[2].iov_len);
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..f81d1f31a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316)  += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

