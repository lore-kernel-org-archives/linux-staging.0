Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3202232D
	for <linux-staging@lists.linux.dev>; Fri, 23 Feb 2024 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708700297; cv=none; b=ftqvvvXAD69o8uaUrAbelLOtQ5RjZvBG/aaH0DS6VnffFWHrPxAj6NWWtx2zUdPF7+RvL7YBvEaAyQHM0D0mafGHsQ5yeD1hzinZGVKFKsynI0o6MowyJJPMjKqoWDaaMaFz7ie6U8TjG2pTwRc0MS0MoMkxxujiPdjkwMSk3Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708700297; c=relaxed/simple;
	bh=e/c+ZP0Jj4k3w0h5haFdrTRJ1bfgB9ofQ999qSO4ojE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Im0YJFmw24aZs/Z/WQ19cW9XLoAJt/77lZPpQsarn3O5406YRG3XZvZ3JPFY6fEf1O+0H2HwbkOg7ACZlYcHPCAKgD3IiTp3DDEP+FQcQDFwKzar5miNUT6vrIvll8wWEUCJA6JCYIvyPYZslh90Yzc0Iq6zCWOxvQJXiaAPQ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GL0peFz0; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GL0peFz0"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-787a2a14d9cso65296585a.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Feb 2024 06:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708700295; x=1709305095; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NDgszGodt3V3j5Lshn/mpqkCU7z4gbtXsqxc5uCqIs=;
        b=GL0peFz0Eu++gCMXoOiaeouaap2UaNNVDjvBvuiHwKPapY9gSTG/7uH/tcqpPgcamR
         E4P3UsFfjcIqoyQ0icMlst3wtL37A9OiZADTO7i4B+6wIRq91JJSP4FIMzT9gB/pfFXS
         Cg/34nvVivy4CycxV+zspmVDMFOLpcKlm2Ek/k51rX0/7mv3uwUOeF7pZi+Y90Lrxe3d
         +yem22skp4cc830Vk1TXjGw3/IKTY9VN8XIVI2/nNFMZmJOowB99+M0pPnlsdUezoD91
         GHVHzj/R5PiagG210CZd1stMg2tlIDzheKlDcEuxTc8U+fxs6gokyt1S+EZsHdcUlXK7
         m36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708700295; x=1709305095;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4NDgszGodt3V3j5Lshn/mpqkCU7z4gbtXsqxc5uCqIs=;
        b=MbTKVUrlVdYZfSrLhUXUsHuZu4KRBt4YE7NSyKhpOFoLZBRpGKaGK07/D/0UMY3kOY
         5qJvWsQtxSXlUyxLPCB7EFfchcfP1oZhlv5TUCAn1ZGDFoZVQ47abeMkgjVe7wmuiNBW
         g8SJT34JOiZTEhMuQUKLN7AdWH4XZW1GnzvVpk+vxPhjpo4l/s3CYrK9dkRIBGW+HAkd
         9OpnFWWcU82Hlz1N4ett+HAkp7sj4zL0lVR/yvqQiMRMhrcsEFSPOHJVbEhQiMN3NkTp
         PdYeOOz7KoKDv4ywC5a8b1pXxpQbAzj0s0zr5znY6CDSLtV/7p6lj/Y7KUG82IgDELtK
         Q9xA==
X-Forwarded-Encrypted: i=1; AJvYcCW87Y4LNss+7frMz/xPurnRpCGpBCn4wbOPfELNcMlh0z8CP3JlpoLF1H1MGSBmiD2t103gy1UXqHg2IIgvW84ckgPYJ/0cf1qA7QaYhQ==
X-Gm-Message-State: AOJu0YwfLiYRPFY4RPndx1LSlllwztc3bjMYoYVU/isRos4GrKBaAkSM
	2N87eoRcVSk3dAytm85WyMMwPk0tq6LfYHxoVeDyrPCAewHcByYLDd1bk2eZpwwH6Vzj
X-Google-Smtp-Source: AGHT+IEpyx0dsbf4zcMWVmdW7wGWEWgrp0gOO7dTGs80H6Cm9yC9Adhi9vVXdU35s6LBJonWqi7ozQ==
X-Received: by 2002:a05:620a:4692:b0:787:746e:5ba8 with SMTP id bq18-20020a05620a469200b00787746e5ba8mr48329qkb.13.1708700295326;
        Fri, 23 Feb 2024 06:58:15 -0800 (PST)
Received: from Wayne (host-24-138-28-86.public.eastlink.ca. [24.138.28.86])
        by smtp.gmail.com with ESMTPSA id wa23-20020a05620a4d1700b0078742e741cfsm6552865qkn.61.2024.02.23.06.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 06:58:14 -0800 (PST)
Date: Fri, 23 Feb 2024 10:58:12 -0400
From: Samuel Kayode <samkay014@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: rename function deGetTransparency()
Message-ID: <ZdiyhAwNTPmbS3E0@Wayne>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename function deGetTransparency to de_get_transparency to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Samuel Kayode <samkay014@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 44b9e3fe3a41..ad9d8bd34e5a 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -284,7 +284,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	return 0;
 }
 
-static unsigned int deGetTransparency(struct lynx_accel *accel)
+static unsigned int de_get_transparency(struct lynx_accel *accel)
 {
 	unsigned int de_ctrl;
 
@@ -391,7 +391,7 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 		DE_CONTROL_ROP_SELECT | DE_CONTROL_COMMAND_HOST_WRITE |
 		DE_CONTROL_HOST | DE_CONTROL_STATUS;
 
-	write_dpr(accel, DE_CONTROL, de_ctrl | deGetTransparency(accel));
+	write_dpr(accel, DE_CONTROL, de_ctrl | de_get_transparency(accel));
 
 	/* Write MONO data (line by line) to 2D Engine data port */
 	for (i = 0; i < height; i++) {
-- 
2.34.1

