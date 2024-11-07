Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B551EF08E
	for <linux-staging@lists.linux.dev>; Thu,  7 Nov 2024 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730979229; cv=none; b=T8paNLZPI6fAsH+Z5XUVkc+c3Xac+Q+7j9mH0oixpIAVXv2OByKUwGkynBKf6klJFWxJZW9WtACZyPqrUKW5JU0lntTK2rJxydC+p5j53C1LH2g32BylDsFCrZL1FVgrJW5TduEnv2JL5Q+ITNiMC585kOmfUtzECK2IYtdZepE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730979229; c=relaxed/simple;
	bh=v0nV0ozMqLgGQIsypK5wMYr1nqnINLpUTLBgBBfijKc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Smb8TgvSi8p9dXnbnTnuoqryDQgu//yAWASvKlKP7Dq3ZcTvoQPH/n/btY1qH8aeUBa5Mv9uSinp/46nAd7EQF3VIcZSRlsP0Qw2fcwfHy8AHwYBR0SrRIjslNPKMydvhO+O0GtWqd4SRFuvkfZGnq1Slr5074d7zKTcvv9d8yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4+Xfy4V; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4+Xfy4V"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-210e5369b7dso8437075ad.3
        for <linux-staging@lists.linux.dev>; Thu, 07 Nov 2024 03:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730979227; x=1731584027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BzEmUMxVFejxdU/rfXTVlEUY+fR/wUBvx47lSE477/Y=;
        b=m4+Xfy4VVxP9nD5kj22FGHWYES/689L+n+LLz1GtxbcRrdjtApLSVGy0j2Db3kKoiA
         RFU9fkrHd1obRSUufFZkpeeTr4eL5foefuq5SDRbrVormMrgPjefJDV7IoI83wRoA2o8
         6LBbRy1bMfh8ieiHGPVGvVp83a07S1PXwwS75CwhV7QkJ/SqWfXPjGkU4prDbTpVrNKi
         X1ANjw0IvFI3fs/EbxMFlfb2yqwBiKxpely9tHJUSEFU8dKWdLHPetPdLKAUNTG+kBMN
         zKxeMbc5sZ0iiftZKpdjmDmm1gCsFkGmzl1CMKMjA2WBVpEGKctDRdWs5BRhW3NRG+og
         /xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730979227; x=1731584027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzEmUMxVFejxdU/rfXTVlEUY+fR/wUBvx47lSE477/Y=;
        b=vS7ACNi8xRldybTfgF/bWOLJnb6GFmLHPtEUxwmoHQnXsdvD5QBRqXSgZY1vYTz8lu
         K0xXbws2JcwzJptqSVsJAzJxeyyNpaOaLWDC19qwVikyQR3TEMM8YNM/I1soLoNtc5cH
         qGUczZl/C/fotFNZv+4MNe1No769zh6H0fCw4nNYgY+T+2HvRRZLUAXlF4wmeCkaCkkE
         U3uDn/Dr9iWDaKIRr5IpJKKtYj3B8WYnumA5km3C6ytSopVtvmLkGfX4Is7KeS94xlIG
         UpWpstrTNF097Gmv/hXbu5q1GF4G0maLSkhIZKWDpOGebetdEITuBDUhXbtJuTDQVeu9
         zBBg==
X-Forwarded-Encrypted: i=1; AJvYcCVOB4fKb8TCD989c/LazbODhHi3Z83wB+BPiE2lws13q6aFV9RCJlBoUjlHy+DL/W8n2qVCGHBepaswpogH@lists.linux.dev
X-Gm-Message-State: AOJu0YxGCC5sNdDh9tOPbVdmpIgTjqyF8gEFHR1LTJ58TGL4+NGqBuvx
	zNzip+vvOr3o0hQTCF7IFpeAk+rKJQGqw9IThFAbVKZA49vF//Kw
X-Google-Smtp-Source: AGHT+IHq+EF/3DgL31wNjq6ih0Ox4gUqipEMw2wqsuNioKyqFspXsDPknMqVgMaPN9uM1QnRfvNWWQ==
X-Received: by 2002:a17:902:e5c9:b0:20c:79f1:fee9 with SMTP id d9443c01a7336-2111af17177mr309869405ad.11.1730979227482;
        Thu, 07 Nov 2024 03:33:47 -0800 (PST)
Received: from tom-QiTianM540-A739.. ([106.39.42.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e77ad1sm9983565ad.261.2024.11.07.03.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:33:47 -0800 (PST)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Qiu-ji Chen <chenqiuji666@gmail.com>
Subject: [PATCH v3] staging: greybus: uart: Fix atomicity violation in get_serial_info()
Date: Thu,  7 Nov 2024 19:33:37 +0800
Message-Id: <20241107113337.402042-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Our static checker found a bug where set_serial_info() uses a mutex, but 
get_serial_info() does not. Fortunately, the impact of this is relatively 
minor. It doesn't cause a crash or any other serious issues. However, if a 
race condition occurs between set_serial_info() and get_serial_info(), 
there is a chance that the data returned by get_serial_info() will be 
meaningless.

Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
Fixes: 0aad5ad563c8 ("greybus/uart: switch to ->[sg]et_serial()")
---
V2:
Modified the patch description to make it more concise and easier to understand.
Changed the fix code to ensure the logic is correct.
Thanks to Johan Hovold and Dan Carpenter for helpful suggestion.
V3:
Used the correct patch prefix.
Thanks Johan Hovold, Dan Carpenter, Alex Elder and Greg KH for helpful suggestion.
---
 drivers/staging/greybus/uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index cdf4ebb93b10..8eab94cb06fa 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -596,11 +596,13 @@ static int get_serial_info(struct tty_struct *tty,
 	struct gb_tty *gb_tty = tty->driver_data;
 
 	ss->line = gb_tty->minor;
+	mutex_lock(&gb_tty->port.mutex);
 	ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
 	ss->closing_wait =
 		gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
 		ASYNC_CLOSING_WAIT_NONE :
 		jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
+	mutex_unlock(&gb_tty->port.mutex);
 
 	return 0;
 }
-- 
2.34.1

