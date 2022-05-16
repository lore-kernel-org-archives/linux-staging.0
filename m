Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FF71361
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 17:04:31 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 191so3492333pgf.4
        for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hvUgUjmvE7sy7yIPoGJaEuswuZK60S9OzDycOOYXOCw=;
        b=oOWKBT+xAcSWpcFAPqotHHwdYzvsiqsyJXFbrfLVoW92ooyiIKY6CSnCWv3uBhttdr
         SwnItytBoeiQm+82vWK9W0QK0AEnFfprXN1/9HEApBvEmVG1bzF52Y8C8EXC6OHGb6hE
         PFidhATRBAm6nbcd/pnL3ySDaS+cavO6C4zQI6BhIyj+14km+BLrC/fP6ONwGOquCZwm
         X8TjZu2PoPMJ3Pwc/aSsBOsxOUmP3Lfc0AyagBTblrX2TCi2X/IKL1b+YfALIAWLbPuJ
         9MoSoWb/Fz4uk2Z7We8rpDbKX9bk9ofweVna79LSvSSpKe6tXM/mzKsHk3iDM4Xaij47
         qPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hvUgUjmvE7sy7yIPoGJaEuswuZK60S9OzDycOOYXOCw=;
        b=qX2WJ4iogd1Ng3pW36eQARM2SVP7t4vYo9imoSCRMULvIBn9FGW2xIKHr0Mx3aRe7G
         LNhezO5gDL9yz+vsKzNIVeFJIFcZnTSh1P3tv8NFxFoz4D2JNDS13qNZ4st5oE08pgn5
         qVBxR4d0GCHbrJ7atG860afkqx9BdGnTrOqhCkZLXuMBJ7iVFwC/u8xuvyb32nRReETn
         WL5323cNpY+vLKNik1mOGJeE5HdlfSoA9K6E6V8G3KdRGBki3XrVvS6zQDbTMxwI0856
         eFBSbPiEQFkndqwI+1gWMwMRpIdQomhrGqaiEb0FjS+hX25xXiuYhOHFIs9SzOBnvSqy
         sitw==
X-Gm-Message-State: AOAM5318tfehQxc/auKOclnyykMySp7vVv795qkvTFbI0t8S+5MY1+BK
	i04Ckpl3NLo2mhQbKzGny0k=
X-Google-Smtp-Source: ABdhPJyNvbMC5UC+Z+pRk3lXpCiWByKdTknRa+8lqvEnCluwugZ2vJC1xGcEAB9Tr6LA4rNH1zgNgw==
X-Received: by 2002:a05:6a00:a0e:b0:4fd:fa6e:95fc with SMTP id p14-20020a056a000a0e00b004fdfa6e95fcmr18377072pfh.17.1652720671411;
        Mon, 16 May 2022 10:04:31 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:1:6465:4732:de67:bb26])
        by smtp.gmail.com with ESMTPSA id b190-20020a621bc7000000b0050dc762819csm7141292pfb.118.2022.05.16.10.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 10:04:31 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: fix checkpatch.pl warnings in rtw_p2p
Date: Mon, 16 May 2022 22:33:04 +0530
Message-Id: <20220516170306.6008-2-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220516170306.6008-1-makvihas@gmail.com>
References: <20220516170306.6008-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the code to fix following warning:
    WARNING: Comparisons should place the constant on the right side of the test

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_p2p.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
index 59bb1bd12..c3884c49b 100644
--- a/drivers/staging/r8188eu/core/rtw_p2p.c
+++ b/drivers/staging/r8188eu/core/rtw_p2p.c
@@ -872,7 +872,7 @@ u32 process_assoc_req_p2p_ie(struct wifidirect_info *pwdinfo, u8 *pframe, uint l
 				}
 
 				psta->dev_name_len = 0;
-				if (WPS_ATTR_DEVICE_NAME == be16_to_cpu(*(__be16 *)pattr_content)) {
+				if (be16_to_cpu(*(__be16 *)pattr_content) == WPS_ATTR_DEVICE_NAME) {
 					dev_name_len = be16_to_cpu(*(__be16 *)(pattr_content + 2));
 
 					psta->dev_name_len = (sizeof(psta->dev_name) < dev_name_len) ? sizeof(psta->dev_name) : dev_name_len;
@@ -1213,7 +1213,7 @@ u8 process_p2p_group_negotation_resp(struct wifidirect_info *pwdinfo, u8 *pframe
 				if (attr_content == P2P_STATUS_SUCCESS) {
 					/*	Do nothing. */
 				} else {
-					if (P2P_STATUS_FAIL_INFO_UNAVAILABLE == attr_content) {
+					if (attr_content == P2P_STATUS_FAIL_INFO_UNAVAILABLE) {
 						rtw_p2p_set_state(pwdinfo, P2P_STATE_RX_INFOR_NOREADY);
 					} else {
 						rtw_p2p_set_state(pwdinfo, P2P_STATE_GONEGO_FAIL);
@@ -1891,7 +1891,7 @@ int rtw_p2p_enable(struct adapter *padapter, enum P2P_ROLE role)
 
 	if (role == P2P_ROLE_DEVICE || role == P2P_ROLE_CLIENT || role == P2P_ROLE_GO) {
 		/* leave IPS/Autosuspend */
-		if (_FAIL == rtw_pwr_wakeup(padapter)) {
+		if (rtw_pwr_wakeup(padapter) == _FAIL) {
 			ret = _FAIL;
 			goto exit;
 		}
@@ -1905,7 +1905,7 @@ int rtw_p2p_enable(struct adapter *padapter, enum P2P_ROLE role)
 		init_wifidirect_info(padapter, role);
 
 	} else if (role == P2P_ROLE_DISABLE) {
-		if (_FAIL == rtw_pwr_wakeup(padapter)) {
+		if (rtw_pwr_wakeup(padapter) == _FAIL) {
 			ret = _FAIL;
 			goto exit;
 		}
-- 
2.30.2

