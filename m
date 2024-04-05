Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C5013C8ED
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 07:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302820; cv=none; b=HTrdfgFbugl0Sk03VvSe4m0V3/HaoZ4UakhisL6DTdgIOi15AEMDKjLVWfs6giGL7QKu0/Bpl5YIsH1ZUr4NpQ/MI+q3FCs7AGddP6Dqk8KX1O+pwI1nbEepdcMvdwfTAIkXu9+2tDdRkAl3QciY05Xx7I8vV7TUv91FMLvl8B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302820; c=relaxed/simple;
	bh=YoCK0eHi9vC1QpW8oygU2C2KyLLNC61wcBUkYFvHKuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fh3o0QZxVhdzzHaed7gnVzOb3nqagoXLRm+JMLryD/HCXByKcwV0dSHfKPjqo/Da/Q7VGuaEH0oRonBlJ9Xel9oagXYDV+EaOwQEF9qc0qz5eAdWNvfAIqTUEe5nrzT0bA7eejA3qhdPAuQ35l4lcPFS0e7qxvM/LmG4BNcr4C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux8TpPO2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux8TpPO2"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3434c6e1941so870703f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 00:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712302817; x=1712907617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNwZe5BOe/LQIqDd4/80RXtPtgdVPrSCbY1S4wwVTwY=;
        b=Ux8TpPO2lgluVNu4K2L1krNaayj2HUUHcezLjTXqAp12riJxf+ZgaK7nwsQ2zdCcxB
         0lShA1XCSsedIme+tpycJ+LIbkSTAZZc7hIRzopc4hTdxqrN4CUlLek+BZuey41Ac51T
         72icuPzR2kLSvpLAovXIM5+/aabFqkLFz9uECycp8/W6dQz9fzoKnkYYEDwmmOFEa25s
         OtybuXmiLgi60u9cr8AdF3Mx83hbZhROLwO0/qCuWEUu87lyMDTfZbxdskeA/czFltB2
         rduWEI0nfjbpDwAta2PPLo0iLgyP8meCekLGj/NMJVKF+Mp2RtEocatiKX+RFpuJpZu5
         zVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302817; x=1712907617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNwZe5BOe/LQIqDd4/80RXtPtgdVPrSCbY1S4wwVTwY=;
        b=uDKRM8EMVEKbE4VlON5Oy9AgV9JY74NPzwCs7huVqdeLMVROgI13PtvbRq4iHrd8rQ
         gBU/UIWJSgZPCZcsmkCDtufTbZHiXMyTrPly4rjWt1umKUMRIzZuLrxLD4pGDLF0d1ZF
         mxOwN7dL7D54kR2SpapUMCkZOrJMEVAqX1IKhOnaOG6MTXkv/za058E/tkjWD/ESB+RM
         e3k0MdxtCRZCPJIeULArbb0gYSqvx7QzNJyNYWOJ4KwACfQBq6duDrh7fV06k7VEA7/D
         7uvo3n1czgrJKl60jb9gSPCfygmGk8HTGVoSchxEcFr9D8ZGBy5EFSelrzHpz7VsXbj+
         E/Vw==
X-Gm-Message-State: AOJu0YyiHmjCL+51b6fOS/VJeMS6q3S9vdutOxmsE00vDGyqphjceImM
	mPgqbzPxrmuxQmNt/BkD07W6RVHkpuVpeY3g2bK8UTCtGCQlUsyz
X-Google-Smtp-Source: AGHT+IEpHqb45+dVx4WtccQ09P9O9tIKvqgQnzhLdc3gA3jyZ2lskMNvWXD6mN3uquhggb1SLoWfig==
X-Received: by 2002:adf:b1da:0:b0:342:61ee:bee1 with SMTP id r26-20020adfb1da000000b0034261eebee1mr485769wra.23.1712302817549;
        Fri, 05 Apr 2024 00:40:17 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:737b:ef00:2bdf:f41a:ebd1:fb2c])
        by smtp.gmail.com with ESMTPSA id l10-20020adfe58a000000b003434f526cb5sm1311643wrm.95.2024.04.05.00.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:40:17 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] staging: pi433: Add debugfs_remove in case of driver register fails.
Date: Fri,  5 Apr 2024 10:39:59 +0300
Message-Id: <20240405074000.3481217-7-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405074000.3481217-1-ikobh7@gmail.com>
References: <20240405074000.3481217-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs resources were never cleaned in case of failure to register driver.

Fixes: 4ef027d5a367 ("staging: pi433: add debugfs interface")
Reported-by Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index b01ee145ff3c..77e37a5bd1a2 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1415,6 +1415,7 @@ static int __init pi433_init(void)
 	return 0;
 
 unreg_class_and_remove_dbfs:
+	debugfs_remove(root_dir);
 	class_unregister(&pi433_class);
 unreg_chrdev:
 	unregister_chrdev(MAJOR(pi433_devt), pi433_spi_driver.driver.name);
-- 
2.34.1

