Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E5A2FAE
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:32 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id t28so6737308wra.7
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xyZGisBD3DW4oYzcr+S2RkmqV081EMO9g7OlIFtR4uE=;
        b=VyMGhuUmGkvIp72iMTLrAUaHspZP+lxyxSILXZ8cePLfbNfiEP13WVKZyFrb/VdcO3
         P9ijgvTTRqw4/UN8WmWL+ZaE/QDoKS34T3cIK3jKPyXbUk9Z7kya0BtwSm9x5plQBHGJ
         zr7hbtLsz9PvOjQ1wBQtIhVxCgBTadN4cwjC6eB3rKN5ai2AIdd8bkbMG6vFkXvrOr5P
         fqGjI7kwUi63/ELRvpg9Gd7orO+l1Tl/LZhcS+yk1yapyN0j9qEnQgp9QLkZahO81QJa
         1bsldJk2I1QHVVvW6iuNJ2fTck01BE/RfM1SzCk8ppYQ9saVu6M4+XULv0ZRRJr8brgP
         xAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xyZGisBD3DW4oYzcr+S2RkmqV081EMO9g7OlIFtR4uE=;
        b=z6Ak1cmMcJHhioBbaH8K7YE/io5jWZEuGgTSe3ynApCIeZnHTG8q+GseugKtlg+ZvI
         WHKGzCguuz+RVH7KdANM1s1T0o42b4qbjO7IVj5KluCrDoJ3IBPlJhfohgGz5SFEGfSH
         TjVNyvsYeuNPsIwlMlCKJb2DlgmvCVvOMLyRS0IekwGeJY4j6A3p80whChOU520ikdGM
         XIIHW8AzeW5N7+k/3ZDPN8nC/qFavWTrOGYAXbJCMz/oalu6yFG/4Yk1xurlSETa5U+c
         Yl7bf0ULUKmKPuGSaXpP39fd1+MiU/EYPzurIIb4G5kvK7qiK810bJMww78e3micqTcE
         AtCQ==
X-Gm-Message-State: AOAM532PbyQw9RPZgpxW8n1go12T7TRwSddc6Ufl2BYLskgRBpzZC7ug
	g96FV/NMgK6zrzdDNPeNPo8=
X-Google-Smtp-Source: ABdhPJwndNK0biCeBUeSTQOoKjIYzudaaf08OXzEYBc/xmdDTM8CLBYO+KC06yRqAixbHkbC9xdtfw==
X-Received: by 2002:a1c:9d07:: with SMTP id g7mr6313029wme.76.1632424171160;
        Thu, 23 Sep 2021 12:09:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:30 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/17] staging: r8188eu: remove rtw_createbss_cmd_ex()
Date: Thu, 23 Sep 2021 21:09:05 +0200
Message-Id: <20210923190920.3580-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923190920.3580-1-straube.linux@gmail.com>
References: <20210923190920.3580-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_createbss_cmd_ex() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 26 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  2 --
 2 files changed, 28 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 4b149425cff7..972c47136b1c 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -717,32 +717,6 @@ u8 rtw_createbss_cmd(struct adapter  *padapter)
 	return res;
 }
 
-u8 rtw_createbss_cmd_ex(struct adapter  *padapter, unsigned char *pbss, unsigned int sz)
-{
-	struct cmd_obj *pcmd;
-	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
-	u8	res = _SUCCESS;
-
-	pcmd = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
-	if (!pcmd) {
-		res = _FAIL;
-		goto exit;
-	}
-
-	INIT_LIST_HEAD(&pcmd->list);
-	pcmd->cmdcode = GEN_CMD_CODE(_CreateBss);
-	pcmd->parmbuf = pbss;
-	pcmd->cmdsz =  sz;
-	pcmd->rsp = NULL;
-	pcmd->rspsz = 0;
-
-	res = rtw_enqueue_cmd(pcmdpriv, pcmd);
-
-exit:
-
-	return res;
-}
-
 u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 {
 	u8	res = _SUCCESS;
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 7923749ae7bd..ce47ad21c087 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -750,8 +750,6 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 		      int ssid_num, struct rtw_ieee80211_channel *ch,
 		      int ch_num);
 u8 rtw_createbss_cmd(struct adapter  *padapter);
-u8 rtw_createbss_cmd_ex(struct adapter  *padapter, unsigned char *pbss,
-			       unsigned int sz);
 u8 rtw_setphy_cmd(struct adapter  *padapter, u8 modem, u8 ch);
 u8 rtw_setstakey_cmd(struct adapter *padapter, u8 *psta, u8 unicast_key);
 u8 rtw_clearstakey_cmd(struct adapter *padapter, u8 *psta, u8 entry, u8 enqueue);
-- 
2.33.0

