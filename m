Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5D227BF7E
	for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753202900; cv=none; b=uc+FC0GgfYnTs7A0Duj1vFBu2qlkVY5/4hy2744V2TkwwgT7dZphB1tDH/6y0WpwfTmVwIaCdER6ggrrmiefTnTn+5m3XjFYxdSwh9CnQR0/CZg/uoBLeGDBiWDDvSSfKcKmvLaAcBnT3mUoQMLWFKMPaidUaW3sGpo5lSmXDog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753202900; c=relaxed/simple;
	bh=BQLxK6QNZqGDGYvT1tqhX06NLvVqubTSINaqRw4OZRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k/xCnUE3XsR/OwziJmsBJbAL9PRFNuEYE+J6Qpq2sablxCK9ZmLiBzZwemgwsYXHdkIJCvPvoV87mxlXgj+irwk2XCRosMaVHDKEmF9BJdPiGsxz78fUISHIrJKm4NjYmWCDWEkxj7cOxpxDWLTbwBqBt+PrX3TxIfkFpVN/JA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVLTRA9K; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVLTRA9K"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so44057305e9.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 09:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753202895; x=1753807695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3lRxwpSev28TePbbD+/Qgoo79t3TAvOtgeCaVQp08s=;
        b=fVLTRA9KDE6oJgm6H0ZA7QdipoP0Qw+/NzBNH6IW0Rccpvq/V19e5E98DbpqHxVCP0
         aOPXJx3pCo6UsQR/Ir8Zc5ax296VEM2S9wjAsuHkhBOsups1tM9GAZDVtr2wNuu/W/qw
         nkTiMoc+xHbG+zuD4sF2PYbdtuG/hFTzjaiwHyqPd3XUcOMFKMiqHzrx2/jJ/+/bWiXo
         leWjrA8uVRUx5vITdUs6kGvpisAmTemHcikZzp2LiM5cTjbD3P2LKzQduwkch6eyLViO
         5YjimgH6/QHCz57FlkYX6Ia/zZR1I77fnW+cHH71pTi1WZFRwlDAYo20+tbBjdQiDGOQ
         XVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753202895; x=1753807695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3lRxwpSev28TePbbD+/Qgoo79t3TAvOtgeCaVQp08s=;
        b=sjIsODXRpSBQiMntwIxoypU8uNYdWQatmvKrVnTZkpTjwR/qmwauqXdVHJgBYsBoyn
         ViGEdlClfUl4OAupBDoCuFyFMPQzzGgGR9V5SoZtGVmZMQRuJnumpkt9aeOJhgqpxp4A
         uX0QYefDGbvD8wuF/A6fDTxLYNdCuRrPrzkhlg0A9tHZ2zqcyclTvkB+/KyA0jqpEBk9
         Xn/53W3uguycgbl41KOg8oWbutaK4hO0URrJ5CzoqoAKNtTGDE7ZUCDWx5aMYx0BYjPL
         yzZ5BgMQ0FFTpnULRXmJw6pRBm5XrQMhI7I4VWeTqYqLzW5yzrtUP9VsTjSZ6O/5Lth/
         kgWA==
X-Forwarded-Encrypted: i=1; AJvYcCXSfonzU/xW40vw73nn2P7vmM7AotE3nZWhuHtZ0scmlMDc3zt7nGw1uLNI8bR0k5i8Iu9rk/XH0sdi8z32@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7DkptNo3W/oqBbYeiNLg+JnfNVgSdVnmVyaZ7gfgYRYNuyT5k
	mF9NlF3RLeKxbZBdEqey+Jorn9Pkrq5O+uzb6aOyyz+KU7Ijys6HmKiqSHLgyQ==
X-Gm-Gg: ASbGnctdWBwMeFMzijTi1rtxDezBc/8BauqfAMTgLcUpYAKsgl0yI5qCPsy2v8gvxxJ
	m/EA8qxPgQQuCR8Ci/P/xRsOmoTcEgPtKkOKsJ5Hn1+ZDMkXfDJ85fcwJtllTmDGe6V82YMbMle
	iXfetTK4q7JSHxtBPeJ/SesTewxRgBa6vdszQZQ9D+z5ahOTA4Zz1jc1opvkU2blh3WnzUEWYDr
	TLccZLhIS1yJDyt9n5PjO99pQuO1OUTc/6a/SOSqqImCew7YtTi9hoNcIgYG6YSLCd6OxVpi5JB
	3JCg6MehcWbeQuBHYCQGQUBE76RMpfI/ckrZTh65VS8ho9sm2LRM3SYuOvRs9AfP68rT/FISgoA
	26jVdVdJbUVautPaeE0Ek/l85u59yUcluavKfMWU=
X-Google-Smtp-Source: AGHT+IGSrnv3OH23b5AXkhuLVBuAoH1QvwJx6IlIkzLx0/LotdK7jxu1iX1BJQvtiSRBdKjTuTDLPg==
X-Received: by 2002:a05:600c:6219:b0:456:43c:dcdc with SMTP id 5b1f17b1804b1-4563b8fcdcbmr130426955e9.33.1753202895054;
        Tue, 22 Jul 2025 09:48:15 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f2bb4sm192801785e9.8.2025.07.22.09.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 09:48:14 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Add init response codes for new ni-usb-hs+
Date: Tue, 22 Jul 2025 18:48:10 +0200
Message-ID: <20250722164810.2621-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A new version of a bona fide genuine NI-USB-HS+ adaptor
sends new response codes to the initialization sequence.

Add the checking for these response codes to suppress
console warning messages.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 7cf25c95787f..73ea72f34c0a 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2079,10 +2079,10 @@ static int ni_usb_hs_wait_for_ready(struct ni_usb_priv *ni_priv)
 		}
 		if (buffer[++j] != 0x0) { // [6]
 			ready = 1;
-			// NI-USB-HS+ sends 0xf here
+			// NI-USB-HS+ sends 0xf or 0x19 here
 			if (buffer[j] != 0x2 && buffer[j] != 0xe && buffer[j] != 0xf &&
-			    buffer[j] != 0x16)	{
-				dev_err(&usb_dev->dev, "unexpected data: buffer[%i]=0x%x, expected 0x2, 0xe, 0xf or 0x16\n",
+			    buffer[j] != 0x16 && buffer[j] != 0x19) {
+				dev_err(&usb_dev->dev, "unexpected data: buffer[%i]=0x%x, expected 0x2, 0xe, 0xf, 0x16 or 0x19\n",
 					j, (int)buffer[j]);
 				unexpected = 1;
 			}
@@ -2110,11 +2110,11 @@ static int ni_usb_hs_wait_for_ready(struct ni_usb_priv *ni_priv)
 				j, (int)buffer[j]);
 			unexpected = 1;
 		}
-		if (buffer[++j] != 0x0) {
+		if (buffer[++j] != 0x0) { // [10] MC usb-488 sends 0x7 here, new HS+ sends 0x59
 			ready = 1;
-			if (buffer[j] != 0x96 && buffer[j] != 0x7 && buffer[j] != 0x6e) {
-// [10] MC usb-488 sends 0x7 here
-				dev_err(&usb_dev->dev, "unexpected data: buffer[%i]=0x%x, expected 0x96, 0x07 or 0x6e\n",
+			if (buffer[j] != 0x96 && buffer[j] != 0x7 && buffer[j] != 0x6e &&
+			    buffer[j] != 0x59) {
+				dev_err(&usb_dev->dev, "unexpected data: buffer[%i]=0x%x, expected 0x96, 0x07, 0x6e or 0x59\n",
 					j, (int)buffer[j]);
 				unexpected = 1;
 			}
-- 
2.50.1

