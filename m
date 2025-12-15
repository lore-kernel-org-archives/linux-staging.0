Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C2086359
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 06:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765780356; cv=none; b=RSOtd7ZW43xcqP6X5KnyFbwCJ60UyunZyYKTLtMihgK8YolDDI8K67ka+L/s8/1XoxI8dmmPULiTP0K4IAPa8d9sBzJPRUkhLPfT0TINGo37MtKFjJdSn/Z2q10mFZH2wYfPyYk6XdmA9lnLcA/uFWot5ZojUrVN1xnIJOyOqJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765780356; c=relaxed/simple;
	bh=AYCZZ4VSUHIog52VaAGOjxBDR001R2KBqloZap1AoGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFY1ya5Ag7rHT+bk6Rs38G4A7AX8pZ5EkcWz6l0Ucl5lNzg/n5T9f6qLawSOO4AITuZafrrFsy2JczGEbaazrroG7h5K4vrRBPbsZxiXsEzw3oVjcueKcZECpfpTjZ4MyupRQd4YWCuOPBH/9aXPsLQUGQNW+CS1HVZFhydz9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDT8HMTW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDT8HMTW"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso3442301b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Dec 2025 22:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765780354; x=1766385154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UHiL+zvbYjzmuHwytg+oXUxOcz+97bRtWTebwcTRqns=;
        b=kDT8HMTWjsC4S7+jcVRnSg41u4LzBzz43rCMK53Isv37kVQAht79EkMrqYQGZsjhf1
         A3W3v78qk+8vxIcPH3D2hziaN1PS5ypRLHnSfBKgLaX5AfxPgdX6AjWY8fX1daRnMVqE
         9TQnXutGBRYMbDfPeMbdcphMPoaUcfar+0RsT8t+jXVeRCJ79gc2GlA+i7jnc8TDF6HV
         y83ablhqjp79NNjTj+qQLVK+n3mUHlQBDoP7+nWPLl23EHYI7m/DBaVrvU6wbpvJ6nCu
         9e48gJMRksGShmUXaqP/l7ufTakfn7PQQn6giXzjlTbl3QaYZEiSH4J2uS27lcq4S9kZ
         VJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765780355; x=1766385155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHiL+zvbYjzmuHwytg+oXUxOcz+97bRtWTebwcTRqns=;
        b=F2o2N/TP2gUz2ny1inEt/CFF9KryINt1IM7eOba9yMTvbqI9FMukKDsI/rF1liCmla
         uaC3jzIlH6i8gQEMr2LymG3eghDV0/JlQ8PYJZN3X7HLUdm3uNlbLnO2J4VNwhtqCSU8
         hPcOVClznY/pikpRVidWmmK3XJVkP4B2aA1IMWx18MSGoJT1hmqYOTkBwjkrrAoD9szc
         JD+Q9d9rcSzRbjrPSB+h0rW1CqwCX9/RtZvGPSTaB1nXFlj9wx+vt3sFGZCZtzZSOhSX
         8qsZzTxxIULJU5suAGRGVoZMJh2EyNGm+ZPX911ltyDRp/GD0gi6wPo8wP9IOij1c2G2
         bYzQ==
X-Gm-Message-State: AOJu0YyBmzy2TOTTettf+RPjRLZG/VOcnU67AtYp4DRdWUo0y29s1wLX
	tN5i74qGbTX43crW1nzJHpQLhkmTqJ0oqjXVntXQSAPImLk7rnfJonkt
X-Gm-Gg: AY/fxX52dN7Xavo6f7tppfz9CdNY2tPB/FEVoLGURqB08j678qs9Ogq7BQezoeToELN
	tLHWMug9oxfR6aMmOQqKPxUSdDmfoIkqnX05oxH4syX7nXqun3ihXklVXOGe4tcIeJU6g3NFHYF
	yFBxZpuOnSHUNroM133ULI8pKGVIGk2RmouQFTS1OLntTnfbIb6L7GPIcjwdzp0E2M/iH75Qbqu
	NQfXjY1wX4rOpdkeZltyc4j0VNxFEcW2TZkYegb0EQldar4ZWJBmO3aqlA6lY4BMuartk4TTNg2
	Jd1mIlrcSyGov9rPdVsyOBacj+HTdjrplKrUcx4Fy6rBMW/sL4q4fuYR47p/UNqrCgdtR7ks7Fv
	bIy0MumpeGcKhKmEb7eUIKtFQ/XzDFM0gnrQQYUOHzehv3850sNslOUIPQMJ6JWVQWNj7bKyhik
	D9vtn736A3YUchT2qBcEkJRPrkk+JbW1t9sx6kNaKpripztp35aU7xFe3lNs1dQw==
X-Google-Smtp-Source: AGHT+IGogYCL1CULo7PpNWbKYVhdwxaPYLkFUk1rjLCp/12k+o3JI0AwAnWyMJyyHYtv15rs1mcj/A==
X-Received: by 2002:a05:6a20:6a07:b0:366:19e6:5089 with SMTP id adf61e73a8af0-369adad00c1mr8858066637.9.1765780354504;
        Sun, 14 Dec 2025 22:32:34 -0800 (PST)
Received: from ubuntu-kernel-dev.domain.name ([106.222.227.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2632c2f7sm11406327a12.10.2025.12.14.22.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 22:32:34 -0800 (PST)
From: Adrish Bora <adrishbora@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	Adrish Bora <adrishbora@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove dead code in os_intfs.c
Date: Mon, 15 Dec 2025 06:31:02 +0000
Message-ID: <20251215063102.1836-1-adrishbora@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented-out dead code in netdev_close().
The code was previously commented out and is not needed.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Adrish Bora <adrishbora@gmail.com>
---
Changes in v2:
  - Removed the dead code entirely instead of fixing the comment style,
    as suggested by Dan Carpenter.
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 6ca6dc548805..df839ea1bf1d 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -934,14 +934,6 @@ static int netdev_close(struct net_device *pnetdev)
 	padapter->net_closed = true;
 	padapter->netif_up = false;
 
-/*if (!padapter->hw_init_completed)
-	{
-
-		padapter->bDriverStopped = true;
-
-		rtw_dev_unload(padapter);
-	}
-	else*/
 	if (pwrctl->rf_pwrstate == rf_on) {
 		/* s1. */
 		if (pnetdev) {
-- 
2.43.0

