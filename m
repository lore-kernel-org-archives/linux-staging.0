Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FAD20B1EF
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324271; cv=none; b=BJtXtHKvdUvOsVyjWcq4XYW5WiqfdqgT6b8IxGAzunHx22QmBv767sLgLyL/I57+d6ybVkwXuvH3lng0VIERO23EUhZshBn22B+pU2N27plnLO2jYlFypnXV61FTxzcHcLi+Z86agSdmYHzKG/9HDdfnrBvCAY7h3nIa0e10G7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324271; c=relaxed/simple;
	bh=IQZ0iUbCC9xvjEAxIXAcFLwsoJQ/RJQF6AQ/NOmcWQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuoN7Q2bmSw84IJ1mwTCMhpeWIMzL2CeICO3+IGxcYnRR2vSE4ncVxhR7Bl0SIdyvuU//psoMzRGQWZtcKXc2y23KrRgnA/wtUXsF/ecOn7ySvclm+0tFXQtvMF08Y0U6KXe5LhVQmbv9JiJ6xYk89tqSG+OR9Jq9DMfKAKFgY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTveE1eT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTveE1eT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434aa222d96so84447105e9.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 06:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733324268; x=1733929068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmrmSp1fKYnprWCdDM12P2PuB9fwFiU34+5ag9mQwmA=;
        b=WTveE1eT98XtK/y6mgufUITPY21suY7TseCDblG1NjEhWeYqM7Z+Op7ob86NbNy08I
         FiMz7LUexlBet4Z9E7bogj1hQ+/NfeJsnByAPbAZDaADD+yayCXWYzjRhRez96VooDuV
         WpcfcjsclW60wc4/DNMEE97MvNT6k65Dc9oxwFpRsQHHIWTIZFN6gNybhORwWWGmVY2h
         Tei/WgTPbNaMSEhoXeeshxtqIP/01/ywV+wlPoYWIRYGHj0sUToa7enrz4IWqqmiV6zB
         vsrRZHN/QNPal/luNl8QFHw9qLUapijzDFWZUc41HOo0yCe+8xvFM+CVjZhIA88EnpMh
         028A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733324268; x=1733929068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmrmSp1fKYnprWCdDM12P2PuB9fwFiU34+5ag9mQwmA=;
        b=bzlLPA7k/VpuBV3kHQVNBYLK3Q6Bxfw4nR/5rutuCX7lM1nAfYtU2RD/W72FuhfQJP
         4hkIjZBwgiuPExOx3OxVOoOqopODbSZTASySiwj38YbYRRHVCofC0FmGs92Qa1njV7L+
         ERGsrK7XI2uiZRvE4n/6VWWaANLP1JDaba+GoqVN5UTSqtRfc8BxR6Twmo8RLqtqi/uC
         eMvFl4209KWgdkprCmLP0vw4VpqX0q6n5rAJ1+frcb7p+i1JOvyfwsjC810Ba0y6nwfC
         HB/ZDXeMCRg9KWmvP/ALs1szknBmemc7Z4HKtJ8eJpWLllHOqtq2BNeg/xMDaWiynxck
         Lreg==
X-Forwarded-Encrypted: i=1; AJvYcCW/8Yx9OLmIsbSyMyF0qu7timS6ldz95z4HLdqX5hPYQIKvMd+TShu/kuOvTNbegnF1dDPqqXeyrhsAkBqk@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3ug9A3SHX3hpxLFZtUlUBZGNpTVWQ25lCvKwHSEa1JHUbtcEu
	pj6bXkwUJN3/jl8Uv80ITfE8BWSLMDABwQE9oRpnV+Kkeasmnq2p
X-Gm-Gg: ASbGnct5BXtQng7KxSthCzr/2QnqOOPkczLN9e7TR7DBL602lumOUgs6F3H/pwJYqAM
	fIQo7IGOJbzJMHQ1MjdsqbOx7LwDGzB7ZGthvLSqxrTgY0IQ1HiJlfme+w9I4/uRQcweuWwcEkL
	Mc/iHScvJ2Xtkl++FhqopNHk5niRlJG6fKozEQDYoL4gijv2WJh+x7z2vLmYBhRFM2N7xf1vSWg
	P4rKEgZmAo0ptnLUCvP1rq/MEpi4LiDlEW3OmS2iCzzcqnotIZXUFHp3sEUCm15uFsgpjbKizUK
	CbD44g3qbA==
X-Google-Smtp-Source: AGHT+IEb3yNqEWKu0U6iHfrsW75PsjsstsCnZ+2ZD9CQrrrFiOglaJeYkLYoz+JGopPvWBlMP/JW0w==
X-Received: by 2002:a05:600c:1989:b0:431:6083:cd30 with SMTP id 5b1f17b1804b1-434d09b2a75mr65718905e9.6.1733324267469;
        Wed, 04 Dec 2024 06:57:47 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527e8besm26678955e9.13.2024.12.04.06.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:57:46 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	Marcello Carla' <marcello.carla@gmx.com>
Subject: [PATCH 3/4] staging: gpib: Fix erroneous removal of blank before newline
Date: Wed,  4 Dec 2024 15:57:12 +0100
Message-ID: <20241204145713.11889-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204145713.11889-1-dpenkler@gmail.com>
References: <20241204145713.11889-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace original blanks with "."

Reported-by: Marcello Carla' <marcello.carla@gmx.com>
Co-developed-by: Marcello Carla' <marcello.carla@gmx.com>
Fixes: fce79512a96a ("staging: gpib: Add LPVO DIY USB GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 47db17418a74..c30db3615f49 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -97,8 +97,8 @@ module_param(debug, int, 0644);
 #define USB_GPIB_DEBUG_ON    "\nIBDE\xAA\n"
 #define USB_GPIB_SET_LISTEN  "\nIBDT0\n"
 #define USB_GPIB_SET_TALK    "\nIBDT1\n"
-#define USB_GPIB_SET_LINES   "\nIBDC\n"
-#define USB_GPIB_SET_DATA    "\nIBDM\n"
+#define USB_GPIB_SET_LINES   "\nIBDC.\n"
+#define USB_GPIB_SET_DATA    "\nIBDM.\n"
 #define USB_GPIB_READ_LINES  "\nIBD?C\n"
 #define USB_GPIB_READ_DATA   "\nIBD?M\n"
 #define USB_GPIB_READ_BUS    "\nIBD??\n"
@@ -587,7 +587,7 @@ static int usb_gpib_command(gpib_board_t *board,
 			    size_t *bytes_written)
 {
 	int i, retval;
-	char command[6] = "IBc\n";
+        char command[6]="IBc.\n";
 
 	DIA_LOG(1, "enter %p\n", board);
 
-- 
2.47.1

