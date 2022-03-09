Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E58B512B
	for <linux-staging@lists.linux.dev>; Wed,  9 Mar 2022 20:51:09 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d17so3308981pfv.6
        for <linux-staging@lists.linux.dev>; Wed, 09 Mar 2022 12:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PRuLGiKcgeniLC3aDTEnQaGDsSncDSNRKzBTC6T4h/U=;
        b=KWJul6uaiJTImsNot7Nu/MBSEElHc19LQWouzDAkOsKJHkjDIKBbmpfVgP9AQ1gkUO
         UwkOFXL1OpeFHsZWEanIFGUj3QGsseh+QD+BdrrudiYEzbWqWw55Ne2/eofJHTt8xLpx
         WpPjDC4SYm4ErM16Q1YBSENiwrR7xnrZeRZ7FYX1avb5KqKaiDUX96htk8iGcLUmT8Uc
         xL32SStiGnlRlxjDaM/97ntdEcVDVuspqvimDzvjF5HXd7hA9r+VDoDGIupXPgn7eRuS
         5o02NB2c3IRezQ5wlPAua/zSaUr5ypc/hPb3YkzlD0r25q3lReHqzzSkdlDrnfjAZH+S
         847Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PRuLGiKcgeniLC3aDTEnQaGDsSncDSNRKzBTC6T4h/U=;
        b=Z3wlo3HkkUMVU2yrJpSptLHkZJBZUctKT++JeJy7abmwVKgTtbtxEcaayiN7Ma4lmK
         4xI6OhAJVZnhRFN+59qet/OD1LBooKyOtpl2gjUd3D8H76AWpqNxKlWNPE5vb6TvsjJJ
         I7pP5PhpcMXcWsyZlKk3ycF7HiFSAxGbF+P0UKTodUY8u8FsAp/BI1VE9Rq/uK22SpAE
         uPHocf0agbF/9rQsUeo/Ke6oRAsRzR/60RypA2e2otkUn7G56DPHHhyXzrvdzDI56QRF
         kDMHVB0guXJDAvJoSSWkDIE6sV8mswzwhKWrImDff/rKffO/LjoSuqd63lsBX2j8e0qG
         gJAQ==
X-Gm-Message-State: AOAM532rBnA9HTzvlk6r7z9U+66yvkpBPG/wxA01pVaaGgdMCUAF1BjQ
	JjfSm0V4MuoObREkLetNI7g=
X-Google-Smtp-Source: ABdhPJxhKZ1SFC/gANrS86QFTadnD9Lns7/2sSdDa97GeaJXio+Ecxci3LautFmffvxq+3eGW9FCDw==
X-Received: by 2002:a63:ce48:0:b0:373:ac94:f489 with SMTP id r8-20020a63ce48000000b00373ac94f489mr1293946pgi.622.1646859068956;
        Wed, 09 Mar 2022 12:51:08 -0800 (PST)
Received: from localhost.localdomain ([103.85.9.4])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090a3f8b00b001bc299e0aefsm7259674pjc.56.2022.03.09.12.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 12:51:08 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH v2 2/2] staging: r8188eu: proper error handling in rtw_init_drv_sw
Date: Thu, 10 Mar 2022 02:20:47 +0530
Message-Id: <20220309205047.45981-3-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220309205047.45981-1-makvihas@gmail.com>
References: <20220309205047.45981-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code inside rtw_init_drv_sw() calls various init functions to
populate the padapter structure and checks for their return values
respectively.
But if one of the functions in middle fails then it simply returns
_FAIL instead of proper logging and calling freeing counterparts
of previous init functions.
This leads to various memory leaks and can be found in
/sys/kernel/debug/kmemleak if kernel is compiled with DEBUG_KMEMLEAK=y.

Fix this and keep the success and error separate.

Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for
RTL8188eu driver")

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
Tested on Comfast CF-WU810N RTL8188EUS wireless adapter.
---
 drivers/staging/r8188eu/os_dep/os_intfs.c | 60 ++++++++++++++++++-----
 1 file changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 197568422..f59b23dc6 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -469,32 +469,46 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
 
 u8 rtw_init_drv_sw(struct adapter *padapter)
 {
-	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL)
+	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL) {
+		dev_err(dvobj_to_dev(padapter->dvobj), "rtw_init_cmd_priv failed\n");
 		return _FAIL;
+	}
 
 	padapter->cmdpriv.padapter = padapter;
 
-	if ((rtw_init_evt_priv(&padapter->evtpriv)) == _FAIL)
-		return _FAIL;
+	if ((rtw_init_evt_priv(&padapter->evtpriv)) == _FAIL) {
+		dev_err(dvobj_to_dev(padapter->dvobj), "rtw_init_evt_priv failed\n");
+		goto free_cmd_priv;
+	}
 
-	if (rtw_init_mlme_priv(padapter) == _FAIL)
-		return _FAIL;
+	if (rtw_init_mlme_priv(padapter) == _FAIL) {
+		dev_err(dvobj_to_dev(padapter->dvobj), "rtw_init_mlme_priv failed\n");
+		goto free_evt_priv;
+	}
 
 	rtw_init_wifidirect_timers(padapter);
 	init_wifidirect_info(padapter, P2P_ROLE_DISABLE);
 	reset_global_wifidirect_info(padapter);
 
-	if (init_mlme_ext_priv(padapter) == _FAIL)
-		return _FAIL;
+	if (init_mlme_ext_priv(padapter) == _FAIL) {
+		dev_err(dvobj_to_dev(padapter->dvobj), "init_mlme_ext_priv failed\n");
+		goto free_mlme_priv;
+	}
 
-	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL)
-		return _FAIL;
+	if (_rtw_init_xmit_priv(&padapter->xmitpriv, padapter) == _FAIL) {
+		dev_err(dvobj_to_dev(padapter->dvobj), "_rtw_init_xmit_priv failed\n");
+		goto free_mlme_ext;
+	}
 
-	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL)
-		return _FAIL;
+	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL) {
+		dev_err(dvobj_to_dev(padapter->dvobj), "_rtw_init_recv_priv failed\n");
+		goto free_xmit_priv;
+	}
 
-	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL)
-		return _FAIL;
+	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL) {
+		dev_err(dvobj_to_dev(padapter->dvobj), "_rtw_init_sta_priv failed\n");
+		goto free_recv_priv;
+	}
 
 	padapter->stapriv.padapter = padapter;
 
@@ -510,6 +524,26 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 	spin_lock_init(&padapter->br_ext_lock);
 
 	return _SUCCESS;
+
+free_recv_priv:
+	_rtw_free_recv_priv(&padapter->recvpriv);
+
+free_xmit_priv:
+	_rtw_free_xmit_priv(&padapter->xmitpriv);
+
+free_mlme_ext:
+	free_mlme_ext_priv(&padapter->mlmeextpriv);
+
+free_mlme_priv:
+	rtw_free_mlme_priv(&padapter->mlmepriv);
+
+free_evt_priv:
+	rtw_free_evt_priv(&padapter->evtpriv);
+
+free_cmd_priv:
+	rtw_free_cmd_priv(&padapter->cmdpriv);
+
+	return _FAIL;
 }
 
 void rtw_cancel_all_timer(struct adapter *padapter)
-- 
2.30.2

