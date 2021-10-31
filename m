Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420A82C81
	for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 18:10:27 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id m14so14257114pfc.9
        for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 11:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Yly+G2tQYc5jWH+dF3AkB+ki7+SZGT9TzfTXC0w8qwA=;
        b=ejXmkOq1FXvj2pqqc9Yjib4gl0az8LlfxSR82cemZEM+YuJAoW5qKXyNdMz6Iu7Z52
         MfNbXwpI+IK3Ayl7+Ajq7TaWnMeZdbHD/B1ye24gKeWChVdLK78i+56RbyuODiDUvmPJ
         QraEJkwfBN0+U9ZVldtcJNmhEpkycYHjl4uRLIr/zZdB09esuCPoR7Tg5/fr0DCZdK8D
         0GAUR+LTlaZrLckuxfeAf9YwhUBhsDBoFPWobvSyg3Ar4z1wyy+y9QVZto7jI28kFvM3
         t+mci3umufQcPIYx5psPScufPeszDRIjsjljui5FODZQIPU5TLxLIuTo4ylJ1gq2j4md
         cYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Yly+G2tQYc5jWH+dF3AkB+ki7+SZGT9TzfTXC0w8qwA=;
        b=xQNb/aVwyn2NJwgFdknlFYPInTi2+sfsB98RTkQVUFomQBFviOet6mc7OEprG5gd1B
         7TS+NB5R5DQS/svUiKxqhVjSOIwAHtLGVD2gceaU47NlS6ec/ocL7QGxx4rmHnk4/6eN
         nfun+t1WhSdX1CG7HGwKlguQsA7l0s3w+PtIe71YBOVh44jvwoZV8t9FJ+HcBl81pXq9
         84FxmunLMHEhvf+L0QZfcB60pyfiWzAlCLWfMygSATnbqIxFAoUiEf0ZI8fo/DCzuELF
         Bv4JsFxVaMiQlZC7f703O76AKjLvxVjbniiHa6H4JKZB8nHfOs+gNanc+z3mfSZvzFgF
         PAjQ==
X-Gm-Message-State: AOAM530IX0KURYh9dKAHrbO/5sE4qUGVtZuXpeAKN5OPv8NxTt36sTxw
	xzsA2dI1tSY/ejcDxtktOpz7kF1E3vg=
X-Google-Smtp-Source: ABdhPJwmJNiy7GWDga0g/NuzWU+G5Ss3MET5W4vRInso9d2T5pvOErULeGK3kbhmsAt9LwPZfuDYPQ==
X-Received: by 2002:a63:1d58:: with SMTP id d24mr18472516pgm.316.1635703826772;
        Sun, 31 Oct 2021 11:10:26 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.84.6])
        by smtp.gmail.com with ESMTPSA id t11sm10837514pgi.73.2021.10.31.11.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 11:10:26 -0700 (PDT)
Date: Sun, 31 Oct 2021 23:40:18 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	martin@kaiser.cx, saurav.girepunje@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: os_dep: remove the goto statement
Message-ID: <YX7cCtVss2RWOJ/a@Sauravs-MacBook-Air.local>
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
 drivers/staging/r8188eu/os_dep/os_intfs.c | 39 +++++++----------------
 1 file changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 1418c9c4916c..4b409479108e 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -480,48 +480,34 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 {
 	u8	ret8 = _SUCCESS;

-	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if (!rtw_init_cmd_priv(&padapter->cmdpriv))
+		return _FAIL;

 	padapter->cmdpriv.padapter = padapter;

-	if ((rtw_init_evt_priv(&padapter->evtpriv)) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
-
-	if (rtw_init_mlme_priv(padapter) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if (!rtw_init_evt_priv(&padapter->evtpriv) || !rtw_init_mlme_priv(padapter))
+		return _FAIL;

 	rtw_init_wifidirect_timers(padapter);
 	init_wifidirect_info(padapter, P2P_ROLE_DISABLE);
 	reset_global_wifidirect_info(padapter);

-	if (init_mlme_ext_priv(padapter) == _FAIL) {
-		ret8 = _FAIL;
-		goto exit;
-	}
+	if (!init_mlme_ext_priv(padapter))
+		return _FAIL;

-	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL) {
+	if (!_rtw_init_xmit_priv(&padapter->xmitpriv, padapter)) {
 		DBG_88E("Can't _rtw_init_xmit_priv\n");
-		ret8 = _FAIL;
-		goto exit;
+		return _FAIL;
 	}

-	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL) {
+	if (!_rtw_init_recv_priv(&padapter->recvpriv, padapter)) {
 		DBG_88E("Can't _rtw_init_recv_priv\n");
-		ret8 = _FAIL;
-		goto exit;
+		return _FAIL;
 	}

-	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL) {
+	if (!_rtw_init_sta_priv(&padapter->stapriv)) {
 		DBG_88E("Can't _rtw_init_sta_priv\n");
-		ret8 = _FAIL;
-		goto exit;
+		return _FAIL;
 	}

 	padapter->stapriv.padapter = padapter;
@@ -539,7 +525,6 @@ u8 rtw_init_drv_sw(struct adapter *padapter)

 	spin_lock_init(&padapter->br_ext_lock);

-exit:
 	return ret8;
 }

--
2.33.0

