Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BD72F21
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 19:08:46 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 9so3048232pfx.12
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 11:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3pYUWbzfJmeVU+yHBTh4k3q7SKXv3vTcqq0waIAiryU=;
        b=EJgjFP4oGMq+CvHuGi7utFhaFknN1sr+n3dB62JsNImWWb8PfivoTyky60buWnmgMY
         KvoaTyr5T3sztr6GwkAwLoM8knyG2SKqyQ/0EoOSsGMY6qGFHBj69U0qkfg0fF81P7JN
         hSte0UmATttEoqCTSHD/3fNkDv8bsewC7MdJLsClsc0wP0PifxGuBFI9sWYS1ILdcN8L
         HkbRvimKp5GlfAF5+uQTWDltmedyxHpnI+1gcwhTFFawIlczdExTN4A9jv2iTVwMWqzr
         R4Qhn8Co6KsFc//zQKZiRw7r9Dfdm7W2yb3+hNJ8jhKMEv2l2iz56/5UB4IIehfS7aug
         3bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3pYUWbzfJmeVU+yHBTh4k3q7SKXv3vTcqq0waIAiryU=;
        b=p6hQSMKUHThB05cIkb6v/aqrbMv6/adlFSG/jx80XEpNSgmgOEj34LpMsuG8gPQnnP
         kWtYBhfZJROYnLiDji2kt2SQyW7wvRYdrJ9g7oEf6/uF1XrMyUlkgB4Hm/26iU34XzoA
         FfHQZs+VSxJhOT93XjAxhjQs8tWANK2XmLtmylfipCejp4+g/69wE+uEWiC/oMfZSIpq
         PnPZwqtH1UV5RHUvJq10pDZx6R4GIuf0IrKGqDgbO+f9QgIpF6EGJYA+BEIpO0qevzBo
         snE9SIM+SPZ80YttnRgvC+UinL5xueMlgx/Yke85mXpiZKKQGL/Ovqdy/ts1UlU0nm0g
         V8AQ==
X-Gm-Message-State: AOAM5324m5A8ki7Gex/H9z0gr0o7e0USDal5ZjWGwO8ePcQkBz7FCoh+
	DMhpw/X1YqCWcAT1E756BDY=
X-Google-Smtp-Source: ABdhPJwJE0afsJJf6gzTybqCyPkR8isNWbhTReCpgDbp96mFX25X55DS7++D8ydX46QiE95J6DDQhQ==
X-Received: by 2002:a63:c007:: with SMTP id h7mr3103630pgg.422.1644433725854;
        Wed, 09 Feb 2022 11:08:45 -0800 (PST)
Received: from localhost.localdomain ([103.81.93.149])
        by smtp.gmail.com with ESMTPSA id x12sm14255973pgp.25.2022.02.09.11.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 11:08:45 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH v2] staging: r8188eu: keep the success path and error path separate
Date: Thu, 10 Feb 2022 00:37:53 +0530
Message-Id: <20220209190752.7232-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep the success path and error path separate in rtw_usb_if1_init() and
drop the "status" variable.
Also, remove do-nothing gotos.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
v1->v2:
    Just `return NULL` instead of `padapter=NULL/return padapter`
 drivers/staging/r8188eu/os_dep/usb_intf.c | 30 +++++++++--------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 10c33e2ae..668e79a3c 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -336,13 +336,13 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 {
 	struct adapter *padapter = NULL;
 	struct net_device *pnetdev = NULL;
-	int status = _FAIL;
 	struct io_priv *piopriv;
 	struct intf_hdl *pintf;
 
 	padapter = vzalloc(sizeof(*padapter));
 	if (!padapter)
-		goto exit;
+		return NULL;
+
 	padapter->dvobj = dvobj;
 	dvobj->if1 = padapter;
 
@@ -421,26 +421,20 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 		, padapter->hw_init_completed
 	);
 
-	status = _SUCCESS;
+	return padapter;
 
 free_drv_sw:
-	if (status != _SUCCESS) {
-		rtw_cancel_all_timer(padapter);
-		rtw_free_drv_sw(padapter);
-	}
+	rtw_cancel_all_timer(padapter);
+	rtw_free_drv_sw(padapter);
 handle_dualmac:
-	if (status != _SUCCESS)
-		rtw_handle_dualmac(padapter, 0);
+	rtw_handle_dualmac(padapter, 0);
 free_adapter:
-	if (status != _SUCCESS) {
-		if (pnetdev)
-			rtw_free_netdev(pnetdev);
-		else if (padapter)
-			vfree(padapter);
-		padapter = NULL;
-	}
-exit:
-	return padapter;
+	if (pnetdev)
+		rtw_free_netdev(pnetdev);
+	else if (padapter)
+		vfree(padapter);
+
+	return NULL;
 }
 
 static void rtw_usb_if1_deinit(struct adapter *if1)
-- 
2.30.2

