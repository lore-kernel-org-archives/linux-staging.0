Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C316021CC6D
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 17:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997704; cv=none; b=h+rw1mrJa+KWzlB0/AfULZUCgCYwTdEJsiZYGB4Nffcxq7nemTN9mtm3nF/q3T3GtQQbmnOx0k26k7pQyFuAJL2V0oruoMHDgNukTwQLVdOVaGZ7geXCPG9HCqE2FA3Bfl6yYZuhgxwhIJjOsVrmSXOIqgcVxTIkh2y2nwVVJbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997704; c=relaxed/simple;
	bh=zbdvaSiXX2oUTDa7WIbY958t9msSvAmj2Lshi5nbldg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P07KGOFieJ8g2s3H00nBBMfgnzQv1NAruGANAlvErc8HPKx9mxU5oDzxwhPUe+CY+AAge0FJdUbD9g0/7i4W7CVFdlF2Uu+YDblP+RYNJnQV3OIEJlIEKKNVLUvOsLmylHm317NvJdYRwbk2NSv3vU6qAI89KASAoZ01MOcycds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnMAiAnv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnMAiAnv"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39149bccb69so2095768f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 10:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997701; x=1745602501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lo8NK9cb9305tOCf3KZaXzeHg3jD7BCaFh2Dh35qq4=;
        b=YnMAiAnvjMq8xnfwuHvqzDIRF7hYDToSsu/5G4TbFcyVisAo+ua808ls0b2pS5LNJJ
         nG+p/tIixo1O7EZpSQ60gOYI4+0TA+DyxXyWS89DyC2NiB99K2BzvPAXwV19DgwTitXz
         fWT1ZcHLNlscg9adIXrheMl/UoR08WnuP/q0sH/g5pDtQTFdEEbS8pYXXw1WBLU7N4ik
         OEy7GWx2tK43Emp0BgeHor9GYX4LdT7IOo1MeIUI0CJdgLKaQcdE3RVt4CKEReSjWAME
         Ft5Q1D4GfKTruMsoGaSVpFCsnqGBGCoeX/ip5wcTFjJM8ZmBWmPQR1HEddV8n4wEyrpY
         gKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997701; x=1745602501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lo8NK9cb9305tOCf3KZaXzeHg3jD7BCaFh2Dh35qq4=;
        b=M7acwTCWm4Jrb6qyIjA8Uk13Ijdo6XdR8qkREQ8tgv11/P1Daweq8c/h9Uq3C0eFl3
         KVs1QtvljPzMUrCpogcm3w5nSj1M0keVdaT8Qk8W+hjmLG6fk0e6xc0hl6KRmzE3f5q1
         DlPdQGS8tVGeLH6qFqZ+heegJO/h6/gcU5mBpJDPKvd12mJq+tpDF8r36+unwkpoAQvD
         4AiPvYBZYqN5kG32m6qsB44qYvZJWzgMwgZZrcheTrzrDccAYf9R8za0lLnEvgG0GWVl
         YtbHfoWMyfGdrZFdzDVZz7qSevV6MeH3KcE1pim3I/+4ystN2hJ1XEoJ/WkT6qI3VBy2
         YiUw==
X-Forwarded-Encrypted: i=1; AJvYcCWeu03UR9wtvOUfaSpqybAsJQD1NBeEmF5uXiaoF2YXAJXHVac+L2tlomIUN8A04Ba2wVgzjqo3SqxOTyp/@lists.linux.dev
X-Gm-Message-State: AOJu0YyWI5i7u5E4/jbQ2id52qE/K+u9YWX0cen260Nv2084iFwzmFsF
	vnyyWlaFmXHxd/O3iU3XAaL1s8GxhVAB0D7gBtyl57WjyVPv58Gf
X-Gm-Gg: ASbGncs1fwytoqEUy5L2HiCxuzToE1EgCrZEITRPhpfYx6IbE30TD+iHMPfWquUbgJM
	nz8lXM+Ajv6tVr5kBpubI9WhrwjefIxIKehffEZen6Lvh/LHt4ye+sj/ggA1gXd+IZnFRxv7Nyv
	pp/Wj1cyCOYCihz/Yr0mWZQUDINi67hXz94jcfXMGMUcBmAQFHIUMUSNKZyjopGJaK67WZQwmon
	AeoCC/bd/CLW/yStVBfSkM52Qw5JxgEWz5R5+kDpoJTEYRy4I4apID4rbUBAvz4Yh8edlR2hZaF
	g+AaUIFDiNYjrqIqM/0jiU9c5Gxev2jsIW0JU/PmY0CkXaXRDohr9o+1zxwXpFWtvnatIDDiAKn
	N
X-Google-Smtp-Source: AGHT+IGycw6PG3LhA4R9z4UXQhejlyXvLsQYTBzDufjRPf307pnkU7s+bMube8/17mGSZ9ymhrWU5A==
X-Received: by 2002:a5d:64e4:0:b0:390:f9d0:5df with SMTP id ffacd0b85a97d-39efbaf141amr2577524f8f.52.1744997701027;
        Fri, 18 Apr 2025 10:35:01 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:35:00 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 5/8] staging: gpib: Remove atn_asserted global variable
Date: Fri, 18 Apr 2025 19:34:31 +0200
Message-ID: <20250418173434.2892-6-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atn_asserted was introduced to deal with an issue where certain models
of the Raspberry Pi would lose interrupts under heavy load. Using
a combination of edge and level interrupts the problem was resolved
so the work-around is no longer needed.

This patch removes the work-around.

Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index caa8361da696..1d650cb57cd2 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -306,7 +306,6 @@ struct bb_priv {
 	int dav_seq;
 	long all_irqs;
 	int dav_idle;
-	int atn_asserted;
 
 	enum talker_function_state talker_state;
 	enum listener_function_state listener_state;
@@ -614,7 +613,8 @@ static irqreturn_t bb_NRFD_interrupt(int irq, void *arg)
 		goto nrfd_exit;
 	}
 
-	if (priv->atn_asserted && priv->w_cnt >= priv->length) { // test for end of transfer
+	if (priv->w_cnt >= priv->length) { // test for missed NDAC end of transfer
+		dev_err(board->gpib_dev, "Unexpected NRFD exit\n");
 		priv->write_done = 1;
 		priv->w_busy = 0;
 		wake_up_interruptible(&board->wait);
@@ -686,14 +686,14 @@ static irqreturn_t bb_NDAC_interrupt(int irq, void *arg)
 
 	dbg_printk(3, "accepted %zu\n", priv->w_cnt - 1);
 
-	if (!priv->atn_asserted && priv->w_cnt >= priv->length) { // test for end of transfer
+	gpiod_set_value(DAV, 1); // Data not available
+	priv->dav_tx = 1;
+	priv->phase = 510;
+
+	if (priv->w_cnt >= priv->length) { // test for end of transfer
 		priv->write_done = 1;
 		priv->w_busy = 0;
 		wake_up_interruptible(&board->wait);
-	} else {
-		gpiod_set_value(DAV, 1); // Data not available
-		priv->dav_tx = 1;
-		priv->phase = 510;
 	}
 
 ndac_exit:
@@ -850,6 +850,7 @@ static void set_atn(struct gpib_board *board, int atn_asserted)
 			priv->listener_state = listener_addressed;
 		if (priv->talker_state == talker_active)
 			priv->talker_state = talker_addressed;
+		SET_DIR_WRITE(priv);  // need to be able to read bus NRFD/NDAC
 	} else {
 		if (priv->listener_state == listener_addressed) {
 			priv->listener_state = listener_active;
@@ -859,7 +860,6 @@ static void set_atn(struct gpib_board *board, int atn_asserted)
 			priv->talker_state = talker_active;
 	}
 	gpiod_direction_output(_ATN, !atn_asserted);
-	priv->atn_asserted = atn_asserted;
 }
 
 static int bb_take_control(struct gpib_board *board, int synchronous)
-- 
2.49.0

