Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com [209.85.160.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B81A2D;
	Thu, 31 Mar 2022 17:16:06 +0000 (UTC)
Received: by mail-oa1-f68.google.com with SMTP id 586e51a60fabf-df22f50e0cso8788087fac.3;
        Thu, 31 Mar 2022 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=E2B7e9Nsff6vEEB8CGolskzuKU2fo78rxOBgNPm56To=;
        b=U7LBSYL6HIVSspJoiOLvlKynDF6Zmebcv/GLYzAKmuuK7Q5N8CU0P8TyxZ+SWVEuW2
         pnEROGtN5q8cgfHyuMKslmF9sPneaQZjgxIOldjcz9UNExH54pElzdkjpe9WLGeFQhdL
         1wBO54AATcbEL4mGxrqEWRBB8oAO5UAll16Cg+7sGbx9O0nememGlKn/+BhVkKDG666Q
         xN8fPXW6yNcFczeRmargFZ2jcvCqAcJPR3YWTqnb++7jHWW5Dm6bJYmA1hSFaTClA2rw
         lX7ntc1ZxqLyEeuHbDBTG2frqI4xxFUDHe9Tmt5S4TYyEfufxg6eedqNAECrhjir3KwJ
         V5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=E2B7e9Nsff6vEEB8CGolskzuKU2fo78rxOBgNPm56To=;
        b=sOZR0KXpa1OAEqigTmck1ZPeH/iv1Uj//TY6zlV5vyLO1kl4JOhF2LPeJVDI3RcwfN
         VZCc5FJJL14BGEsfXICESbXAV2iFzRddG4mW7VoQ21b2hpAgg1DPUZBXPustXM24IpjS
         3sO4NzeKDIMgfKPkrAijsvZdW08O+HVSdU1N2/T8/jab15wz0aWiKOu9B7g3FmfPS0nG
         wupkkqOAineC1rn4YsGVNd6MFrhzisKcx1g7Ho2ur2Z8rRruITegR5X8/p4L9WDrLLJx
         BPcVNwVi14aSdvW2wDS4m1Flh3mGK7MC0b6tLDYSi3BpHlXhGpVVecX7t8+dohUDzzHk
         PZ2Q==
X-Gm-Message-State: AOAM532gLViwmTgqZaDQVNU/lcydb2U3/3di/0s/XGdQjSXPoCvdmx5q
	064gKuPyoGgdrZgfBjcTJuWuPHIgCpoXNg==
X-Google-Smtp-Source: ABdhPJyqptgy+yT9/xcHTi9XsIDEf3bVMd77udOoeBcKUb6NXEqH4iR8dKH+1tMVS6C1g0AfsopU7w==
X-Received: by 2002:a05:6870:45a4:b0:dd:b08e:fa49 with SMTP id y36-20020a05687045a400b000ddb08efa49mr3208332oao.270.1648746965353;
        Thu, 31 Mar 2022 10:16:05 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id hi21-20020a056870c99500b000defdfbee5bsm6551698oab.28.2022.03.31.10.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 10:16:05 -0700 (PDT)
Date: Thu, 31 Mar 2022 12:16:04 -0500
From: Rebecca Mckeever <remckee0@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] staging: r8188eu: use sizeof(*pvar) for allocating structs
Message-ID: <YkXh1HBqaHwT38UC@bertie>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use sizeof(*pvar) instead of sizeof(struct var) when allocating memory.
This conforms to Linux kernel coding style, improves readability,
and decreases the opportunity for bugs if the pointer variable type is
changed. Issue found by checkpatch messages of the following format:

CHECK: Prefer kzalloc(sizeof(*pvar)...) over kzalloc(sizeof(struct var)...)

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
Changes in v2:
- Update to latest staging-testing tree.

 drivers/staging/r8188eu/core/rtw_mlme.c     |  4 ++--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index ee48dfd09fb3..f94b1536a177 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1506,13 +1506,13 @@ int rtw_set_auth(struct adapter *adapter, struct security_priv *psecuritypriv)
 	struct	cmd_priv *pcmdpriv = &adapter->cmdpriv;
 	int		res = _SUCCESS;
 
-	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
 	if (!pcmd) {
 		res = _FAIL;  /* try again */
 		goto exit;
 	}
 
-	psetauthparm = kzalloc(sizeof(struct setauth_parm), GFP_KERNEL);
+	psetauthparm = kzalloc(sizeof(*psetauthparm), GFP_KERNEL);
 	if (!psetauthparm) {
 		kfree(pcmd);
 		res = _FAIL;
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 643f9f8a7a3d..94d494cfd457 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6424,7 +6424,7 @@ void report_survey_event(struct adapter *padapter, struct recv_frame *precv_fram
 	pmlmeext = &padapter->mlmeextpriv;
 	pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_ATOMIC);
 	if (!pcmd_obj)
 		return;
 
@@ -6474,7 +6474,7 @@ void report_surveydone_event(struct adapter *padapter)
 	struct mlme_ext_priv		*pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_KERNEL);
 	if (!pcmd_obj)
 		return;
 
@@ -6516,7 +6516,7 @@ void report_join_res(struct adapter *padapter, int res)
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_ATOMIC);
 	if (!pcmd_obj)
 		return;
 
@@ -6613,7 +6613,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 	struct mlme_ext_priv		*pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_KERNEL);
 	if (!pcmd_obj)
 		return;
 
@@ -7013,11 +7013,11 @@ void survey_timer_hdl(struct adapter *padapter)
 			pmlmeext->scan_abort = false;/* reset */
 		}
 
-		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+		ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 		if (!ph2c)
 			goto exit_survey_timer_hdl;
 
-		psurveyPara = kzalloc(sizeof(struct sitesurvey_parm), GFP_ATOMIC);
+		psurveyPara = kzalloc(sizeof(*psurveyPara), GFP_ATOMIC);
 		if (!psurveyPara) {
 			kfree(ph2c);
 			goto exit_survey_timer_hdl;
@@ -7555,13 +7555,13 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 	u8 res = _SUCCESS;
 	int len_diff = 0;
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	ph2c = kzalloc(sizeof(*ph2c), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	ptxBeacon_parm = kzalloc(sizeof(struct Tx_Beacon_param), GFP_ATOMIC);
+	ptxBeacon_parm = kzalloc(sizeof(*ptxBeacon_parm), GFP_ATOMIC);
 	if (!ptxBeacon_parm) {
 		kfree(ph2c);
 		res = _FAIL;
-- 
2.32.0

