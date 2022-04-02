Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4631363;
	Sat,  2 Apr 2022 08:51:26 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id b17-20020a0568301df100b005ce0456a9efso3692292otj.9;
        Sat, 02 Apr 2022 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ldid4ljpTipmsQhOv6JPWoqFhKtbXsLDYhk2KntAovc=;
        b=KAFQGvZ0NJ9rVgGYrPkiRPInodeyew81EEkXVadDRY8N6ktZRH5Iqs0gGptd9EAKuV
         6DEo+8wnwOddDm5nibVVRniAPDTbdG17FbEYMgEA+AbRQwJ/wzei2H3fxkHWEZ0ULFis
         KOZsrbpkCnfNEPpgbO4LXQnlQHw7QBL18Yqo0mPBEYs2rv1vhRW/sz59H95Jdsh4F6NO
         pPxC15AqnyFI8YjGJhBU6ekW88/fQk015anivwUZIZeIvTB6Rh0RCsp+bXIi0/ua1ZTl
         hOaPZC82HOlxvXkey8SypmVvqqbyOcrjYe9WUxDANfP0q7Y9QWCn1RQQxfWn7gNRG+5Q
         807Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ldid4ljpTipmsQhOv6JPWoqFhKtbXsLDYhk2KntAovc=;
        b=JwjRNfGIkEpgOla1dr9nl1qaW73rpwQiMbUYMX+tX+NAQ2M39LOO3EvnSeG1RaISvx
         g0F5oYhuGhxPIqqGrrhqckqZEH0fqdz6BBWfFoKXH8sWHG5NT8B0XY6/LrvPpnMrrnxo
         qMth74S8r5slMSzVA3tZBqPG2gpXWtIWR6q79ahIG4eqvCaSX1Ffi+ezAM0sonUcwpGs
         oxE65X8mE1rwAM5Vqrw/Bdn+uLZ3oWUZZjuJHW/r8R2xKT1tqUG6Qdv72sNNCQEcLI7i
         qEFTOVBJYKgu7N7MBwdRdwHTgVQ4rznNgcT+rsx/g21aPUNENstQ//ITEAgkXGIUu5cR
         zQ6g==
X-Gm-Message-State: AOAM532ytdspTauXsIXkLFDSNjfqJ3AqEmciEdQDq7+cO0Nb3V+WfVS8
	FCyCoSEwu1UFG/1PNjgaIsU=
X-Google-Smtp-Source: ABdhPJzJtFaXbMcy+64yaYYRroXmyTyK8j8Gkg7Uj2Kv573XC8okNjixo4oiA7R0G6MyTG46ipjrAQ==
X-Received: by 2002:a9d:7d96:0:b0:5cd:ae1e:3043 with SMTP id j22-20020a9d7d96000000b005cdae1e3043mr8942959otn.284.1648889485183;
        Sat, 02 Apr 2022 01:51:25 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id g25-20020a544f99000000b002da70c710b8sm1947556oiy.54.2022.04.02.01.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 01:51:24 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 6/6] staging: r8188eu: remove spaces before tabs
Date: Sat,  2 Apr 2022 03:50:48 -0500
Message-Id: <2fd10f393e3bc7381a85d0bfc1ec04a80af4eabb.1648888462.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1648888461.git.remckee0@gmail.com>
References: <cover.1648888461.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conform to Linux kernel coding style.

Reported by checkpatch:

WARNING: please, no space before tabs

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 832bf25b1a83..8ae25cb4246b 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -548,9 +548,9 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	phtpriv->ht_option = false;
 	if (pregistrypriv->ht_enable) {
-		/* 	Added by Albert 2010/06/23 */
-		/* 	For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
-		/* 	Especially for Realtek 8192u SoftAP. */
+		/*	Added by Albert 2010/06/23 */
+		/*	For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
+		/*	Especially for Realtek 8192u SoftAP. */
 		if ((padapter->securitypriv.dot11PrivacyAlgrthm != _WEP40_) &&
 		    (padapter->securitypriv.dot11PrivacyAlgrthm != _WEP104_) &&
 		    (padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
@@ -1010,7 +1010,7 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 	u8	res = _SUCCESS;
 
 	/* if (!pwrctrlpriv->bLeisurePs) */
-	/* 	return res; */
+	/*	return res; */
 
 	if (enqueue) {
 		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
@@ -1151,8 +1151,8 @@ u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType)
 	}
 
 	pdrvextra_cmd_parm->ec_id = P2P_PROTO_WK_CID;
-	pdrvextra_cmd_parm->type_size = intCmdType;	/* 	As the command tppe. */
-	pdrvextra_cmd_parm->pbuf = NULL;		/* 	Must be NULL here */
+	pdrvextra_cmd_parm->type_size = intCmdType;	/*	As the command tppe. */
+	pdrvextra_cmd_parm->pbuf = NULL;		/*	Must be NULL here */
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
 
@@ -1378,8 +1378,8 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 		p2p_ps_wk_hdl(padapter, pdrvextra_cmd->type_size);
 		break;
 	case P2P_PROTO_WK_CID:
-		/* 	Commented by Albert 2011/07/01 */
-		/* 	I used the type_size as the type command */
+		/*	Commented by Albert 2011/07/01 */
+		/*	I used the type_size as the type command */
 		p2p_protocol_wk_hdl(padapter, pdrvextra_cmd->type_size);
 		break;
 	case CHECK_HIQ_WK_CID:
-- 
2.32.0

