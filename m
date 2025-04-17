Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F2E1DE4FC
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850753; cv=none; b=Y8O9DPdZh0yqCXrzKDjAq757nAeo6xp3x9ejMNMJf2wj4HEGJ4EsZ7gomXBEhWCOhXsDWyC+WIHdBLUlDtDQZrq6PV4rrx1pXakxY64DlsOHFOTdXuSpcPSQ5JrtDXUkyHuqrBoFkBmAgEL8xFvshhthk/9w+4eotaPSsRyg9O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850753; c=relaxed/simple;
	bh=3Tspjz7wxGyMD0ERoZ4OefpIVgysaEDnq71Z9+37JeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LibaPyLJOQuwcflftItC7MgPpffuDq7gLvplwD4xDKVWvJSahzRMxkK28HKuHUV3SuQLwngJ2Lgkqb40eL/YedVx51l51yPHqFTT74DxS7VU2g6AHgx1BX3LrBkTDaMFt5NrRzLXlREBi9Tqg9i9yd0eVEuwTYbJ3bwDdTjfSYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=JpAeOne9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="JpAeOne9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224341bbc1dso2437875ad.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850752; x=1745455552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kx5EY5NNpPB6MvS87zqGMc+jEI/M9Fei5OKN+WHLkj4=;
        b=JpAeOne9+AJMtr5jvQiA2eCMTV50cCyirGkCMWzeM9hMHRFYuVovxDfb8IhyDwkn+W
         cchS/iN90/pXGoS45xllLEYNvc8IszwKbDXHR/jew34Z5w+vUK6S9N1Wm7m0ldM+icE0
         4fcdq0D2E9653vlL+Dsj4be1XthtN2gL7042nwHcc3end+odlDYzx9YVUpkVV9r4dn8+
         ERGKneXnlhER6IeIYYRTYmDXgSgyciw2rFVaN584vMafjWDwfpO0qhNf0Cz3kicr6PKh
         GIgyZOBYf8zYBjwz22lz4EeyBJbfcZNNgh+9BxaXJP7ZxF/WV1ys1sUBlSDIngQAr9Uw
         iI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850752; x=1745455552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kx5EY5NNpPB6MvS87zqGMc+jEI/M9Fei5OKN+WHLkj4=;
        b=h9ukFf++BSsnwvy75eQpAECAW8wJiEKzMtvdDJJ+nQQsuizr7ZgLzLj+Lcgq7eJuEW
         p4k0iCfJRUzFyjtcdk8NuFOF054/63V64T4rtgoZbiJiiwy1+2dMyUDRx7t0y9Kg7CQS
         jkkuXUfTkWhOvSbdXVWl618Ixg8Wd1mMHUXiamFXUKXaYWtM5oOUaDAR6BDeDHirIjLS
         KnOK53nUhnhMv3Mep+MnnBRtoMEDxGabdtiympSexri3p1JReBgzECaqJEAyRzbROERB
         UPpc4sIcy3MAf2mbMWT1v03Doc9/XGVBmlyxpJENnwOejaIAhTKs9jdwLGYsXnvspA4C
         NMTg==
X-Gm-Message-State: AOJu0YxV3qzhH3HI83Chw6VXrEhsZkrLFjQMDmge19AB0moZ2Uw17zRR
	yJls0vPnFwVy3ijH31M0HI1S8mon53ATC5wKSLWM16bDNXsw5M64z3oiqqbpzg==
X-Gm-Gg: ASbGnct2nV01jYXmL2Apx/Frw48AYRBbEWwgiBziSwETzQwPgM7eElp5hCMTfTnXDwA
	ZndmnVV0oA9rzaUDZRhempY2yhwlzS6M8WyPLZfTr7CJrle3XNwy/FNwyiOou7TzlzsbQ/u6w5X
	8r3CFNzvIBHDay0M0La44QPQ7M+BQ4UknZ/rXbuchBj3D0Ps+sVeA1G/kYFFQkMk0Y90fnzoHWj
	PXgt3+W6lj30CG2XZ308E9+Pb5OhcE6vg5qLAI0o8mooakMXOPmu+vK5ynJJiID5U57TdowFuk3
	EqLOR9lzdUQAdN7b+5wNwMOEbqcPK6/6DXDxnCQKyFPwXcwrUSps9mA60URtnxjtRjTdTEEQpzv
	2e2iysg==
X-Google-Smtp-Source: AGHT+IFVMDhBoKUlfjJRZUEokbTKsReFRGjGofLVuPnfwfSJ0jFbSb45nYAchbm7ksrY+mhhiMn0wA==
X-Received: by 2002:a17:902:e848:b0:220:ce37:e31f with SMTP id d9443c01a7336-22c358d9b59mr57562575ad.17.1744850751704;
        Wed, 16 Apr 2025 17:45:51 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe4cb9sm20938975ad.211.2025.04.16.17.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:51 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 12/14] staging: gpib: gpib_ioctl: u64 over uint64_t
Date: Thu, 17 Apr 2025 00:45:31 +0000
Message-ID: <20250417004533.86765-13-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u64' over 'uint64_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 2d2a268d8573..0fed5c0fa7f2 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -18,7 +18,7 @@ struct gpib_board_type_ioctl {
 
 /* argument for read/write/command ioctls */
 struct gpib_read_write_ioctl {
-	uint64_t buffer_ptr;
+	__u64 buffer_ptr;
 	unsigned int requested_transfer_count;
 	unsigned int completed_transfer_count;
 	int end; /* end flag return for reads, end io suppression request for cmd*/
@@ -59,7 +59,7 @@ struct gpib_wait_ioctl {
 };
 
 struct gpib_online_ioctl {
-	uint64_t init_data_ptr;
+	__u64 init_data_ptr;
 	int init_data_length;
 	int online;
 };
@@ -134,7 +134,7 @@ enum gpib_ioctl {
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
 	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
 	IBRSV = _IOW(GPIB_CODE, 20, __u8),
-	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
+	CFCBASE = _IOW(GPIB_CODE, 21, __u64),
 	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
 	CFCDMA = _IOW(GPIB_CODE, 23, unsigned int),
 	CFCBOARDTYPE = _IOW(GPIB_CODE, 24, struct gpib_board_type_ioctl),
-- 
2.43.0

