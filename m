Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933F23E4C8A
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254495; cv=none; b=E7y6MgHs0eyp5J0ycQouGjUE3K4Y+3Sx4G9PEqA3YAniQzvNXS1ocIUrMNjks/a5cH4dz0pNBCPIww6VQ5YJ9bjGqo9JKLRlGSb9KyoP0s/Oz5vod+73JGCDq4iG09uH+Xm5CBOZfY1rkuZ9SKXwNbZtodAFdadccvuoYvSgTBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254495; c=relaxed/simple;
	bh=WaRlK6ADyJGwKPeOq+zbAjbnJ8368wyLZLmBoXeDw2U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BINrlYN55b6HOHXQCpxqP/baX2HW01FEdz2kzQ/kJjF6Kd/mWNKjPr5rqXgU/ZiMFu6AFUyw6fFRnjWY+ejaFT54ZXL+wiq/rtzXWPt3+8wtLJ0GCb52JHj5La4nuV1F1+umOkjzXFWWvGSTpcnv37qpTyCiELSq42UAd82NVYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXPZ6iBw; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXPZ6iBw"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35a04d6aeb0so106510a91.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 11:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254492; x=1773859292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jm6aBQFmhV5MNb69YAxeMe+wLv1vCAxTIamZijo4ixo=;
        b=BXPZ6iBwCrnv+dzoX0a1AAX//doN+ycBP9Fn+DrMdM4NoqslY9qoZiFTb8vqHj1G1+
         xEkhcyfd4d6rsai99Os0vKAMrcdpvYlxkFae3FHA3RqPgynyfrlvZwBtaJAaebc16+BF
         veQ2ApgQiVXq09+/SJQuow8MDvOLL7kvhYb866+lNzBWIKy8mVzDvuQqFHcmLwe0wt11
         n6YFSFDGeFUzEW4VEUHpF9diJwAfwpRxetw/ylB8s9hkWGFTchEy0OnDj+iOX9LG+oCb
         3RHTSDAVUqSVIhheAdG+ARnsMNaYGTv1MatLjP/jRehuLFE57YXRlGIHqVFOij+PUbhP
         2mEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254492; x=1773859292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jm6aBQFmhV5MNb69YAxeMe+wLv1vCAxTIamZijo4ixo=;
        b=gkLL/ru6e1/UviQXIiSZXtFL98HBEBNXIJyR2YrE8zcS70EFy842E3/VFPDbpxuIN2
         kN68vVImeyH/tlzh6xLei8npW3CBmGJJ/pVZmTtfv/JBEpTdhlp11EfFejzSjKXZWleJ
         Z3QpqWVxLQQDHEzrSV/8b+J1Lwqrk2EiVw0Dk3uhEftk9uAItd7VbBRSorDNoKqv1snw
         +ts0TelRoXJkG4iIKf99qo2wIGGu9+flGtNhUYjfJk0rhMcGhp8CRK8S1LY40hVewoG2
         +CbAqpbxbEBfFZkTVdgD+JQBccJj5lusBdgIcyS+9fj0xI8FFFBk3BMWV7Vlr6N+Xfh+
         bIhw==
X-Forwarded-Encrypted: i=1; AJvYcCXftml7/OYnlOQSB6mlByjoq5KbMaoCk/JnwsaQzPiRScqK2vRgx6MIGGfNrUnwCSRU9oeT266D+4+URMXB@lists.linux.dev
X-Gm-Message-State: AOJu0YxsRBrtYXEuNi3gemFcv5jkctRisDal380UbWVLydQDYbLHUDf8
	DAb9bmtJyfWnhCAfj3i4tO85bwMS9omy8YF7qh8xLxevCofJ9fruadcm
X-Gm-Gg: ATEYQzxkJOzeGzdiAqi6hrrpmNnAsincuDUgc/FZImjMC6BjB5v4AphGUmr+xXYiiLp
	2u8aI59/uhDF3XybVXluitW85CHSmenpidCRBUHouBsYpiWxHVypAzznrcq2ydwQxoT8jt8splm
	yjF37ndcr7k/YdC9BvnpE7GuO84kz9mw1I0zbH+Vn/qnSsbA6+EwseF5etnVUzNRYFXrh3iK5PG
	tiA8yG1z2I7lKolPlsBieRcq1NSE/Td5gZnb+U+e8a7I/aoKsre+SPAWSsPDL8YvAG2XXC72ERo
	aJMNv5sgo/WzGk8IhYIqtSBOtLN5p40cYY17dA7D9g7ZuWzOWzYRgOL1YgH9QCEz6jlE0A6/E0H
	oX8iG/SIxPlzUg6xcwEn/T8VMa6C2oreDSfLPVEHM7eYyakVp0ROjB5jrH9fcwuWQmsT1CxVsn1
	SnMRpywmaNmodiQUAAW1PCRLFPBq+BNKZEwR+IFrDqkR67
X-Received: by 2002:a17:902:ef4c:b0:2ae:aba2:f915 with SMTP id d9443c01a7336-2aeae7ba3b6mr37880165ad.21.1773254491602;
        Wed, 11 Mar 2026 11:41:31 -0700 (PDT)
Received: from hyd-e160-a08-1-06.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae35f0dbsm30211155ad.69.2026.03.11.11.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:41:31 -0700 (PDT)
From: Rahul Joshi <rj5547884@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rahul Joshi <rj5547884@gmail.com>
Subject: [PATCH] staging: greybus: uart: add comments to locks and fix alignment
Date: Thu, 12 Mar 2026 00:11:04 +0530
Message-Id: <20260311184104.499201-1-rj5547884@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spinlock_t and struct mutex members in struct gb_tty lack
comments describing what they protect, which is required by the
kernel coding style.

Also fix the alignment of the wait_for_completion_timeout() call
in gb_uart_wait_for_all_credits() to match the open parenthesis.

Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
---
 drivers/staging/greybus/uart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..52a84a68049c 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -50,12 +50,12 @@ struct gb_tty {
 	unsigned int minor;
 	unsigned char clocal;
 	bool disconnected;
-	spinlock_t read_lock;
-	spinlock_t write_lock;
+	spinlock_t read_lock;	/* protects iocount and oldcount */
+	spinlock_t write_lock;	/* protects write_fifo and credits */
 	struct async_icount iocount;
 	struct async_icount oldcount;
 	wait_queue_head_t wioctl;
-	struct mutex mutex;
+	struct mutex mutex;	/* protects disconnected flag and device state */
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
2.34.1

