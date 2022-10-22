Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E142717E
	for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 04:35:57 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id y4so4084311plb.2
        for <linux-staging@lists.linux.dev>; Fri, 21 Oct 2022 21:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQYm5LqzX57uwWQZcQgQcLEzWEXhv56KAAGUn4/bM1s=;
        b=pQvvard2nxmZEuToHQCoxqKq7E+NyOPozW/OVGgcTjUXIuXUtthCc7761Sz21nK1Ck
         Q+8eGKtasc1vPLudAPwPMPJPFstelL3PbyCrl0dSQq+DvXA8k6SlKFDmHUn/5M+b/RGz
         W+CDlMrwQrXwHTjgmA5AfhFRGHL8ZLzIxI/QXty7DHZLWsYMOkGwH+UcfoN7vPB1wmo9
         6WlrXsoTcwNMG3I7REK8U4MpPMoGsafYEh/PUKmO2Qi36ARLc7tQ+Eb/BUQ1buaLGjs1
         FnX4Wplsz7wWStPIBsq/tcdrieUbUWspX769DNftAFHlJRNSrsSUjnHE9mdJl6RwN5YA
         OR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQYm5LqzX57uwWQZcQgQcLEzWEXhv56KAAGUn4/bM1s=;
        b=6pCTuSi+PAH0t9ZvqyP7203NmTzh/6DvfrjdVbYHP6AfZMWD+kogm2y9s2qX+1fy2H
         wJv/iQg87UDDkSd89Yj4EcApy9XbniqPVBajic5jrP1qoKafTnjlBqxTBvwhCPJicj9U
         jVKZDCdh+K9DMj7SWuc/vj7cnqMggWy/R8kwrv4OrhLBRfkCgMcrVeQ2i2guf549bWUM
         y9160UEzZms2xtWSJfMfze6C4cB2Snkk1LCxWO/OCBw46VtRr6bvqI6RJy0dHMEDUQ6J
         HWSEkuzTf0lsdjHfri+KJlVrITl3mR9s7lqhspph/JwDdSTePlbVe0Xn2K+NGK2665W5
         c5hA==
X-Gm-Message-State: ACrzQf1P6NS2niwRwmH4cnSPwVFJWeJ+CSgfTjv20KQaRZtBXMbUMjm3
	dbQDNSsDlKlsASmbgQwu5lk=
X-Google-Smtp-Source: AMsMyM57V05ZKji27dZkrlNCQ2qo4WzjK3QyXijF498quz/JdHwf2kSi+mgkZ9Dg64BlKvl6JfMA6g==
X-Received: by 2002:a17:903:40d2:b0:186:6f1d:608c with SMTP id t18-20020a17090340d200b001866f1d608cmr9815540pld.52.1666413357291;
        Fri, 21 Oct 2022 21:35:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:d90f:f801:7164:b4e6:b90b:c4d5])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b0017eb2d62bbesm402812ple.99.2022.10.21.21.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 21:35:56 -0700 (PDT)
From: "Scott J. Crouch" <scottjcrouch@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org,
	"Scott J. Crouch" <scottjcrouch@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vchiq: add 'static' to function definition
Date: Sat, 22 Oct 2022 15:35:48 +1100
Message-Id: <20221022043548.1671644-1-scottjcrouch@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes the following sparse error:

    warning: symbol 'vchiq_platform_init' was not declared. Should it be static?

Signed-off-by: Scott J. Crouch <scottjcrouch@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index dc33490ba7fb..ffa517077b80 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -462,7 +462,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 	cleanup_pagelistinfo(instance, pagelistinfo);
 }
 
-int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
+static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 {
 	struct device *dev = &pdev->dev;
 	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
-- 
2.37.3

