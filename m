Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3EB37649B
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358404; cv=none; b=lQKXAq62D8y+o+4byJy/9cWZKy6jNlpf/nVqOaaDmHedURxZHbOspX/jIKV6GzT8sEbUq2ilFbE6sVYc8G7kdOMAjyUbMc3YJPEfAzAw10IyqkRh+slcyrcvkWb0UBR7pgAvLbaqfSweyb+IZu1LL+xTDM1JFuIot3gH6SK/UFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358404; c=relaxed/simple;
	bh=pXAe+04j2eMYEsuO1Kozb9RLm594EvCDTCHbKJOOy6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3vF2tO9b1z81Q0HYfqMr3yyLnZhfL+GPAOMkh9qJC9YkYlPGeaC1fdKYAe71wmyuvelUo3mNk54ua4ZEF0Qfc0WT+VJXWWIdaRgETGL/azD/NSoDKVIiMsrsmLyzUlSfuZ4jySpJM/1mCr5d1v/ZKee8YtfOyBXNAVCU+TvfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prcbWgR8; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prcbWgR8"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6314cc192a4so1764667137.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 03:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779358402; x=1779963202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rILg+oMh1z0s8sO4ABPHVZeTYgFcKY4qxnY9gNQ6FeI=;
        b=prcbWgR8OFwAc/+DQ5+65aj2jC8FgKrEoV+KyDjTDODLiHti//roWBotwuU0byqkeK
         cgUxMTJJzogk+ZGFFU0G3DUvgNR/v8dLhHXVEfLD08/nrE7/iGesUI5XVCCz/lS/J2Dp
         nHpIM6Fru3J5mo3x0GKxS+Rbgum77/8ALughXM3/v14qMFgCo4f4GgzU9yMLq8OiHGRP
         R8P1rL3flKrl4Lvjo10mIf3XBXmM200gqMm4XMqkNhlXPkf4t2K+6ctjhA9xi9VC0txH
         3Ef87mOYkZ2TB9SCR1s/J7jhVFC67yK9djGJ2gb6ynFWtu7Yg4z+Q6L3SYcRmFPSg27Z
         Fwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358402; x=1779963202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rILg+oMh1z0s8sO4ABPHVZeTYgFcKY4qxnY9gNQ6FeI=;
        b=eHwpARI+dZnZRfFyEL8XoQ5Kbg/okmUxuIpkIsKArAQGG24lpBhIlYqCseDH/YtYEO
         FOqwQWPed7b3egRvO0YnOoveJs6B77bAhTDSHdIHcykTx7iakCSTbSd0oovtHS+1LjHo
         9dtb+dTV3gn3q6kzB6NQx+S87ZseB2FrdaZI9NVL0AhdYI3grbX+bjF85HqIiQ2jDKQT
         baURuyhIY3jPVQCC0WHdWH+lXyCrwmFMz/hg2pqTR6M09iyaZZGYkNNfkNnAx4nZXCK9
         LX7zBZaO/bD0x4SFVfwQAjrSKXhp6jJR5iLzNOU7qWBVPlPYm9boIYaxQ5UpYRH7ggql
         UDew==
X-Forwarded-Encrypted: i=1; AFNElJ+Qv0CCV8mgVC//eIW/UVTol1Ar+s3rIBCIsOEj4oZKJGF0S1XuVXOYS+Cm+cviRJOvLfplWntmb/oHjFH5@lists.linux.dev
X-Gm-Message-State: AOJu0YwMxzoAcQhs1m1nH7PZ6rT87D1912/4V2Tqw0z/l6PTyWVaS6Lv
	oESsUlgYsw/WOqSKMyLQQdbxA9PCtsEaG64cdPk1k4GCuRF2Yd+SYk7I
X-Gm-Gg: Acq92OF6OIYorS1Wja8eAlhWWUI4CkgRuj4OeO9spkj6e03BhJS60ZdsBy8xsZUiw7z
	nkYdYMIT7iEZGaKYXDE43hOSYWPZsD3Ej8K8j5g2SpX7jCmvz4COP45saYBHnzpj1aXs39vQcVT
	+TyN3CoxSe7YSc1D9ZSHp3PJOs7yE4jqE0jtonbGbuKipwBbj5dw0vlIHBHvcEhDFUJboChhnaI
	tiA8Y9T2h8RP4C4kADfkvpxsjr1FXA+yGyx4fuGrv34MpyuVQbrgR2yX5k5eUBPL6q8nyyl2k6i
	EmNOeHIFhXYteu65EeVSVwGO+hhwKqisYBEUVusBLVgLBF+fZIwxfZf/lFqGQi8l9t/kQF3H1Uc
	y5qoTxV48BwqpxVw/dukYp5JlJaeZaGgThFqx4lCrXOoWCYg5+p067sygeyQEhVZ8H9+BXZvjVU
	ShCh3Tau1m8F1qq2fyjEr/LiUR+EhMq5A=
X-Received: by 2002:a05:6102:3ec5:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-6738b86eb96mr974309137.2.1779358401570;
        Thu, 21 May 2026 03:13:21 -0700 (PDT)
Received: from arch ([186.195.35.248])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5857361b267sm136686e0c.11.2026.05.21.03.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:13:20 -0700 (PDT)
From: Luiz Carlos <luizcarlosmdea@gmail.com>
To: David Lin <dtwlin@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luiz Carlos <luizcarlosmdea@gmail.com>
Subject: [PATCH v2] staging: greybus: uart: document locking and fix indentation
Date: Thu, 21 May 2026 07:12:45 -0300
Message-ID: <20260521101245.5540-1-luizcarlosmdea@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026052154-spearmint-eleven-1121@gregkh>
References: <2026052154-spearmint-eleven-1121@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comments describing what the lock fields in struct gb_tty
protect, and fix the indentation of the
wait_for_completion_timeout() call.

Signed-off-by: Luiz Carlos <luizcarlosmdea@gmail.com>
---
 drivers/staging/greybus/uart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..85586e9a4341 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -50,12 +50,12 @@ struct gb_tty {
 	unsigned int minor;
 	unsigned char clocal;
 	bool disconnected;
-	spinlock_t read_lock;
-	spinlock_t write_lock;
+	spinlock_t read_lock; /* protects iocount and oldcount for TIOCMIWAIT */
+	spinlock_t write_lock; /* protects write_fifo and credits */
 	struct async_icount iocount;
 	struct async_icount oldcount;
 	wait_queue_head_t wioctl;
-	struct mutex mutex;
+	struct mutex mutex; /* protects disconnected during lookup and removal */
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
2.54.0

