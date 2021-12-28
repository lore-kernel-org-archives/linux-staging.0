Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2A52CA4
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 10:11:47 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id r17so37406732wrc.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 02:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=syi4xzz6q/zd3yOkEKI1/sCYTEmmG2y2NufKeEEtv6A=;
        b=XcrJ/gN1FeqnF/1WCEj8RpzU58LK5SdY+3TMl3pN69VXieZJqNwvXAxunM5tvphHPq
         xLvFuvdZVIIokviXLObUepAeDZu71yJGDTkYc3AwWVgD4ZbD4jgo0nOASjmQbiuN4do+
         VGpM3iua23xiK4lwnlBEl4jY4pwA2SaihRkWiL09FHH1PzChfXZ2n3e2XAQKG42EYJ3d
         OkFzI32mRITF4CLzlIk61n5NQtJqifui5zEeSJBH2z1l7SQXB/2+1PY0vSle82Z5WkEx
         ko0HPPdfX443cl1AX2AoSo5w3lBzqALGRA3Q8PmFKoG4fw+qWMqGBiZHjnoO5iuCANhw
         t44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=syi4xzz6q/zd3yOkEKI1/sCYTEmmG2y2NufKeEEtv6A=;
        b=M9MOtf8spOnWm7PWbslTw7FKCNPOjjA8yxjsfsRI37LOcLKhGxzKozFwfhE4xDTS9m
         IjRHMu0EtZPC6u3ipABvfKSO8S1BkFuYEykbcGeCRFWVPni7PEbLe+8mwyw/ioDKtdpL
         pMA00Yz8omNwJoStw90I0blohEdN1IKOaCpeSAe7CswypHoIttvXA9XXDyXryObpLyyf
         vO/evRAAojUv4vkcHv6CqD3Yz9OmwX80gVNPKV4x8RK5+eySfkCQsSkUQaoeQTAXd//O
         kn+7LvrNUHqfSIAjQ+YNATWK5DCLgiYp2ihcVV+DdyXbYNNEptSSLNCzU7ggiCoGE10i
         clZQ==
X-Gm-Message-State: AOAM5315nYAVybFtpZlsgwGNFmyKt0qEis21pipdLufy5hOMajyDKI8x
	GQa2CtdI2P949+5pGksLtQU=
X-Google-Smtp-Source: ABdhPJzt8Kac8Iry1ow3xpBJEQwN2DRCUeHzY5IeIjE4QawqTRQt8vRMQEsgo7Kqb2d9tHyuIGM4HQ==
X-Received: by 2002:a5d:584f:: with SMTP id i15mr16388073wrf.542.1640686305982;
        Tue, 28 Dec 2021 02:11:45 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id d62sm21160984wmd.3.2021.12.28.02.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 02:11:45 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/10] staging: r8188eu: remove ODM_CMNINFO_ABILITY from ODM_CmnInfoInit()
Date: Tue, 28 Dec 2021 11:11:14 +0100
Message-Id: <20211228101120.9120-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228101120.9120-1-straube.linux@gmail.com>
References: <20211228101120.9120-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ODM_CmnInfoInit() is never called with ODM_CMNINFO_ABILITY.
Remove that unused case from ODM_CmnInfoInit().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index a820bdc26fbc..afd208c3ba05 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -195,9 +195,6 @@ void ODM_CmnInfoInit(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	/*  This section is used for init value */
 	switch	(CmnInfo) {
 	/*  Fixed ODM value. */
-	case	ODM_CMNINFO_ABILITY:
-		pDM_Odm->SupportAbility = (u32)Value;
-		break;
 	case	ODM_CMNINFO_MP_TEST_CHIP:
 		pDM_Odm->bIsMPChip = (u8)Value;
 		break;
-- 
2.34.1

