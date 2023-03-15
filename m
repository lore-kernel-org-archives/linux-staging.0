Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81723538D;
	Wed, 15 Mar 2023 13:43:46 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id eg48so16508487edb.13;
        Wed, 15 Mar 2023 06:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678887824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xoJ32fY2U6onu2XeTo5DX618tP1s6+s3YRLKr7wGres=;
        b=J8dt7NZabR68uwiqryISbGu/PmcQUqJcNVHirreVXGHQUT9Ii8iVdq9OKF9FbJjwBl
         RRyeo4gsBUnR9xhbGineny22Zr9mnGQrpgS4Lj9KLYuA2J0jy506Jo2i/LEnOQxEvhKG
         yPoh9OTapSyKgkm/dWNRO01CFAJZ0Q23PSTiPeO2ruqzEDvwrPGua3VhOOZJF3W2JVaV
         Z/QZwlbFltztyL2t0yoNVn59euJ/JFQDBw3ZWwuOaByG9z7A1kRDEUjSw14Z6286drFE
         trbfgagLphAAb0dAmj6qj7MTMytVtGyltigOJHk6jIhb8oZMJyPU566wDVKrNHt8xl2I
         KsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678887824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoJ32fY2U6onu2XeTo5DX618tP1s6+s3YRLKr7wGres=;
        b=3mCXuG3G4IuLIFCQlNtu0JRqljqftyOQHoiPO4EoW+Jpi+Xbz8tGDuNO20f7CLi9wi
         ZFMVRtnRwCE7t/MwkU3Ih8g3fPyl4ypKqwjyRKs85xJEhwABr2y/SX5W38FsR/pREzcx
         ZBa2pz0XSMQppq+JkccEUhaqAXnjGM0I+QgsZUQ3WGIROGuQ1rl3MTha1kSSdW7+DJld
         S88yF2/qUYCmnotxQkTvZqn8RuDCl962OKCHf6EvbBRXJt3ZDOg3/sBKX8JQWWkHI8ys
         AhQIIlqZo4lvYDxq+Ll+0GfoD5xnb0bRL3hw1iDywzWsJ/pHGmBMqdB8Gis5MUILakXl
         /1bg==
X-Gm-Message-State: AO0yUKVt8Y2DB/DtojsxI0JON8AWDJJb/Lrb93GWdSdZLTv6zlPRlIa3
	n2G4WC4wCh7AUx/DlKmVhzU=
X-Google-Smtp-Source: AK7set9/6OO+1HqP1LXwHDjU1sOWrZZQXj88e8j9SHocwupKAN7znEQ7DkAzhaTwJwsXpTwyVCnCdQ==
X-Received: by 2002:a17:907:6e23:b0:92e:eecf:b742 with SMTP id sd35-20020a1709076e2300b0092eeecfb742mr2982706ejc.2.1678887824610;
        Wed, 15 Mar 2023 06:43:44 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id a12-20020a1709066d4c00b00914001c91fcsm2546201ejt.86.2023.03.15.06.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 06:43:44 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	zoo868e@gmail.com,
	jerrykang026@gmail.com,
	cuigaosheng1@huawei.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH v2 1/2] staging: vme_user: add space around operators
Date: Wed, 15 Mar 2023 15:43:28 +0200
Message-Id: <4bdfd864b573c164df30ec738afc93b06ce0d573.1678887330.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add a space before and after the operator, for readability.

Reported By checkpatch script:

" CHECK: spaces preferred around that '+', '<<' and '>>' ".

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
----
changes in v2:
        edit commit message
---
 drivers/staging/vme_user/vme_tsi148.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 482049cfc664..bfa604043355 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -737,7 +737,7 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
 		return 0;
 
 	if (!image->bus_resource.name) {
-		image->bus_resource.name = kmalloc(VMENAMSIZ+3, GFP_ATOMIC);
+		image->bus_resource.name = kmalloc(VMENAMSIZ + 3, GFP_ATOMIC);
 		if (!image->bus_resource.name) {
 			retval = -ENOMEM;
 			goto err_name;
@@ -983,7 +983,7 @@ static int tsi148_master_set(struct vme_master_resource *image, int enabled,
 		goto err_aspace;
 	}
 
-	temp_ctl &= ~(3<<4);
+	temp_ctl &= ~(3 << 4);
 	if (cycle & VME_SUPER)
 		temp_ctl |= TSI148_LCSR_OTAT_SUP;
 	if (cycle & VME_PROG)
@@ -2187,14 +2187,14 @@ static int tsi148_crcsr_init(struct vme_bridge *tsi148_bridge,
 
 	/* Ensure that the CR/CSR is configured at the correct offset */
 	cbar = ioread32be(bridge->base + TSI148_CBAR);
-	cbar = (cbar & TSI148_CRCSR_CBAR_M)>>3;
+	cbar = (cbar & TSI148_CRCSR_CBAR_M) >> 3;
 
 	vstat = tsi148_slot_get(tsi148_bridge);
 
 	if (cbar != vstat) {
 		cbar = vstat;
 		dev_info(tsi148_bridge->parent, "Setting CR/CSR offset\n");
-		iowrite32be(cbar<<3, bridge->base + TSI148_CBAR);
+		iowrite32be(cbar << 3, bridge->base + TSI148_CBAR);
 	}
 	dev_info(tsi148_bridge->parent, "CR/CSR Offset: %d\n", cbar);
 
-- 
2.34.1

