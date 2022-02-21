Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DEC2568
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 08:56:08 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 75so13723223pgb.4
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 00:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZXrnKErNeL5lMaOc5mdXm+VKeICKiYhtwQ5xG170Xw=;
        b=jU/OVWCH/lwwVb3C6Bp5ADGr8MXWoiP7i+0Kij0V0hacdaZZ8tK00cVt6iZ/1oDgSf
         zLCNBR+499VDg1KPetHCo+UMwdstxG/Wtb/cojSBn4CxSEJ6+B6Kn2sSEKMLa1FhpnkO
         gOfg/cTYpGSln1Uw29rXocHi3cBKSe7DPv5ozIhOeUHwEN6CIvYt5Ra3Si/aWrc6nHOh
         7aJAYpciUQhPZ4GngXgspMO/udtUSVPy9FfWweOkXFjyWaxJte3XNAcV5wQbDu9Bgw6B
         LWwBJa1AeaH1H8LyWa/xijViaL4QCRQOZGKSBn+6X/iN/DMs7UCUWh/T95iDkQZ2eXiU
         6NYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZXrnKErNeL5lMaOc5mdXm+VKeICKiYhtwQ5xG170Xw=;
        b=uAF9GppLfAVP4sRJrQxo7Q+AzGMr/USNfOhbNSfqg/KXPbBl8irwQ48Q9cf06NrVrp
         dNaXv9s3gDRuQsFL3u7yCMM6r7BUh3rEuN3DvyGlF2RfxYR8czCwmWFd4uKE7hrFLPXy
         43DH33scUgYDix2pzi/epWljAxshP8tUltXE2FjEh1KygqZCWCfveeHEU0Hs2pQkBrpc
         XHyAqiuvUZ0t01yNrIvou6yysLJj9c+fTPbzOxjYPZN+OeL+0SRsQYuAe0ZiPKe7P1mt
         4fR7X4BnhMb2AYHnm4gB1s1lfKVN0RkgyoPD+tWJmr5s61ZCcfxZtAKorZ8kYBHtv9rK
         XjoQ==
X-Gm-Message-State: AOAM533cXgqC6rN3TVPthLBopghsmEQHAyWKBF5gvIYR7cbWNRzDcwju
	SwlEjPXXMuu8YFmgZc+KE+Q=
X-Google-Smtp-Source: ABdhPJxQFKuAvx0FRc1MFgpz68m7KDduM6CKW3pDZQEtnNhhGZJ/kLVbzQcknaO+Ju1xitzuqiXzYg==
X-Received: by 2002:aa7:8d54:0:b0:4e0:bd6:cfb9 with SMTP id s20-20020aa78d54000000b004e00bd6cfb9mr19221126pfe.60.1645433768449;
        Mon, 21 Feb 2022 00:56:08 -0800 (PST)
Received: from slim.das-security.cn ([103.84.139.54])
        by smtp.gmail.com with ESMTPSA id h5sm11488325pfc.118.2022.02.21.00.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 00:56:08 -0800 (PST)
From: Hangyu Hua <hbh25y@gmail.com>
To: manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com,
	coiby.xu@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH v3] staging: qlge: add unregister_netdev in qlge_probe
Date: Mon, 21 Feb 2022 16:55:52 +0800
Message-Id: <20220221085552.93561-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

unregister_netdev need to be called when register_netdev succeeds
qlge_health_create_reporters fails.

Fixes: d8827ae8e22b ("staging: qlge: deal with the case that devlink_health_reporter_create fails")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---

v3: add a Fixed tag

v2: use goto to fix this bug

 drivers/staging/qlge/qlge_main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 9873bb2a9ee4..113a3efd12e9 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -4605,14 +4605,12 @@ static int qlge_probe(struct pci_dev *pdev,
 	err = register_netdev(ndev);
 	if (err) {
 		dev_err(&pdev->dev, "net device registration failed.\n");
-		qlge_release_all(pdev);
-		pci_disable_device(pdev);
-		goto netdev_free;
+		goto cleanup_pdev;
 	}
 
 	err = qlge_health_create_reporters(qdev);
 	if (err)
-		goto netdev_free;
+		goto unregister_netdev;
 
 	/* Start up the timer to trigger EEH if
 	 * the bus goes dead
@@ -4626,6 +4624,11 @@ static int qlge_probe(struct pci_dev *pdev,
 	devlink_register(devlink);
 	return 0;
 
+unregister_netdev:
+	unregister_netdev(ndev);
+cleanup_pdev:
+	qlge_release_all(pdev);
+	pci_disable_device(pdev);
 netdev_free:
 	free_netdev(ndev);
 devlink_free:
-- 
2.25.1

