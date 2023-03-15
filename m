Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6C1538D;
	Wed, 15 Mar 2023 13:57:23 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id w9so5124503edc.3;
        Wed, 15 Mar 2023 06:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678888641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJDmE8nLtNAwqzKNS3st8xzMZ28J8twt+9hFH7I9HWg=;
        b=qHaYVdwuHPj8qpV9Xal5hHjRjnbdzUQlXAra9/kKJ+L/8O9NWj5DAU7ZHrE/hI1tGv
         BAa+bqgVRr3987ebUhUYHFxwI6emihyFM/RhLaJCrkHaULqlRwnIC/x+UOmBGAP4mjwc
         vzYCcU06QAbB2l5NHzKMM8+8+5mG4KCLUTxQvAvBPZHtmRFbDqYmXY1fG4msgfqK/YA6
         BUiHBCOiGbu9UYhFxcvgjjsSuSS/JuW2cDWqMRhVya//uh00YwDBF9NYfqTRdCKreeBU
         jaNcUEx2YfEHptqDvgCFrw6aic4XgERCa+uvuJ3kOUyAh9w3H6UvNSxlyDn9ySsbz9bN
         dXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJDmE8nLtNAwqzKNS3st8xzMZ28J8twt+9hFH7I9HWg=;
        b=BCr2epbFZeFWYsPiLqe4Ns32UiTaKGd+KgotRLGlJaqNYwivPqFD1g2gJZipO4RjqI
         g+NiK8RzLdDPTcmdUebB81W0rsrV9qPARZUEdeWbwMMNg1TIgCl3xVfhJ9/2g8sypkGd
         mH8UBXGWNQlaM8rLVNNKndA10cBCHcWoVvQAOlldETgOKRF7EZ7ZoxmAU0i6ritdR11c
         4B8dkhMfb7+NEUvWa+peKQdjA5zK9y+5K55SV1TuIlA6FFL5qMWi6HhCmBdvgwaTStFL
         PMBewYabZAJHc3hODFjAs9xJMlIL5yHYNJBjlxnqYIR3rP06LXuYJkK/nr8iyXTXj0IT
         do0w==
X-Gm-Message-State: AO0yUKVam9lBr73u3DZicGPVm9dFAG7QfMze80WOV3PI2zBad8mzD2s6
	Nhb7tHc7MIXTI2HvuVbMU/w=
X-Google-Smtp-Source: AK7set/pGW6K2Z8PjEPnatxCW7d6XUOxH4b4CCCzt6vSXSnp6bNCmW0nCHC4KdpOLQHk+462ckcFcg==
X-Received: by 2002:a17:906:f8cb:b0:885:d02f:d4ad with SMTP id lh11-20020a170906f8cb00b00885d02fd4admr5863877ejb.43.1678888641386;
        Wed, 15 Mar 2023 06:57:21 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id jz14-20020a17090775ee00b00926f89e2213sm2529441ejc.190.2023.03.15.06.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 06:57:20 -0700 (PDT)
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
Subject: [PATCH v3 1/2] staging: vme_user: add space around operators
Date: Wed, 15 Mar 2023 15:57:08 +0200
Message-Id: <078be1ba242950f31d0aa13fe9815d92fe96468b.1678888612.git.eng.mennamahmoud.mm@gmail.com>
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
---
change in v2:
        edit commit message
---
change in v3:
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

