Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C002472A7
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836136; cv=none; b=VqmqvecLCJZNiXSkOBRyGzhdRg1Rsj+MKuCKsMDeG9TUZaAqESXejyoaLZukGFnwVGTY1a6hpaDmD634Y2OsL8piLIWxiBUAsDWpoiBdRjhfUPNMdS29cv09XQD0Ez7Qh4cTy6lk7nvx32ywOyv3uYS9dyh7FZWjSiBmvRO1tfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836136; c=relaxed/simple;
	bh=RSie0nXMjQWozJafxINypzZFt8eO2DZf7eBuhaP0m3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIC59rYMfJlByjAdi0VXykgP3Y6DHa4pfEPmUVdTUhbnjomJCKG2yzd9QqDLts7xHVbw0xG76+imB7gY/nGF7BN811eqNVvY+b6HFiohh9AqChEEhPlN2TZpJr9vRrB0DXEeIO0LINsHdV/II0XTqduI5SffX3NsScU1eCMf0C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=cVx16ltw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="cVx16ltw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2279915e06eso1194615ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836134; x=1745440934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KbTAU01u2d1Fyhrvlbrvk8qe32/1uE4Mm7IabxHd+o=;
        b=cVx16ltwSCOAF1ptQq+vpUQERf/6mMtThE+5buwFNSrqwOIwoLbhIfETXPWM3rrV8+
         DVJSEK6SLEnDNyubxXkx4coUxrMb7M3XOSaH+f1dpUQxX8VqmGJx5r7FyHriiU6f9AmD
         SSRcUkyqSPUIpE8p+QkdSCz2MZNPQvBoSIHvINUg1aI3hSa7ib4FoL00FERzbLgAG6K6
         mzemmC5JWSS5Z8X/ehIlr41woRDlfpV+yxeeMgp635tMOXeFN7ukdtWs7+F3hWOwckXu
         e39hrehKRWoo82p/+x9ysmoAWlzVXQxoL104zlqNDPOtHusB5VEnSURpdfABqT8O2d5m
         vXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836134; x=1745440934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KbTAU01u2d1Fyhrvlbrvk8qe32/1uE4Mm7IabxHd+o=;
        b=igDMe/PceHuB9XxvHisUAikV4eo2FBSxt+2wLV6jf4Fj5ZxCTxXMjm0Msz/ot+IZ36
         9Vx4qB5R1Na0pgjIZ1/i21RjnJycS8VgR1oXFELLSdg2LuKCr0SqnxfhvVF6x3ai55An
         pZJUTJ4TcO83FmgpHcacoOni3nkztC9cngbKve8THwsGpiJH/AFPEHw32Zhmatc9LRJ7
         I9VId58zIEUB5MPDkgBZVyM7QqHcGBe4Qgpogw6g+sSxbixQ/0Bmyw77LC1VAMG6wUcr
         74BQy+4dzG6XGadLYGAB8ohKTWEdMXwzxNWmLqL5ZycftzLK53/rRmdCPOHR+seiHW96
         y0SA==
X-Gm-Message-State: AOJu0YzhHT9Vwz1onm9LEAk3VYbsdZIsvj2vL9d9EWkbiuaVHhxMtJXf
	0n9qEvG4ZEuExPS7kb3q+k5UH1WZG6hBPHXQR1pE31nm3YOx4DUBHiiRBr4JBQ==
X-Gm-Gg: ASbGncsgGGsSwj4eBP5wbt2kZ2Qif/nEWOhoEyTbPRl1Oseo0LfOlbbnS27T2vjmlbq
	chfqnV1aXqzjxpSsffJETdbrnRXpmVp8M7zr7mOU+QCmvrOqcGSQw99io512YMh1Fli1ysQby/E
	S/Z+nW3x6nw7HuYI8XFM9IXtNUmXWCsEnpWDXbgcx6SAoC/Vx9Z91Dod+DtQdD11dGZtVX1pXG0
	l9KruXIgVXldQ91JlGMoiINJyu6uGFkwXR6B6e9Ivz3ERD7bMkQC3HZiHykfMEs7Q1ckuYLsy6c
	dAQnFSDFsAMWCO96bV1enQr3X9OidkueowfJRJqrnC4VIBf5oX5d2Z255/5hVOiW1PyGFyME5fE
	A8sPmrQ==
X-Google-Smtp-Source: AGHT+IHfRTGtXW8empc1D2cBf7UaxyTiL8sP58xBhsmEUtXUYv0rcmyWAyhT9pSwnf8mtCyytUgfRA==
X-Received: by 2002:a17:902:e541:b0:224:912:153 with SMTP id d9443c01a7336-22c358c4083mr50959125ad.5.1744836134534;
        Wed, 16 Apr 2025 13:42:14 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc4c49sm18858855ad.168.2025.04.16.13.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 06/18] staging: gpib: common: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:52 +0000
Message-ID: <20250416204204.8009-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 029590f95fd3..87329d35ca47 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2038,7 +2038,7 @@ void init_gpib_descriptor(struct gpib_descriptor *desc)
 	atomic_set(&desc->io_in_progress, 0);
 }
 
-int gpib_register_driver(gpib_interface_t *interface, struct module *provider_module)
+int gpib_register_driver(struct gpib_interface *interface, struct module *provider_module)
 {
 	struct gpib_interface_list *entry;
 
@@ -2054,7 +2054,7 @@ int gpib_register_driver(gpib_interface_t *interface, struct module *provider_mo
 }
 EXPORT_SYMBOL(gpib_register_driver);
 
-void gpib_unregister_driver(gpib_interface_t *interface)
+void gpib_unregister_driver(struct gpib_interface *interface)
 {
 	int i;
 	struct list_head *list_ptr;
-- 
2.43.0

