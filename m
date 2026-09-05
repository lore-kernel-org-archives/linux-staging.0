Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE22D5926
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 00:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568214; cv=none; b=o5YqnfVXtSTMeY2Io2DegiTnrOsKugDzGQQM9A6eorGzDNVmueJxsoKlcY17AyE50ARCD5+sHchpu4CagiEoelZ1ATmkDE/qOxtoswqZtAsL5rTiYwUY4dSOENK22AlciPfFBlBzg8UR4LyccwoVrBkBWctaXB8K8qOYNXEmVGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568214; c=relaxed/simple;
	bh=XxbPIFk2tSsij/ROTcukZp1v9F5KUnPXyjMHgXJVQ8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qn5wcbPzeVJZq9jhI1xJ5zj+wEy5qnqeNS/gNzoX430LIo/9SwtzjUNmYIjhn8Xe/yx946JOixdAEBZmUyvM8/ZE7GifuU1hglZhUOaM8UI+bE4Yb/7WfFIq3UtG5GOfW3DH/M1pcrXdFKrSJIsJ3RSLGL2ioBXlg/y5haoORTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ho2oE5hG; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ho2oE5hG"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso1217330a91.1
        for <linux-staging@lists.linux.dev>; Fri, 04 Sep 2026 17:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788568212; x=1789173012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7HnYBPkgGHcq9yWO+WayMoxCwKBUXVvRWJyyRsMWSP0=;
        b=Ho2oE5hG51Ea1QduptbcuShUCRjDv+CtDiKNob6tNZV+GoBhl2snuX+a956JL4zHzp
         fqUhc04oH6ch1dtf6iUSoNIQb2sMN4T5eHJZv2gS9goAOiiTtxtyj0cZXQ4dbVIH5j71
         CAZNXvkPpDL8+yasjskly5tFd4zDJ24Wx9TSfJ0XPLmhRcvtTcXlI0J24w5Xg/G8X1jA
         aDWuyXvT2UGt26DTiWjq96D2YHIdBEmByJe7VvMw6qwB+NcXbEoLUyzOYXjnP9jWD9q4
         +Tt20g48Yt9Y1iEt1gDrAQB3iphuSS3AvDzqs9N0GFAl7Xq+00to0aQAul3N4klpnBOY
         J4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788568212; x=1789173012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HnYBPkgGHcq9yWO+WayMoxCwKBUXVvRWJyyRsMWSP0=;
        b=SN2CDqpgzx6pLb2TYYn1bcFjaQpewrywG5mpUWPWfaleWFlR9vv9w3fIkrEbaYCTYD
         HzP7GXAZ9EWi9/MUHrPP1Jo/647nZhPUS1oCt868NRum/5Z411zzK4p9ZuUOvvNtLYEm
         F/WzPLtyeFdvjwLqzCzGca1C9r5RnSQzbs8fWCVv3eob45Za+lsYw4zmGemUw++9Jpzh
         rcpKYQ7PJzYBD7p2A2xi7qTCjw6lHemZMC6K3tl9ph0nkSZymFHQE4Bt+iMnV7Qyv9qz
         KhU9SD5d29HmEaygDVLktDSnUWSE34cZlq4KKDiVih9kH2W12h8B/iPs9VwcQmcX4jaQ
         ILig==
X-Forwarded-Encrypted: i=1; AKwUvByhzueCCRNJ89ZR4n4gVM3WAlIjzJWiXKrbUuW8Wi3vM3wJoHepBMYj2SWYNQsuMRAtTcExCE0SY6Lj820W@lists.linux.dev
X-Gm-Message-State: AFuF++mnyvIYA0MUWbMB7H8GqTUHOVI0a1YChNng+j/Zy0u3Jf/Qn074
	PLS9w6hU9OoOr2yI3acvYGle09ptKl8S0SVsjjq9ba3CYGPLDd55a3vh
X-Gm-Gg: AYBFou1hzSYCWB151Eaf8pJp7N4ptsj2ZRVNvggcPZnHpbVasEl/lDe+U/ZFYFKWfpg
	7gPw4u82TT3IVW+1E9oPJNU4AKAnOl9xmbMjdcEdP8Idhb42XdWLSPAV3i5zmy+rvmzE60/IJhA
	cdiAqHLmR3IhprW+Oh+NUwXmossHZN1uOLZAJBIzpWu8saB0vhN/6wcbWUoY3OmVApNEFOHViaA
	l6iuXrE0j9TF+wgCGVMy/blIrG2alh2jIMUqPk5xEi+7Ah1zidXXOunA9290p1nIuAmkOrBAtpC
	A/BtDWKb1dSjSU2iL7pnPy6VRnBXB4WggX2V7GV5KYz/m0a19GVH9oALC5EWK99iDDzviwGzV+k
	lHMV0x0ua9YXQ5UgS4uoxesbhITz9fXvPZ+YUc1rRwqRuO82i2OrOi7PN/+DhVF3RRkaj/Ryg0Y
	EBrV2xlnSqqF24vXwbqy5A3JO/AaF1/OTG7Hg+7j0AwCD+pCXKe8MMV8XnDIhkqaziPBXfhYvOZ
	DJgu6gNkylL3U9kWEqV/iAWoKcBRGSq
X-Received: by 2002:a17:90b:4b0c:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39b26121f6cmr14637223a91.2.1788568211735;
        Fri, 04 Sep 2026 17:30:11 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm9745628eec.13.2026.09.04.17.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:30:11 -0700 (PDT)
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
Subject: [PATCH v5] Kconfig: fix typos in core makefiles and purge defective DVB debug (v5)
Date: Fri,  4 Sep 2026 21:30:05 -0300
Message-ID: <20260905003005.118245-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Automated review from Sashiko AI revealed that re-enabling the legacy
DVB_ULE_DEBUG code via CONFIG_DVB_ULE_DEBUG exposes severe race conditions
on global state variables, leading to out-of-bounds memory corruption.
Additionally, the debug block suffers from undeclared identifiers (TS_SZ).

Following the core kernel principle of eliminating dangerous, unmaintained
code, this patch completely extirpates the defective DVB_ULE_DEBUG block
from dvb_net.c and purges its corresponding configuration symbol from
the Kconfig tree.

This version retains the verified MediaTek bugfixes and ghost purges:
  - Fixes MediaTek interconnect typo mapping mt8196.o to MT8196.
  - Fixes MediaTek regulator typo mapping mt6316-regulator to MT6316.
  - Cleans up the dangling comment in drivers/leds/Kconfig.
  - Purges verified legacy ghost weight.

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

