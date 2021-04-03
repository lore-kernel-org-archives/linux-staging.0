Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5576D00
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:56 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so3325176wmi.3
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kcJCSOmYpxcf+ptWmUJmH8IOVjOvLmxAelD1jsprrwA=;
        b=NsCOfCdAPOYFI5rF/k94JrQH0iP0jY1f6Ki2X4GRhUGsLV3uaOPbVn7LTlnElfHZrJ
         S6zRwf9CqtwSFhrDq5+EPKqOXeEeHJRj7GhRLB4ra9kfhkspjO6+UlVERb93nll1gbMD
         T+zTC1Gx5Y1QucMIf2fD3SMQV3lcHKdMtmtFAdDOc+fAIYv5RDu6J018BH/cowNFNAa8
         X5t93LpB4C5m2gTOSxy4N8+qV/fc2MJ+MIwaTLrxEHxCUS2ysNl+j9+BeZjdnIyfuTZ0
         +k6rU4Jj+6y4FTeTVJ7I14ZWbyQ/9zG7Fcg3nP+ZAgyV6n+qCvYu+FrddCNpiKQ0bkAc
         gadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kcJCSOmYpxcf+ptWmUJmH8IOVjOvLmxAelD1jsprrwA=;
        b=Nt3Y3aMLwdKEFNFL8Fvmy7fv0+Gf+UyiDO82N4vqVKipw209SorxhxOl/eF6Babg9k
         dQOe+2maALeYh7TAaRTMvQ5J3Xgi6hdbOQHo7BGJTQw1gqXLJ8cVIpLw/i7w24M619fX
         GoJCHFxz0lNeq3stzI4r+0pyrcisxRa209ARIKLzu6iTJyY9BRsn35xDTsPiaNhSesQl
         UNSPAU1+qHcdmvCnTVFKNH3IJPohK8NWnIK65vWBqTXULm09TTn7uslVJRhRrimmtrGZ
         Upepox4xNeRUceuXDDzy4rtekxDeClksc9JpHSOYyY3tHyn1h9Etb8/FGE85mBNdBZ8g
         EN4Q==
X-Gm-Message-State: AOAM5312GbB+pyJylzREtJcgpe5fE4xkHNqRXE51qVOpkaEqX+1vxfoG
	N32lZZXrG9+25MrwnM4NsgI=
X-Google-Smtp-Source: ABdhPJz/xw/ALhTRPzqp6L9s98fGL64FV1ArHlbskYN26JCZ+0KU7x4PXKxyO+gI5s4L8MYDMefbZQ==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr16515980wmi.79.1617441295022;
        Sat, 03 Apr 2021 02:14:55 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id a6sm17602863wmm.0.2021.04.03.02.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:54 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 26/30] staging: rtl8723bs: place constant on the right side of the test in core/rtw_ioctl_set.c
Date: Sat,  3 Apr 2021 11:13:48 +0200
Message-Id: <935085037d70767c828fa4cd15f03938401d889d.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix posst-commit hook checkpatch issues:

WARNING: Comparisons should place the constant on the right
side of the test
40: FILE: drivers/staging/rtl8723bs/core/rtw_ioctl_set.c:71:
+			if (_SUCCESS != ret)

WARNING: Comparisons should place the constant on the right
side of the test
69: FILE: drivers/staging/rtl8723bs/core/rtw_ioctl_set.c:122:
+					if (_SUCCESS != ret)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index d4920d7d2452..f8c7dcb7ab7d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -68,7 +68,7 @@ u8 rtw_do_join(struct adapter *padapter)
 		) {
 			/*  submit site_survey_cmd */
 			ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
-			if (_SUCCESS != ret)
+			if (ret != _SUCCESS)
 				pmlmepriv->to_join = false;
 
 		} else {
@@ -119,7 +119,7 @@ u8 rtw_do_join(struct adapter *padapter)
 				) {
 					/* DBG_871X("rtw_do_join() when   no desired bss in scanning queue\n"); */
 					ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
-					if (_SUCCESS != ret)
+					if (ret != _SUCCESS)
 						pmlmepriv->to_join = false;
 
 				} else {
-- 
2.20.1

