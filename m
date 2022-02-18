Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BAC323F
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 08:11:42 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id i10so6602639plr.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 00:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4tyuVDt8konpruvFZLheBo0477RzkXZvUE1/xQIQQzU=;
        b=HGxw+cT80fKVAuFta3cCBeLL2b3yRUW4hCLbJ2St0WM6ijqZZ41IvyiizVcSr/bqL0
         7GQoGde/lTLLFvZf5RXAu44mpBNxaYjiFE+ah3cPxMwb59NyI4gG1pazf2+OyVrfB1tQ
         NOyeWna96ckGtA+bPNeAFOPqajoNvpB1LEjj6sRdzXnyVvlrOzdOw9oeWuOhSvBhVwOP
         4Aj3WAyj2s09kvwuVgAnYx1CCTiPBd+7Jxok0aL2n/e4KT3816iH37IADV81aPwdsMmc
         sbgk0kCwqj5g5ZCL1qKVYcZhc9f3VFrYOWshUVKwWLLzOv4fBMTNKR7rUA0RdPvJlfPc
         37RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4tyuVDt8konpruvFZLheBo0477RzkXZvUE1/xQIQQzU=;
        b=KVitGGuP/D8xZra+H29857dktbbKeOWFXV1+xRGLekTajMgN7RWrAn4R1qlTy2K/vN
         4y9rQ+dZfHAGxb2zBiU0/VgxZJe275PjmzRQMAHQQagpE23dc6QyXp3YZwph5AFVjnPh
         PwM9z2Bhw6I/Xfs8C4jILkXRIGhQ4NjMFcktmOfutadypRJSL/P8rI4bezezaDQeHkrR
         l6TH10LgxsOXMOCfbj1z99SlnKaJv2I+Vk58Md1UoXWapbTeH3y5YB8HXfBofbdR9gFP
         dWJa89LbROXdczeQyLoS05zGbqvuaoE7LeiyOh+WRJX632GeQ7hLvW9GqoDoNgxNH/jW
         HMZw==
X-Gm-Message-State: AOAM531bItX6XHbcZebrmhqTIJ7N6Oa2YpxmlyEBHOv7ExXtctIxBpLs
	KQMMyTnsNoVIQdm3DRrXZQaBADLiRSFiDZp1
X-Google-Smtp-Source: ABdhPJy6dTgjTfwO+xBjsRnrzDVHxDWbcM2O1ZHCcdZ0hKvPfLXE8LTO96lZXLmUSDJ8THT3vpCP2w==
X-Received: by 2002:a17:90a:1202:b0:1b9:b7e7:1652 with SMTP id f2-20020a17090a120200b001b9b7e71652mr7282313pja.1.1645171901988;
        Fri, 18 Feb 2022 00:11:41 -0800 (PST)
Received: from slim.das-security.cn ([103.84.139.54])
        by smtp.gmail.com with ESMTPSA id g21sm2004515pfc.167.2022.02.18.00.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 00:11:41 -0800 (PST)
From: Hangyu Hua <hbh25y@gmail.com>
To: manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com,
	coiby.xu@gmail.com,
	gregkh@linuxfoundation.org
Cc: netdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH] staging: qlge: add unregister_netdev in qlge_probe
Date: Fri, 18 Feb 2022 16:11:30 +0800
Message-Id: <20220218081130.45670-1-hbh25y@gmail.com>
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
 drivers/staging/qlge/qlge_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 9873bb2a9ee4..0a199c6d77a1 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -4611,8 +4611,10 @@ static int qlge_probe(struct pci_dev *pdev,
 	}
 
 	err = qlge_health_create_reporters(qdev);
-	if (err)
+	if (err) {
+		unregister_netdev(ndev);
 		goto netdev_free;
+	}
 
 	/* Start up the timer to trigger EEH if
 	 * the bus goes dead
-- 
2.25.1

