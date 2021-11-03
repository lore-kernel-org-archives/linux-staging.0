Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D83E2C85
	for <linux-staging@lists.linux.dev>; Wed,  3 Nov 2021 15:48:49 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id v20so2747250plo.7
        for <linux-staging@lists.linux.dev>; Wed, 03 Nov 2021 08:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ead3RuHhckCl8EBMptNp8b8Ud4MyZajfflH02ACD9D4=;
        b=ROQd/5bUfimi8Aot2GdoDUDuuj/mtOzydB6RRRK1IkpZEu9AOK1A9yeex5CAMRlZ/A
         8ciq+FbzsGu7m2iPs/qy29rf+PvFXmRRzly4yXbVcp4RnXioCQ2zvwMLF7yJzSxdbVBb
         yUfhuZQmnhoa1meeQrpIK+MsuAILefO7Xjy0dkKeS79pMM2rSyEp/lmkmr90DIVyCvLS
         QzHdlt6UVhgAslH4g5Z2yal4sFi4gpS17x/zjzoLJsrv2uRjpEAqimNmBAJL4sRDZTsU
         cYPltAd6rETtJ4CJveVyiUd175v/QbtSgdkFX1yvoxzYfSG8LRj3hGMj7Ntx0cpVcZB2
         OeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ead3RuHhckCl8EBMptNp8b8Ud4MyZajfflH02ACD9D4=;
        b=i/rJ/M2H0ejnnHQBMl46aRB8ahhizUn8WwWkvWxak1INj4HR8cgcMoc/QUfC/EFkzJ
         ZmCc8GcJKSUJ7a7All7V4M1hKwTQMkLtUoJhUK+Gb86rnZT4zcuOMikY9S2ZHBkhwcfe
         Kt4RFo7SxJo2fK4PDQMjhQmAGK0ExDkuayjvY/U8wEQ9GoGdoKcMLOAAru4oNBt8bPxt
         m/sqQSg9+3SiuKUV9NselzPmCMMZL0q1LNkTy9uGRlZcabJxFN8VqbX7bL/O1VJHvKhG
         f4rQlZobZ7ag0t5Y5MWOT72woBp+9O8cdo6Ej6VVfxjj7Z/bm6oYz4/GAA9IPZNR5hDH
         mGag==
X-Gm-Message-State: AOAM530oH+muRFRobDeASgO/3dE3veNay+t+q5tPmiz8MePpqUDiHGHz
	GLTQuu4BbHrnxkyO5HMtmpc=
X-Google-Smtp-Source: ABdhPJzQ5LnjtrL2CxxPTBAjDQznKcuPjQPjHfMRkxbqEOaZ/hm+Co2UT8alMF5lXcmWyPkkfKJiAw==
X-Received: by 2002:a17:903:2348:b0:141:d60b:ee90 with SMTP id c8-20020a170903234800b00141d60bee90mr23950290plh.15.1635954529339;
        Wed, 03 Nov 2021 08:48:49 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.85.116])
        by smtp.gmail.com with ESMTPSA id d19sm2220235pgk.81.2021.11.03.08.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 08:48:48 -0700 (PDT)
Date: Wed, 3 Nov 2021 21:18:41 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	martin@kaiser.cx, saurav.girepunje@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH v2] staging: r8188eu: os_dep: remove the goto statement
Message-ID: <YYKvWeyqd71pYSqM@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the goto statement from rtw_init_drv_sw(). In this function goto
can be replace by return statement. As on goto label exit, function
only return it is not performing any cleanup. Avoiding goto will
improve the function readability.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---

ChangelogV2:

	-On V1 combined the if condition check for functions as below

	 if (!rtw_init_evt_priv(&padapter->evtpriv) || !rtw_init_mlme_priv(padapter))
		return _FAIL;
	reverting these changes and keeping them as-is. It will make more clear on
	individual function call if something need to handle for error case.

ChangelogV1:

	-Remove the goto statement from rtw_init_drv_sw(). In this function goto
	 can be replace by return statement. As on goto label exit, function
	 only return it is not performing any cleanup. Avoiding goto will
	 improve the function readability.

 drivers/staging/r8188eu/os_dep/os_intfs.c | 34 ++++++++---------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 1418c9c4916c..ec96e837ab88 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -480,48 +480,37 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 {
 	u8	ret8 = _SUCCESS;

-	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL)
+		return _FAIL;

 	padapter->cmdpriv.padapter = padapter;

-	if ((rtw_init_evt_priv(&padapter->evtpriv)) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if ((rtw_init_evt_priv(&padapter->evtpriv)) == _FAIL)
+		return _FAIL;

-	if (rtw_init_mlme_priv(padapter) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if (rtw_init_mlme_priv(padapter) == _FAIL)
+		return _FAIL;

 	rtw_init_wifidirect_timers(padapter);
 	init_wifidirect_info(padapter, P2P_ROLE_DISABLE);
 	reset_global_wifidirect_info(padapter);

-	if (init_mlme_ext_priv(padapter) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if (init_mlme_ext_priv(padapter) == _FAIL)
+		return _FAIL;

 	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL) {
 		DBG_88E("Can't _rtw_init_xmit_priv\n");
-		ret8 = _FAIL;
-		goto exit;
+		return _FAIL;
 	}

 	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL) {
 		DBG_88E("Can't _rtw_init_recv_priv\n");
-		ret8 = _FAIL;
-		goto exit;
+		return _FAIL;
 	}

 	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL) {
 		DBG_88E("Can't _rtw_init_sta_priv\n");
-		ret8 = _FAIL;
-		goto exit;
+		return _FAIL;
 	}

 	padapter->stapriv.padapter = padapter;
@@ -539,7 +528,6 @@ u8 rtw_init_drv_sw(struct adapter *padapter)

 	spin_lock_init(&padapter->br_ext_lock);

-exit:
 	return ret8;
 }

--
2.33.0

