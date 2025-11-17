Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9D53164D2
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362217; cv=none; b=Z1EkQ+SElsr8XPdLQLpEFQzOS60Uf0cHVh681BdCFIzdPFykDjY2LXF+IwQJLQKJ59ELhviEKdt1MwntR4I5Lv12wJv5lyURCRjrYoyEg9Se/AOI8x/1pU4c+9FBKWG5uOPFk5/1BnygwCyvqy2p0CjCOuIle5TqKIFEDszf1O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362217; c=relaxed/simple;
	bh=K9KcOUk/Zuh2cmdjmeani0bsQd4Cl4TWEGgPQHweZtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m03W7PvtVNJ3N3BPSmDR7ZUJ6e1igjjWNOIyTwZdGu6O3akpE2oNfzpc5RIWrRN91NmFKRNREY4OIRaOtKFKG3vT5w6XkBpy6GerypEmbIm5BpHwFSfcOpu6CkFUsDIhOTDGyU52qXU9c3mK2PuV2lSsWceEA6DW2ns0owGAHY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqpwNdJH; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqpwNdJH"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so2515749b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 16 Nov 2025 22:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763362215; x=1763967015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rcsk5ZeQ7H8x3wIhBbV5hj1Gvifm17yYNO4t5tbYLA0=;
        b=UqpwNdJHhPYbe3OXwcRFoUzXQmAl7J6jZeszK9fNBtVjR9vDfL7ox8J7uf66q6uLXE
         2OcyFgORuPIoVGqBgablAK8GBlyBsXgrY4AeDta50a+W0/CM06exgk0UAZImRWwC0bCU
         ec/RRHSziMjxRO/QIUQRHR+k31wFKtBWi4d+Xo6Vj7cgPeJp/wBC98BMiL22YedwpKfW
         TN3hBpxfbFTjdWpDHNobofo9kfDPC+C/yZ68kcxTZoSNGE63XsOzvs955KcgxPsRdaMT
         2gHTiG3cCXmCfYn72tcbGoJTsbnC6p/i2hh4Vs5KCqryuvToT7X5nKSIsqbpdwxL2dcq
         amlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763362215; x=1763967015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcsk5ZeQ7H8x3wIhBbV5hj1Gvifm17yYNO4t5tbYLA0=;
        b=p2snloMuuRMM2eSuXTcY/8zD9HtUwSmzKwV3g4zjcsWRm7mgDcfNFgqU0bsTajNMIt
         ojwOpixQTd9IirJr0MBMC/ZeLGhGDIKoC2zrjLgtyNSZhZqoVLv4CZgFaUqQAHtm6JM9
         PpovBparHZ2Kh06CVyW0p1MV+P/fLat6r00++khxYM1b8+F18+rBPlj+OhoTX+Ff8lFE
         1C0TlhdFgQ0eSJg3CG3Uizo1WrHdgPYhjIzq/1cx/sKU47r936l+BcPZeGdTwy1mOeK7
         O65CQiLerYVHRgL/ERkWU4o8GHXSX0pNFo4UcF9q2ZC3d+bwBvwmJfyNQLJ1PN6HNbvU
         2kMA==
X-Forwarded-Encrypted: i=1; AJvYcCWAtIAmV5KRfCCS3H97plVK6vW6g9I0/+kvG2tVFbksT6II0eqTedNTjYao46zvBkxDE2qKtouRXUiy5Az4@lists.linux.dev
X-Gm-Message-State: AOJu0YxqGITSTEKndj30ToHxD1db73XWGSM2lXwhRB6pvWEBSgeB00wd
	744zIbPZd4z0/eubKR+lMU43FjIE238FJHyEuac7lIoZZ2SLy8hSHwj8
X-Gm-Gg: ASbGncsNblokvf1VFzriVB0R+zPcH3HDlqHkgYKxwqlfJiLDgfY18mXtmUNRlshFlGP
	4VW3it9910UiK1mE8tpz2+wWfXQ/POA/wHxHlRxSJ/GkB1+Pu+5GLD9Hks6DSmxwI6Sk6WNcMyc
	XLRccallD3LP/9mMQsGYl2z9dZ6v9YlkdEzzKf7hPMD6b9YWO2z4K+9nIyXo71aGTuZchnHc1xF
	budiEUw5DSbl14NasjEosR1UNyrVSH4MpvluzVqoey6PImwzWWxyrAzUuromeRnLt+NfPFi+Fs6
	u03jyLZTJpW89OGvzyynuberHpQlLkZ+4DRni0XBhE50H0fWTC2HcMzfVDzLv0zPYp+b6nquHWH
	FIa81WyslHgSk5JgWzl++iVffKYyYqsiigklfuApkB8O4WbGx5o2MYuDqSXh0c8YyRmhBRMSwzJ
	DVkzLLpnzNNLTOh3IAzt/kRdc5CYMeFKW6ciYY
X-Google-Smtp-Source: AGHT+IGxi4zd0jo6/MZiPeQPTGUHJqofagpVYfARMww4ZdH9XcQJD/Xht9LykrDS5kDPLJMWZnZgeA==
X-Received: by 2002:a05:6a21:33a9:b0:35f:30ff:89f6 with SMTP id adf61e73a8af0-35f30ff918dmr3425612637.57.1763362214656;
        Sun, 16 Nov 2025 22:50:14 -0800 (PST)
Received: from LAPTOP-6H9JJHSF.mshome.net ([61.1.189.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36e8a58c4sm11013227a12.9.2025.11.16.22.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 22:50:14 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH] staging: greybus: replace strncpy() with strlcpy() in firmware test tool
Date: Mon, 17 Nov 2025 06:50:03 +0000
Message-ID: <20251117065003.7453-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sample userspace firmware-management tool uses strncpy() to copy
firmware tags. strncpy() does not guarantee null-termination and can
leave buffers unterminated. For userspace code, strlcpy() is the
recommended safe alternative.

Replace all strncpy() calls with strlcpy().

Signed-off-by: Dharanitharan <dharanitharan725@gmail.com>
---
 .../greybus/Documentation/firmware/firmware.c      | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 3b35ef6d4adb..224eb8f4e39c 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,8 +63,9 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+    strlcpy(intf_load.firmware_tag, firmware_tag,
+       GB_FIRMWARE_U_TAG_MAX_SIZE);
+
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
 	if (ret < 0) {
@@ -101,8 +102,9 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+    strlcpy(backend_fw_info.firmware_tag, firmware_tag,
+       GB_FIRMWARE_U_TAG_MAX_SIZE);
+
 
 retry_fw_version:
 	ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
@@ -129,8 +131,8 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+    strlcpy(backend_update.firmware_tag, firmware_tag,
+       GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
 	backend_update.status = 0;
-- 
2.43.0

