Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3BB6136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 21:38:38 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id x6-20020a4a4106000000b003193022319cso3520119ooa.4
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 13:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wAluUivNSRI0mrtPJNKUEXcouPOkO+X3IXT465oBrOw=;
        b=ACoMsJ2Mn/SOG3Ze7RxKSgj5WSgeDliONFFe/Zacv8MMyTD+5zX1YRwy8BT2NSTWOv
         vWrDxXwWKD16SLaDbAvoKwM+He8s8J930uuTlPJ5LIdaXe7Ne7x8jW4nv7tohThlKf4g
         ylsLgmIqgkoJ1LbJ6Gj1NS91PpCGn9pewcS1Rs1qkQf24pLPpcpq137W0ae3sBDu2FX0
         Vo4nbzalqW8o0gE2L94prKFRD61N2KwfgYKo2iiKPq7gky7ITNT3sHKESacetDMcSGgU
         vgLwyhSnDu3DLR0IHrBUehjE3hvpo2hRDZ4ZsiWi9H/ss86zr5FNvnaqQ9nXQkjF0cgw
         8Wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wAluUivNSRI0mrtPJNKUEXcouPOkO+X3IXT465oBrOw=;
        b=aHvLoQf8BFyDbBhIHFA97ntf04w1/qpicpmb1p9+0x3ohehP7ZLSvi2x0aBxOaASpM
         zIXg+ezBX5pn+OHUGeTB8suKVgK925ZRpK86GVP3+UR51eQGsEIeebvhaCaBOkVwVKjw
         K/9SI3kOsrqERwSp9g2MRTtC01A2AliD1Lf41Bm6W43q3z6hVSq8LCmKoMdtq7/ibgWR
         i50j2xBZvAFy6or+XZPu9RQFVaF2hF1ZiiVi7MoUl49ChgyKvNpjqGimekI9fuaAR7ZN
         DYBBo48D9Jm7Ld2rcwMPQiL1qv05bq8d/zM53X5XxHA6ECfQ6joYLEv0bykkK8WcFb7r
         Gr+w==
X-Gm-Message-State: AOAM5332Wg5uwWSaWwEMiBILIHsDkBYeaAwyI1InmqIS71gRDcxJuZls
	W2TLJyN5hBlJV2p80m/TC+E3Ue4pcPg=
X-Google-Smtp-Source: ABdhPJyXeYXONnVXkUqChLuC1mmm3Ye7mTwg0kIZZfs3SJeTlobZacBugYfKSzTmJSUI2rOxPJD0og==
X-Received: by 2002:a05:6870:54ce:b0:d6:efb6:5fe1 with SMTP id g14-20020a05687054ce00b000d6efb65fe1mr1577880oan.25.1646257117221;
        Wed, 02 Mar 2022 13:38:37 -0800 (PST)
Received: from localhost.localdomain ([181.23.87.56])
        by smtp.gmail.com with ESMTPSA id s12-20020a0568302a8c00b005b010d92dadsm69132otu.69.2022.03.02.13.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 13:38:36 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	ojaswin98@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 2/2] staging: vchiq_arm: add prototype of function vchiq_platform_init()
Date: Wed,  2 Mar 2022 18:36:38 -0300
Message-Id: <b74ac90e869f71a98a04b834c4f3b5ab37bb38ea.1646255044.git.gascoar@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646255044.git.gascoar@gmail.com>
References: <cover.1646255044.git.gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix "no previous prototype" W=1 warning by adding the prototype of the
function vchiq_platform_init().

Note: vchiq_platform_init() is only called once in vchiq_probe(), so
presumably should be static function. However, making the function
static breaks the build.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 2aa46b119a46..d72edaf7e5e9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -122,6 +122,8 @@ vchiq_instance_get_trace(struct vchiq_instance *instance);
 extern void
 vchiq_instance_set_trace(struct vchiq_instance *instance, int trace);
 
+int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state);
+
 #if IS_ENABLED(CONFIG_VCHIQ_CDEV)
 
 extern void
-- 
2.35.1

