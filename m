Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FCF1B4150
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242564; cv=none; b=piQrndgBGalNh26CYSQAmStdZX2dh07R9qbqwQ4HAwL9Fknp0RehFwGk4iJ0L8AhGLn8f11mRn/atnJ/yQ0crpM3qbVoqeZjZomcnLLKmcrQD9RcmdrJmpSCAcJuoQi7JxVpJqJBpfefpjYs80sHA7JMKnAeGMi1o7a0hhEvViE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242564; c=relaxed/simple;
	bh=/tWWqyQBjCa37Hoi/rd2gDMGifDNNGuAhp+UsSe++O0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=afFxzJl7uzW6/to+5qTC/XFwqSKFkCtqdE33wlOWPwC898cgVdejiMlo/n9bPy5w7WopxZGEblK1/om4bF3zgGRnJD5lQv6fCYvxtu2njo+ZMJ2QKksV0CUek0e4BhU64SZaD9Y7eBSA+mSTK/6hQ1K8mmqqjEFruokxXs00ihI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nn+YIA44; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nn+YIA44"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-215464b0432so7910405ad.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242562; x=1735847362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiGGjLP1sUA3+CKFxkxP+Nzp9uRb7o+38Fzbf0e9QCM=;
        b=nn+YIA44NpHfv2477PS191DheaN7oevb387puvcqrqIqUlMhJYAI8MSQdgTPgAbvEt
         oBOdp6Uqr+82hwbk8X2PAVWPb/xczUvC6QQ1xwdJmYwTI1xvKAHV5kSnDPaV/2xYDgn2
         hRZsUKsVp/aqf8qP0ErTM6FARuAObDIMc5OK3y6CJFENIxxSWtW/noTijOicBHLib4Ur
         S8RDy3V51KofEdCFvCklu8l3SoI67sDQd4GPjsDLOIl0WD9TYum+vB7pdOJT8H/R4A12
         Q0dNLVzfGryBi6KTNBaIMBk7/bpg+jBgD9jQQ2MtPrZKEZru4MMJ/MYq874i/XVDdJ1Y
         fnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242562; x=1735847362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiGGjLP1sUA3+CKFxkxP+Nzp9uRb7o+38Fzbf0e9QCM=;
        b=K55DqV5BVfNCMnCNztq3xgGWj1jrHeswJ/dWSQ0A1la2MAP0IddqNza5XAh2WVmDGn
         glsn/I82MAQALQme6OjDbFbWaO83A+XVDRQ4jHdJ7sjT8Qu/lOgjbARAL6K0bQxN2LId
         VaPsxx7hP3srAoWwGb9cEpm80mXYOe7djizazKSQgRTDCFWB94ZaBfCVS0zSl1iOxkYS
         O07Q/h0Y5yKb8wNP3YmXwgwlSJKitnddrY0xemXpoRawu41Uux8OJJyEQM+kRGY/3n9x
         d/nVfhYNxbb+jWO4iKc2KIa5qDia+yK++TbAaXj9s38ihMswzVXMIFt46Y3yRLQY6z/l
         BMZg==
X-Forwarded-Encrypted: i=1; AJvYcCVao2YP2/sYZKQUFp1QpOg0Nh3Sno8xrvTOUS3EuiddZaOjCVZbMYBelAfgp63SD15FgMw8kEZrTkPjHT16@lists.linux.dev
X-Gm-Message-State: AOJu0YwJa/RzP7vscpVVmh6XOBOND0iE7+r02DkNuiKi/2a2Ch2SAfhX
	cUE9T2FvF11SkoEJjCJeW1CXc38CuUrUZdUtf4YdR4qfwzIMYdwW
X-Gm-Gg: ASbGncsDmqO1wLxfSWHAmvGJezFY02kEC1P8/7gNg+5bXcFQnSwuYP70WdvE62RdlBP
	u7Jm2TBEoMQzmRi9nt4lKmkweJjnSKo6BDjojac1nmUnGlcPs0rbzPZEx3/6s2Hqz5pSWCGfxVO
	j3EYJCxxSM6C9tT5G9A+s0PX67pzkJ9ftSXL41AQ3hzjJ5eaFxoAdgNQUmyCLWvsL9Lb4QP7cfb
	OJO/9VNTguHhQceydyJOCszZicpnLEOuta+WYnBcUM1JZJ8PxDXT84=
X-Google-Smtp-Source: AGHT+IElec6AfBf3JXW3cVhtMs2r2njKuK1M1VQZJYL1H2oIAiZf7mGHRdvGGak3k95nef/cKgQzAA==
X-Received: by 2002:a05:6a20:c70a:b0:1cf:4c3a:162a with SMTP id adf61e73a8af0-1e5e047fae3mr14465742637.5.1735242561749;
        Thu, 26 Dec 2024 11:49:21 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:21 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 05/15] staging: gpib: cec: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:29 +0530
Message-Id: <20241226193637.241049-6-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226193637.241049-1-niharchaithanya@gmail.com>
References: <20241226193637.241049-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail and result in a
semi-registered module and does not return an error value if it
fails.

Unregister the pci registering function in case gpib_register_driver()
fails and return the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/cec/cec_gpib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 3dc933deb401..ffa366c30ac5 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -361,17 +361,17 @@ static struct pci_driver cec_pci_driver = {
 
 static int __init cec_init_module(void)
 {
-	int result;
+	int result = 0;
 
 	result = pci_register_driver(&cec_pci_driver);
-	if (result) {
-		pr_err("cec_gpib: pci_driver_register failed!\n");
+	if (result)
 		return result;
-	}
 
-	gpib_register_driver(&cec_pci_interface, THIS_MODULE);
+	result = gpib_register_driver(&cec_pci_interface, THIS_MODULE);
+	if (result)
+		pci_unregister_driver(&cec_pci_driver);
 
-	return 0;
+	return result;
 }
 
 static void cec_exit_module(void)
-- 
2.34.1

