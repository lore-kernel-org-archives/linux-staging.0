Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F07B;
	Thu, 31 Mar 2022 15:40:03 +0000 (UTC)
Received: by mail-oo1-f66.google.com with SMTP id y27-20020a4a9c1b000000b0032129651bb0so40620ooj.2;
        Thu, 31 Mar 2022 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=5NvDxXOCj2IjyiLWVvaGa2K8cfqwFAMmFQA1NzW5zlQ=;
        b=SlYdKhMQeCIIizXjR2ftf96grOKqBwNTw15wVpZchWuXuI4ivEgri7HPuS3/j6rDjp
         XytUgTkYYuTIyY+G/dJtV5VC2vRffaWHwNJ52M2TMu8AG6HVcFFP3CXqeF3nrImQbBaM
         /MsdY3mLAje9vfjtf/wxdAhAmEyDkH3fpWsgtSuycN7vGlomI7ibnc1IQv07AS7WOaNB
         376vzHNd08msPiJizrDCjWQ4jW3UFR8DhCoSJCktV3G1uNT/LThu72dD/zx/3CDwn788
         4owfczlLxRRW3OCRjhIg1yJY4sdtAf0e0Qtzj69AZHirkGDTXiSWjOJrE/bFr9RMrQHQ
         dETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=5NvDxXOCj2IjyiLWVvaGa2K8cfqwFAMmFQA1NzW5zlQ=;
        b=O82wue3Sy8RtVKuN3Mx2tOuOL27p25cEg1xj4Cs1QGQtUERFW/56uS5MaXIuz2E+kS
         VpGSUeCry3qKjI0Z+qhgsg2YP8N24P3okRDlz08SViUDkzkPo5TV1IAia3qv3fT1gzaJ
         fmUVZsfmeK58v7Pd5HLCFMZAGPdB+uKqmP2VbZEKixYbzGEO5V10RwZfZafD4JwYb0sm
         x2KFVNmF3l963mYjc2qT9ZosFIuOe2Ucd78SyVxo+AN6hN2p7Wo/ruxUDiLezySb6y2h
         MOcXGyARm3vuObqWm7q6rLQvCMNSw+uJoV5SXCQ1iYIzEEcrMY8zwB+syE5wvNgXCBjS
         gP+Q==
X-Gm-Message-State: AOAM533PGoHWoteF6Bp7JTDVqFxoIZK8uCsyxxoj0aR3yaNT+6FXoCKE
	UhZROHrOfIRR5quAkQXcsVfR+s/xJshiKg==
X-Google-Smtp-Source: ABdhPJzuRo0YGQtSqCPTJVqtxgUHrhRly5OEtg0E8sVgxze6Up+3RncDemZbLaq8micNvmL4QlYQ2Q==
X-Received: by 2002:a4a:cb0d:0:b0:324:852f:4438 with SMTP id r13-20020a4acb0d000000b00324852f4438mr5335614ooq.3.1648741202226;
        Thu, 31 Mar 2022 08:40:02 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id u23-20020a056870d59700b000de821ba7cbsm11462103oao.15.2022.03.31.08.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 08:40:01 -0700 (PDT)
Date: Thu, 31 Mar 2022 10:40:00 -0500
From: Rebecca Mckeever <remckee0@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: r8188eu: use sizeof(*pvar) for allocating structs
Message-ID: <YkXLUIMkcD02N0RU@bertie>
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
 drivers/staging/r8188eu/core/rtw_mlme.c     |  4 ++--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 6f0bff186477..2afbb6a9aee6 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1509,13 +1509,13 @@ int rtw_set_auth(struct adapter *adapter, struct security_priv *psecuritypriv)
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
index 10d5f1222936..c3ec853d0895 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6421,7 +6421,7 @@ void report_survey_event(struct adapter *padapter, struct recv_frame *precv_fram
 	pmlmeext = &padapter->mlmeextpriv;
 	pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_ATOMIC);
 	if (!pcmd_obj)
 		return;
 
@@ -6471,7 +6471,7 @@ void report_surveydone_event(struct adapter *padapter)
 	struct mlme_ext_priv		*pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_KERNEL);
 	if (!pcmd_obj)
 		return;
 
@@ -6513,7 +6513,7 @@ void report_join_res(struct adapter *padapter, int res)
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_ATOMIC);
 	if (!pcmd_obj)
 		return;
 
@@ -6610,7 +6610,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 	struct mlme_ext_priv		*pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_KERNEL);
 	if (!pcmd_obj)
 		return;
 
@@ -6996,11 +6996,11 @@ void survey_timer_hdl(struct adapter *padapter)
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
@@ -7538,13 +7538,13 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
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

