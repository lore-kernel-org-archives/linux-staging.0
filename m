Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5023FC9
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 12:14:51 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id s29so1680084pfw.5
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 05:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=yWbmcQlOamqknzkTVRblnZufvJwZB9dtwXewZ/RdYJE=;
        b=E2GiGl1AzGZqAOlfyQF05ZTAd0sDQN/1wvSR5EwI2oflUzBM+K3Q4QHB3gMvWxBfCC
         JkeVl+rtl56DrkOUlSQBC71lpX/+HY1bZYb8WVlxJ6t+ce8GgoTqzo9l31ngnL3Blj7J
         3/u3HtGvkFcVWeR4oNUbtWxQrlqob/giohrQi0l/N4vaVqF7C9D7A/7gnvrOaoJ5nIb5
         OVZdIYqF/lS7r4DWH+5oJHPKNAgrPODm1phPU+sm48G+g8CJmpS6gFO/UTLG60XaZez+
         rN2g1iYe1xRKp8ANseJL7RZoqNe6vf7FPi1Po60OutMMyiPDbitDbDUj6geVXwIRXmT6
         9R/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=yWbmcQlOamqknzkTVRblnZufvJwZB9dtwXewZ/RdYJE=;
        b=Fvq4Xi+0yOFllfL+CcLwwxrKjysWLNcYobA0IbDZRS3w8tiFFpZ+cCh+DFbgWGPDiU
         24Nf9UEZQhg58IYICriaeSGzrq0s8/fhn37/2cnn/8BE4VJKJNclWi6eBM/GFdw8mz6C
         88A/5fhHvG4P4MQRPVGUro4tuGvs5M/ZLMdcmYIpQK6wIhmcxbiiH4TrY0MtVbgPy6mM
         7BUBF7pWkFGUGcG0osdHJzv+ngsp5H9hh/PDa/69naKyVzXcO9CougCX28Xk6waaVy32
         CARO9O72r8b7GMd57YtSaZlqaf7MqdlOGceqUAkWIIw4uGvmu91VtCBrWbbCfRTpxE3W
         6KNg==
X-Gm-Message-State: AOAM5312wMh1RrJDQ9CQfW2FcLpgJH6/zWZtAUakIEs01o/wM+s3Ff1A
	zFnVbmi8MqOZ2GLd6yEwB80=
X-Google-Smtp-Source: ABdhPJwVpcX0RMlQ+8VbEVUvJ6RS+QyZjiQFeCrTOiBXf4Aw1eADDGx8ypfja20dKjfrBRqkhXf+hA==
X-Received: by 2002:a05:6a00:2410:b0:409:5fbd:cb40 with SMTP id z16-20020a056a00241000b004095fbdcb40mr7679981pfh.8.1630757690667;
        Sat, 04 Sep 2021 05:14:50 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id o10sm2481631pgp.68.2021.09.04.05.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 05:14:50 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:44:44 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, saurav.girepunje@gmail.com,
	straube.linux@gmail.com, martin@kaiser.cx, nathan@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH v2] staging: r8188eu: os_dep: simplifiy the rtw_resume
 function
Message-ID: <YTNjNLcNvPfD9+5Z@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused variable ret and pwrpriv.
Remove the condition with no effect (if == else) in usb_intf.c
file.
Remove rtw_resume_process() and move whole thing to rtw_resume().

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---

ChangeLog V2:
- Remove rtw_resume_process() and move whole thing to rtw_resume().
---
 drivers/staging/r8188eu/include/usb_osintf.h |  2 --
 drivers/staging/r8188eu/os_dep/usb_intf.c    | 12 ------------
 2 files changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_osintf.h b/drivers/staging/r8188eu/include/usb_osintf.h
index d1a1f739309c..34229b1cb081 100644
--- a/drivers/staging/r8188eu/include/usb_osintf.h
+++ b/drivers/staging/r8188eu/include/usb_osintf.h
@@ -24,6 +24,4 @@ void *scdb_findEntry(struct adapter *priv, unsigned char *macAddr,
 void nat25_db_expire(struct adapter *priv);
 int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method);

-int rtw_resume_process(struct adapter *padapter);
-
 #endif
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index bb85ab77fd26..77b03e7631b7 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -493,18 +493,6 @@ static int rtw_resume(struct usb_interface *pusb_intf)
 {
 	struct dvobj_priv *dvobj = usb_get_intfdata(pusb_intf);
 	struct adapter *padapter = dvobj->if1;
-	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
-	int ret = 0;
-
-	if (pwrpriv->bInternalAutoSuspend)
-		ret = rtw_resume_process(padapter);
-	else
-		ret = rtw_resume_process(padapter);
-	return ret;
-}
-
-int rtw_resume_process(struct adapter *padapter)
-{
 	struct net_device *pnetdev;
 	struct pwrctrl_priv *pwrpriv = NULL;
 	int ret = -1;
--
2.32.0

