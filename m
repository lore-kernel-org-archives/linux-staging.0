Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A286D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so275522wml.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X3H3j6UjtB5ptVMptuAkOd92kZZ/Jh1ArquSKwjHAMc=;
        b=iWBCSZBwvcI+AUzpxU+yO/ibb62xgHiSMNvuhC4JkfjqIZ7vFf4Oyo9vniM2JylC4g
         ayJILyLbF7SB/QP223cZv637/BHPpv0yvXwGCWi5P+aEPQ6wcAgWxkFGI67kkfv0ygpn
         Im9QHDphl1jOrILZ2aImpiGuUCtDy56MIbk0c5/paVgoqGsdPkSWfpMWg/SAYwCvXsha
         Z/VVJ4OiOjg60Lf7a0fzuOe4a7M9YMq8KJMQ6qX55CF/+ImhmaHuLtuy1NZ+7kwox1Ty
         DUq5cxZAG+NsxBSdD2HIyhMPuv9NPm4rKDSlGpfQtlYYBtEGF8+vVSNGxZsxsI7aFZ1o
         3V3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X3H3j6UjtB5ptVMptuAkOd92kZZ/Jh1ArquSKwjHAMc=;
        b=QOxd00nKXE3YTgVrDR1mJ9F9eftO6W+5anh4PczOMjUqOyig1+ad+/1fQxTl07y6Qh
         LQMlsl6afP+ArNde5kkSPpmMOTPWcpEX52aiwWhDSpQlLCXQLXhmu0dc28wLeGXtrxJE
         pF/PDx7fridYD5bygz1paN2eEBQ8LItG7/v230AntNGEjRhRv+iUbHi+W3axcEE2scMJ
         Wnw2Qn0aVFaZmAwnWJVtrTqCqAppgSVzMI/hLN1sWvOIN4J22EbG+vV7aIoGt+Rq0qwm
         ztjs2fh066kUHRm7z1h/+GDmHuFYACqj/jpPGsp5dA1H/otjRgbixzu3BuYaNGpC5AcG
         7trw==
X-Gm-Message-State: AOAM5339w+o+5F4Z/98WWg4MEnMD42URvPudZSW90t6ZkTMuXcus3sS4
	DYbhEFmhleIF+cMeDZCUQjc=
X-Google-Smtp-Source: ABdhPJyxhBBTZ8KxBad1AhczrfAdPq1eXCooaFTDzFSbagLG5RVJqgUe/XbKn8Snud6GhwwmtuikSA==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr15941071wmi.177.1629129561474;
        Mon, 16 Aug 2021 08:59:21 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:21 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/23] staging: r8188eu: clean up spacing style issues in core/rtw_cmd.c
Date: Mon, 16 Aug 2021 17:57:59 +0200
Message-Id: <20210816155818.24005-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up spacing style issues in core/rtw_cmd.c reported by checkpatch.

CHECK: spaces preferred around that ...
CHECK: No space is necessary after a cast
WARNING: space prohibited between function name and open parenthesis '('

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 65ca4a2895f8..7c640c8148f6 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -16,7 +16,7 @@ Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
 No irqsave is necessary.
 */
 
-int	_rtw_init_cmd_priv (struct	cmd_priv *pcmdpriv)
+int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	int res = _SUCCESS;
 
@@ -38,7 +38,7 @@ int	_rtw_init_cmd_priv (struct	cmd_priv *pcmdpriv)
 		goto exit;
 	}
 
-	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((size_t)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ-1));
+	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((size_t)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ - 1));
 
 	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_KERNEL);
 
@@ -69,7 +69,7 @@ int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 	_init_workitem(&pevtpriv->c2h_wk, c2h_wk_callback, NULL);
 	pevtpriv->c2h_wk_alive = false;
-	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN+1);
+	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
 
 	return res;
 }
@@ -87,7 +87,7 @@ void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 	}
 }
 
-void _rtw_free_cmd_priv (struct	cmd_priv *pcmdpriv)
+void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 
 	if (pcmdpriv) {
@@ -149,12 +149,12 @@ u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	u32	res;
 
-	res = _rtw_init_cmd_priv (pcmdpriv);
+	res = _rtw_init_cmd_priv(pcmdpriv);
 
 	return res;
 }
 
-u32	rtw_init_evt_priv (struct	evt_priv *pevtpriv)
+u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
 {
 	int	res;
 
@@ -801,7 +801,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	t_len = sizeof(struct wlan_bssid_ex);
 
 	/* for hidden ap to set fw_state here */
-	if (!check_fwstate(pmlmepriv, WIFI_STATION_STATE|WIFI_ADHOC_STATE)) {
+	if (!check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_ADHOC_STATE)) {
 		switch (ndis_network_mode) {
 		case Ndis802_11IBSS:
 			set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
@@ -832,8 +832,8 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	psecuritypriv->authenticator_ie[0] = (unsigned char)psecnetwork->IELength;
 
-	if (psecnetwork->IELength-12 < 255) {
-		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->IEs[12], psecnetwork->IELength-12);
+	if (psecnetwork->IELength - 12 < 255) {
+		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->IEs[12], psecnetwork->IELength - 12);
 	} else {
 		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->IEs[12], 255);
 	}
@@ -1010,7 +1010,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, u8 *psta, u8 unicast_key)
 	memcpy(psetstakey_para->addr, sta->hwaddr, ETH_ALEN);
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
-		psetstakey_para->algorithm = (unsigned char) psecuritypriv->dot11PrivacyAlgrthm;
+		psetstakey_para->algorithm = (unsigned char)psecuritypriv->dot11PrivacyAlgrthm;
 	else
 		GET_ENCRY_ALGO(psecuritypriv, sta, psetstakey_para->algorithm, false);
 
-- 
2.32.0

