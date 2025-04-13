Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7012117B505
	for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744529568; cv=none; b=mdJff/2HXSqMjbQ7OfMxPozgEzUVi7Y1/Y4gdS2An+bojcAGmMpip/pJJjqB4XClq6pLuLmWmaVIreS2alF+TYiY1xBgLxcg2ld1nn1SNQBWcxPmuOqRC2JHcZoeqg0wGyPiNpM6t5sqB5+36mdMrBPo5HRlr/fVpfYxLIw9AmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744529568; c=relaxed/simple;
	bh=noTGHob0U3nCMmX6ggPvoPttAsBMb3SkzDTyGuKAQlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D4FkzFSbwIytmiyqYCrkeKemg9gWgjDwgsqqjcuyoeVyE+vDDnMqClDT6J3nuPOg1YbN7ZIKnBvhLF9eacddc1CRKYpwOwTMKWy1Tnnz3ZF67UR9VqDfVpzTkwqCjNGE1qnAg0m97RQezRZaRlB0dNXmcsu+Bw8Qe6tjMbHdi2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0tseExw; arc=none smtp.client-ip=209.85.160.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0tseExw"
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-476a720e806so29568341cf.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 00:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529565; x=1745134365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4007EJtTTw4rTvfv0n1SalSLJtmVlRpzu0mtepvnyg=;
        b=d0tseExwMmW0aa/pdy8DKvJGimndIXN1oEeRQ48aVqUmoBCtCSTRaV0IVYxqxdhyny
         p8lXZebFWj6/Vg7KMhTp6gPiwmkWoFZbzXz4TRqj8miRWPch30qew8w5/k5CEUKQVCRP
         qDKEywIl6XfagYrNlob1U2S8WWWnuFsgnpURPrmv6Ect/FH42tMOPZszoksAq558uvt3
         KgsB6/Q88al1IWyUAID1DVu03xc534pqWrKNblVmyFu56QPTVnL/DMNRm9/Xn4J5TlZn
         3V9kl+tJPDJk0T1yFrTjzBO/zR3RqvrdVS4IaE+qu63MJ5iDFytCmY736O21S8XoWkAi
         +n0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529565; x=1745134365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4007EJtTTw4rTvfv0n1SalSLJtmVlRpzu0mtepvnyg=;
        b=wfHh+U878E/NTHFirf1TuA288502RmWlN435SS/QXeN7qySE2vLFCeWDlShD8ii7Vy
         g9unNt3r/mwvPBk2wd6OuWVoHUCaNi+zkzKFblz9hYeAVvAipZCmUlMrDAQtwN9yopqA
         vDmZfBGjFi4ZheL9YsSK3A7lDJSefsV3k/U6xKjwi6BefGhNMv/cXulAzdDaRs/aWCvZ
         jBVAOE/sGsV+e2SR14PaP7F4PPt5VJlqB+d111ghF/g8OVV+klEy7bXRIvr/NH28wlSG
         R/knvskB2JTdk2eg/IMtwxmkVpKntCTN2qe+KDl04nZINlSKgfIGOSTvj9Rb/3JRnEl7
         IAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfzmH38TY/FpdorRJhbcSb/wLEK1dR1iptg06jRp1G8UtUGK2jzu+fPmJ4naNowdY2G8BiDYgcvXctwfKn@lists.linux.dev
X-Gm-Message-State: AOJu0YwO3gOJo6tGMxch8kR7yIaE8+9lQyi0DLNH1qIB+upGCiI9Z+GS
	jkpP2BWHlw3ebiWry3OZg8v/KWESFTLlsAvEyJKBm3gcmiuwxBLN
X-Gm-Gg: ASbGncte/xDfMSFlDsbhIXZq9m+APHFct2mqYdIvyfMf6uRmO2nBmETWdCeb6PGHRIK
	3qyhDazSHaKdgV5duzuWT5/r9LQiNFBty9M0SdKjOR+R6k7YmKNFKETT9aMdsUnoFbWT04SqBk2
	jGO2/36A5FLbL8HSFfA19NYx5AM2M/dz92UHdZiKDG8JMxPWS48YSaFb1QLKXazDZTK0ElDiNGo
	n/Tnnd9HoAjelxD9dKPC2jXI0AMNTfxRMmOGZyamgnHfHfzF+8AadSQucHcv3MIjykl1xwmBgmF
	FLvT7xP+CMQ5nc5t4/8ELpWi45u555d6Z1CCK6kPYyTnhbDGAKyi5bKTR+FBRK1DKL7DT4/v80y
	62XPJnuUHTy5lHWN0IfGgPI2AI8Oj
X-Google-Smtp-Source: AGHT+IFIabePYRIYtpcxXzaSMqqVPGq5rSARcMVUANBjoA+ZM+7MttbdYWxqjnd1rND1XEHRjhJRxQ==
X-Received: by 2002:a05:622a:352:b0:476:8588:cead with SMTP id d75a77b69052e-47977551ea9mr100615211cf.17.1744529565199;
        Sun, 13 Apr 2025 00:32:45 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:44 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hvaibhav.linux@gmail.com,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	rmfrfs@gmail.com,
	pure.logic@nexus-software.ie,
	ganeshkpittala@gmail.com
Subject: [PATCH v2 1/4] staging: greybus: replace deprecated strncpy with strscpy in firmware.c
Date: Sun, 13 Apr 2025 07:32:17 +0000
Message-ID: <20250413073220.15931-2-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413073220.15931-1-ganeshkpittala@gmail.com>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces the use of the deprecated strncpy() function with
strscpy() in drivers/staging/greybus/Documentation/firmware/firmware.c.

The strscpy() API is the recommended safer alternative that guarantees
NUL-termination and avoids potential buffer overflows, making it more
robust for handling string operations in kernel space.

This change improves code safety and aligns the driver with current
kernel coding practices.

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa9cc..f37904b914d2 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
@@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_version:
@@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_update.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
-- 
2.43.0

