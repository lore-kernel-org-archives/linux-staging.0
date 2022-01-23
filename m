Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEF6173
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 18:18:36 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id e9so13134664pgb.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 10:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LM0mMzefnSfZje8daSUkdPFi8UkMvseVamFzoxFU/CQ=;
        b=IVrpsy/tjwu0SUk9J+FsWyANxgvEcSBSx88SqsySONb7XLsdhdErMEkGSlPbPrwezu
         qCSxGGQaZire7aSWgQRB4kwjbweDZKy2B7O9IL/DNzJ/tS+4lajPiESJJ6EQ7vuneAj3
         pFqz7ATwHq2S5BdvA+ZGIzd17UjvLWTMqUdB1VM7bYRgjm8EhSL88eXBQZfpscahRj6Y
         Ny28p4SHvptgYDqvSxznzqytARJi3bIaEV17cQMxWYODRWPxYkjTPhpXTFR8XJk1VUya
         apiQFrOUEEKfbPW5WwzAfbC4OwoYPDviVPvfH0mWjithQOtZlIE6ng3vcN5Bl9hLfR0h
         XyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LM0mMzefnSfZje8daSUkdPFi8UkMvseVamFzoxFU/CQ=;
        b=WkaW5gVaXLBSzDD0HQNxzLZQ4G6VAje4XDh4BDraTph7MAAJu2fcOcJA6UGKIfXyqr
         JuAT4Ek2NMm7b2fjLj2QtdVXN0KTTmrrtrpZRoKEEM7NbRv2Xb/26Gswpe28krOVmaSy
         P0INB4xfo+Af54Gmo0td/4mhE0WBIiwYTV9vfbGOQ+qgbd+sIjQHswcMUqgSzCJTrPyw
         hcy+8vUfeUv1BMIHNow8lVNokIiNRfCI2q5g4N2/x9bIPSFmzM88P19GburB/179Lcwq
         SnsThG6zyPDzsMUEa6LGb6HX8S9zOW/eTok+kH5YHpKyz9aesLTTOeWqdGiYs2+ecUC4
         EVSQ==
X-Gm-Message-State: AOAM532UWaVMoFJ3j7gnWrjyeiZr4vXe9dC3FlX5fwRHg+7CFHqJpLOw
	Qx48kSnqF08uSd4Dty2PkT0=
X-Google-Smtp-Source: ABdhPJxNugxrCfpZDi11NGkw2Bzh4uFDeQ7gOSmsfifv+0dTKuSstL00nrlFPomTYwAyQorNFtz8DQ==
X-Received: by 2002:a62:3003:0:b0:4c1:6983:f1c3 with SMTP id w3-20020a623003000000b004c16983f1c3mr10974880pfw.20.1642961915949;
        Sun, 23 Jan 2022 10:18:35 -0800 (PST)
Received: from localhost.localdomain ([103.85.11.151])
        by smtp.gmail.com with ESMTPSA id h6sm2634220pfk.110.2022.01.23.10.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 10:18:35 -0800 (PST)
From: Vihas Mak <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Mak <makvihas@gmail.com>
Subject: [PATCH v2] staging: r8188eu: handle rtw_init_netdev_name() failure appropriately
Date: Sun, 23 Jan 2022 23:47:35 +0530
Message-Id: <20220123181734.10402-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_init_netdev_name() calls dev_alloc_name() which allocates the name
for the device as per the given name format.
The name format is specified by the module parameter "ifname".
It returns a negative err code if the format is invalid. Handle this
error appropriately.
Cancel the timers ininitliazed by rtw_init_drv_sw() before calling
rtw_free_drv_sw() and then proceed to free the adapter.

Also, if register_netdev() fails then goto free_drv_sw instead of
goto handle_dualmac.

Signed-off-by: Vihas Mak <makvihas@gmail.com>
---
v1->v2:
    free the adapter and netdev instead of warning the user about 
    allocation failure.

 drivers/staging/r8188eu/os_dep/usb_intf.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 91792dfd3..85b5d0bd7 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -399,7 +399,11 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 			DBG_88E("can't get autopm:\n");
 
 	/*  alloc dev name after read efuse. */
-	rtw_init_netdev_name(pnetdev, padapter->registrypriv.ifname);
+	if (rtw_init_netdev_name(pnetdev, padapter->registrypriv.ifname) < 0) {
+		DBG_88E("rtw_init_netdev_name failed, ifname:%s\n",
+			padapter->registrypriv.ifname);
+		goto free_drv_sw;
+	}
 	rtw_macaddr_cfg(padapter->eeprompriv.mac_addr);
 	rtw_init_wifidirect_addrs(padapter, padapter->eeprompriv.mac_addr,
 				  padapter->eeprompriv.mac_addr);
@@ -409,7 +413,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 
 	/* step 6. Tell the network stack we exist */
 	if (register_netdev(pnetdev) != 0)
-		goto handle_dualmac;
+		goto free_drv_sw;
 
 	DBG_88E("bDriverStopped:%d, bSurpriseRemoved:%d, bup:%d, hw_init_completed:%d\n"
 		, padapter->bDriverStopped
@@ -420,6 +424,11 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 
 	status = _SUCCESS;
 
+free_drv_sw:
+	if (status != _SUCCESS) {
+		rtw_cancel_all_timer(padapter);
+		rtw_free_drv_sw(padapter);
+	}
 handle_dualmac:
 	if (status != _SUCCESS)
 		rtw_handle_dualmac(padapter, 0);
-- 
2.30.2

