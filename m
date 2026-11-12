Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499554;
	b=G7GSSBhZUtitoXvxTOCMgZ+wOO9FfI5l5y9OmyxR82cAHdACJMEpK7mYCR6lajb6QSu8
	 0uOF0G7aoRtHANmvj/z/tC9l+IvNiUFisDbVi77NBMFcjuBTS8iVD6awtPiKejDYRJPZ1
	 PHS6ImhlGOrE8DhFtsmuiXs2Q+3eeDxptIb9zcsmuTbGCedgUz/1xQeiMF8iqEYSxG0/S
	 8HH7j1XMpkEBPdpVaUNxBHbfiq3Et5d6BwbJna/izBrJf5nYijWCnC0nYjHvIIH65vhWl
	 NicQOqBTd79SFIr3IIfODvQ7c6/qH8F4DGlYCKtJkEnz3hpmBhQwdARqD3rYFaj/3Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o8iTVgOTiZT73c0h3+A1eigD9lE2pHsZudl5pIAmkQI=;
	b=iqFRvB1iaUpV5H4S3cAtyyTrWszPlJeZXs4db4FT8YdX43K+uQdO+upk+/5nP8yAUz2w
	 oOf4tGA4NKFh//aJm05ih0oDA+S6Oicebl86TSTota84efliPaQaVH7rXhjF/xHCZKJvr
	 YNlzSO7wIoQwSptM7Bhh0a2i+u6LMiG1QdVoifO0NLXkin4A48n7MwRsm+TA0CXPSTsBo
	 239SmeEpdyreehCYh5UlQ4YH/vV5+tBBWxczPwCnwWG0Y0mjDFZWILJPTEdmODPP3zhPa
	 0w4Wbotxp46zxjszmuMnSOrKbEbrVg9/QqXdU66oh0AAm2Tpunl6aYxCYeWuX5nlmmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IRWOxejG;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A5606A331
	for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 16:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47A5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IRWOxejG
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4044207f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 08:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499552; x=1795104352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8iTVgOTiZT73c0h3+A1eigD9lE2pHsZudl5pIAmkQI=;
        b=IRWOxejGDTZ33t7wAaJe78oQ/Yr1Oy/JMWswsm/hJXvfZpwL8PPGHyfETDw/RWBe3v
         k06Llv43c9dVaG7kKxnhufk6p1dQQSBEWiF7zYd97KVrXBSo1LO9gc4dHP57ziGOCyba
         f+Iv7f4tTI9/I363E5GB8whRmdO6c59uqI21dZZlb0xDCQeVcwSUcptHYpFcZ6C+bQ/7
         ZCHT0Dxik57Y1BlGAD81SXlZ2p87h4Ynlw2NZUUQlL8qovieA3BjrS0FxCv0IJEL5kXD
         7VwM8GANL+IOkE11841FzTYZWjPa8KjOWupia4JK+xWuu/3MMbeejgi4BQ6hJ24U/XbW
         evzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499552; x=1795104352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8iTVgOTiZT73c0h3+A1eigD9lE2pHsZudl5pIAmkQI=;
        b=TAdYFVBzkXbxPuddhxKvyaMlbr3bS0e9sq3Uss5OEOyCteCjVj689mpR70yk47rPfi
         6iP+0BhEbgICzKSPhA52uJSsb394ECASz9iRIWBTAr+RpxpIbrgR9tEk73MX9UNNjCH6
         OdxEJBUNXQJzmuooyEkCyNy23TRvz01PiIk6TbqNSnis6O46ZzKFLEIkvMLiCJxr1OUn
         eRpyPn4IisKsXlGElw1F9C3TqkNdzcz8EgHiI1R103CkA1rvyRoCnnyx719u4YIoyAbY
         iTiRJi6/vudz04lBFBFFmnqgunVSZsIT7g3BL/VRjsHZ9eZ+thre8hkO0UxteH6QaTiV
         xU+w==
X-Forwarded-Encrypted: i=1; AL+hErG/b99LtU9E0vXw4UPHJha8yqr2PDrzIvegUL6a9Q6Fjq1oZT8x5rsoZ7HIxq6LcoJhCn6OgSSlcg+vU548@lists.linux.dev
X-Gm-Message-State: APuU4Z9TSBs/9LBlUAj1UY1QonWbqJH7PfMs/j9jXKzOjqt8O/pwLSZI
	Yt3jH58fmI2NGZ4Zd0e625BYTOWUI6eZXCcpnVsUd7ikKsMqM48CGhAw
X-Gm-Gg: AYBFou0A9iBUJRUQ4xJlUu2Nhn7+RcV736WO0zGWHp1cumiLMzT8zapejUPLFnFc57t
	jOEbNO1y4YNSTLL7cUVDkeH4qbTxMH5+j57J6ZrZMOioZE3OCbaBb+FUumG6mrRRa08feu92ib1
	m3uEsnp80SOGuiKeM+xGddpKVLohsS7eYQLIh4RK1jcTnBI8mLlqPxOonYClZQJTpjT5kD5W658
	cHBWODDPw9q4gKS4cDNrC2zXefBt5FHsfIXMazF26jEB2qaqx3NPiIUnTBYBFdVuec8HUxqb+M3
	bDABDGwus6Jta8GYhGNmTVpYVLMvMVeKtLJBk7HzibwkbtzxZD+Nm6XrjQS1AXkYA8VZNVuPrhj
	nFj3q6/Dd8CpQ8KGVB0DFSt3YmODXhfm3lf2VHmE0Zxs4Ia/jKmG77yNmXOcfaQdUVQEwbdbYN2
	+MR3buBN5//H4gxW1Tbzaq32FaozIkliYYS5448KlPlVt6j0VeK5kUg3cV7w4BHn7RB0Y1HNMUv
	W2WmKO7661PRwkrOObfc47oy8DCORmaOM80i9H3UxQAiE5BurRoj8jPCSf5hxXLilk+tx7fmJm7
	XlYf8Mm45cmGCTiz3CwKNUlAWTU+dyyWZoL0pCqC42hoQuLGMozvT/1pP+48
X-Received: by 2002:a5d:588c:0:b0:48c:414f:cc12 with SMTP id ffacd0b85a97d-499c792de9emr11285652f8f.40.1794499551691;
        Thu, 12 Nov 2026 08:05:51 -0800 (PST)
Received: from AVIV-PC (89-139-9-231.bb.netvision.net.il. [89.139.9.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f78214dsm23615f8f.25.2026.11.12.08.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:05:51 -0800 (PST)
From: Aviv Levinson <levinson.aviv@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aviv Levinson <levinson.aviv@gmail.com>
Subject: [PATCH v2] staging: greybus: uart: convert idr to xarray
Date: Thu, 12 Nov 2026 18:05:46 +0200
Message-ID: <20261112160546.27094-1-levinson.aviv@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026111219-guacamole-quality-2ecf@gregkh>
References: <2026111219-guacamole-quality-2ecf@gregkh>
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

The legacy IDR API is deprecated in favor of the modern XArray API.
Convert the tty_minors IDR to an XArray.

To prevent locking the entire gb_tty object while loading the minor,
switch IDR to XArray and use the internal XArray's spinlock (xa_lock).
To respect TTY encapsulation, use tty_port_get()
instead of direct kref_get_unless_zero().

Signed-off-by: Aviv Levinson <levinson.aviv@gmail.com>
---
 drivers/staging/greybus/uart.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 2b1a5d4671dd..054bdc232942 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -339,24 +339,21 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 {
 	struct gb_tty *gb_tty;
 
-	rcu_read_lock();
+	xa_lock(&tty_minors);
 	gb_tty = xa_load(&tty_minors, minor);
-	if (gb_tty) {
-		if (!kref_get_unless_zero(&gb_tty->port.kref))
-			gb_tty = NULL;
-	}
-	rcu_read_unlock();
+	if (gb_tty)
+		tty_port_get(&gb_tty->port);
+	xa_unlock(&tty_minors);
 
-	if (gb_tty) {
-		mutex_lock(&gb_tty->mutex);
-		if (gb_tty->disconnected) {
-			mutex_unlock(&gb_tty->mutex);
-			tty_port_put(&gb_tty->port);
-			gb_tty = NULL;
-		} else {
-			mutex_unlock(&gb_tty->mutex);
-		}
+	if (!gb_tty)
+		return NULL;
+	mutex_lock(&gb_tty->mutex);
+	if (gb_tty->disconnected) {
+		mutex_unlock(&gb_tty->mutex);
+		tty_port_put(&gb_tty->port);
+		return NULL;
 	}
+	mutex_unlock(&gb_tty->mutex);
 
 	return gb_tty;
 }
-- 
2.53.0

