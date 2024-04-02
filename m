Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FA777624
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056478; cv=none; b=fM2UA0v7f2eepd8bje5y+gyKRBWgBIvIVx4nkQzQM2WrAdDxQTpe3onAByETDmyZoRSQdwgJs+Um1qCKFFlC+E8sROj2/NlgOLcGvg4NrVEZLatzz7DWH+kQubmzxyh6YvY/L+s8NhrOH/G6wRbKnJOwQZT0gzNQZXbAp4ec2N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056478; c=relaxed/simple;
	bh=fcVbgCCXoK3w9FQOBuxNovy1ixOVJR9WHZpVbqKlyWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MD5vAX6gopgWdDPX12oclwlNm1cUtlvFD3W0SF+7+kHBTL/ftQMrxGulJHSpD1D3hFt8wfTFzKMayglRVFkDAErlgHcSERt5/Aj1qOwoGq4/IwSPJ2uIck6uSt6xvRqCRFcybLHNfug92+puCLf84PBTcmvr0iiqJgu/ugXKDh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPLAzo8X; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPLAzo8X"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78a5580324eso335960985a.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 04:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712056475; x=1712661275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG+XcPSEX9Mh6tQPFknGS3juRQhjzxHPLPnw/bWfBs8=;
        b=lPLAzo8XCwNUpBKn14bMeLJSejnwYICcX27Q/AntN+3066MJCI+EcpjeWdbcsoNGJM
         qAbTK/E7Ot1hOhFeIvGZ6pYvbL1hxhif1zzDMDU9bpyV8izGv4p8hQ4hQU2vlYuiU4jn
         MjoFIkMC/kmsfxy9Nte8mzgqROcRrd1iIRfr1TvkgHDkcv3o/vrb17Iw7kTwAAhEAhgx
         ++HBAaKjQwXkRsLN6iO0MpGomcEcX5Mz+KLoeqlHlJDrc9ZJl0WimrpFc6TxASJULNuD
         IHMYpz4PI40an7yV/iAho5yza0bHfQ4R23WTLw5QRXKBr7M5v5Ap0INp3VIjRenuV0LX
         wf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712056475; x=1712661275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FG+XcPSEX9Mh6tQPFknGS3juRQhjzxHPLPnw/bWfBs8=;
        b=FqOtA2xwgQcuGvsgfenvV5weDh88kOhSMPw49tub1APNAzvpcFW+iARRwtT5CBdWx5
         18C4KfEjYaUp9ZwmImzWwirHL16Qw5ZEv7C2k5325xFOnJ2rAmRidRWIsw+qmq3EiFf4
         4cAKKcb11N4YRBGb92mFHziR/RcwMqWVQmHvGNu3HxUAalmfxe914aQl2VEUWnD+Fu8O
         oKzORrIhM0DQLGVzrgnALIvi7ooVBIcAip/2HUKj4i9tavQuiR16xWm+KAPc3BwUcSC8
         Sr5HICg5RjEiQu86dUcV9B/5Amepi7AR3ZaGspnQy3S+F4HZIWkUQmOCweE36gA71Gzp
         K2hQ==
X-Gm-Message-State: AOJu0YztAWTP3sdAS+auumLgdBpxJKi4KU7D84PhrCYjaIez3GZuF/i2
	xn7OatxpRqUNZdtu8iXQW2uY4PIZKhsHJrJOzip1781M973m1FZ9
X-Google-Smtp-Source: AGHT+IF0PGkbBIJ7k97WVMkLHs2MM/H3Ee4F+sOqhIzOuyRuvbbet/78Nva9DA9ERL1udXnY8UjthQ==
X-Received: by 2002:ad4:5d4b:0:b0:699:11a4:1aab with SMTP id jk11-20020ad45d4b000000b0069911a41aabmr3881782qvb.54.1712056475577;
        Tue, 02 Apr 2024 04:14:35 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:737b:ef00:2c6f:6cdc:f641:6ecf])
        by smtp.gmail.com with ESMTPSA id 11-20020a05621420cb00b006968a6fb010sm5428855qve.91.2024.04.02.04.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 04:14:35 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] staging: pi433: Rename return value from "status" to "ret".
Date: Tue,  2 Apr 2024 14:14:14 +0300
Message-Id: <20240402111414.871089-7-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240402111414.871089-1-ikobh7@gmail.com>
References: <20240402111414.871089-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers init functions usually use either "ret" or "rc" naming their
return variable.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 47e0c51ffe2e..b0407d5c6be8 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1384,7 +1384,7 @@ static struct spi_driver pi433_spi_driver = {
 
 static int __init pi433_init(void)
 {
-	int status;
+	int ret;
 
 	/*
 	 * If MAX_MSG_SIZE is smaller then FIFO_SIZE, the driver won't
@@ -1398,21 +1398,21 @@ static int __init pi433_init(void)
 	 * that will key udev/mdev to add/remove /dev nodes.
 	 * Last, register the driver which manages those device numbers.
 	 */
-	status = alloc_chrdev_region(&pi433_devt, 0, N_PI433_MINORS, "pi433");
-	if (status)
-		return status;
+	ret = alloc_chrdev_region(&pi433_devt, 0, N_PI433_MINORS, "pi433");
+	if (ret)
+		return ret;
 
-	status = class_register(&pi433_class);
-	if (status)
+	ret = class_register(&pi433_class);
+	if (ret)
 		goto unreg_chrdev;
 
-	status = spi_register_driver(&pi433_spi_driver);
-	if (status)
+	ret = spi_register_driver(&pi433_spi_driver);
+	if (ret)
 		goto unreg_class;
 
 	root_dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
 	if (IS_ERR(root_dir)) {
-		status = PTR_ERR(root_dir);
+		ret = PTR_ERR(root_dir);
 		goto unreg_spi_drv;
 	}
 
@@ -1425,7 +1425,7 @@ static int __init pi433_init(void)
 unreg_chrdev:
 	unregister_chrdev(MAJOR(pi433_devt), pi433_spi_driver.driver.name);
 
-	return status;
+	return ret;
 }
 
 module_init(pi433_init);
-- 
2.34.1

