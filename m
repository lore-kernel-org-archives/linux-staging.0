Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4BF2C98
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 13:14:07 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id q2-20020a17090a2e0200b001a0fd4efd49so7661744pjd.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QweeGM4aqSjgNfs+asUhXTu86Il96HRIIEZ/a5PtZnc=;
        b=NT/km3+Yigt6OoB3H5RMs83c7Xs53jjfJWSfp3YsEmB7d21FlEhj6UDGVL+1qxPZOZ
         rreraVJGG5bJb8Cag8FMSLF+kiMNBJwOl3M98H0iXngcM0rl4rwjM1UiI3OGlwtb+Mbz
         LWqCDuUg7RRZ9uiWxilThsJQnIWMuxloomtrJGE8vfDTo51Ee4Fx6PAsRa5h8NboGVLz
         SUkZG2Km1ARlwGczRbDNYza/u1rFnkUDkafCan06JQTKQY8tziq9LZERoVUBlPRqbIbD
         XeS6Qedoy2HxmK33ecPec9hEQLjkTPtI2+6X1VyvPSqEbsPyHhQIvRsPY01KFWIq9jAB
         b3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QweeGM4aqSjgNfs+asUhXTu86Il96HRIIEZ/a5PtZnc=;
        b=nlFysRMrv362r/H5IERaKJdgHLmPrynSDRE7UEd16C7/66H+HF40Eaq8FKUKLRUPTV
         36slS2LHVrPIboiW8OELVeMe5JfpQ9ykrnEMjvMrIM3jfG4LS+kfLsssX42oWC1kTtIq
         N1Z43mmrXj4328INSbfphuOjxUL274XV8+Lo/tAR+LNJykEIeEEMETlkSoPFdNvlsWWv
         YpmAvrPhuYN6v2uwnFF30y6FAgmJa6E+KAT0ODfiwVk7WjQv0qhLsRLjWyxpwZRzgBY6
         lGJmBbMlwlQFFompLQAeRferoAdIGrrHJhfIKoCa5JR+P1QBR1cfZKc8fYJt065k2ZjN
         Ys3A==
X-Gm-Message-State: AOAM532+lZkGyqPlUoSx7NMSRuMOIoihDSnn9MH6+DK9jhZ3e8lC3viF
	GdEOC/8s8F17u2OMhu2WptVDw2Xek8jqyQ==
X-Google-Smtp-Source: ABdhPJx81G2JMJus9PahAl92Dd51u6CIUCMLFeBrW5Z7J1nbTqnAGzQDagcI/XDRnMm/l9qDEdDb3A==
X-Received: by 2002:a17:902:c410:b0:13e:cfac:45ad with SMTP id k16-20020a170902c41000b0013ecfac45admr11505841plk.68.1634908447432;
        Fri, 22 Oct 2021 06:14:07 -0700 (PDT)
Received: from localhost.localdomain ([115.96.219.100])
        by smtp.googlemail.com with ESMTPSA id mq3sm11932413pjb.33.2021.10.22.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 06:14:07 -0700 (PDT)
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
Subject: [PATCH v3 3/4] staging: rtl8723bs: core: Remove unnecessary space after a cast
Date: Fri, 22 Oct 2021 18:43:20 +0530
Message-Id: <528ac3f0fa7b164fe3c2a86d2476dad0f23f7181.1634906059.git.kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634906059.git.kushalkothari285@gmail.com>
References: <cover.1634906059.git.kushalkothari285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>

Changes in v3: Enclose the version number inside the square bracket.
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

