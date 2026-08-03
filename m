Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B434242D7B
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 01:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785720396; cv=none; b=ZL9V96tAPQvhBdmhj3MbEuUqQWwHC+HMUQ0WkgEur48uUisONjPgIH8u4AJuqH2qPINqm5T5Lxn7zNWz2pE+tWS/DdOrEAhIpa76/Fs3j8NRJYaupcV5Sn0YkVx/Cujg2OCN/PFUw+Q5eQ8cMFvRib9jI2+WXDkwyQypJYTpnnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785720396; c=relaxed/simple;
	bh=e2uSckTNpBW3/gIESHAKXoBHB2oM+/qvBTvl7GVsLEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJKCjTSTJUKAE1NTy11PM1XfFNPDtHV0wvu81v0WsJoUW/jHDU3kZElUW4woBHjO3Kysj3tdZ3j2af4QrX5UrYiPUBpzxGQobIyz8/jYNy/zwW6mGL3lSHODn1jXNdaa5YavpjFSq7o09g8JAFTagJpjNyWEOdGZcmzxplrNyz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0SWHMTQ; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0SWHMTQ"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c2ae02f69eso2168304e0c.2
        for <linux-staging@lists.linux.dev>; Sun, 02 Aug 2026 18:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785720394; x=1786325194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbfU0zwAGV86yG6dZEcN78jYEMhZWHAP6SHAgU1L6ks=;
        b=C0SWHMTQViowvJk0vDFAqBbbGiKz3uZaJq7EQXHQS5xD5S9MB11izhGtVyge/k9vJX
         CfXuznZsSeb8zifEnB1zTLNeUCfc9vX709jjb+4jcbcgxHD61YSpBvQZyrY6w647i23n
         uyOMQdtrZKbRTSckbB+RUTGXIfSd+B/WCluThoUnacoDLKdI64HOqE1xOA42Eq2d+BN4
         5Y5qKm/YD2mateGDhz/xCy0hsq+AjXePduR+37/Qfde8vMLQyZJwRBUY4wBzR90jkJkA
         5hUTdCgb2Xv3wnKoUnEe5JJMZrWzaEIHuqk/PHOd+sIaVLCZdcy1IwvWgbsMKMKI0cNs
         c42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785720394; x=1786325194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbfU0zwAGV86yG6dZEcN78jYEMhZWHAP6SHAgU1L6ks=;
        b=IdfZRTdC7Qt/p8t/p9RYjKHZswwkm0JShtkg5FptZKGFdRTEBLm4crBVBPwg3SV1ug
         2Pkvmbk2kklS9Ik3DNd7zwgBXgtUJe20AFaMYSZ7BY2RrR7KiDgukSYNCfp91+EV4cu+
         XNWu2tFvySq8unlWM9/YYhXhGKFYP2+Hd2uc7UkYabvq8brcg3PZF16VcB8Jh84OJK+t
         UQYsTZjYLOXzNdBioLQy+HIr2ds5gGIJFyVeewX8KAZ5i44FNGZ1kkhY9b3yKPvdYcHc
         B2OO15YeFBIE3+bYgTmCb0iD50ABjKsefOGhe3cK7zsv7a4+AbXP1bqc82fbfqq4s8zp
         3gyA==
X-Forwarded-Encrypted: i=1; AHgh+Rqq4N9Q3SUALchJV57ZqLZF8si4nBBykISxd2qv8q54Gwy/A/TZsgBne4IFAYRd9yva9QTxo7YbqRzE+MvY@lists.linux.dev
X-Gm-Message-State: AOJu0YyEEXMXShIW44v/YHo3FB0NayYWwXpUnR0RW7U4CvchKW8Cg1y2
	hJ1yTQ3f2NkgbNiWhCKHPPOl2g1RI13DI/9QtCyXlrYnbYPnlzYmkIOr
X-Gm-Gg: AR+sD10u3yoUAP1ZykI40t/OswbG5L8IBVlC4vqWIYtXMc1FP9Ejg56Aj/KRaolOrh2
	R3tW/84kCtJ07G29QLEc8f2Gfh241q1wCDRJJQ2ZbJqBkfBuG3JEclxet+whHzA0yNKY50NKTec
	/HTvgJOnxM815SCfycTt04KbMbXuzH5hSAyxL+pITDd7so7AVz5dJbXHXNdbU0nLOndgTs4h/rX
	3RvXaox0wO8RdLfnz+yMbVmlqrCKdm0jYvEYGfgeLBNDIY4geEzvfgL8fVTyjoEesnIL/PgqRhn
	3FtRRbkFU05LD4pfn1TZZKSeQKE1Ug6xDs129twYZ3wIuc/eaq/vb1n2Cw4RkcTK8+NIbMXi9bM
	IYHEOQIbxuoLpqJ5SjPWwpDlGYH63cSeYkV0ZG1IXSkK8GaJcXj7RQ1EthDIJUZIlGF4rXZn2Vw
	98k2N1Ex7quJLciS3oJlFPUVzuvuxnkdz8zU2B0C5UMrxdu8pHQDtlYw8P9Yy+smGQ73G18VJYB
	YkBtqJjGNaanH02ucVehRif76lSz312QgG2cc51y9DKMxD8ow==
X-Received: by 2002:a05:6122:da2:b0:5bd:fb78:5461 with SMTP id 71dfb90a1353d-5c3873c15fdmr3020096e0c.0.1785720393960;
        Sun, 02 Aug 2026 18:26:33 -0700 (PDT)
Received: from NoahDesktop.tailef97f4.ts.net ([66.231.155.87])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37eb6befasm7606037e0c.8.2026.08.02.18.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 18:26:33 -0700 (PDT)
From: Noah Techoueyres <noahtechoueyres@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	Noah Techoueyres <noahtechoueyres@gmail.com>
Subject: [PATCH] staging: greybus: Replace strncpy with strscpy
Date: Sun,  2 Aug 2026 21:26:20 -0400
Message-ID: <20260803012620.5503-1-noahtechoueyres@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 Replace deprecated strncpy() with strscpy() to improve string
  handling safety. strscpy() guarantees null-termination and is
  the preferred function per the kernel string handling guidelines.

Signed-off-by: Noah Techoueyres <noahtechoueyres@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 3b35ef6d4adb..669185706744 100644
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

