Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88CCA52
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 05:48:36 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id s3so1653552edr.9
        for <linux-staging@lists.linux.dev>; Sun, 15 May 2022 22:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z35PekQ/2obmmP7m7D/fzPEe8sTueCxczGR+BZRhlAI=;
        b=M4P11R9PJwApTYAm8LsM2xM4jNSNLLzKTJjeUWS0QlNd0RkPanh0VzzdIFIYoZ+xCM
         s8wesEf9PTAFw04UsFo1RUMNdcGcxy3HcMNTAX93Gnyy+mqsT19v7Ycjp7DH12+n6kwF
         2W2UC3P27/0Z4Fsdx9nUvp220CgfQmLtCGryHWwKfdfxLP7ZChsHs0+3khn5DV+K2K3Q
         QuRIiAL276RH6Pvm2UU00IxVYljHemP0x+4qgPS/X7JQpf8FFd77clKOV8RI4P9g+Cd5
         XkMflytUzc73AqyAV7jr1+a7cBoxNtonGpvy4x/m3mCMr2g+5EgZa7Cq6lWLmYxzQpcK
         qGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z35PekQ/2obmmP7m7D/fzPEe8sTueCxczGR+BZRhlAI=;
        b=DwLkH/LLPg/jAEMGugbMGGrpJuY4tJeQEFl/klGJxwRKukjlJTAgAzyc5P/6CYZ2Wh
         fUXfTgGW5PwCNIRWVl7RhsZpy7oFG6HJ3bm0eHzmDPD/uR+xArnFS/uNpz9IEIB6+5LU
         qVtDm8FLCnTptCrWiKyN7Y1EpcaiRuVzT7X2BauKJ6hg9nW93BhWPjpZHW1AD5BxrO/A
         v7IAsyVnlzjwxXnLz11oc6oGDlpIKjU/aoQ/TiJzMNFEYmfLehu49o/2tmymscMd4hmL
         9Hb93xqDU1bcjH7mwD/l0SOeAMX1OOCGWMg4tSEGNxAUyPelyuix3UL/xayq+eOsjvwW
         QBJg==
X-Gm-Message-State: AOAM530zBG2GkDOGVgW0Z6XZBR4oysU7zYgKzDbK8y7zgD2uYHMK0cpX
	/nEjfEM1kwArErJaxLlCmI8=
X-Google-Smtp-Source: ABdhPJwVqd1ZeHGsghwoGNZPevd88H+ELuP25CPf+/RB5GwvGCtb4HyBoE3EOdQlZtNxuXChWVPuFQ==
X-Received: by 2002:a05:6402:849:b0:427:edfe:1b7e with SMTP id b9-20020a056402084900b00427edfe1b7emr11360145edz.355.1652680115148;
        Sun, 15 May 2022 22:48:35 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb79.dynamic.kabel-deutschland.de. [95.90.187.121])
        by smtp.gmail.com with ESMTPSA id u19-20020aa7d0d3000000b0042ab87ea713sm343714edo.22.2022.05.15.22.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 22:48:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove HW_VAR_AC_PARAM_BE from SetHwReg8188EU()
Date: Mon, 16 May 2022 07:48:30 +0200
Message-Id: <20220516054830.8702-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the HW_VAR_AC_PARAM_BE case from SetHwReg8188EU() and move the
functionality to the place where SetHwReg8188EU() is called. This is
part of the ongoing effort to get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 4 +++-
 drivers/staging/r8188eu/hal/usb_halinit.c    | 4 ----
 drivers/staging/r8188eu/include/hal_intf.h   | 1 -
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 27035eac6e61..6c75363c76d4 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -539,6 +539,7 @@ void WMMOnAssocRsp(struct adapter *padapter)
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 	struct xmit_priv		*pxmitpriv = &padapter->xmitpriv;
 	struct registry_priv	*pregpriv = &padapter->registrypriv;
+	struct hal_data_8188e *haldata = &padapter->haldata;
 
 	if (pmlmeinfo->WMM_enable == 0) {
 		padapter->mlmepriv.acm_mask = 0;
@@ -567,7 +568,8 @@ void WMMOnAssocRsp(struct adapter *padapter)
 
 		switch (ACI) {
 		case 0x0:
-			SetHwReg8188EU(padapter, HW_VAR_AC_PARAM_BE, (u8 *)(&acParm));
+			haldata->AcParam_BE = acParm;
+			rtw_write32(padapter, REG_EDCA_BE_PARAM, acParm);
 			acm_mask |= (ACM ? BIT(1) : 0);
 			edca[XMIT_BE_QUEUE] = acParm;
 			break;
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index b62ebd011886..a217272a07f8 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1075,10 +1075,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 	case HW_VAR_DM_FUNC_CLR:
 		podmpriv->SupportAbility = 0;
 		break;
-	case HW_VAR_AC_PARAM_BE:
-		haldata->AcParam_BE = ((u32 *)(val))[0];
-		rtw_write32(Adapter, REG_EDCA_BE_PARAM, ((u32 *)(val))[0]);
-		break;
 	case HW_VAR_AMPDU_FACTOR:
 		{
 			u8 RegToSet_Normal[4] = {0x41, 0xa8, 0x72, 0xb9};
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 26dd395c239f..a56f3d6ca399 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -18,7 +18,6 @@ enum hw_variables {
 	HW_VAR_DM_FUNC_OP,
 	HW_VAR_DM_FUNC_RESET,
 	HW_VAR_DM_FUNC_CLR,
-	HW_VAR_AC_PARAM_BE,
 	HW_VAR_AMPDU_FACTOR,
 	HW_VAR_H2C_MEDIA_STATUS_RPT,
 };
-- 
2.36.1

