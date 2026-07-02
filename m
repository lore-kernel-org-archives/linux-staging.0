Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3AB39021D
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975986; cv=none; b=k40qrCh4GXy+wwECEL40sUYhaE+66MOuPl5oF4HCrvMwcDLWoskKhx9WMf8JPWstYGySgVDBTGtYsMoEjfGApLEBdNvO5OmGDxEEWiKxyDqxpAz7xwBhG8WrSYSYuteZ25Ao1NQE1GNBZmbkGMAKBzg7QJp82earaqmkAwOAuYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975986; c=relaxed/simple;
	bh=uZo3B6aWvCKbe+vGSvuw4BaJPTVy4l59d8m8ZnJP7qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lycs0UDIABl72lDNq5J5nVwD/Xo4uVvmB/mkw4eNF8gZreJ6lg6njMcJMYEgEKibpB80vghscctZYDLGuvZmbhaEOXknQzKuBhEdFJXZD2P4mz6t5pRQLgyFLLdMrsGGgFTSIHj7fAkBP6WF2dqa7suah5VohZbCmcgDAkDTVgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCu/JaA1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCu/JaA1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ca265d6ca1so2858155ad.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Jul 2026 00:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782975984; x=1783580784; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4TBwT7+IN7fJMdJO5ji2E+JAqQjeu1KffU5+JXGZ74=;
        b=qCu/JaA1xuh0G33Y/rmF6nzQUR/pxqdqgyUVhELKFUh4Xa+HEqdbk4/5zfoDM3uidb
         /wqFocRYqlEXPJr8moL4zyaZmySbru8JM5zyd0R0NffK8a025MO8Lal0hf5OCG089KoZ
         wNQncsxxTr0ljiCdcXGzAGJuzR9N1WLM2l/UVI0MF5tSYu765NmPwKKVUO03m25TAZCx
         Ybh/3+HliXtuzJrR2tu6wrP53b8mnIx4hLX6Szp0wQ4qVbZ4vE3dEX7ttHbeVn1BC+EQ
         JqfMt4rW+c7YiYHtMO9xp8bcolZbgro3o0KyuqZikUCsJ4MdwOinaQ3X6i9hoQFXi+l2
         MCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782975984; x=1783580784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4TBwT7+IN7fJMdJO5ji2E+JAqQjeu1KffU5+JXGZ74=;
        b=PF3218BxlPALz3MtT17XC9bO1ZOW0mKrJHaCWRfpYjVsLvIrQytTnm0jMRxEpHSE1h
         Y/m8fOCfClr4uYyE51E9fcgMO2s63Erq61zVluxl5lnVRlHa0gvfxBqDH8TKZzxU3/Ei
         woTNatUlsWDK4CGFyB88BzWHQuW5ZX16OoXk/EDpHopdWgvK83SjvfvO349GH5SPhQoF
         67IU5Evvqz+jdqjuB5L/hkj95kGFnpWDRFu3kl9LOdMHpnNAjdDByEIGc8N8YjsTI/Jm
         NezQWUJkURTNdQGCPSPi7irQsvOndN7YynSbEDN7dgYjlLM7o+7zh+5pwWn4Bz9mMAap
         rNXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQvaNUi2nlBR2pOCfBKWRc1NmT+HcxzVbMsHVhg5feQ69/ajtT+g/q53LUZqcIVmnp1TRhtflaykn1YpPH@lists.linux.dev
X-Gm-Message-State: AOJu0YyQEgeKGH5gPnGqh0dE/fpP6Wj7gTK4ewpexAkbTxVQ9iPXV5ie
	3q5077FJ/8OlMRXWoTH6evq+/toD9R5JwST/ihskQPft0MIoWw82Q3E3
X-Gm-Gg: AfdE7cnD3mpoE0G0F8q/eI4NDK1hnDk46AgWfYQ6YOIx6eH5NAqYKTNd9wd3BMFe4Y5
	x0OJ4xFiiQyRsYqCFsNgKuHCZ9bkdNgbC3xi1KYe18K48/NRdAxRpYOTBE8ZZQSoRFqHx0afiqv
	EVE5XtO9XuYT2nah6cVIMCZupSUYi1QNyVLQqSTseuQoqqCJroDsGp7kWoa0eL+DfIVUzwnFBB+
	SsPrpT070oXKihAKEmJX0R8EkaRdBNyWdf0en8Yfe7T4ubpuHtQWq33nqaWItPflx0YXnNbHgV4
	2gBhPelPvi8vQ1xNCZeC5PBvtBulGAihw8j1L259KKenzJHWhn7u5IyCk74pMVzb7zwDVZFdKah
	2H79n92DrkobzjebAix24mBoCrPUF+p/WypRbq9WqJUFiRh99zuWBu5w/ZLr4zoRKhy9ncgnoov
	AUQQJZl6gibfi81P8rv9tZiql5z9c7NT0yArb5NWhecW4nQ3fkMnH/yoLD1Jv7ksGdk8HSHNMsH
	Z64T0to9pI=
X-Received: by 2002:a17:903:1a2e:b0:2c9:e9ad:3ed3 with SMTP id d9443c01a7336-2ca7e862370mr49545805ad.17.1782975984171;
        Thu, 02 Jul 2026 00:06:24 -0700 (PDT)
Received: from [192.168.1.45] ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9124f2sm8865035ad.33.2026.07.02.00.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:06:23 -0700 (PDT)
From: Prashant Rahul <prashantrahul23@gmail.com>
Date: Thu, 02 Jul 2026 12:36:14 +0530
Subject: [PATCH v2 1/4] staging: octeon: factor out device removal into a
 helper
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-staging-driver-octeon-panic-v2-1-2c2b6ae086dd@gmail.com>
References: <20260702-staging-driver-octeon-panic-v2-0-2c2b6ae086dd@gmail.com>
In-Reply-To: <20260702-staging-driver-octeon-panic-v2-0-2c2b6ae086dd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Klara Modin <klarasmodin@gmail.com>, 
 Prashant Rahul <prashantrahul23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814;
 i=prashantrahul23@gmail.com; h=from:subject:message-id;
 bh=uZo3B6aWvCKbe+vGSvuw4BaJPTVy4l59d8m8ZnJP7qI=;
 b=owEBbQKS/ZANAwAKAWw+kajX8DhtAcsmYgBqRg3pAW5OVlVxr6HVQKEr0tABd8HDzWOc9C3lE
 tJzGJGmobqJAjMEAAEKAB0WIQRS5esR6MP3hQs0SsxsPpGo1/A4bQUCakYN6QAKCRBsPpGo1/A4
 bay3EACU9xk+G70i70UXAfqi8BoECR6E2p0m1T0xwXR5u6U6YHjXk64HzpuUueej0H3JjyTpLCL
 TQM4DXSccW4nBjJChdIj8wsrHkuuO1pYewR5Cf8GExKMFu5s7FU6FP1HNgl9uCcGgCUkQryiCOk
 aR8jPiBsm/XZLZ5E6a1jxFRxW2ymwzJ1d8K7LZ5CIiNV4ECGMoE4+ZASK/j1Wg7fL9mlwtUyp0Y
 pBdRx6S2EGVUZTM7hJ+e1I9CaIRKXCdH+5mgkw3ydNxlduzGljWYfeeVDLJN94E1kof82gj3PMs
 xRFVmlPouBlA+nxlioB91F9rDrFViKp7G3UgL6J5ZyPnUc5+iDxfxLdstCY8Br1X3X9xqYv0NcG
 LrnVlRVxlNHiJbE8tdGmi/HumuHsdaA0U99p6qWgDAStCJXHYPw4+zqpq0CUKAr/pW1Tw3tyKMh
 uPJfCGtmY9/Bd6Y/B1yD8O8SJvFbHv11vMMGi6h4GMEz5pl5An3EaIFHt6g4o/UANC/atUH6e3J
 GJYn3ZTYaEM/AQxOhT9Vc0gOUbFnLMqEoaDutpmjOcav96G7+nk5oWrwp4PVECNmye6powtZDEq
 n3dGKCBxumFaGWuz45Myb1kP1JZCLLpnSMh/pTXtdGpLZ6DqCCpvkXGcwA2Ttb8kVOatbmAvw8V
 MbGV/VxgPu4ls7g==
X-Developer-Key: i=prashantrahul23@gmail.com; a=openpgp;
 fpr=52E5EB11E8C3F7850B344ACC6C3E91A8D7F0386D

Factor out the common device removal sequence into a helper in
preparation for adding cleanup to the probe error path.

Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index f3fa221f452e2..21f3e27aabf2c 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -104,6 +104,21 @@ struct net_device *cvm_oct_device[TOTAL_NUMBER_OF_PORTS];
 
 u64 cvm_oct_tx_poll_interval;
 
+static void cvm_oct_remove_device(int port)
+{
+	if (cvm_oct_device[port]) {
+		struct net_device *dev = cvm_oct_device[port];
+		struct octeon_ethernet *priv = netdev_priv(dev);
+
+		cancel_delayed_work_sync(&priv->port_periodic_work);
+
+		cvm_oct_tx_shutdown_dev(dev);
+		unregister_netdev(dev);
+		free_netdev(dev);
+		cvm_oct_device[port] = NULL;
+	}
+}
+
 static void cvm_oct_rx_refill_worker(struct work_struct *work)
 {
 	struct octeon_ethernet_platform *plat = container_of(work,
@@ -948,19 +963,8 @@ static void cvm_oct_remove(struct platform_device *pdev)
 	cvmx_pko_disable();
 
 	/* Free the ethernet devices */
-	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++) {
-		if (cvm_oct_device[port]) {
-			struct net_device *dev = cvm_oct_device[port];
-			struct octeon_ethernet *priv = netdev_priv(dev);
-
-			cancel_delayed_work_sync(&priv->port_periodic_work);
-
-			cvm_oct_tx_shutdown_dev(dev);
-			unregister_netdev(dev);
-			free_netdev(dev);
-			cvm_oct_device[port] = NULL;
-		}
-	}
+	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
+		cvm_oct_remove_device(port);
 
 	cvmx_pko_shutdown();
 

-- 
2.54.0

