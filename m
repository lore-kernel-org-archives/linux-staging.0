Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266070;
	b=jZ+MNchE3LU0kvVa3Rn/TWR2b0DrckRhYkupqzIg7lUDyJI6MYZb+Ux6Lxm/Kz+KXe3L
	 UELhlsbpJKhh0qWHeP9OSUsn1dHRNFuy0SdSOn+zJc4+DH5Zmia2u24xgfmcH+E6FktXq
	 fpFnE24LU9s2GeLN9Xfz5zdHkqNCYCcJnmgfI2yU+o2fRjz0AUdyQBHi58IuoX38vbudj
	 kxcRNzU/22aNPMMocqgks2W+r0SxekMWgAzktMONpVt2syEkPRe6RMvgA5NbCQGWiU476
	 6N5jE+mmyj6FJtqNoYONVWkHFHyheqJfhpBxf4Mum+VRz31bWjBtaDGnALVb6h/OnGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ttzRCCZmtIduqcI0NA53dxcz7nQK0XuXfcj2kfCcu58=;
	b=5stoz7CKLRGnqHB/bFULhUGMf1O99SQzWSOUbCjuCPV4gccB0CTkaYYKX/U0/2YTMos6
	 NPlbfj5Ajf+Ivsb0+ju40tQG05QWtyhNS61AIAT3ZDnHBo0CMdQpUvjbPf7p368A4Jl1z
	 7tXr5o5SdK/O/cKRnjrUycw/pSWM/crHk4SYK5Uh6k3jMxr6HZtcqIk2PzfHsl6zodmsF
	 pCKCK59AyI5FDMcDngnMS+tTt9gd5doBHBAcahCoJLbgp1K+yE7d4HgpWvuFG4GfrsreE
	 6AS2Gs0b3UK/vs3KkeLb5ac7IUP2feVAoX9j+uxxW/4fYmoCB/ybrLxl8BUMhgMI2cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJI0r1Tg;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FDF606A325
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 23:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43FDF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJI0r1Tg
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so1882184a12.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 15:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794266069; x=1794870869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttzRCCZmtIduqcI0NA53dxcz7nQK0XuXfcj2kfCcu58=;
        b=BJI0r1Tg5vfsXPoUQZoC71+bmZ3ioccDdsbe0NVpF5BGN3Xd/OQqhVAqfNrPA/rDxY
         mcmylUOvQscnX1VwI67rfIZt9Mijm9sUgr/3P7BQk6QNzK5R+g4lswfjxGgP7KBhCqv6
         n27zQOjX8q+P+q+K46EH0/Y+u99MdfceedsalDPQej/+vzwQGgjUsGtw2FbP1s/B1ZjV
         Ib0Kis/54PZn0fKADs8a2QKV0jNlplsMPJmBInLtaN09kie3Pzc+Sz5eiMKOF31b72yc
         K4Psl8N9slXe0CDCrk2xCdhvb04guzYwDPFZ9Orvo9ctRZ3kNDE/DZ8h5f/3xPlQxlqT
         cd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794266069; x=1794870869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttzRCCZmtIduqcI0NA53dxcz7nQK0XuXfcj2kfCcu58=;
        b=a4CrFnuk+u1TXU4H9P6bImCS9/lyLIQP+08iNo3R5IS24qLCBxJL3P7oKu0WlPHIK2
         sN4gZpYHxQW/ug9EJGntSkbRs9UrdQRlgWOISima7ktvKxEHK35WcU2o9IyfiMixS4dJ
         KxeW4H2rk49NKdSssvBOUIlIiSNfqbUBfuk2CxzRb/TFjZ28INzA5LpLcsRyLsU8fadS
         sA6zugbkJlvYWBnRmD1Q53VKmqwJa6T4+JnB/hqn2knMPv6gPIB3ZgyBNJ/vjdSALNVE
         iVpq6cbhlaOs2U2PGyiC6FFq7ROXSh4q7XnRhQJTNetz1Hm+Mpiby50gS1/SKxqQoEGI
         K4Fg==
X-Forwarded-Encrypted: i=1; AL+hErHwk1BN0EKyBeZAk/P8Mw28MVwj4gxrKE6i0VqPzNqaJsu9htWYBEKtFQtfntMaQ24zpqJDd5cC5RbOSe/G@lists.linux.dev
X-Gm-Message-State: APuU4Z8z+DM96kP5K/U5zz8FpTeVK/h+FqJEPI18rvkhUQ7i1e2L83iG
	jtA0IwGJZxkok5lRTnPVcONT+aPRksEFgoP0x55AIWQvekXA402awMKj
X-Gm-Gg: AYBFou2qKTTJr3Ej6UvcZffuR9TaAxGAAG3S59iXiK40oG9pcDoJdm1Zh5LCCfisA0T
	ft7ktqvilcLW2hgCTu1+YDRk2M1LIffbQ+CcLzi8+pZs6pZN3rEdncTc25b/voQKUNjgpe1E60w
	JNLwPJA6nVfAJvGOPbm/SNp6GESrvEB0govElrBgoPJdLjFiO5wgyuc0sXYXMmYHyXu+vmogxTA
	h8wqqGKXeQqyyRxiRa3IXGvkoR1JQEgL24iQ8kEX6TYB9qLKXCgY13sVS/V3Ifra8GyDhE7VQy7
	GhEqC3KFJyQlNaQO1T1qvGcIgdswZJJc3AtGHv34E3t9ekd9HyVJeLBVEthZyxRzk/lkr88bAMV
	g9C07KeEn+Nrjo15unnsP0M7MsazIATbAK59S5wpgEZLTs7JGUPG9gFLKMa6rFTOCmiP3n4+eQK
	bowBIbSX9Sl7DT4MFcFlpqrNNtXGnI3bNAcbPUflcjw9Jd3A+JFhYRQ+bT0fPD5cTN9jaXxH9bm
	P0la5A0f3NT1iq2DjepRVoP6jojiI4GhgvMRZbuGHh4dHJyft2IStcHWpyqSqtPJOWnRd5mNvyp
	7vSWvVfhIbKTEyuNhsvz8KzhFzDvWodLWkl+YqyNV53MGD4gl7/O4UhuL2OSpsASHrxhyKKfANZ
	mxnLg1xSGWTvCmipzNIV+w5ZWsqKRCjgDn8U=
X-Received: by 2002:a05:6402:a6c6:10b0:6b5:6a24:6cf9 with SMTP id 4fb4d7f45d1cf-6b756ae3a73mr532912a12.45.1794266068494;
        Mon, 09 Nov 2026 15:14:28 -0800 (PST)
Received: from fedora.tailb87685.ts.net (ip-194.15.124.140.laito.net.pl. [194.15.124.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790caffsm273785a12.32.2026.11.09.15.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:14:27 -0800 (PST)
From: Platon Miller <platon.ksenzenkokk@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Platon Miller <platon.ksenzenkokk@gmail.com>
Subject: [PATCH] staging: sm750fb: remove unused macros in sm750_cursor.c
Date: Tue, 10 Nov 2026 00:14:14 +0100
Message-ID: <20261109231414.25021-1-platon.ksenzenkokk@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macros HWC_ADDRESS_EXT, HWC_ADDRESS_CS, HWC_LOCATION_TOP, and
HWC_LOCATION_LEFT are defined in sm750_cursor.c but are never used
anywhere in the driver. Remove them to clean up unused code as
specified in drivers/staging/sm750fb/TODO.

Signed-off-by: Platon Miller <platon.ksenzenkokk@gmail.com>
---
 drivers/staging/sm750fb/sm750_cursor.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index f822d147e..571cf86fd 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -10,15 +10,11 @@ writel((data), cursor->mmio + (addr))
 /* cursor control for voyager and 718/750*/
 #define HWC_ADDRESS                         0x0
 #define HWC_ADDRESS_ENABLE                  BIT(31)
-#define HWC_ADDRESS_EXT                     BIT(27)
-#define HWC_ADDRESS_CS                      BIT(26)
 #define HWC_ADDRESS_ADDRESS_MASK            0x3ffffff
 
 #define HWC_LOCATION                        0x4
-#define HWC_LOCATION_TOP                    BIT(27)
 #define HWC_LOCATION_Y_SHIFT                16
 #define HWC_LOCATION_Y_MASK                 (0x7ff << 16)
-#define HWC_LOCATION_LEFT                   BIT(11)
 #define HWC_LOCATION_X_MASK                 0x7ff
 
 #define HWC_COLOR_12                        0x8
-- 
2.56.0

