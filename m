Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0766C6D17
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 21:24:28 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id k2so8041960ejr.2
        for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 14:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnIGn/8lQxIvkBxIYAS0VX64KIDCnkMm+kr3eEDYl88=;
        b=XIP4bEFIcdIw/T9jh4VAzKatrQJkOlQZmO7SqvJALwsEKkkJYu8vPujUgOwlI8cLot
         F20Fp89nNXajchE43quObfLKMOnQgDQBC0Tn3nBTJ5Ex9cAN+zbOR30X9n42DcyYOyQB
         G97s31gHJPtUnkFRmIjo06ukG++F4eHcJOxj3jPX7u4NKtVfGpxk5PBvMRvFkAeKI86t
         8URuIMqoVKs7vr5qg4W+0yWE1aTn2nu74wsZYjAyZbVkWVJhqlsKtVZ/IDxCmQiA80HM
         WuWcrzYlFmozzQRs8+MnWdWkfiUJesTAYwzTxfFA2U1/g0STRvhu8xe97VMEmYgt1UpN
         ZDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnIGn/8lQxIvkBxIYAS0VX64KIDCnkMm+kr3eEDYl88=;
        b=1dMguNwzx6GoBZ6LiUra5xbDugGTpARCt5gGYjo2mj3MKhgoaAsVClEay1KMteCCkJ
         lAYu69CpiWtKo9qf0Dc2uzz0PG3HqJtaD+/aISJtrKvWIqPfP6cFQbZP1iOTVuGjOYqB
         gaQrvDsP2Sj3D+rUGDiVIqQxhHosdK43cqODeiu1DWCSIZUo8Xz3rgKwB3CH4Z32fRDp
         MpW3aee9hUJGJmnKmf5acbTy4offh40dKuvOMp+S2ZX2ot/mxSfes0PN0uDO3a27fEBA
         2q/WLtY/IWXkqweVMcB0N3aiysVeE0wq43nYID85nqjWIZYpS8ZFnd0op8L3eGjPi+xs
         wzlQ==
X-Gm-Message-State: ACrzQf1aaQB11zJsMNH1tnAqS8lvtEv4nOl7KB0NeRFiGe7HiPNFx2Xw
	t7dzMuqOEhlI3Pnv/HLbLW7Ai1gYm9g=
X-Google-Smtp-Source: AMsMyM4As13GMai/yS+FNzNmUkg75fu7jjtSd9W12kGYnpIJ+ZxCsw0m14bKSffg3fiLMS28oMuarg==
X-Received: by 2002:a17:906:9b93:b0:78d:eb36:1ce7 with SMTP id dd19-20020a1709069b9300b0078deb361ce7mr29772911ejc.621.1666646667267;
        Mon, 24 Oct 2022 14:24:27 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-178.ip.prioritytelecom.net. [217.105.46.178])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709061ba100b007a9c3831409sm379354ejg.137.2022.10.24.14.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 14:24:26 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: namcaov@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: rtl8712: fix potential memory leak
Date: Mon, 24 Oct 2022 23:24:09 +0200
Message-Id: <43674a56b0734618291dccee5bbeb756d940f55b.1666645510.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666645510.git.namcaov@gmail.com>
References: <cover.1666645510.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In r8712_init_drv_sw(), whenever any function call returns error, it is
returned immediately without properly cleaning up the other successfully
executed functions. This can cause memory leak.

Instead of return immediately, free all the allocated buffers first.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8712/os_intfs.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index ade57dd89eee..a2f3645be0cc 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -304,28 +304,42 @@ int r8712_init_drv_sw(struct _adapter *padapter)
 	padapter->cmdpriv.padapter = padapter;
 	ret = r8712_init_evt_priv(&padapter->evtpriv);
 	if (ret)
-		return ret;
+		goto free_cmd;
 	ret = r8712_init_mlme_priv(padapter);
 	if (ret)
-		return ret;
+		goto free_evt;
 	ret = _r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
 	if (ret)
-		return ret;
+		goto free_mlme;
 	ret = _r8712_init_recv_priv(&padapter->recvpriv, padapter);
-		return ret;
+	if (ret)
+		goto free_xmit;
 	memset((unsigned char *)&padapter->securitypriv, 0,
 	       sizeof(struct security_priv));
 	timer_setup(&padapter->securitypriv.tkip_timer,
 		    r8712_use_tkipkey_handler, 0);
 	ret = _r8712_init_sta_priv(&padapter->stapriv);
 	if (ret)
-		return ret;
+		goto free_recv;
 	padapter->stapriv.padapter = padapter;
 	r8712_init_bcmc_stainfo(padapter);
 	r8712_init_pwrctrl_priv(padapter);
 	mp871xinit(padapter);
 	init_default_value(padapter);
 	r8712_InitSwLeds(padapter);
+
+	return 0;
+
+free_recv:
+	_r8712_free_recv_priv(&padapter->recvpriv);
+free_xmit:
+	_free_xmit_priv(&padapter->xmitpriv);
+free_mlme:
+	r8712_free_mlme_priv(&padapter->mlmepriv);
+free_evt:
+	r8712_free_evt_priv(&padapter->evtpriv);
+free_cmd:
+	r8712_free_cmd_priv(&padapter->cmdpriv);
 	return ret;
 }
 
-- 
2.25.1

