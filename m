Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A595F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:38 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id x21so1159865eds.4
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FRu29DMfgjgESM/r4ngIdYBCudXkF27Ad4jVLeKHA2o=;
        b=SagP9juGlx0d8N1URCqzoKr4uIwe1e1lb0D09qxZyMnQDc9VEto+da08oaiKoXZV7N
         l2/o1aI/uAkTDefgDez0S9WmqyDMjdeMTRhtwn3CZL92/fRlMNp2k+/WfPnVrgUG3PcB
         sGumwAThB3rDhOyp4fotCZYjxqTdiW+pgEoEaQToMy+fZFyVWHHMFarj8F3AvCjt43Kg
         lSxHBbDZUYJlehNQG4l8UdeWbI/g42UHrSt0cP3l40JKZK3LIi8JG7AhDd/CTQRL9Fkz
         uA47UkPt2SEIoVi397YaSeWGubvC5PnUe2sHWQr9bywE7kAEGQJ047unAIEzyUU4ipCK
         Zz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRu29DMfgjgESM/r4ngIdYBCudXkF27Ad4jVLeKHA2o=;
        b=Rf+t23ieh9Nb4FT89PtDIviwaaAtBA/Lt1fUtTR/0XORPLLDD50uJT4Kx8fZfe010A
         e28Xv8/YjPxzFEBYojhdlvMvN6eGglnKr/Mxe3YaGoWGjDfRYGjn922hzWTGehbWhLGu
         u96W249IHNbd7Nf2Hc70F+5N9X4L0XWxvMAF1MLEbuCOVv15LctWCFVpYuf999csyRKq
         ArTz55+SS71A/dji2jWU4u0MwenQZwNQS7RTSxagFWtZUGgKgt1oz+MogiTWseUtntY/
         5kPPMjJHAW2VRnPQ9T8ae6Gcawf9CCTBZ36Das3voaIBvZldWJOMi5LGl/9vQTuGz+Cm
         /BDg==
X-Gm-Message-State: AOAM532xeid4oFxk0Rsd9CBmEP5mfuF/jV+wVIti5cN6w06rWG1KdtEY
	hzGORSBG6/4rDm98w8MzCFk=
X-Google-Smtp-Source: ABdhPJyurGqa9bX0BwPFi/uwuofzVZBrk2ngT+9mrfk1hczIv/7ZHgZ6RVcVVcEWb0Vsi8uplP/Hnw==
X-Received: by 2002:a05:6402:168c:: with SMTP id a12mr8867493edv.344.1617268897592;
        Thu, 01 Apr 2021 02:21:37 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id ha5sm2482266ejb.39.2021.04.01.02.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:37 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 09/49] staging: rtl8723bs: remove empty if-else blocks and unused variable
Date: Thu,  1 Apr 2021 11:20:39 +0200
Message-Id: <f76f909bb92a95bc538a5db1173364e3b401397e.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

remove empty if-else block,
remove unused variable as well, to suppress the compiler
warning:

drivers/staging/rtl8723bs/core/rtw_cmd.c:
In function ‘rtw_createbss_cmd’:
drivers/staging/rtl8723bs/core/rtw_cmd.c:661:22: warning:
unused variable ‘pmlmepriv’ [-Wunused-variable]
  struct mlme_priv   *pmlmepriv = &padapter->mlmepriv;

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index e143f89ea39e..e6d507ed60c5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -658,14 +658,9 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
 {
 	struct cmd_obj *pcmd;
 	struct cmd_priv 			*pcmdpriv = &padapter->cmdpriv;
-	struct mlme_priv 		*pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex		*pdev_network = &padapter->registrypriv.dev_network;
 	u8 res = _SUCCESS;
 
-	if (pmlmepriv->assoc_ssid.SsidLength == 0)
-		;
-	else
-
 	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
 	if (pcmd == NULL) {
 		res = _FAIL;
@@ -751,10 +746,6 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	u32 tmp_len;
 	u8 *ptmp = NULL;
 
-	if (pmlmepriv->assoc_ssid.SsidLength == 0)
-		;
-	else
-
 	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
 	if (pcmd == NULL) {
 		res = _FAIL;
-- 
2.20.1

