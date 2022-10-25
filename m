Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4D2EA5
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 09:12:46 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id q9so11015395ejd.0
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 02:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z+J20nkyvf9zvzoex976NXQ4RyfsmUwd3Fi5lYS2+g=;
        b=JuwhEj+FIeI8r7Auq46FaNuvbKKNxmoG+Oo8YSiLsSh52Rqb0ken7YJuyO39BMy3gc
         HVioh9tgBUfywHgGRiaa8tu3pDanG+Y8UIDw1CQCE1BItWiSG3rLShOBZAZU+QICses7
         VlEQYvHYwuc9/s4ROpNuPTqPKYTTYm4dmb0wPfBajqeLwkvssLZwkLC4nqGVazVDHdlp
         lP1D4Wzmzeo3izM57PBYYmbI6R2dMdnrDlECR630TcuvjqSK6vA5NugwUi8gRLHY/YvN
         EXOOdNYmfM60qSiAzsmNJGA8eWlKCFjgI4cbyaO427EkK9NKud7d6fuvW9GoL+1HxC/j
         TCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Z+J20nkyvf9zvzoex976NXQ4RyfsmUwd3Fi5lYS2+g=;
        b=pPehuKoLJmAROoma2i/8e0/XnC/pP0Q3poprkHGvFGzwikZeGe3PVxt1mnIItMrXMC
         nZVBEPgoaZ7vVvT7p30nZCK5pvDsWYLY+DXXW7575bVtxaTb0PLbeswPDKgFGBMjsgLU
         4vBu32IOR+sif4vQXsJ1Wvw7RneLQzfPSIp61S/7EkAP0WyxDhpuTRLUaPA60CVr0RNA
         Tyk2s1yRVeV14iEuPGFMpfEli2hsIwEofEM/yG70+1WCQQn004pVMsQHUoy4wR4RZxUo
         4yyIxQBtthR8le6wDdffUkBE4nSx8UpP3xC876TTncKOpebbFmHcVb5fw/0nlQlghOfb
         fokw==
X-Gm-Message-State: ACrzQf2sZcDwFvF5v2v91p73+PMRH7PaCUS6RK/onpoaAYYHEvQQdoTu
	F7eGS1XPuYCz9S/fJdBRscU=
X-Google-Smtp-Source: AMsMyM6pxohNxoDB4Ay4qDRDLiEQmXWwybWKlDz+Sb4+rPb0gimKWaR2nLjgMzddJoCbPmyk/48jLQ==
X-Received: by 2002:a17:907:2c4a:b0:78d:ee99:a06b with SMTP id hf10-20020a1709072c4a00b0078dee99a06bmr30382254ejc.578.1666689164975;
        Tue, 25 Oct 2022 02:12:44 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-178.ip.prioritytelecom.net. [217.105.46.178])
        by smtp.gmail.com with ESMTPSA id bo12-20020a170906d04c00b00780f24b797dsm1061953ejb.108.2022.10.25.02.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 02:12:44 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: namcaov@gmail.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] staging: rtl8712: fix potential memory leak
Date: Tue, 25 Oct 2022 11:12:26 +0200
Message-Id: <0a3414b12031f6cdcba81a8725e91eb9567ff34f.1666688642.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666688642.git.namcaov@gmail.com>
References: <cover.1666688642.git.namcaov@gmail.com>
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
 drivers/staging/rtl8712/os_intfs.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 205b7d66a40a..a2f3645be0cc 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -304,29 +304,42 @@ int r8712_init_drv_sw(struct _adapter *padapter)
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
 	if (ret)
-		return ret;
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

