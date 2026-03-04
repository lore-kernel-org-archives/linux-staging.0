Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5613D34F461
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 08:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613968; cv=none; b=sp/3EHKEnpR9L1aQbCL7vhxJuM98GheMWJqIp37hXAX97TXVSS2y3wrvRjZhnJCo207Qsu9xUKSXZEn3zXsjAyJTmbGPpVM+ol9FkT9zw9C9/BKyI7res3/vNQ/OKjw2wDxBY6h6OMGT7guPk2ZPn0jqa90ptYuih9ALSsOPF8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613968; c=relaxed/simple;
	bh=26HnA6jr8Gpj2ARL5WF/0FOSAJ8I03Q+Uhhb0MqsB6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ta4QVGDLZBPTUThAY6juk6Mvhii7H3H0JjCrrIbf0/3kXonefmj0dPqVg5btlVE7pW5kis3Pko81kLRqFjVNZefmwSH5CeBoazUk/oW8koLTMAlTSnljNRDf8ugYV1CfuWW359ockGW0GA7iz9uJptqyzbaN+LQcWFqdZMr657w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFR/Lcow; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFR/Lcow"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-3597a2fc2beso236399a91.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 00:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613962; x=1773218762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q74EyZl/rBv7dMbdQMZD34TxKD7igp3TSZElWe8rZoE=;
        b=GFR/LcowlJD2Q0CAWwCRXAjJFJgQ+yXuxW5u+UGTNZdqnvAWzYtuWHDumIztEPyxQw
         Vp9/XoFA6gHg60akLdL9K8Dp39/6PDwSmzUsIWPXbj5tAmsuQxS7AQzG5qJY79cNcPTq
         Xi7tiODWjJDgKJi8eq84pU9QspxITgaxj6e8tICkMV6CYiwivUFm7qXwiBWkHzr4nsfj
         QxWG+pfq3r9WDZyjqK7laFMOdogvgfgJHhIGvQ8mUO/l3oXaHzDobmHZdYpBByuh8RBW
         rUsH+KDzsJjRd1NP26/YBmreyqvO8ZQeD6HGft8Ix9/NqSr20OqRIkHFiv37offPg/rB
         BN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613962; x=1773218762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q74EyZl/rBv7dMbdQMZD34TxKD7igp3TSZElWe8rZoE=;
        b=pwejZReoJxhKFvUKYJCc3muzVDL/RYjA6escxcvFGTLpScGJfwp5FICLzCn2HQJf2o
         +m7yZan50OgY90fNDEn7u557QZdqPdrv3VvAE72e9yv8dvFjSf1OY2bGL7NfVaHuQ0Ed
         R/5REyVWLjlxHl16wems7Ij0jd0mCG2bZkw0N5CkzNK1RXiZya/X4FUBiGmiA1/1HC/O
         IDAbID7+CE8uRN5sZkhtnD0eYsv7JxderiLNGBfIDEkEOVLAhDe0T1qYixIgmHmlj5+s
         LwpLqNKgAx8pf+s/5Yz+xIRmkqGh7RuEuviIwPX4I2efpMwXKDtI7w+Yopsee0s0FBm5
         zJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCW4ms/iBZdGb/WQjkQZ1R1W5gj4rn1XGu3/BVdvgChiUdz3qWFhllz57YdibauJLcmIFy/DCn+nclA6JgMC@lists.linux.dev
X-Gm-Message-State: AOJu0YxdkIfW4a/cu7OxCbZsf3TlCr+Ydx2rEQD691bhlxTYAedpZkkp
	hQCRtKAa2r0iRBkUtqezbWDFr/CzPoGXH4cTrSWXSofAoL71eT/4PxLT
X-Gm-Gg: ATEYQzwm4YEAqC9Ec62zbyyzMra6Lmn47YRzJLCHOLlpVxdWFwon6Ysx/Q/qqCZIEYu
	ANU8vNUwSwLWsG4rjF8+6wNyxD6xbzKfv9qhI/ECoMIYc5tgb5QGST/ylPwH0q8x60icx93xZTo
	2IC2DT6YfbyUEjHH9eBQgGVVyUFq/cddd5ujy92fiyeyBycc9Zm2U643unwEtge1G1tCW231UOG
	DRy/2dexlO08iXZFTZSXIE0aGtW50tAN/x2BZosHiQSLyVxmX6RW41zq23AfCuBcWIGI2H4IDek
	h6qXwutUjhZYp1esTaktGFo7yiBFehxOTdRJzi08KwEGMjyYiRDfoiV8m2Ow2d+PiYKosc4CP/R
	FAvc6HGwwwnlT3+qRC7o4nbnjCI9I4IDWqE17/7pIAKRfQFXh5EnbFvwCkKcwFO5GJ2TDnfJp86
	A6YP0YmMlt9aMW1e6tm6GNcGJK3ze95NzvVB7Sv/J2rehmbExlXaKw3b4OzW3pPkVdcxA5lA58a
	wGEg6BCMWJCEkI=
X-Received: by 2002:a17:903:2f8c:b0:2ae:63b5:1785 with SMTP id d9443c01a7336-2ae6ab6c988mr9891635ad.8.1772613962439;
        Wed, 04 Mar 2026 00:46:02 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm122010285ad.6.2026.03.04.00.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:46:02 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 2/6] staging: sm750fb: sm750_hw_fillrect: propagate de_wait() error
Date: Wed,  4 Mar 2026 14:15:41 +0530
Message-Id: <20260304084545.156170-3-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304084545.156170-1-officialsohamkute@gmail.com>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the error from accel->de_wait() instead of returning -1.
The caller treats all non-zero return values as failure.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 046b9282b24a..1bd0502db039 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -90,14 +90,12 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		      u32 color, u32 rop)
 {
 	u32 de_ctrl;
+	int ret;
 
-	if (accel->de_wait() != 0) {
-		/*
-		 * int time wait and always busy,seems hardware
-		 * got something error
-		 */
+	ret = accel->de_wait();
+	if (ret) {
 		pr_debug("De engine always busy\n");
-		return -1;
+		return ret;
 	}
 
 	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, base); /* dpr40 */
-- 
2.34.1

