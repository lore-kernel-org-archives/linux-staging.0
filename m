Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9821E3C196B
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 18:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772044742; cv=none; b=Qu50oTDrqBDjW9uYfhgstFw4Eeuwp9Vt64zXbx4aBi9qOTsg0aKlB75OdUs7JBzxFf4gLz6pISoIy8yeJbeaQjlryP2xBVrBqf8tS02Sz3Az17GXXWq2ZqgRgeRIThU2KZTEkTPO1pr2Sw7UH0yYV5JldrOSwtUcMonoRAio1Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772044742; c=relaxed/simple;
	bh=rwxeENQsbEUQ3j4ryDf25T3JEjJYOz7vfeMcUpf8YGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nBv6NX+smGZTbFFpwriQYQVwZfc9PMRJWslb/tks8WhKKvwo5O8g4YH9AYo/BUOy9ISqeancmp4BAO/AfGtF5tV+TweEKZnL+UMINLRfDWQOLBTobfy4OlbSJryuUnkq9RkS71E0rMoszbPRKUsmNLBibirNCcwe7QKL9OVNLnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUUIZimM; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUUIZimM"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82310b74496so26495b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 10:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772044741; x=1772649541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4HRybFjotBo7xCavdJbzXBhAVjefd7vNccK+edsdN5M=;
        b=BUUIZimM81Pk3jkl9cW0+eamADEilSWp3ysTQSZBd7H7USXv7NklEDERLcMJg4ptRA
         7UeuJAQqBx0lDlooJtNE5nK2ngc8uckJ0ij8tHk43ZT0pWJA2OuGA/23ipTinqtE/qhh
         fco0iXbZHlvHOyRvm+AqQZ9IyPrqcUMCrjbnw49k7cskRZFsJSVFUTYeVVZXrB+9n+/H
         0N/XlnnMabwCPd7m1VZ28NZ1HoKzKFnzk3rXqHCoHHUSRPBIOlEFM0i6kDfwsRaVJ+gF
         +a2MWrKkeetFgLadSkJcxkT8i94nc5XofIvWffKjwXiugav42oNWcN5awUBAntabJKiL
         44ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772044741; x=1772649541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HRybFjotBo7xCavdJbzXBhAVjefd7vNccK+edsdN5M=;
        b=uIIVUuCTYdU+9HS1cOrswCyQSCroF7Ibti6QOe7VXDY5kUeAOOlTQM+DoT7+f18dqQ
         aVHaCmd5qtGUh0yznK4M5xQ6IUdA0D+332PslmPwXHqa0+0FnNf40XalcGTzjyak+tMg
         XqPmeB8tRASVOnKS38OUsfA43jPcBb/w/ePnoqIDvS5/A6CgsXm36UPQ5la/0vx0XE7Z
         /Jv/T77d9RHMRRFkVgVxYKWCeMDc8xFBSJ6oaBAXFtnN7gFGjrva5QE21LZFJtIXvuy7
         POrnkdQri858Vhe1qwuKbtLwhR++m8sg+P/sj3kvlKtjsg9YCaHLf1P8EzxMs932mzUY
         rzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAVp/XTOXFAlip96Ia6l0Stb8rWJdvV3lmPSYUWQlRYLN3vLKwOeWiCHyB2jbGc5JW5pNZRP7PgzWHJ9LG@lists.linux.dev
X-Gm-Message-State: AOJu0YzDY3otFHKaiYLzdrxyjzXM9ZkVH4Sqgof+59KzQe6GZzzAl1Cb
	EfEpfIKlwaDIiy/gM3hj3CFQCo6O3CuC4GdjgP7YMAdPEiS+fOyqqNWv
X-Gm-Gg: ATEYQzyBGa6JEnMv3pKz44qAEJaK27qPLCKcGZ0W/kB+bZwUZUOGKDipKnS7lCQDxJx
	P8Dn73RbMj2PFDRC84EsWduknPfAETBKmlNBKTiXqCkkt3Gb4/R/LhgqEKH/m3sTubRwMCvBaFt
	2AZudC7TpEeI3/73pmlFFlrYT4xkpKX97yr3SUxvTKaArj9z7eRkDCGGEb9P+JloSNnYyBwfXEe
	q8s9G5iO+0UIFyOvEqqOCXSmLtzyEvfVZKy1Fc7ZQiRpwNvKQyU3KLn3+CW79IiMtOTlrIcBeM9
	RkhWSP+XBz52rFm6826o+iRaLnQ2fcdkLO9fMxnEK1GvyparjOaE6Q1ijfMAKDFMHGU60hK67hn
	BFoar3FELzBGUl26A+3uGOOLYSDB0qgfG62YpxskJ7jhX67K2zDU6huE9pemEzNHFDUEml4mEdm
	ZDUhlRTzUJBUQNNKfQQURaS3gKS4CbplVlvYM=
X-Received: by 2002:a05:6a21:9d48:b0:35d:d477:a7f3 with SMTP id adf61e73a8af0-39545ed2be5mr14317467637.20.1772044740790;
        Wed, 25 Feb 2026 10:39:00 -0800 (PST)
Received: from fedora ([2409:40e5:105a:d068:a95a:8654:94eb:1089])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b724321esm14010380a12.16.2026.02.25.10.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 10:39:00 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: David Lin <dtwlin@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH 1/2] staging: greybus: uart: fix style issues
Date: Thu, 26 Feb 2026 00:08:35 +0530
Message-ID: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings by adding comments to mutex and spinlocks,
and fixing alignment to match open parenthesis.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/greybus/uart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..1d2c4ef70865 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -50,12 +50,12 @@ struct gb_tty {
 	unsigned int minor;
 	unsigned char clocal;
 	bool disconnected;
-	spinlock_t read_lock;
-	spinlock_t write_lock;
+	spinlock_t read_lock;		/* protects read operations */
+	spinlock_t write_lock;		/* protects write operations */
 	struct async_icount iocount;
 	struct async_icount oldcount;
 	wait_queue_head_t wioctl;
-	struct mutex mutex;
+	struct mutex mutex;		/* serializes port operations */
 	u8 ctrlin;	/* input control lines */
 	u8 ctrlout;	/* output control lines */
 	struct gb_uart_set_line_coding_request line_coding;
@@ -318,7 +318,7 @@ static int gb_uart_wait_for_all_credits(struct gb_tty *gb_tty)
 		return 0;
 
 	ret = wait_for_completion_timeout(&gb_tty->credits_complete,
-			msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
+					  msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
 	if (!ret) {
 		dev_err(&gb_tty->gbphy_dev->dev,
 			"time out waiting for credits\n");
-- 
2.53.0

