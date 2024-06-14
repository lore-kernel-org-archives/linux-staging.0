Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C97A954
	for <linux-staging@lists.linux.dev>; Fri, 14 Jun 2024 22:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718404985; cv=none; b=Bo4D0rT2MhYz7yUCquhwz/VJFpEO04AallUG/AMBCDpKYXxFmiqmL6X9LB9ppFa/8Zo5hsk1zuYLm5Q9OeT1aisp6at6/1CfBUnUvVEFEG5t1bCtowbJ3Gel8/RVeSFP4eNOjJ+zvS7Qlx98CvjNRugQtq7BC2UksHrqEjfRQE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718404985; c=relaxed/simple;
	bh=wWdFBUq0TBR/kJG1+KtHv5R1dV46yPZU/UdOMCSFTF8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NjNQty3Jnwvlv50Yp0w8OqcV6E7xZe3pSQSlxN8X56L/kxWClQ44EfT/MVzkG6H0WqR+GDsQfzMZoUgTkxrbg1u05Zi8kXInpIVuIxhRIPoc7029phhcr31XO6ik2sWW28sIRSnmOORWgyg887rUwLoPm87Ydpz3WR8/8UXX6hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlDwdduT; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlDwdduT"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-705c7e2d31cso2470269b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 14 Jun 2024 15:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718404984; x=1719009784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8GcWMEEnmsQAzRTqgdUci961+09Yzh7hz6iGBCWj82U=;
        b=UlDwdduTHcDaP2qJ6tXbLZNIMAywfu6CC0e9aEN8EVaFk1AHtYpZoFqKvpVzMSw/yL
         BCu6ajjxZkjBgBFF28jTV56hxgpYqVIrw67E9BguzFWmT2SaOKkxjJ6gqiLCOHu+7d/5
         MFQbjrotP/2fS3C0qeQOovQ0hiH8rwrPAevNP5luza1WI1Sua6A1j0x34W7Y/Cmq60js
         CDf7TQN1s/kn8hHHqCS77mZdfUrvoosIJm6R/ouljQBxdnWjIn0pS1sU7O5pzNKO2zBT
         x/FSC1YS0qG3sE4gRjXeL4oR0M0nUj9q+6+J7tehneivQzeiBhy8BpdApXWTpQV+GuXx
         gILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718404984; x=1719009784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GcWMEEnmsQAzRTqgdUci961+09Yzh7hz6iGBCWj82U=;
        b=ARIMjvRFR/rYR9cPBuJY5q7Dnqi719WJVny/LSO6EQKbmqbG7cMfdD/2XGNUR1tpGo
         cn6v+RcprEaVKyenl27lNgOpB9nyBl81+gOhlIIYz7KZqQKNKzoxUmuqeVSMMQq9EtZ4
         6+YgjtfHWuxXophxZcyoCgZyLWGu9xhyu5XfoRE9+P/o45r66lQtxgY7SRyq78L6Puub
         HgkWIv6btvq2yAhIW7rOQQulSn6HdHgDt5nOvKbc4xJLJvGYQSL9X0vqkBuTU3EI47dM
         j3L87yOvPQ+1B3sJmcRZ7AwMo5CUp+ePoSIdye3a9kcBxkGzjZ5riOP737j6z3/N2fGN
         pZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCVGZbT+srl7GNP9PJVVQKkmi/9Xdj52yhuKxyv4hsKprmUqVrzwguGn+e9KZMOlysIprjTVpkNnGn0PH4yllR4KXaWMbwmg/C00GAs9cA==
X-Gm-Message-State: AOJu0YxTj6MgTDP1qSxv6pKzKQlmN7vucX8Ow/sfJJgPaPFp6yALaDYy
	q6KIaj9oeQ34VAzqhH2BSgfmx4OnfiM0aEECivYA7nNQD3dPOiXl3NONZSRw
X-Google-Smtp-Source: AGHT+IFM0F0/bOk0DJfja+1mE+6TE/gRUmvfKw4aRn9mm4gX2wZL/rWQeKh15CN9keQfbWwTGZAaUQ==
X-Received: by 2002:a05:6a20:6a0e:b0:1b8:9d79:7839 with SMTP id adf61e73a8af0-1bae7effc98mr5065056637.29.1718404983654;
        Fri, 14 Jun 2024 15:43:03 -0700 (PDT)
Received: from dev0.. ([49.43.162.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a75f0053sm6910600a91.13.2024.06.14.15.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 15:43:03 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com,
	jain.abhinav177@gmail.com
Subject: [PATCH] staging: rtl8723bs: Align address to 4-byte boundary
Date: Fri, 14 Jun 2024 22:42:56 +0000
Message-Id: <20240614224256.43131-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add address alignment in sdio_local_read, _sdio_local_read &
sdio_local_write functions as per the TODO.

Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 107f427ee4aa..caee2d2043b3 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -478,9 +478,6 @@ void sdio_set_intf_ops(struct adapter *adapter, struct _io_ops *ops)
 	ops->_write_port = &sdio_write_port;
 }
 
-/*
- * Todo: align address to 4 bytes.
- */
 static s32 _sdio_local_read(
 	struct adapter *adapter,
 	u32 addr,
@@ -494,6 +491,7 @@ static s32 _sdio_local_read(
 	u8 *tmpbuf;
 	u32 n;
 
+	addr = addr & ~3;
 	intfhdl = &adapter->iopriv.intf;
 
 	hal_sdio_get_cmd_addr_8723b(adapter, SDIO_LOCAL_DEVICE_ID, addr, &addr);
@@ -516,9 +514,6 @@ static s32 _sdio_local_read(
 	return err;
 }
 
-/*
- * Todo: align address to 4 bytes.
- */
 s32 sdio_local_read(
 	struct adapter *adapter,
 	u32 addr,
@@ -532,6 +527,7 @@ s32 sdio_local_read(
 	u8 *tmpbuf;
 	u32 n;
 
+	addr = addr & ~3;
 	intfhdl = &adapter->iopriv.intf;
 
 	hal_sdio_get_cmd_addr_8723b(adapter, SDIO_LOCAL_DEVICE_ID, addr, &addr);
@@ -557,9 +553,6 @@ s32 sdio_local_read(
 	return err;
 }
 
-/*
- * Todo: align address to 4 bytes.
- */
 s32 sdio_local_write(
 	struct adapter *adapter,
 	u32 addr,
@@ -572,6 +565,7 @@ s32 sdio_local_write(
 	s32 err;
 	u8 *tmpbuf;
 
+	addr = addr & ~3;
 	intfhdl = &adapter->iopriv.intf;
 
 	hal_sdio_get_cmd_addr_8723b(adapter, SDIO_LOCAL_DEVICE_ID, addr, &addr);
-- 
2.34.1

