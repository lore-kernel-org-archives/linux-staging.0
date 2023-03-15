Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC51E5669;
	Wed, 15 Mar 2023 17:00:17 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id ek18so47018122edb.6;
        Wed, 15 Mar 2023 10:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678899616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bThpFt7ecM4XEK4+UmZ8s/Q2y4cVJVw4hg9eF1s+C9s=;
        b=JBt2scHOn9ML2pxuv1XbAQehxjXtsRkovyFsCeOit6Kph11Ghs94PTl1nFLhb7YdsH
         9EEBpkWk77ZzsZ5c64ldnKBjzwWM+Px7XcEjqaPQISs2bn7cfLxX1ImsJOI5SpZYffrN
         /LDTw6xPF4zSTRZi5iebpz071dHuvdbNSc7p4Rh+bQ/1HL9KsCMnfws+OVMS2ZBSplTG
         s3pljQoGPPUL3ZJ6Hfepp6cFlLCTlbuVEEGdDggt2A/uO8vczSBWdyVZmQtzZCt49/Si
         VtvOBfG4d3YUi8AE/2y6K/ptOqMD1xZSZTlXjZDpXojwHK74JN7FUiDdv7bDEq/YO+yQ
         2zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678899616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bThpFt7ecM4XEK4+UmZ8s/Q2y4cVJVw4hg9eF1s+C9s=;
        b=ISYqGDwRbMDbPa5Cd64IrYAfCFEOSPBIvYA9yWb143SBn9h1AS8x/wIjMekFLSkOhR
         BrzG/MjRWZaQhqTfGe/vrj54s081Ipj/ZvEO2LLe6IUwjZb1w61qcJljiDVYF66g4AkM
         fIIcXlHN7RLIhbiG5sk8IK2KhTP7KQyy84tywP4HMyPLUTjxcrAWg4icwQN7zQyBnb7n
         ixadHdCw9mVmERCY8UMQ7OTQmp8NVE34v9n4/yIWFoPlpalNjYsLnTUC9Y+C5RdLS+1h
         Ck779Ok0KCCNSpd8OiEE55vpL+BSkctqjOv3v5SSMV6MgNfFfol7Z9xH5dJukItGb1Y0
         8zDg==
X-Gm-Message-State: AO0yUKWLtsDHUquJawDrDFJohJZh7rwm/nKPy1UwMXtzql0D+P/0mO47
	4nxHGoxU/UZZenzXcM7thJI=
X-Google-Smtp-Source: AK7set8KqxGChd+10+eNCk53L7LRkWLuMM95PrJIZ6Ng1lUa3Y/dw2cuDJZwFw8olvwi+hoVb2G9EQ==
X-Received: by 2002:a17:906:e248:b0:925:51e2:e91e with SMTP id gq8-20020a170906e24800b0092551e2e91emr7146796ejb.71.1678899615845;
        Wed, 15 Mar 2023 10:00:15 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id q22-20020a1709060f9600b008eabe71429bsm2771895ejj.63.2023.03.15.10.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 10:00:15 -0700 (PDT)
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
Subject: [PATCH v4 1/2] staging: vme_user: add space around operators
Date: Wed, 15 Mar 2023 19:00:06 +0200
Message-Id: <57006c151d4d95550b987143a6650f8b3594ddea.1678899549.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a space before and after the operator, for readability.

Reported by checkpatch script:

" CHECK: spaces preferred around that '+', '<<' and '>>' ".

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
change in v2:
        edit commit message

change in v3:
        edit commit message

change in v4:
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

