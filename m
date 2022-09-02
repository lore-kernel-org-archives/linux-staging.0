Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415831118
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:52:36 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id lx1so2727212ejb.12
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ThDb76+kZEC72ISvvHs25TvHqgP2beNaL5wxY8n7dsc=;
        b=NUjfOq9/5L6JJV9vJslddUmeS7AaRFkr6sq7xI5oNDsccB2aIuvLHNuJMg4wyof+oE
         7eK1TW/8FULpKamlM2neerduzBjYzxCGh3lNa389TOkGOZgtmJnFPMxghfdXhO/Y4z8i
         zDoHTUFvq8k8z0GQ/0KQedD84hZ7wDSCI0Ec/3Qr+aREoxLvqNArcapuzeI9OQXbiDJI
         P0yYoSpuU/JKHzF1Ln8zPAiqDupoId6KnskqbWRSPzrnovkk3nGnjoTKhti74M279vD2
         CY1xutNtVilPSitlh/dWJjBi82mbFFOGvBgqKrW62bqYJRqLdH5Y+tdoGCFdobv5eSyV
         77SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ThDb76+kZEC72ISvvHs25TvHqgP2beNaL5wxY8n7dsc=;
        b=3rH70F70bdL3FveLiKRR2+VOFTdgVzVrqMBrbgkDDPOBboZiVNfRO5IXmRMS6oX3kO
         IrZ/3scPuEpKcS9oLwClqIajPTNS1MLTHXs4CqpnjiVkseP8P6UGNRDE/UOlnjZqkKzF
         dH2kDUaUsXLlMPdiAcGHp6ISH8sv1L/U00376AFH2GCHR0Df9bFng5ELZXhbvyzdJ/x8
         kTnGHpH8Im8cGzdKcnQPvlZB8DRLmjFZOWmJwPcCNCG8jm+M8GBM1JYZTfcFw3TETJWe
         NmbbEw0DtZ3/P0WHjqG7VdPz3ovu75MmKrclf5gTFtcSpbe5+qeo6TBLFnrSN5zzXvRN
         xvgg==
X-Gm-Message-State: ACgBeo39d/UJ+RTw11ULiasT+fGbsNl5kkH9e8xgx2q1Yxkk/bKoNZfH
	RCFQUhRoAxeKa7nsxD9gf4U=
X-Google-Smtp-Source: AA6agR5zCoNE6sH+KYkTSJ2nPQ/wNsIebIEN4dcGZhqUWHmM/Uy+L1R5TGLi9CJOyVZmVMrYjw1Kxg==
X-Received: by 2002:a17:907:9620:b0:730:d5f4:d448 with SMTP id gb32-20020a170907962000b00730d5f4d448mr26586297ejc.45.1662112354552;
        Fri, 02 Sep 2022 02:52:34 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-83.ip.prioritytelecom.net. [217.105.46.83])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b0073d6234ceebsm959601ejx.160.2022.09.02.02.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:52:34 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 01/10] staging: rtl8723bs: delete rtw_setdatarate_cmd
Date: Fri,  2 Sep 2022 11:51:51 +0200
Message-Id: <bfc4c5c9aec8b026fd3cf092354d508881d790fc.1662111798.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662111798.git.namcaov@gmail.com>
References: <cover.1662111798.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function rtw_setdatarate_cmd because it is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c    | 29 ---------------------
 drivers/staging/rtl8723bs/include/rtw_cmd.h |  1 -
 2 files changed, 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b4170f64d118..a5e66b9868ad 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -593,35 +593,6 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	return res;
 }
 
-u8 rtw_setdatarate_cmd(struct adapter *padapter, u8 *rateset)
-{
-	struct cmd_obj *ph2c;
-	struct setdatarate_parm *pbsetdataratepara;
-	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
-	u8 res = _SUCCESS;
-
-	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
-	if (!ph2c) {
-		res = _FAIL;
-		goto exit;
-	}
-
-	pbsetdataratepara = rtw_zmalloc(sizeof(struct setdatarate_parm));
-	if (!pbsetdataratepara) {
-		kfree(ph2c);
-		res = _FAIL;
-		goto exit;
-	}
-
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pbsetdataratepara, GEN_CMD_CODE(_SetDataRate));
-	pbsetdataratepara->mac_id = 5;
-	memcpy(pbsetdataratepara->datarates, rateset, NumRates);
-
-	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
-exit:
-	return res;
-}
-
 void rtw_getbbrfreg_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 {
 	/* rtw_free_cmd_obj(pcmd); */
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index 1bf030cbbbbe..0af8215e2f2f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -591,7 +591,6 @@ extern u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8
 extern u8 rtw_joinbss_cmd(struct adapter *padapter, struct wlan_network *pnetwork);
 u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue);
 extern u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrastructure networktype, bool enqueue);
-extern u8 rtw_setdatarate_cmd(struct adapter  *padapter, u8 *rateset);
 extern u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
 
 extern u8 rtw_gettssi_cmd(struct adapter  *padapter, u8 offset, u8 *pval);
-- 
2.25.1

