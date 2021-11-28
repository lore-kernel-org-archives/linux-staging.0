Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475C72C85
	for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 13:53:39 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso14651348wml.1
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 05:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lgDZB4IOfVNqZTR87ZkJaDoJSzG0JEfpGt4NxaNH5O8=;
        b=GGa2behho5PoCHdivh5qgXgY+0TuDyylj1Lsvs5zHgsQXm2ic+HbCEcSukyZaRJ24q
         5hpvddRfrGtZ3uAq2GOsqagELqNftUuwNaQQy7UsNKM0dowkZS9FH/rW1Sh82U/BAMgH
         Wj6M045AoYsU4a4JbgI/SDoEy/TD+rxel8lXs9ozVKKwzkqxkDH5/Hj/71TRWOorq3QG
         tNmBwb5O72xGZltf8wYWvlaX3EdTKFEAjFWhBtgoQ455gH88BcJ/JKlY9XqYJ7gRKjkt
         7uLgdmkrmPvGK/4Rx90lpefZE+f6UENe/Whr4UMSjAivdmO/LdBVWceFQBWwlNTqP2Kw
         GPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lgDZB4IOfVNqZTR87ZkJaDoJSzG0JEfpGt4NxaNH5O8=;
        b=on4O6iNuC5Rsirh4yQuYUplMwGPdtnkrF8FeyiG6bGakyT96/m/mKs0warJRJdKf7U
         cWwGITF4D0xv6MDuX0lmIrpmfIN4wPWeBu6BP+CfDOLKSoVCbXCwdlMtPP7fue7y78fq
         7DZyNVrymnzqCJkG/Z9vbFMOeiSiq9cFImsye5htT7O5HLBI0bLsnpvWyu3otxejUHPZ
         h1aUcEqwaBGQp7DPKZnl9cn5hplfbFgfqRPO3IOiRNPupPpLT9GZ3g8Zwx40CmVN/pDP
         Mr1thZullqGBuE4eoiHClJWkeNRsCn4p7HXqf9phL5gnFeYDAOIlMc1AKjAxBLYdo0xf
         F9Dg==
X-Gm-Message-State: AOAM5310OiVB4MLuBeFeE8LO1uWBdTlflhlMqQhQT6CD1wZRRW4cLY04
	S0CD6HVDWnSO/nmy1AXuPIU=
X-Google-Smtp-Source: ABdhPJzaWI12BcW5S1Ml2cGKAoFgQolrORnAG2Y/a8E9/w9Ym1LLeOkZZ6s3OV7IGzML+cpRxbXCjw==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr30154463wmb.51.1638107617694;
        Sun, 28 Nov 2021 05:53:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id l26sm13598510wms.15.2021.11.28.05.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 05:53:37 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: remove rf_type from bb_reg_dump()
Date: Sun, 28 Nov 2021 14:53:23 +0100
Message-Id: <20211128135326.9838-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128135326.9838-1-straube.linux@gmail.com>
References: <20211128135326.9838-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rf_type is always RF_1T1R. Remove it from bb_reg_dump() and remove
resulting dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 27 +++++++-------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 52d42e576443..0d8b0b9a9851 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3611,27 +3611,18 @@ static void bb_reg_dump(struct adapter *padapter)
 
 static void rf_reg_dump(struct adapter *padapter)
 {
-	int i, j = 1, path;
+	int i, j = 1, path = 0;
 	u32 value;
-	u8 rf_type, path_nums = 0;
-	GetHwReg8188EU(padapter, HW_VAR_RF_TYPE, (u8 *)(&rf_type));
 
 	pr_info("\n ======= RF REG =======\n");
-	if ((RF_1T2R == rf_type) || (RF_1T1R == rf_type))
-		path_nums = 1;
-	else
-		path_nums = 2;
-
-	for (path = 0; path < path_nums; path++) {
-		pr_info("\nRF_Path(%x)\n", path);
-		for (i = 0; i < 0x100; i++) {
-			value = rtl8188e_PHY_QueryRFReg(padapter, path, i, 0xffffffff);
-			if (j % 4 == 1)
-				pr_info("0x%02x ", i);
-			pr_info(" 0x%08x ", value);
-			if ((j++) % 4 == 0)
-				pr_info("\n");
-		}
+	pr_info("\nRF_Path(%x)\n", path);
+	for (i = 0; i < 0x100; i++) {
+		value = rtl8188e_PHY_QueryRFReg(padapter, path, i, 0xffffffff);
+		if (j % 4 == 1)
+			pr_info("0x%02x ", i);
+		pr_info(" 0x%08x ", value);
+		if ((j++) % 4 == 0)
+			pr_info("\n");
 	}
 }
 
-- 
2.34.0

