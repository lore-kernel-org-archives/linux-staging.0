Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03B92F0C74
	for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 07:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782630118; cv=none; b=ozImQZ2zJqUIrGK6ttgQC793YJNS0uYttEEIvUacMISbocIsTveUaF9CrpHggqRGY1J28eVKtyNRmGgKCpUNYrv33YrPANUAHN3t6JbkXn+WMjyww2443seTPRxrcEj6g+CMyk/lBMm3/uxRjV4l2Po0RrleeYaW5W3XyTl0zkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782630118; c=relaxed/simple;
	bh=0Cj6wOJdILUOWABnwvYdl2Gz4eV0vxkMFlX+pQrPy/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mY1G5ZeHEEelbsPZk0D9FlGHldXxF56MKT0PrM/GkQ2EcCoC48/sFNtPFRz33P4fAV9vxwiHlXxXplzyokCTqGhzbwz7ZOR49db2g67JA8UZZc1Ep2hVQJc+zdOpxm0VywWoKvshc2FLzgxmcYTzK3bxNjJXkTngInD/Rx8x6cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxDgSxuV; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxDgSxuV"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30eac9abd79so776319eec.1
        for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 00:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782630116; x=1783234916; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebr54NXoj/alJszP2J+8XnUT0XJSuCiSbPSA/7MjZ7E=;
        b=HxDgSxuVfgkYxTQiSVCc+AcPkoSDVC0MiD3hsimlh/Q3ati51v1ROReaavRUi9ZuIU
         DnWyvLxy/pNzaeFF3g6pVaSmvhrChUUiqBN+pwUwRZywvmCd2r2FiVu3CIkRwWRb2Nu5
         rboFonO4sn6cRuec+hjyOlVTEID/7KmPHc8f0HPzcBUMKIcGtvTrsyBKeX8KaVUpzmHt
         0g/t5G1bG2XmlcqlIe9BnYQmB4nOWNiTvukMaLoNxdp2z8SgDXwlpC9gBRq2NGmiVeEc
         pWbhY0IdwwVXCSuv+MbocNR8nRTednRjuq1YpywpovelRoynKy4BxUWsOxx2Rv9vZ+kP
         GjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782630116; x=1783234916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ebr54NXoj/alJszP2J+8XnUT0XJSuCiSbPSA/7MjZ7E=;
        b=MHFfMTc9lcoY4/VgFVmaozBZTskTqVhMmKki7ELnaSfV39CXPh5+4LxHxaZuij74ze
         RTigOlhbbHrSDCK2qGtjEXS0Sfw3drJ3GRdeENnldVFPT29Deqi/evgTGjjpFEbX6vic
         WIfNN26boZjQ85W98N97oaYstGBKqNvx4vyREYZVg/ZBRLMR7+4jcq8Ff4bIO+f57wFp
         LL6JzLupvjRr/l1MkN8bybrL8PpCX4+1cLjSSPBwooeo9Q7/Eb03vWvFh7zB8lvznX5l
         +TM9MmfTOcDVmaXZ7PymQJZkOo8sxtp0xGaOndnKz7po7i8dd6K/R2u14QVo1LdlERJc
         aOcA==
X-Forwarded-Encrypted: i=1; AHgh+RolZVIFqx0deZ9FqoIgWABMmEwoVjDDqD13ALgQOWkuWYiuac9wppqVgVEd3ePROyukO2yGsp6LdjlvpXTW@lists.linux.dev
X-Gm-Message-State: AOJu0YyF8iUry09Ho6+TGxrV+Z/92i+Eteax4qEg7OpFzdEAX5jdx6cn
	KEHSnuJgzLYROHlvvfR7cV1d/nokd+UfQDp6q/Aak0NKJqsuXc9/KvX9VE2IwJJX
X-Gm-Gg: AfdE7cl9OdFQB+5cLaHYf29a3kk0m9tSHT25m0iZwZ9YNC8Axe75GXeM9ET4WXRsHBl
	WZLRLOMj48Q+SeJzONiuPare3CQOsBpLi6JCTjsM9FNUpREkhqVV40iiZJz6kO0uNHCGeHaZKKV
	59TyHrPXp44YSw9ew1DvcOC2cjXoFBNLA/KzOm4AhHiLMiyLQOxhLUtnI5tnch7kxB6IdQf2mU6
	9O78GyAPZQ0xeEY/vVUmMCbFVgLtulnTaKgNvPv7wfnUGkxRlnQOwtI2XHO4jQJRigfauT32puN
	vxJ4/yA5rt51Qx/bMHyrI35+JsNqzd7JQ0KzUlqEnFkeBSXSoh7HV0UkmMtFoBvVPvR4ZsckQv4
	NridheFnz7wRmAeoszC26nvTnoZzZIokhgdO0uR3lI7Qqq9NgE/dzFCPEwFzYb0b88dErFNg4xQ
	8D4RvC12vft4JyXexQ0fzJqEIWSUT6qPQ1Uw30Hb+u0IdggOpGiTYONno703JzTJWdI6JfgpPJu
	puCjd1OVZc=
X-Received: by 2002:a05:7300:8bab:b0:30c:6ac0:5d8c with SMTP id 5a478bee46e88-30caae2e94dmr6895784eec.7.1782630115956;
        Sun, 28 Jun 2026 00:01:55 -0700 (PDT)
Received: from [192.168.1.45] ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ae5sm39878489eec.16.2026.06.28.00.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 00:01:55 -0700 (PDT)
From: Prashant Rahul <prashantrahul23@gmail.com>
Date: Sun, 28 Jun 2026 12:31:27 +0530
Subject: [PATCH 4/4] staging: octeon: handle rx/tx initialization failures
 in probe
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-staging-driver-octeon-panic-v1-4-fe8c34989254@gmail.com>
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
In-Reply-To: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Prashant Rahul <prashantrahul23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167;
 i=prashantrahul23@gmail.com; h=from:subject:message-id;
 bh=0Cj6wOJdILUOWABnwvYdl2Gz4eV0vxkMFlX+pQrPy/8=;
 b=owEBbQKS/ZANAwAKAWw+kajX8DhtAcsmYgBqQMbUxUQ0uxWyQMSfX9OH4k7IDVFHc9fztqBWg
 MvZN2+WSSqJAjMEAAEKAB0WIQRS5esR6MP3hQs0SsxsPpGo1/A4bQUCakDG1AAKCRBsPpGo1/A4
 bYW7EACmz037MkLPiNiuDDjXnEZTDgv0CPAohwVxVKKDCM6WVaK1lfLUsHlI7RneDzdd7lwYD+B
 OpDDBH7hskj6FgD9D91Vx+xdFZ5Y0qde7MCPUXOm2iTdIQb4O9pd0s2mKAAAiQvyp21CXjKy6ND
 FoCj2L5iN4iKVuL9/cGnLYZU1EsMGm2HbRna9vs6iaY1qvjEt7DFisQoN2Tmrf3y8zp8NXpduH5
 J09TSrwmPSI6uEe2mKkNu7q/xe0OOymBeeXcvFLi+2P6F2HxpGHRhsAcs4o67iwa0shXKVXOJ4+
 x+8HNdZF9iEQ+X3frGYOrTkhxKBEoBbrCIJYnGLB6uMp/khffjnQChblXf1LJoVj7GKRcu9VdrE
 wtprL3OH8jbmPYoqhW0HVJFZwDLzrYC2kLgfAl5ywD/Wvi962f3HNth51CDlt1CYAk/e06u/q52
 WkaU5syPWIYNj8EetxptOU/y67qXe0hFNuuXyfKsyijgDbZz/ABPcVRPa1okhSy6wozfUkuOIDs
 D/yYmGy78AKasPI58jtc39NPFhQ19DgmQAbrm7B7mCokf+3XgQrZBUEf0T7GG381CwlhFLvWqCZ
 PdV5WyZM803QgEr9/pcN2UE957bcN8vPTvk2N2ZZ5SPRh1kJoKV/935zdawyqnq1GPdyCFfcfc4
 LwfdZqVp5z2SWUA==
X-Developer-Key: i=prashantrahul23@gmail.com; a=openpgp;
 fpr=52E5EB11E8C3F7850B344ACC6C3E91A8D7F0386D

Check return value of rx/tx initialization functions and abort probing
if either one fails.

Add error handling labels to deallocate resources before returning the
error.

Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 1d3bf3c79598d..41be73b2ded91 100644
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
@@ -934,17 +935,50 @@ static int cvm_oct_probe(struct platform_device *pdev)
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
+	cvmx_pko_disable();
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

