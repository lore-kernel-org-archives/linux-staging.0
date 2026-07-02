Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2391D39061C
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975998; cv=none; b=G2cpJeM8qJRe+cPwnQ5+31FIlnMbRrBvutc49Mpq0sii19uaJ9/6p7/beOoFzdtBeqUtvnjCSpPvDIpgfu1O92AHPSRefm+vBrkxvS+CIB0nWAg7Mc8zhscEAsD8jQy2yWLIZWQzUSHt05F2+OSPLhG95yGfDGpaj3sEGXDcgpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975998; c=relaxed/simple;
	bh=qwCY0nFaOJCUvrmLvadCEv+mpvx7nZJWCKGrLiomDdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Si1P7bFxJ5zMLldNhGJ7OU5kwlOBcseocVuJhU7DUAgYYLLXacMaIuANOuPzVBMXhdxMYV2hLw7Wq3E7Jse+6jH1Za7lkgUfSh2ciqxqs2cS0JX6fom7nTVIwYsz+b6EWcPcWrBXMsUD6jlIlWnKL1Dm7yd6TAUnq3dUfHcHTXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlLn7/6f; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlLn7/6f"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c9f10fa7a3so14714805ad.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Jul 2026 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782975995; x=1783580795; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qLH8TGZ+WUlwfUH/GXvctqR+GIWLJhWorLHDQ/+QDc=;
        b=XlLn7/6feLasSbs89SQOBanJ+XXgXlsKiU+eqnnyO+kTyPoGJyQmzB6lIIVhl8HOko
         hUeMDhFhlT6VwTr2T+FE9iEt87Ir6JPhOJvBfA5Nmfl7eumtG43ja86zHZIQGN6vQftP
         4S/nyqpmiAcKvD4Ms5YFwOcl+71aV/QyClhWkCgHT3CvLNJBP6cLRSPENgcTOJJRzKdl
         f6ZuaI/B5uiEI3T5rGNXs753bUIkkr4QyLY4KW6JPl81k5xVxGw1idIiyklZYJRnkXM+
         64LINEETJj+27U1nZiX9Uf6oHBMLy6MH7qIbweWrvRXgn5s2qja+FCvGcPdRMyDSVeo3
         Wlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782975995; x=1783580795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4qLH8TGZ+WUlwfUH/GXvctqR+GIWLJhWorLHDQ/+QDc=;
        b=s73bqvGYVJkdYjiIjYR9/Jql3Ef3Ssq3+NfWjZYIIkLQ9NTAeycnL698FptRa/MGFn
         nhK5l6ASJrjzYrKftJUWhM8qEkJbR288VnL6JGNai9mIFNMew5J1vyU5Z2SB/aLJlpUv
         ukch5xHKjqiu8XMieWq9ThdP2DudTkcT7ZzpL9PrYs4Yb+uiks2G3GYNw33D6BAoXze8
         AyT8iLPTJdeJUCT8O+2k2cBDYRcVNLOn1M8hIUMvRoLcPyrQmvebxjy9MDQKxJAMAnJO
         8GubGRHM5ZhmIrJ8jFrHuIjwQPWvGM6Uw+ekrCMDsyxUMw9Kx48tlWZv3EluYVOYCJYT
         msyg==
X-Forwarded-Encrypted: i=1; AHgh+RpA1I1IwRjW1iT5MKgqVp4vS40gf6AgRWVEsH3YLe8DRuaPhn2j1clFTGNs8Ds+Zx7jdly4Qk3Ko4JSOfq1@lists.linux.dev
X-Gm-Message-State: AOJu0YyZmtvplPrcaq2JBry6/nK9vAUaEaO+O/C9wU0JgRU+qUb4SpQn
	JpXvPSuUrfknq4OBMFkE4C/da6JWeQ9/N6H0L6KpNGZGaGQ+5f6pS/xn
X-Gm-Gg: AfdE7cnHrMzGe/DUL81O5Ee9Khno1qQgPYhX6UIo2y9zBk0pzH8qbBDM1L9ON8oM2wx
	oLaJUIRoxeaoB1fNsP2CmqVGzq5lPLAvVZ3tWjgPOPa4eijIMWKvFU9DFore+nkWuN2wVKNoJpw
	KS4l5+2eHzvFL42B2mHe1ARA8NJdJUfup66eNPqzCdBhXL+kXvch8L/6fegmlaZluuZfCcv3UG0
	9dfcX4qgw0kz4jK4ojVFIoh6oNChGyzxi8NmO4CfYjeL3P8HUUqnNO0abwQbqfTFXNA020UysEy
	gDpSwdqDvtd83uBxH66HSr1JdUXqP2WCckaXsFoLflniabpwO4q1C9gA4/aBGO6sqmyveOgaJn5
	5F1+ua++YPauGZQz80am76IOmLHvIaoS7tKq7+QB7B+26AnakqmoNfTKhawpm2BNhENGcgsU/dh
	2dVpqf/EQWfF1/fhK7AG+nRvnQQXvFk5Q2qy9+lEnfY+u9pVAwl8Ln6uEcxP9pi0Qq8qko+iSkS
	ir/tL1ezeA=
X-Received: by 2002:a17:902:d490:b0:2c9:fa37:c666 with SMTP id d9443c01a7336-2ca7e8cbd87mr46648105ad.44.1782975994973;
        Thu, 02 Jul 2026 00:06:34 -0700 (PDT)
Received: from [192.168.1.45] ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9124f2sm8865035ad.33.2026.07.02.00.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:06:34 -0700 (PDT)
From: Prashant Rahul <prashantrahul23@gmail.com>
Date: Thu, 02 Jul 2026 12:36:17 +0530
Subject: [PATCH v2 4/4] staging: octeon: handle rx/tx initialization
 failures in probe
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-staging-driver-octeon-panic-v2-4-2c2b6ae086dd@gmail.com>
References: <20260702-staging-driver-octeon-panic-v2-0-2c2b6ae086dd@gmail.com>
In-Reply-To: <20260702-staging-driver-octeon-panic-v2-0-2c2b6ae086dd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Klara Modin <klarasmodin@gmail.com>, 
 Prashant Rahul <prashantrahul23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=prashantrahul23@gmail.com; h=from:subject:message-id;
 bh=qwCY0nFaOJCUvrmLvadCEv+mpvx7nZJWCKGrLiomDdU=;
 b=owEBbQKS/ZANAwAKAWw+kajX8DhtAcsmYgBqRg3pQ0F973YJeuqcWtpTNrj3CnK/+ILJkFIIJ
 Xsv+ApE3eSJAjMEAAEKAB0WIQRS5esR6MP3hQs0SsxsPpGo1/A4bQUCakYN6QAKCRBsPpGo1/A4
 baD8EACwPLwOlwPPoNMCRbkJrGzhIVtMtC6CnufFYRxD3GeLHHeDZ6W0Ez3cvvLq9g8vCvvaNly
 l+2N8dImpk0V/7Nq3Ou3BLDo6c3Pptdvfb9wkStEgP9xxBMFrdrR6JTIVG9ZRZ5m69xnpqptk9u
 1nFC8Mpbj2C5hljelZnvNpLiMg7tJzjMvkdTY5wLFAKUomxQ4+yyu1uG5usf2D7R73UGgs7xJh3
 BbfOc7TAY1LV1uRFrtFKyxwf3Kw+JY01EqSXTYpw91W4XbqmfSx89dlgbLZrHHTGjGIZTADLdUo
 KPPi4gN+O9/bxMJuwwJKPSRdTrNWbQ/U1Bb07bxOtmhJNap5a8QB680DVt+Tl7sEPQEG9T2qFKR
 O8QI7zuVMj79OO8TfEZZaP3p7X47Cl1qux5WhwB5yzU0/7IwH9vFuH+MrfJp1UmkaeGPlaNKLMK
 gcx9cPaKxgdTMsXaCaDQaaXLTU5gDq7AOxxYcnug7ZuSrdz+5Tw3mFUafMmAw0FIYXM2TU+bvtA
 gCbA1lArBHOKuEjOjRYlPGPC64IJM9l7CqUJUAesWK7MTkNVQQoBIXk53k0YtiDQZ5cEg/vXnVl
 Ao73MX12/FbMUXAspcWC6gz7roneLMK7L1+yCmQukIS4POmLgh1Jdvmbw5Xez+b+rmb5mB5rbne
 3urOhP8qRljmEEw==
X-Developer-Key: i=prashantrahul23@gmail.com; a=openpgp;
 fpr=52E5EB11E8C3F7850B344ACC6C3E91A8D7F0386D

Check return value of rx/tx initialization functions and abort probing
if either one fails.

Add error handling labels to deallocate resources before returning the
error.

Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 56ea848187531..42ec4b8324a83 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -688,6 +688,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 {
 	int num_interfaces;
 	int interface;
+	int ret = 0;
 	int fau = FAU_NUM_PACKET_BUFFERS_TO_FREE;
 	int qos;
 	struct device_node *pip;
@@ -934,17 +935,48 @@ static int cvm_oct_probe(struct platform_device *pdev)
 		}
 	}
 
-	cvm_oct_tx_initialize(pdev);
-	cvm_oct_rx_initialize(pdev);
+	ret = cvm_oct_tx_initialize(pdev);
+	if (ret)
+		goto err_tx;
+
+	ret = cvm_oct_rx_initialize(pdev);
+	if (ret)
+		goto err_rx;
 
 	/*
 	 * 150 uS: about 10 1500-byte packets at 1GE.
 	 */
 	cvm_oct_tx_poll_interval = 150 * (octeon_get_clock_rate() / 1000000);
 
 	schedule_delayed_work(&plat->rx_refill_work, HZ);
 
 	return 0;
+
+err_rx:
+	cvm_oct_tx_shutdown();
+err_tx:
+	cvmx_ipd_disable();
+
+	atomic_inc_return(&cvm_oct_poll_queue_stopping);
+
+	/* Free the ethernet devices */
+	for (int port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
+		cvm_oct_remove_device(port);
+
+	cvmx_pko_shutdown();
+
+	cvmx_ipd_free_ptr();
+
+	/* Free the HW pools */
+	cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
+			      num_packet_buffers);
+	cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
+			      num_packet_buffers);
+	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
+		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+
+	return ret;
 }
 
 static void cvm_oct_remove(struct platform_device *pdev)

-- 
2.54.0

