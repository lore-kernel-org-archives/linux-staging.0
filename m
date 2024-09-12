Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF61BF7F2
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 17:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726161762; cv=none; b=Jg7vvCjo9MWs2GEBtadGRTXkcUd7uA/nBf18dlxvNWNrsDnEpoAvO9puC02gv0eBNdMJOcI81QgoRhEiOsbzYicFO7u9jNj2R0Tum+J7/IycBo5vrhCL49Ej8Zbp9jTaw4rscnL6g4hVvH1BhEC3IjxH14sdC/dSOgIrAg9Pa3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726161762; c=relaxed/simple;
	bh=pxNvmEq5QlTet3+8Ka3sAa3aczDBESjV67G5PvmWMUg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mpmt0h7IuFBdtWUYPw2waHOtA+Qx4ckWh4RnSTujVsptDdDFiCYUAd01pnyt8+NICHoBHLlMimzmcLxk3N+XSJtOfVLyXnRj7jF1stVM2V8JT6hfQJ8pViCTHgAlS9qyd5bL8YIMhm6VpvqdP5BOHTDK4oJ0moPxYgJFIXFmUeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKdJ/Pam; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKdJ/Pam"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7d50e865b7aso1168563a12.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726161760; x=1726766560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDOX5j9BpxBbwPDKPBgnjgeJFyPPtDXmwFa02m5fEQk=;
        b=HKdJ/PamrnaLEKUiFFSRYdkQ9L5kTTyPOJmaQzw0M7vhhPgzJM8EIuaX+SHxnnoVti
         eyfdxNnIjMmIltwgIxZNHjAv66108vSBmq14hecjXM0iKWuLJvclu3eIZ7Svf8mK60tp
         Foxjgkon9yGhEwurWEeW5RVWWoWXI58MrAnaG3qLUzW8m7QtKzBj3dpY7t43akUktO3E
         w8wfD1GH3kullm+rsZvZQsa/S/FVmD67Ko+4UKRR/k8JB0YEpTPUCwLfe59uHCEjE0Do
         Nyb8H0t+qFDUbMAo4/bZW4Ccp1C80NLQrXNMz99clvgWdh7fXAhBbHA749QBm5NW2FBv
         i7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726161760; x=1726766560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDOX5j9BpxBbwPDKPBgnjgeJFyPPtDXmwFa02m5fEQk=;
        b=ZfSaSZF67f3lcMnMhmuAcU3Yvu+lYdu6sXyKKLWHbO0MB2t3wq8zcmdZZEjnEVCm6F
         UL4fHAwCFVOJrN+gKnJ02oI+Cg0b7SOQJnHgyDf++Cf78F22Ec+bIcAZ9Ax7g9szjlWx
         Ya11ziv0D3cRJqOxZnFqbIWGvp3IQF7ziP0PMhDMirWYvASSJSKuaycgJfUtezx25teD
         q+7eZah7vIUQ/jnSfn9dUx9WcryOixmC098lAGJ+VSzK3a/7XlkvKgZOnZC84ZUwvsNP
         fMSj5bAV93BOQDOKfT2BWguk8jqpycSzPca1gbYnCH/32jQEkIP9W11vW9JsGIlm/OGF
         WbxA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Gj/sGxSvcOmPEtXbbM/iyk4554EDqpzdiErugr7QnY0s61kgdNhRaFD3CJ1Pnko9zzVZG365litJ0yWT@lists.linux.dev
X-Gm-Message-State: AOJu0YyGa2PbMhmLpNmqVpaBd2V14Po168p1EhlEuSzKDrvik2Y7uAq5
	q6xMxSmP/JZTdrEnBFGToCF3mjzyLrFoBfd8rrCQzCCP7gwBao9a
X-Google-Smtp-Source: AGHT+IHOONd5GoqrCv28UoIPTOzPATOJf1fEQXU3Q8j5mHBTE7M6ofoDdgrilpG5VHlsshxFm5tMKw==
X-Received: by 2002:a17:903:2b04:b0:203:a22f:6b09 with SMTP id d9443c01a7336-2076e334c05mr55343525ad.13.1726161760382;
        Thu, 12 Sep 2024 10:22:40 -0700 (PDT)
Received: from embed-PC.. ([106.222.232.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af2745bsm16567035ad.60.2024.09.12.10.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 10:22:39 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: octeon: Use new initialization api for tasklet
Date: Thu, 12 Sep 2024 22:52:31 +0530
Message-Id: <20240912172231.369566-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
introduced in commit 12cc923f1ccc ("tasklet: Introduce new
initialization API").

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/staging/octeon/ethernet-tx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index bbf33b88bb7c..ae1bac99b461 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -40,8 +40,8 @@
 #define GET_SKBUFF_QOS(skb) 0
 #endif
 
-static void cvm_oct_tx_do_cleanup(unsigned long arg);
-static DECLARE_TASKLET_OLD(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
+static void cvm_oct_tx_do_cleanup(struct tasklet_struct clean);
+static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
 
 /* Maximum number of SKBs to try to free per xmit packet. */
 #define MAX_SKB_TO_FREE (MAX_OUT_QUEUE_DEPTH * 2)
@@ -670,7 +670,7 @@ void cvm_oct_tx_shutdown_dev(struct net_device *dev)
 	}
 }
 
-static void cvm_oct_tx_do_cleanup(unsigned long arg)
+static void cvm_oct_tx_do_cleanup(struct tasklet_struct clean)
 {
 	int port;
 
-- 
2.34.1

