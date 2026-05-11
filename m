Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7313FF89E
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 15:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512354; cv=none; b=B9KRZ1/aGBdBZdSCi7/G+1brJZWcZ6YSE5Ev9Qre6VZKuaK4Aor+mmyxKVulrwMUCPje4wMcjTeHa47/StVHfGQDRlQE9k9HCLn9M808NJVhtpSR2aLGKPpb3fk48OH29OsOA8lKH1Zt+6gq1N62Mjzgu2ClgNye0VqM5uwG5Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512354; c=relaxed/simple;
	bh=iQC233ObFQR/90YxKD9y724eQmyLFjIZfp3RWHo/ye8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BunPtiDUyeZ1eaZVdgkFCtt6Xnb0lc6DuGFsj2GHhXWn4fDmf+4Z4akc+jVwVh8XNGFfpngdqwXkqRsUQoatsaOdq+sDHC2uIXgpmOz2PK9zxeix0xY+5oWQNTiMAYYW+eatNntpfDwLyNlJ3u+BXm01/sG7oS/gfa7+k0wJgsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzWvkv/F; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzWvkv/F"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-365cad57764so355373a91.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778512352; x=1779117152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcvoM5yhRfse1l84YXFUTPi+JFMcUZ44W2hrGEOy/hI=;
        b=hzWvkv/FNb/mm63fhnZsjuvP263KKhQ7K2qH5CcJ6egGV5FNGBcSiXRrsUz8Q2z9W9
         FpzQ2pSqXAXeDGMHCUMuDTcJZCFVns+0GSdDYVp0Shov9Yqk8dv0DJkWw4ERjGJXVFHE
         u5l9ayK2w1/mdaGFOI5DxclNmhnmISIyKWKjwz8txzeK9+pZkOqbgwHjvwpE37g9wcRf
         H+KKV+Evv+Gt+teIXJrIGJJDBT8e1s9hQPrz9Kpenfl/N6xoVK+y0oA2iXtYhTWMg2oP
         PQh8sx2G+XxzYre3xQV+DqJFXZbQSYvTG9IJPNKlQEFqK98r2kR92S2c9Gus3F0Pf1yW
         Y64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512352; x=1779117152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vcvoM5yhRfse1l84YXFUTPi+JFMcUZ44W2hrGEOy/hI=;
        b=hK7jAyN8vcTGSH6sskKsOhRdYWDZ0+OPNaAWNZ2vsTFxXle4nYt9j4BQpFsv4eyfxN
         NB9z3KH3VQQOUzrHTugxMQkC0NTzPqMlwLZDPRnUQvv9fLfsprlOB+YSQ08A/B0AdxlG
         5pE56A5Rmy75xN8HzFAo4v7S/WVC/SjgcuWLYwFNNPUhLIXbH00w0ScsrLp0lbAuasEj
         l8q9aC1OdN3wBvPYwLFhoPDdM4J1+7Rx0JT1Y0EUV7NTw+77/7qvuuh2L9Bwnl43FHH6
         EDAJecz80bt1L6yZP3etHK17Q8BSj0P43Ektsw+x16DekMGpGlAAcSAT2msgC+oQfNb2
         0EGg==
X-Forwarded-Encrypted: i=1; AFNElJ8c2RGp32QD53C6r43SOVA9JpZC2LlY1FaMylz+5hf6mrlqny7ZFxupk5EcVZ4MT0bSS8erTFo0Rad2ufLX@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+92d35atXzZTCs126q63i0/H7kQlAUBndV1UhPhvY8YGQxQ7P
	MtFJtE/wrGE4Bk7sQK1gF68koeMZiZDEgocM1irRKXdrTtYd/Fi3+nhU
X-Gm-Gg: Acq92OHqvlQHJ/owYuZ4rLnei5pIRz1qMnlLoMNxS2KISYooNS1YWbSfqsBbg2t8S83
	aUnGqj1Sdsgg1nZMrx7F75aGrdpYeOD61rcMItHgdHaNrP5iciZ4BeU0hhrmeyoIe/hCW0iRGyj
	kSLB50Qu6ANX8Hc6ZCeoPlJ3/gbqaci+wu/k9eD9AAIdBy11zYJw4usGFKeSABSZ2tFi9Q6S9sR
	W4Enk6F+6GwbiO8060JjxD/IjTaaJO4Y8WF6EBZkSdeXaWM1hodKteHbR0gd0cMen2EGtSZ8kap
	GXJlouvXzUksSYdJrVvtiPKOq2Og+I1NM92awV5aKmWFvGIeHXwVeUpcNTp6XBk3LAHcmwCFXCw
	u6x8KjR4oIpm/6tVVQ8MSrPx1zl6kRll1vfkOHajFaeVbFDetmfrJ9rBRdVgJw3QNeLR6SUpj2c
	uRi9hd7XsAhazLjrLGEu6CMKYj479DO7KCpoHavtf/YBQmV2OfA5pTPab45MDA9Qk3kCcH0aC2I
	mmqFbabAVwKbMsKBcElysO+1ZUW
X-Received: by 2002:a17:90b:5808:b0:35f:c796:ca60 with SMTP id 98e67ed59e1d1-365acb8a956mr14322757a91.7.1778512351991;
        Mon, 11 May 2026 08:12:31 -0700 (PDT)
Received: from fedora ([2401:4900:bffc:e9a7:49ca:5a41:a2bb:6936])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fa7asm9932363a91.10.2026.05.11.08.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:12:31 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v7 2/3] staging: octeon: ethernet: replace pr_err and pr_info with dev_err and netdev_err
Date: Mon, 11 May 2026 20:39:30 +0530
Message-ID: <20260511150931.93382-3-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511150931.93382-1-ayushmukkanwar@gmail.com>
References: <20260511150931.93382-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_err() and pr_info() calls in cvm_oct_probe() with
dev_err(), netdev_err(), and netdev_info() to include device
information in log messages. Use dev_err() where no net_device
is available (allocation failures), and netdev_err()/netdev_info()
where a net_device exists.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 31464ed63b58..eaa4f04093b8 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -685,7 +685,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	pip = pdev->dev.of_node;
 	if (!pip) {
-		pr_err("Error: No 'pip' in /aliases\n");
+		dev_err(&pdev->dev, "No 'pip' in /aliases\n");
 		return -EINVAL;
 	}
 
@@ -783,16 +783,16 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			dev->max_mtu = OCTEON_MAX_MTU - mtu_overhead;
 
 			if (register_netdev(dev) < 0) {
-				pr_err("Failed to register ethernet device for POW\n");
+				netdev_err(dev, "Failed to register ethernet device for POW\n");
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[CVMX_PIP_NUM_INPUT_PORTS] = dev;
-				pr_info("%s: POW send group %d, receive group %d\n",
-					dev->name, pow_send_group,
-					pow_receive_group);
+				netdev_info(dev, "POW send group %d, receive group %d\n",
+					    pow_send_group,
+					    pow_receive_group);
 			}
 		} else {
-			pr_err("Failed to allocate ethernet device for POW\n");
+			dev_err(&pdev->dev, "Failed to allocate ethernet device for POW\n");
 		}
 	}
 
@@ -812,8 +812,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			struct net_device *dev =
 			    alloc_etherdev(sizeof(struct octeon_ethernet));
 			if (!dev) {
-				pr_err("Failed to allocate ethernet device for port %d\n",
-				       port);
+				dev_err(&pdev->dev, "Failed to allocate ethernet device for port %d\n",
+					port);
 				continue;
 			}
 
@@ -897,8 +897,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			if (!dev->netdev_ops) {
 				free_netdev(dev);
 			} else if (register_netdev(dev) < 0) {
-				pr_err("Failed to register ethernet device for interface %d, port %d\n",
-				       interface, priv->port);
+				netdev_err(dev, "Failed to register ethernet device for interface %d, port %d\n",
+					   interface, priv->port);
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[priv->port] = dev;
-- 
2.53.0

