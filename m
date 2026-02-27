Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8EB3B52E4
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 06:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175159; cv=none; b=END8QmWpCgqXdSKpBrSFAVPjyqlfTlCV+XdawzLGSVH+XlBYT+5mWnt7JFRjWdqT5/gprZ/XzUPYJESiz46cEVZdH/V+oPTkh2oYuN1vx0qLHY49hH/NjRxGVgOaUsIDKhHxH3ugYu/l6V869jKyKto2M0Rq1pK8rJx5a8aCB7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175159; c=relaxed/simple;
	bh=VGybc11sxwvWF0HDuBPbq3JhrmA6GyT3MfIsT7PkMeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kk0KokHO63T2ysC32F8R/jcxSXfsQ2Vzej3CkqHp01DjakCOfWIi8A1FCT68mNc5ih8X2A2wjSQcos7hEiAcljmeZu+x62WhmFOimEecl85IVbwMKS5nWcIG+eK5Ly+mPwVUKJ9Bgkmmn3ymo9RRILwnYhTxCnHIUPE391V/BoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnCm7rc0; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnCm7rc0"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-358f3ef464bso953045a91.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 22:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772175157; x=1772779957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/me4FJ+d1aVpAIXm0mJoiSYOgYUY6c5yW2UB1Oq5vLw=;
        b=bnCm7rc0LaaQ6oWVw6jr/2yFFOTGrh4VWEMKjYkxMgnOIiLK84XjTAdeIRh0W8Cjd/
         nHk37wnF07VLK1BMvUZ5T1SiHr+CzIBzGZbQNQQRicRqXdKY3G7Jvh6/jFccVZIRtS9J
         n4UEvIB9gCpDeJ1/Kzi/gSkJWrVofgc5ct26Rol9l9E1pyLppo/bqlOkKgECpDDrgveQ
         bC4H4jrcyE2bAHCg+K0F5znwfHR+PsovV61JjQNM1ftYomXl+U50RLjuzxtHCOZqSyVk
         2M6668N704fZN6V5DV8z3UwoogMx9hLHC4QJhhH84yHP5cb1v6pjVZg5CDnjhTXl2lOh
         nBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772175157; x=1772779957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/me4FJ+d1aVpAIXm0mJoiSYOgYUY6c5yW2UB1Oq5vLw=;
        b=GmL5Pc2MMjgMCVwHhj9YlIWSVewLe9RRwBBLxPojwPC6xlS3feZZhFVGoE+GR8f4VT
         XeswWEzLcP2hVVOvEkcIfsTErnHwmqhdAACD94ER/pL4PXxc1E3y2ASCSb221zTSZiUW
         5r+mFJHATzq0L9/FNS2A8WjLJ5Lm1UHIxuNdAvVWqYmIKK/6QlLOMGyx8ZmEMv217MyF
         GVkyHS7iAEHju9Ys6bdVRoYTcUwpG24dBtQTSXc03MBfHt9Y1Fn938G7X8mHRBqe/7NJ
         J3uSasRDG3PZBDdfVfYHh+vzmJ27FyCYPTiLHDxaP/ONmVMWqCAUcxScfY4wDn6ficBo
         HA5A==
X-Forwarded-Encrypted: i=1; AJvYcCXqQ4pkIRtxmVxdrJ8YByi65BlV3iwfV+UM0Ab8n3pyTLAa5BXZ32EVlEz0zYMaZNb1p90Rn0uY8V4hDivO@lists.linux.dev
X-Gm-Message-State: AOJu0YxFNaI4mbg1bGDr+WbWKYZ1H8YRtB9ssXqZqYdHEAUOiyB4jTg3
	By2WuSI7Z0zkw82qy+TUywFkH85/PpcbvG9/LGfP4FT6lyKNr5QpdiMj
X-Gm-Gg: ATEYQzyESgmO8eS0HSPbwXN0vQGZ3OjrybFPuP+uEeL20JhexxY7IcQS5iyLNH1GGgW
	YCvAYlkcxDpyggsz5NKleE35aTLjaRkMmNF8Tiixo+Ae0/HfTBYdpj8tLoSBlv426cBJX6Bc1ci
	FcC6aLtZi/BkSapS1NELSsazWxOu19q/Wdnzkm3YK0LpVYtgQ5hPj2g5Tevy/CFj2uZm/7nnU++
	HAeEBhpc1o06G+xCpd//L1qR5P2mXj4T9P6/3huNsFtwoorgJvlGsS1NAi1RqsDM1oSZZsrU69m
	fAKcrwfaHLNYsOkg7ihDw1u+r08e9iEDTJTqc71Mqj+Ai7SaKMqwFYl06ZQOkVG40trBU4SXZS4
	qfchezTtG91k9E8gLH5BpVwpoJYg3PwTDHQR/LnGd0ouQPpRt9qaezr7/vazZ6P+bLXVV/6ykt0
	MQZvFlPYxJljlEvweR299TzCJ/hKX+AhjqucAVn8oikT8GLg==
X-Received: by 2002:a17:90b:4b49:b0:359:7eb:d91d with SMTP id 98e67ed59e1d1-35965ceb5d7mr1683755a91.26.1772175157281;
        Thu, 26 Feb 2026 22:52:37 -0800 (PST)
Received: from fedora ([2409:40e5:11f9:3821:4f9f:ee0b:d955:3519])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcad6ddsm4149788a91.1.2026.02.26.22.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:52:36 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2] staging: greybus: uart: add descriptive lock comments
Date: Fri, 27 Feb 2026 12:22:20 +0530
Message-ID: <20260227065220.8039-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aZ_9V7cldGzWNDrb@stanley.mountain>
References: <aZ_9V7cldGzWNDrb@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace vague lock comments with specific descriptions of
what data each lock protects:
- read_lock: protects iocount and oldcount
- write_lock: protects write_fifo and credits
- mutex: protects disconnected state

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/greybus/uart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index fe554eba555a..1e51818e34a8 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -50,12 +50,12 @@ struct gb_tty {
 	unsigned int minor;
 	unsigned char clocal;
 	bool disconnected;
-	spinlock_t read_lock;		/* protects read operations */
-	spinlock_t write_lock;		/* protects write operations */
+	spinlock_t read_lock;		/* protects iocount and oldcount */
+	spinlock_t write_lock;		/* protects write_fifo and credits */
 	struct async_icount iocount;
 	struct async_icount oldcount;
 	wait_queue_head_t wioctl;
-	struct mutex mutex;		/* serializes port operations */
+	struct mutex mutex;		/* protects disconnected state */
 	u8 ctrlin;	/* input control lines */
 	u8 ctrlout;	/* output control lines */
 	struct gb_uart_set_line_coding_request line_coding;
-- 
2.53.0

