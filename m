Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9A12C9F
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 11:38:33 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id c4so3044861pgv.11
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 04:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rccfm12KpSvWMnfVMFO4QKNXNCfzMa0oV3Fo5GIqPt0=;
        b=iqI03UhX5hT7fF3H0iiH3I5GYZpNeA+i0X7rTuDM7HLJQ/3FM4vfNLuXwVTTHgk9EJ
         uppdEkgMh16sH68w72mUsFc0Udv/wqv9y4l1JYmN4newEPyG2E+vIwSIMno04hWxw0H0
         Ya64lNEsF+FgE201TgwiY3vrWjZllECqimTXhoE90M3740d3xYcmAP9zmvcp0QAytvC0
         I3cEILn+eW8hMMYOErjQon6ktP9bT5tUFq/0fD2dISqNFNgMUCcffrr2giMyNEU19L25
         ETceSUS0n9AvVHLbEVeiPoK0eng7d7y0dWX8skISjThvQVjZqtZf5TvmJjtb9hajINH5
         BPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rccfm12KpSvWMnfVMFO4QKNXNCfzMa0oV3Fo5GIqPt0=;
        b=wKnM6z1OloJNcrD5r6NMsEOdMzhF7kWti9R1T0ScRS8z4CvGgbgSiv1aNPiCy8xfLT
         REUyyyfYwaJdE6ge7sYmwluDtTYluuDwGudnYi62sjHPLVxwLFhv+kb2TVSHz9uLUK8x
         K/9uQUqeGghZkMNo//dSrt94Q4gqfE84onj5CMRbYyDwHrFW7b9GVl054PbTJBLKPNXz
         Fm3XW4OJKE6lO5ObSU4jQBJtHcPNxptrkf3X8gbmDfgpM3rdccTHuO45fEn9GDj+ttle
         WNU5bGDxiM8bRDR8bWiOEV9UYRBH1O9Kymm2AZkUh3BfnzheFKi+iIs1GcRuMrumd8QM
         jmoA==
X-Gm-Message-State: AOAM532c+iDT9Q0tDClh07UJ2Y5FGjTV4feRTqFqiVNE450qQOGYOnlG
	mycFksFqibqirjmra3jnYvU=
X-Google-Smtp-Source: ABdhPJz+gSN9a9JxjraI8gn6J8uJMUJKpQG4Kw79ZWkTve2qhiLVoDJTeZXpnlt5ASD893PbIfUsxw==
X-Received: by 2002:a62:7904:0:b0:44c:ca08:1956 with SMTP id u4-20020a627904000000b0044cca081956mr12118844pfc.47.1634902713133;
        Fri, 22 Oct 2021 04:38:33 -0700 (PDT)
Received: from localhost.localdomain ([115.96.219.100])
        by smtp.googlemail.com with ESMTPSA id t22sm10946224pfg.148.2021.10.22.04.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 04:38:32 -0700 (PDT)
From: Kushal Kothari <kushalkothari285@gmail.com>
To: gregkh@linuxfoundation.org
Cc: kushalkothari285@gmail.com,
	kush19992810@gmail.com,
	outreachy-kernel@googlegroups.com,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	fmdefrancesco@gmail.com,
	marcocesati@gmail.com,
	straube.linux@gmail.com,
	philippesdixon@gmail.com,
	manuelpalenzuelamerino@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mike.rapoport@gmail.com,
	kushalkotharitest@googlegroups.com
Subject: [PATCH 3/4] v2 staging: rtl8723bs: core: Remove unnecessary space after a cast
Date: Fri, 22 Oct 2021 17:07:37 +0530
Message-Id: <859fedf8146c92b17295a40044007de9dc479525.1634899405.git.kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634899405.git.kushalkothari285@gmail.com>
References: <cover.1634899405.git.kushalkothari285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>

Changes in v2: No changes
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 88f6b7405106..fce3256cc275 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -922,7 +922,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	memcpy(psetstakey_para->addr, sta->hwaddr, ETH_ALEN);
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
-		psetstakey_para->algorithm = (unsigned char) psecuritypriv->dot11PrivacyAlgrthm;
+		psetstakey_para->algorithm = (unsigned char)psecuritypriv->dot11PrivacyAlgrthm;
 	else
 		GET_ENCRY_ALGO(psecuritypriv, sta, psetstakey_para->algorithm, false);
 
@@ -951,7 +951,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 		}
 
 		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
-		ph2c->rsp = (u8 *) psetstakey_rsp;
+		ph2c->rsp = (u8 *)psetstakey_rsp;
 		ph2c->rspsz = sizeof(struct set_stakey_rsp);
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 	} else {
@@ -1002,7 +1002,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 		}
 
 		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
-		ph2c->rsp = (u8 *) psetstakey_rsp;
+		ph2c->rsp = (u8 *)psetstakey_rsp;
 		ph2c->rspsz = sizeof(struct set_stakey_rsp);
 
 		memcpy(psetstakey_para->addr, sta->hwaddr, ETH_ALEN);
@@ -2027,7 +2027,7 @@ void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pc
 {
 
 	struct sta_priv *pstapriv = &padapter->stapriv;
-	struct set_stakey_rsp *psetstakey_rsp = (struct set_stakey_rsp *) (pcmd->rsp);
+	struct set_stakey_rsp *psetstakey_rsp = (struct set_stakey_rsp *)(pcmd->rsp);
 	struct sta_info *psta = rtw_get_stainfo(pstapriv, psetstakey_rsp->addr);
 
 	if (!psta)
@@ -2042,7 +2042,7 @@ void rtw_setassocsta_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct set_assocsta_parm *passocsta_parm = (struct set_assocsta_parm *)(pcmd->parmbuf);
-	struct set_assocsta_rsp *passocsta_rsp = (struct set_assocsta_rsp *) (pcmd->rsp);
+	struct set_assocsta_rsp *passocsta_rsp = (struct set_assocsta_rsp *)(pcmd->rsp);
 	struct sta_info *psta = rtw_get_stainfo(pstapriv, passocsta_parm->addr);
 
 	if (!psta)
-- 
2.25.1

