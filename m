Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303ACA29
	for <linux-staging@lists.linux.dev>; Mon, 18 Apr 2022 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650300258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hfOUYN9UIIiOEE4PlLjMhtSzjMtNPDZSzWUFehT4Zg4=;
	b=BC2CiDjvXNqkAx2ump9SQHJX/jiK/F92CDV4UM6zab1dIE3jyZHmSVtHCWMj5pGQ0hcNMp
	lkE5HgtItn4wn+muV+ZuYlGgSBSkL3cAgkv9QrMtybHgh5ld/RIzQaiBGaobxgnBPrBqsN
	NjRrPiJ2hMTyTiUkciRmnETsDvfu5R8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-bQwVjimqPKiYoG4CtIN1jg-1; Mon, 18 Apr 2022 12:44:16 -0400
X-MC-Unique: bQwVjimqPKiYoG4CtIN1jg-1
Received: by mail-qk1-f200.google.com with SMTP id bj2-20020a05620a190200b005084968bb24so10705580qkb.23
        for <linux-staging@lists.linux.dev>; Mon, 18 Apr 2022 09:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfOUYN9UIIiOEE4PlLjMhtSzjMtNPDZSzWUFehT4Zg4=;
        b=pIlPSAbmA4GnFf2/KB9/kVD41+Sr3DsEVlqCPR0UIiRK5y7qyD1exBVYx/QuYZrFsL
         3eaET3SUvy2aM2tkoWN4XKubwr4NH++P0uZngXC+tGXZkme4kOluyUqd7rkzSf56mXkI
         AlPBJIHamNVHx+SqLVV+jv/22YjxMlQk7THGMf/4c+B+3vGZuiTFQCuGM8rU0Q7lpAl1
         HUob/BRrbERXorNFz+WE7LhMPiy8YG+3dO2pcsSpecvzUNqpPvgZcXQJbyrrWhhIzliY
         0wjmjaqJA1VYLVV9FGihqBauXPjJP5engWOMHhYqa7O5LuB9sqyxspe8igX3fz/FIdTO
         3mPQ==
X-Gm-Message-State: AOAM530uRmlc7ukvbTGrt6LsdftGyywChee1yc3t2H8rIEl1GQre0sw+
	+EHD4I3db4ZzlfTL6/cXDkXRs2t0y4HIPMHoRKKF2+VTxakIWoPfaQuB09AvCkrZiw9WbeQ55Tp
	M1McFaMVR4kSpg6CtSzR5l5SsTg==
X-Received: by 2002:a05:620a:4154:b0:69c:6976:1ee4 with SMTP id k20-20020a05620a415400b0069c69761ee4mr7210404qko.463.1650300256496;
        Mon, 18 Apr 2022 09:44:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYPpaPozKKnyQ/NIX2bofZripMjbu2H4MFzW0nKSXBeZharHnP4QWvyOGM0K+33nrpfMsqGQ==
X-Received: by 2002:a05:620a:4154:b0:69c:6976:1ee4 with SMTP id k20-20020a05620a415400b0069c69761ee4mr7210387qko.463.1650300256303;
        Mon, 18 Apr 2022 09:44:16 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id m139-20020a37a391000000b0069e88edfdacsm2895896qke.105.2022.04.18.09.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:44:15 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: nsaenz@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com,
	gascoar@gmail.com,
	ojaswin98@gmail.com
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] staging: vchiq_arm: change vchiq_platform_init from global to static
Date: Mon, 18 Apr 2022 12:43:56 -0400
Message-Id: <20220418164356.3532969-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Smatch reports this issue
vchiq_arm.c:466:5: warning: symbol 'vchiq_platform_init'
  was not declared. Should it be static?

vchiq_platform_init is only used in vchiq_arm.c.  Single
file variables should not be global so change
vchiq_platform_init's storage-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 0596ac61e286..7de98655e8ec 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -463,7 +463,7 @@ free_pagelist(struct vchiq_pagelist_info *pagelistinfo,
 	cleanup_pagelistinfo(pagelistinfo);
 }
 
-int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
+static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 {
 	struct device *dev = &pdev->dev;
 	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
-- 
2.27.0

