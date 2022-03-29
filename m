Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C78C2598
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 20:21:52 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id b15so22020772edn.4
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 13:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pXzC7B+G1Vq7z1Rm7bBrok4K1ZSPCYyPSAJ9Zp074Sw=;
        b=q3vf2bCmZ1ZNNDsHVj7VTUOZLT75ckZ+jzRTjxI79ZK+r+8N7HyjTOv8g1xVew7qrp
         yv3aQOyyx4HhhSbJsA4UnbTAVgeeQxw8zQMKDSy3h4ZNu2XJhoPnpfuh/fbxd43IUFGT
         Y/3Rbf6KrXPtt18ROsuEXWlwIqbeiQWg8hxICPLyKUS0Cfk5YC8Y8rWk52nTgOqnw5HR
         smIsJNAVpgssK5M1Q0nQeM9U/f5+ZoiQBSesQW767NVM11xiMbxKv5s7KBG2WzQvZKb3
         tJGl2/f7dI/hLUEgK4mnvAdwJkUk089iZpPFeskba3V0FxPDNxOhSOOZoW1Qe8kF5NSL
         DswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pXzC7B+G1Vq7z1Rm7bBrok4K1ZSPCYyPSAJ9Zp074Sw=;
        b=mc5yLCJSzHxByXK/fS5WgC0ClnnBylJu7LJLyC60qWD4solonSssp38DwCcUmzEv2I
         w5yjVVimLOf6VwgfMHtgu1B9iU/DAZEVP1vI+bNjoi+LmE54RXeq9CezDyRXHVy1yvKZ
         cX4s7IIe6mCj1HGuizBzqSF1o9wsZZplKTr5b3tVFA/Ld2XmBGQ8UoBExHYkpdZlqkXC
         lcwoixp4/5BZjm/RqGMkQ0zXXLvFOeEVz17sKcqbfpVe8PmfoBEbKPGWgCN/tZ2Ozaya
         DOpt3JgBxn70rOd3/vD/8zYl7e/ifpjtteuaSuVMJZZgseqEJMoJgHsg5t1cm7rpgK4U
         5rtg==
X-Gm-Message-State: AOAM531JhpXM4fca3vnWFVoeqWNW410/Sl30D/4wy1zrJoftgS7FXxJp
	Ga8wP3lTAs1Pd/t2VdUumyU=
X-Google-Smtp-Source: ABdhPJwjjdL5AxQOccoKR3owW99Y8879dAR8FYcnUW7XGN1zAHBGFL2zRoplCkFqRzGWCsFRR+nvxw==
X-Received: by 2002:a05:6402:3689:b0:419:d380:ddbc with SMTP id ej9-20020a056402368900b00419d380ddbcmr6819875edb.230.1648585311330;
        Tue, 29 Mar 2022 13:21:51 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id ss12-20020a170907038c00b006e0ec9e806dsm3938111ejb.136.2022.03.29.13.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 13:21:50 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 3/8] staging: r8188eu: rename some macros to upper case
Date: Tue, 29 Mar 2022 22:21:36 +0200
Message-Id: <20220329202141.7028-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329202141.7028-1-straube.linux@gmail.com>
References: <20220329202141.7028-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename some macros to upper case to avoid camel case and improve
readability. While at it, remove some unused macros.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: no changes

 drivers/staging/r8188eu/hal/usb_halinit.c       | 12 ++++++------
 drivers/staging/r8188eu/include/rtl8188e_spec.h | 10 +++-------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 8e4b84f51a3c..8dc90f9636b5 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1148,19 +1148,19 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 				AcmCtrl = AcmCtrl | 0x1;
 
 			if (acm_ctrl & BIT(3))
-				AcmCtrl |= AcmHw_VoqEn;
+				AcmCtrl |= ACMHW_VOQEN;
 			else
-				AcmCtrl &= (~AcmHw_VoqEn);
+				AcmCtrl &= (~ACMHW_VOQEN);
 
 			if (acm_ctrl & BIT(2))
-				AcmCtrl |= AcmHw_ViqEn;
+				AcmCtrl |= ACMHW_VIQEN;
 			else
-				AcmCtrl &= (~AcmHw_ViqEn);
+				AcmCtrl &= (~ACMHW_VIQEN);
 
 			if (acm_ctrl & BIT(1))
-				AcmCtrl |= AcmHw_BeqEn;
+				AcmCtrl |= ACMHW_BEQEN;
 			else
-				AcmCtrl &= (~AcmHw_BeqEn);
+				AcmCtrl &= (~ACMHW_BEQEN);
 
 			rtw_write8(Adapter, REG_ACMHWCTRL, AcmCtrl);
 		}
diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index edae053e350e..ef42c4b2f20c 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -998,13 +998,9 @@ Current IOREG MAP
 #define STOP_BCNQ		BIT(6)
 
 /* 2 ACMHWCTRL */
-#define	AcmHw_HwEn		BIT(0)
-#define	AcmHw_BeqEn		BIT(1)
-#define	AcmHw_ViqEn		BIT(2)
-#define	AcmHw_VoqEn		BIT(3)
-#define	AcmHw_BeqStatus		BIT(4)
-#define	AcmHw_ViqStatus		BIT(5)
-#define	AcmHw_VoqStatus		BIT(6)
+#define ACMHW_BEQEN		BIT(1)
+#define ACMHW_VIQEN		BIT(2)
+#define ACMHW_VOQEN		BIT(3)
 
 /* 	0x0600h ~ 0x07FFh	WMAC Configuration */
 /* 2APSD_CTRL */
-- 
2.35.1

