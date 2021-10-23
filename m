Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71CE2C98
	for <linux-staging@lists.linux.dev>; Sat, 23 Oct 2021 07:37:38 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id o4-20020a17090a3d4400b001a1c8344c3fso5272552pjf.3
        for <linux-staging@lists.linux.dev>; Sat, 23 Oct 2021 00:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MPnz3NtbdWVH33KNLzBSBKBvsqzVWtkwV9sLj0e2Gwg=;
        b=cQrhRNpj6Mt8WAH4g+XXFcylw6gwNfowP1IfY6qM6tjvcOjcL6bQd740dSxBCflylu
         z1T9iyZHWNShR8Gzx42hFtKIVt3Iot7OGeui86BMhC82TC9HbaULF1qo602Lf6Pphe4f
         8pMn3LlZ2QPlydYqQEjEeqyKl5Z8yiqwEEm2C9NikMoiBT9n+hUqXUi6eb3IntpVvXxw
         3PS4A5mp82WUzjlr/NQ6aOeCxT+vk/apOnVWzzrNNjCqLe/1q8ZwT8WHBBMFZ6O2yk2Y
         yM5EwD++q2oN/0sX3gU2Dp4amMTM5fhUjjf6m3+xFyfXxWHOq/tazhN+mxsMF3pM/iNA
         QHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MPnz3NtbdWVH33KNLzBSBKBvsqzVWtkwV9sLj0e2Gwg=;
        b=GFmyuLwGzu4Fgsowj1iZO4uTBg059MiY7JDzRJgfGxnjv9FahgDH84YlFYcVbG8da3
         u8xUtnGmvGah3Zi7zBl4QMiKCIpJFqgi3feqM2S4pBt++/jN+OXa0bvk9i1RpAXJ6qBv
         cPZIZ//UHy5/4upWroHDWpeey6vKcN6ern/RUOFGwkciFqyigXSCZZf+HBetJG4ERLcD
         UESINxeOPrR/pd8LZUUJ/GreyDlQUL0odShKUHGdm9358FuM4qd9JF9GsP/y9Pv6tg2T
         Emdr6KNXjTX+QgvAgp0qi/HWHy5+LlI6UBDKecthSNQFowdzdH60U2OwZujs72aqKPZS
         n4Ng==
X-Gm-Message-State: AOAM531yB5DYxqAxXQ/r8wa6AizSW0sEBzPaqV3x1C+bnwJbyFtRXnHd
	sZRJ5H18x6byOFySnJRhxhU=
X-Google-Smtp-Source: ABdhPJzYZYT+8x0WJhPqyfjw8H14JB075VG3So3H7qTwCyYbGyEhM/+nzmdIEqjupBJ9+150Qcja5w==
X-Received: by 2002:a17:90a:4a85:: with SMTP id f5mr20170467pjh.92.1634974658427;
        Sat, 23 Oct 2021 00:37:38 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:5173:67c9:d8e4:2819:8ee8:8de4])
        by smtp.googlemail.com with ESMTPSA id c4sm13949791pfv.144.2021.10.23.00.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 00:37:38 -0700 (PDT)
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
Subject: [PATCH v4 3/4] staging: rtl8723bs: core: Remove unnecessary space after a cast
Date: Sat, 23 Oct 2021 13:05:49 +0530
Message-Id: <baa1703e0c202dfb90e215b63b535161bd3ccccb.1634967010.git.kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634967010.git.kushalkothari285@gmail.com>
References: <cover.1634967010.git.kushalkothari285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove useless space after cast

Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>
---

Changes in v4: Move the version notes
Changes in v3: Enclose the version number inside the square bracket.
Changes in v2: No changes

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

