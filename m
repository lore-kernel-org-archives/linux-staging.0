Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A90C19DF9A
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585804; cv=none; b=Grbb6uHzQWqW8UcJCSw/1J6HMx4jrZrIlZsVnBo2fMQS9EtR6k43RAHEuYI+84m0U9fVH3BmldjYhSWnMMG+Bo4J0OLG5cstGGZswJoT8elK967DJYlqv1ymt+RTt449WxpUiBGkVPLxmb439ZO7W5Y2K/srh2RwtHPOY3FPYt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585804; c=relaxed/simple;
	bh=NVeaPMc2nCJbhLmBVQxHS97kOfSb9r+NuAjGgpepxUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KWhfa2sEqO9Y4EL23TaLv+7qMKC9Qw4ArGNr5VFkydysnelqUWRwH81CHM0qww+T0WXwjd0I9jJqol3tnyXIa3v7Km989wnwTlQ821oPcbUUrNrm4o2Aye10q19P6HrCNo/HoeNc4VsmggyeU/D3PzhqJ4PCH6s82Hi4Ygbq/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhV3aX5y; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhV3aX5y"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215607278acso10737075ad.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585802; x=1736190602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWznVxxStAUDNkIlcoS5NcdooWzDrhHOwRt+GbhpQcA=;
        b=LhV3aX5yz8Yx1tqJZKVi8XZHVVGqUKrSiwjk6Jn+o+B51iwFlTBSzFc6lfXIXEMaKb
         7hj0xIuIOhZe9aLxNNHPCw/bTB+DXlytSF+hX0JWm68iVDW+znKRycJpuBpoEzJqeScb
         reF4ihDZm4sYHPAGBr9ZsBCsmOKT8zQdse4YnxQO72jcVulGh354DN5AwNSPhQHY32+v
         X/ZAY+BmK6lLqMAuQ7AmsxYVV/25sp01FT2gRBbU8+Z67i0QJhBf4ECKJ6weOBx2li+i
         LyW7A4blTDbFW0Q9Y/NIEYUVPvh3rkfBD34NlvgGz7R9NCOt/GnWUpOwmrXFDdJMVHnq
         BlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585802; x=1736190602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWznVxxStAUDNkIlcoS5NcdooWzDrhHOwRt+GbhpQcA=;
        b=Jdsckos4JjgJrBvLG/hPlRGVVkhgpkhGxKWmmx3xZYOGaH4mpCDFvuX1ibfut1GKYS
         MlhyUdoXTYb/3VTOVzx6qlTFWa0ztL+OgsrT92KYvjI/rpNDnYZAMJDZQ9P/KiaCq2Y3
         D7DohuSQ3OrxLoUtrHoOrwLvu3WI2gkIR960Sdpo7aFgAMEbwnaDkSVibn/qnBz3G6pd
         9Ic1uqUENnhYxqaoX8unuPImiIjWmfMX50411lhksdkv88P12O06wj3aWBECb/MlRIKn
         T/c22BitFnv8VskfaHyqqmCMUQDUW6iZEVRk9yTXAW1yHtO/XSVWSudMOqc4Q+4cDhXY
         jEHA==
X-Forwarded-Encrypted: i=1; AJvYcCV2VSzdrUUl6Qjd6O8NkwPnC+aqRiO27AMDsFIdBkj3OyO0k4fGt+dWioPHjzQ/Hrg9IXGrXx/8DAp86Pv6@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8vSn4lUPXL7HCpK45ckBZjIM9M4mYBFESmnK0qPzI/CLvGzWj
	p780MpyNsnygds4PUuIeOdQmESSFscgTjURb8O12vRpQ1CNG+PmFvCziGQ==
X-Gm-Gg: ASbGncukA6y+pUW6OlxrVmPCblRefvKNCvjtcpziZu4k9MWOg7KxVMhUjVnHH+VlJiL
	EaST7ertBKSJc8r1Msqk+QtKvAlxApbTjIaBjSi07gaTVuQp2Bgogh0xY3HxKuhamh7rZj07l1U
	nh3/WJY3NLhGhVQW8VuUP+D9fXNPrd965jUePpB5PpOSA27lk+2Ayn+cWZyfsjEJyimTnc0DcH6
	s/sqDOPSnkbfexv1FWaPGu/Z13DL+asOqo/GTdhTjuMtoyS6XH27hg=
X-Google-Smtp-Source: AGHT+IGbYSrGkEeU/+nvbTWUrx2+wqeKKwAbRjtiQQhHNdBHD7V+odq7z21preBe4lNqcIH59Gpj/Q==
X-Received: by 2002:a17:902:c941:b0:216:3dd1:5460 with SMTP id d9443c01a7336-219e6e853a1mr199344655ad.2.1735585802531;
        Mon, 30 Dec 2024 11:10:02 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:10:02 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 08/15] staging: gpib: gpio: Return error value from gpib_register_driver()
Date: Tue, 31 Dec 2024 00:26:28 +0530
Message-Id: <20241230185633.175690-9-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230185633.175690-1-niharchaithanya@gmail.com>
References: <20241230185633.175690-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail and does not return an
error value if it fails.

Return the error value if gpib_register_driver() fails. Add pr_err()
statement indicating the fail and also the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index a2d562cbd65b..057f9264de34 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1341,7 +1341,12 @@ return_to_local : bb_return_to_local,
 
 static int __init bb_init_module(void)
 {
-	gpib_register_driver(&bb_interface, THIS_MODULE);
+	int result = gpib_register_driver(&bb_interface, THIS_MODULE);
+
+	if (result) {
+		pr_err("gpib_bitbang: gpib_register_driver failed: error = %d\n", result);
+		return result;
+	}
 
 	dbg_printk(0, "module loaded with pin map \"%s\"%s\n",
 		   pin_map, (sn7516x_used) ? " and SN7516x driver support" : "");
-- 
2.34.1

