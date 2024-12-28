Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785A512B169
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367164; cv=none; b=c2ulBzhpPkoI02SL9wS9Mkw4E9WMDQNyds4VSAjH5xxpKnP3Kz3SQEssUmsOAOhGeXUB2hPpTYQexXnX6OmKmKm3FSIj3bODiu123wZQD0upJSE+J+Eu/EVvLYd2PLouy5u6GV9LIvuSdDZtttgrPBBKTl7V+cR0NNQqwjdxo2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367164; c=relaxed/simple;
	bh=pyOPVCmKVw5hJ1elcW8WlGFsIQjVG+F19Ncu6OrPZoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SaEy9iP+TWNQu/zclvo6sJYhDyud4K/X3mCBKc88/av7m+nM22p4DX8N5P8y01hRn2qBzT+lJcS/3AimQbBkwGR4JXwm24/fgbalQljNK9pcZ46m5nUF/pdo9VSlaih0ti4Fasm3cuMWN6+w1Oma/F6NqB6b61/u1I96tH9TxvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7tLHBxY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7tLHBxY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-215464b0432so9329365ad.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367163; x=1735971963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BGixoehf1mJw23JkUWifJrsL6wsfFdC9e2kfI8fNrs=;
        b=j7tLHBxYjOQUej2JmeMEEYlxZyyvE5T0CovtOEB9V/t6a7at1iONtnmYCEAX6oPrxh
         3bXFL6SIjRE6JGfBogGKE/+3dlXnS9pEv1w/xEivJ02aNkO7/uUugLUTtSpDxjcGRSPo
         4TdLfK9/FLKWoRfLRoZ13zR2AZwgmbqILpkEguQtVu75x8Ozn88XBMZsXjmmlj9W32FD
         4iQO6IR9mPGrbeS1EuEeDtS0jrCH8M5rRS4dNyrNtex1oUlF28cAnfVDFgsUErZCf88E
         Kv+U9H/tcejw/aA4MzDTMxYEpIZcaF7yvS8D9uMNDZXQgDJOuXp7galXttIOiRM84gDK
         Sk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367163; x=1735971963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BGixoehf1mJw23JkUWifJrsL6wsfFdC9e2kfI8fNrs=;
        b=lp8cIdqgrgpEMXjO86ctPPIb8nMt2ZFVHVDOIyqRICedGCtdDIPmdhXs8wjkBEH60T
         AkyExJBdjXlJIg8M+QcCuHevLPcWrcSL2t5uMCAN1MXEPQwOpj8N+ka/R1YC+IfPydwv
         h9uDwzHUvtrxuAEPlxpCPEJgrfc33xSkBjrK0FoVrQqs1vdl1jFrnroZS/c4Up6LsjPj
         dfsMQCFHC5wuk07xhRv6OxWU6C69w14SfPf+RhbttN9OPiokx4Er0ZhDD44c5ZCEgxAz
         N3Hv/HkZC2/sTRD51OSUixlbIDOxPDuLhNVMbN5Cv2xhxDHDU7bBlO9Pix8kf44QKRdU
         5WIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWXBDtcfzoV5hnIgFY2o3FSb//eFLxj0845IL9VZYh2kxchyOSmbKAvH/XfPGcS0j9luP3eOVWgiE/U7hH@lists.linux.dev
X-Gm-Message-State: AOJu0YwchP2p30Zj56/fqkqK8bm05sJF4r5jsoDSjdIrcUoD0wHtuBGc
	Km3oapU9mImBhXuy1S1Cr9vsVhECvrotBoBw4w2FSEnCVIOGAhyf
X-Gm-Gg: ASbGncupgjsi2k1aDhj3xXbG/bt7LZt34IjThUutlYJQl9CIEciyiHIOrLsgeUbHgjX
	rYaLApOvCn6LxEa76AQUBvTKWr0jsxqZVFW7HmYyGgVa3T7iqM3CAyrWw+dnOVvn55V7SXa3aQI
	mmmtiH0FHd5TkGKMusGp+dh2Qr6XGwOXbpbcOuzHWb9zRZdc/lVoXOME/MsQuoDLAFTTmFm0Qdo
	f5/1I92jISxhaXFZd/ta+v7Gt3SoWHHwv3T+LIKFqSz5gqlHJUNpuE=
X-Google-Smtp-Source: AGHT+IFWfnKofbkMu08XhiPNmXkh7Z5P7w++dePA8aFkTeINdP0r6SyQwZiVbqnBsNrkbLIWSSeBEA==
X-Received: by 2002:a17:902:f541:b0:215:98e7:995 with SMTP id d9443c01a7336-219e6f117e8mr158070925ad.12.1735367162925;
        Fri, 27 Dec 2024 22:26:02 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:26:02 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 08/15] staging: gpib: gpio: Return error value from gpib_register_driver()
Date: Sat, 28 Dec 2024 11:37:56 +0530
Message-Id: <20241228060800.107653-9-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241228060800.107653-1-niharchaithanya@gmail.com>
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail and does not return an
error value if it fails.

Return the error value if gpib_register_driver() fails.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index a2d562cbd65b..0fb654757540 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1341,7 +1341,12 @@ return_to_local : bb_return_to_local,
 
 static int __init bb_init_module(void)
 {
-	gpib_register_driver(&bb_interface, THIS_MODULE);
+	int result = gpib_register_driver(&bb_interface, THIS_MODULE);
+
+	if (result) {
+		pr_err("gpib_bitbang: gpib_register_driver failed\n");
+		return result;
+	}
 
 	dbg_printk(0, "module loaded with pin map \"%s\"%s\n",
 		   pin_map, (sn7516x_used) ? " and SN7516x driver support" : "");
-- 
2.34.1

