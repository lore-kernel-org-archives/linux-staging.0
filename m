Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6441020E6
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 02:23:27 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id v8-20020a17090a634800b001bb78857ccdso15247148pjs.1
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 18:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3TqDnGbE814aL5zFFBqZwwXe27yQRSxYJoayRFzKY5I=;
        b=OkZPsDsK+7Hmprv8mVquc5+qvIyMxDGyDnVRtXZR3MFks2a+5Hfvzs6YBrH3HiDmbj
         C1V+lupxb6cPETcoHqxlYfCsiCW4/A/LDYQJ5sI8zSH+dcpiPArkucuwdTbkcQt4LMNy
         eE5tgL1f3w69vURTbL0vZzoxmEkRSCNuOEzFoVjHnYoSUPisp/dGcGeqL/BK8Nus0jJS
         4lurtAz9PrmzWxIVDSmS/hVPXPDBTdhHDNxIUh4Rp18f1tBVmEq5GjEvfsT/SOgl+p8C
         VwqG/Kt6nIQEIKbk15vDmKBHu6fyVPy1w2Mi42gwt5MCJ4wj9ye3a1uccMhXfPZvqgaC
         PqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3TqDnGbE814aL5zFFBqZwwXe27yQRSxYJoayRFzKY5I=;
        b=zM+vDbL3HoliMrtjky4gf8CCYJaehT6rwrbH/1IUhap1pM2fhn6841xpwNhRuVYEvE
         hucJi77EH4sPB5CREa/aH6l3YnROHPXpDXpKc2mBLOO4rs9TNj77qL8Q0aeU80+9hLgB
         Mp6NBmkCPTjV01ZZru9hp8Fxn19vFdXoI48pmZ1zaC1HIW6zvBa9v8P6qH+0rZmCON9y
         0voO8V/5yLyna6QjMxTwnDo50VgzCA0AC44zhzWwhKuojIQr1IqZZ2fzFgK9qmsXxOoP
         28lE0Zc/OvQedj+coYFvEejc8IWhXbeDdQJ74jSKd5l0UmiBBcIzg2or4F9TAuKsnDF9
         cRPA==
X-Gm-Message-State: AOAM533qMjcy+sTtmy/3FBFlZejAK15uNLkjjgYq93LWcMpuqeQVFmwz
	AHIedO7p+bZOPMMeR53tt7s=
X-Google-Smtp-Source: ABdhPJwyUcNeyLtpe6R0/FHsc1Zv0QeGXVq8gnX6O/nlyYNbQNIf7OtUpJ4i63+eNEIYSgqWJD5gUA==
X-Received: by 2002:a17:90b:1642:b0:1b9:6b34:b68 with SMTP id il2-20020a17090b164200b001b96b340b68mr23490123pjb.99.1645410206903;
        Sun, 20 Feb 2022 18:23:26 -0800 (PST)
Received: from slim.das-security.cn ([103.84.139.52])
        by smtp.gmail.com with ESMTPSA id e28sm16603548pgm.23.2022.02.20.18.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 18:23:26 -0800 (PST)
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
Subject: [PATCH v2] staging: qlge: add unregister_netdev in qlge_probe
Date: Mon, 21 Feb 2022 10:23:12 +0800
Message-Id: <20220221022312.9101-1-hbh25y@gmail.com>
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

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---

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

