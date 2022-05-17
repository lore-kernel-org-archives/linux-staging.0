Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F416D1383
	for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 14:06:40 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id j6so16948170pfe.13
        for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 07:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hvUgUjmvE7sy7yIPoGJaEuswuZK60S9OzDycOOYXOCw=;
        b=LdPgp9viGlgUoy+Z2wq8QytcD4XRoYj1OTfGDEdNPB2AkOFpjOVE5KjgnQUFn/tQeV
         gnsYTY4ORDpAmWJf/2cxZAyz+o5eP1TR78crD6oi+oaNmaQEfDK8HGzToaIGHxutC5gd
         e+4iGkYyqGasM/GUH2ZNqugg/RL57wjcVFPfnopdK1Tw9sg1E3J+BeuKJL4MSajoNQNS
         8heGUqM7PTZ3R1HGBc6RAMCQrNmemvItVLdgkjApwNo6T3HXcL/Fiv8Y78wKLnZZ5M8A
         CImuTuRUMEJQ5YeHDHXsXVQgp6V/+mp/SwRxQzkmnKjHqWP9x6dXCJ2P7X6nQA3O6Fhn
         103g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hvUgUjmvE7sy7yIPoGJaEuswuZK60S9OzDycOOYXOCw=;
        b=t5SbU+gUGWwdSLntpnYxC+6Zcw1po8p89am1KbatAgNIuRilEp4zXXF6ZQRBYeuxYH
         2yC0AEPpmGYN8BDh8dIEhGnFhfV4aaXaAZUsqWeb2H4quheW8k8TcIakTekOCl17Wytm
         00tajCLdE9XheezV+rYc756LaYPmoYiTBQ7ck5TL1HmcwiHjYN+BfHq4TR9R9vyGWleI
         Eum8/kcIAQ721XGFZIux2q972v2B7COjujinsea5dPHVHRmgbhSnZs14UZYCrZZISFX+
         72L/sJgDxrFod7UaL4ueJirK3JBIfIH5rOnOSbJzi+YVSzD/nhqsmqptyA73aRMhpVCk
         6FBw==
X-Gm-Message-State: AOAM531tHpx7GoVhxb6Va5cxPvpFk5ZAGRQp+CgRo926PrzAKJ3PYK0i
	i6GFIu2/+bgvg3tcuHiA6Vk=
X-Google-Smtp-Source: ABdhPJwWX8ZDtaSXGxc5BTr7f/mCM9/dBnBR2fUupGrZ+WO9omjidQc6rPELYuVINkcwPmhTzPk+lA==
X-Received: by 2002:a65:428c:0:b0:3db:822e:2163 with SMTP id j12-20020a65428c000000b003db822e2163mr19232498pgp.466.1652796400301;
        Tue, 17 May 2022 07:06:40 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:1:3174:ae5c:a49e:4e77])
        by smtp.gmail.com with ESMTPSA id z34-20020a631922000000b003f27f91135asm3113289pgl.76.2022.05.17.07.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 07:06:39 -0700 (PDT)
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
Subject: [PATCH v2 1/3] staging: r8188eu: fix warnings in rtw_p2p
Date: Tue, 17 May 2022 19:36:24 +0530
Message-Id: <20220517140626.3716-2-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220517140626.3716-1-makvihas@gmail.com>
References: <20220517140626.3716-1-makvihas@gmail.com>
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

