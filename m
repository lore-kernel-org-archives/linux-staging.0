Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F12271
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 12:17:46 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id b19-20020a05600c06d3b029014258a636e8so1007028wmn.2
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 05:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nat4LFfGQcFfXDvBywclc7M5Wq/78nBVd6uZKPH1Dq8=;
        b=Pq9HXZ7txVp1pkmu6gspsFTgD+uQBEen2M7yHb59w8HezVd+iwvQsjnXzG55gkIarN
         c4fidd3ycNNaHSKve38aQ2bj4lHmHlIAylBmT7b+pmF2CDp0lrbBUe2u++cSqPnxh8Cu
         xkU0j8K0vAQndlwjxgi4eofVYOklDdzuCULHcG992lxTHQ/UnC6ifCFFTd1FYoMz26Zs
         X0LdcW9Yc5pEh+i+WXK/zk6CA7Ve4wax2sQsHUW79ZK/CfTqTC1CpUnMy7nyEP4kpkbb
         wCbuRcfoSMZLuqJ5Hv22FQZoWxq8j8n1FzeRkPtOvoeCbPveyR2MRqCC6DMo4hqnL+LM
         WJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nat4LFfGQcFfXDvBywclc7M5Wq/78nBVd6uZKPH1Dq8=;
        b=ixfCm6KLjvlx+lTsc/BElDPJkhMmkTblm1JIvcza1edZIOx8YiPrASqBVrXPs9lZq8
         SQwPGIt0gZQ2Zkjnd/6C0/kr+4nvwo2saGe0xNrw93ISMAw/mBp3otuKCUKTGiXYB8Ox
         CU0oHLXx5vE48FvVzdURcD5ql89EyR9tdXe7RtyrP63rd+tal1rKKF6jRtCfWNK4y8mc
         1TJ5XYEImHKhQEAMQPwqHGo/uoTT0mdzQzz+zQ1PdsLP9Fra27s0n1PDd8kPhZcjxNZG
         NCNR/kb7Btnha13S0TCxZFyl3dfzAcvzezeZpx92uW+ZvThadfzpxuelM+BCv2avq+On
         v+dg==
X-Gm-Message-State: AOAM531g7vzbhSnZRr8Xb06SDcC39TQpnXKffcuMKKp2XAiNnMrXoEgo
	RPpGtkAeBqHTkjk1i1Y03Zg0frCWvxtADQ==
X-Google-Smtp-Source: ABdhPJzvblG+gxcPv90oda+jKwO4WdyaruOPWmPYrXfihHfFuvVB5xVUbIsWd8B1EG/Yief1l4vWeQ==
X-Received: by 2002:a1c:7d09:: with SMTP id y9mr33072249wmc.7.1620217064906;
        Wed, 05 May 2021 05:17:44 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p17sm19067896wru.1.2021.05.05.05.17.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:17:44 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 06/10] staging: mt7621-pci: directly return 'mt7621_pcie_register_host'
Date: Wed,  5 May 2021 14:17:32 +0200
Message-Id: <20210505121736.6459-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
References: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return code after call function 'mt7621_pcie_register_host' is
being checked to give an error message. This function internally
is calling 'pci_host_probe' which if something fails will complain
already. Hence, directly return result of this call making decrease
a bit LOC.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 40bb2e8a1177..331bd8b47d99 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -694,13 +694,7 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 
 	setup_cm_memory_region(pcie);
 
-	err = mt7621_pcie_register_host(bridge);
-	if (err) {
-		dev_err(dev, "Error registering host\n");
-		return err;
-	}
-
-	return 0;
+	return mt7621_pcie_register_host(bridge);
 }
 
 static const struct of_device_id mt7621_pci_ids[] = {
-- 
2.25.1

