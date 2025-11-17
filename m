Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A6E302756
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403630; cv=none; b=ic2WcvX/Ze4szDbJHrWeVq0jLm/eORy3sYGEnC+IrK2Fe1i0a9X0AUhG+PElRX9EdP22nxGFNkOWC0Ls27q8fAsA4PJXG5faVbImbMEwlMpi5GMqvC+ceROK1U4tYmxc1U8c98pfXBZfSjiLBYfqK9YKbzZ5WaYGPnneOPiEh5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403630; c=relaxed/simple;
	bh=QYTFfeRhJ8EnA+t3AUhtp+KXx0DbBD/iRUITE7j2fZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyDVlID8GcBh8enBkLeFW7RyJcDme8R6nZcaWzPA60OT1JbSfT9x2WWiX4tf/zjRoqCB3npZ7NQuLAu4qUdC1nOm8FafehvVl8+Lz0QlpUd2OqfIYRb8sgNkMYh31u1GpZP6zi/sK+OggIUCTSsIUCykbclUFBMNjUlpGpymTL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYGeMAiS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYGeMAiS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-298039e00c2so58949995ad.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403628; x=1764008428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LJLo1e4srSl/A8tUoXfklbAY5SHQ1BetqKki69lZJ4=;
        b=BYGeMAiSP5ftsCydj8PAmMdxaoWSrOTjLkoCShOjAjF1xA1brO5eYj/ylX7FFxhAbM
         vl6EaEZRxUkS28S8v7lEM543Mgblctrk0e3eDnpi0N4VGOFT7/PMxkWlm00/3h73Pdsf
         wfESJOu7eMSFxLO0l64mTjclaBX6/Ff9FIjs04zT2d9Ps8JMTtP94VkCoVqH4BHszDzC
         Z+Sf/nfvBMRVFA82OyhsOvgtiWfhokpIHcvcgY8UIikbCRT/dZ2Hlec7FWYkohx9IjKY
         JVQ4VL3xCxDo4+9zMKJvUYR5Vsqa00Xr50OdQfASGeZZoHQgOP/WmboIO1lw9FWv8j8q
         zlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403628; x=1764008428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/LJLo1e4srSl/A8tUoXfklbAY5SHQ1BetqKki69lZJ4=;
        b=ncHmi7slGZNtxIepQXiI+rMS5EcTQzweJ0nB7cjg088rWgzY9aRWEpLwL8Xiua3YiO
         ch2rjyxKcQ0wzAe13uow1KCzftdsMOuBHycs9ZKgKm1M4HKJUjQL3g/jrrBXvOnDl2p4
         o7e83aDJSh6okeesAVVMW+jYDHCkeZPnFyTGRdC6cRXBS+fJfPsZxhm0EKTFuuTVddJ7
         lxFSK1P1U9uFwZMdvV9X8qr2u0LObP1KNWG79zOIvCwYz36ytQSYdQ4mErw78x1c+ukQ
         GoxVbKyv47GuMGyGI12nlahK3oNRN5JHhWtP6HOOPc6H2Fh8EceVn6ZD5ynkkekxkOxS
         6+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCW/iD41oQalHdKO701Hvut47tOiF/srkfzP1c6mDJPrHfaDWWetDun4MxKzdPWV5H7AbFcY1tL7SotB2zOQ@lists.linux.dev
X-Gm-Message-State: AOJu0YymdyXmimFjURBt8kClpJnVIXXGBx7dUTGPx7guYoV6Du4NBYNE
	f8kw3VSrHGg/EFG3vciB0VJKnUBuX3qUQJZ1ad9J8TLnx7cjcco72kKW
X-Gm-Gg: ASbGncsqlUib5B/yKwlIhs/BbU1Uk3QtjRpVhpGsTg59Ybt2m5PwuEj3m3PaItXCdvW
	kARKOHzxxGBr+EkoRvMemL1euI+xbjSqu7AqGeW8YlQdim+ux1OsG3WjHuAZfTku/50GjRjc+MZ
	TR1k0Zw6Zj0VzcSeygbr0UA4l5bWbwa6xYuczCDciPw1NmzkGolPkwvXuPXCcQBRx7t67qGmRPq
	2z0LTM0QLDuhRSzHd5ESgIh3aMdMztRx5ZeKWxgigq5k9IREn/MEqbKBCWePQOTnN81GT4Apb2v
	Ju+NpQVynyTfcgbmY8C7/fDAaS29dpmuBwELMKG9zru05g91LPpOFRlUN0FXq6zkQjsElyvT0P4
	oC0sj3MqjY3RbrZYRwbexnUlA4eBNwl70L4Akta7DfIN9bQLni+VLkZilkLKiOjhWuZKzZph+GL
	pQxcZY0BXb/U5GsHuxSuOHhoiqunjJnxR+OF47
X-Google-Smtp-Source: AGHT+IH3HGg/AmNLBIKUB40JPQtMiBox13JfuVBM7e26piVH8Syan3xudGxi2caHhVADE84tiRsaGA==
X-Received: by 2002:a17:903:1786:b0:295:24c3:8b49 with SMTP id d9443c01a7336-2986a75676emr144549835ad.46.1763403627931;
        Mon, 17 Nov 2025 10:20:27 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:27 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 11/13] staging: greybus: uart: clear unsupported termios bits
Date: Mon, 17 Nov 2025 23:48:16 +0530
Message-ID: <20251117181818.118139-12-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Greybus UART protocol supports only 8 data bits, no parity, one stop
bit, and no hardware flow control. Mask out unsupported termios flags
before applying settings and force the supported configuration. This
removes the old FIXME and aligns the driver with TTY subsystem
expectations.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/uart.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 10df5c37c83e..cc7337bf5088 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -495,8 +495,14 @@ static void gb_tty_set_termios(struct tty_struct *tty,
 
 	newline.data_bits = tty_get_char_size(termios->c_cflag);
 
-	/* FIXME: needs to clear unsupported bits in the termios */
-	gb_tty->clocal = ((termios->c_cflag & CLOCAL) != 0);
+	/* Mask out unsupported termios flags for Greybus UART */
+	termios->c_cflag &= ~(CSIZE | CSTOPB | PARENB | PARODD |
+				CRTSCTS | CMSPAR | CBAUD | CBAUDEX);
+	termios->c_cflag |= CS8;	/* Force 8 data bits */
+	termios->c_cflag &= ~PARENB;	/* No parity */
+	termios->c_cflag &= ~CSTOPB;	/* One stop bit */
+
+	gb_tty->clocal = (termios->c_cflag & CLOCAL);
 
 	if (C_BAUD(tty) == B0) {
 		newline.rate = gb_tty->line_coding.rate;
-- 
2.51.0

