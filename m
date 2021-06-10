Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F002FB2
	for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 15:52:24 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id im10so14087327qvb.3
        for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 08:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q71sfuDpSTxt6fvWZzA8RCfU/BngLdxXFJt4It6rlCA=;
        b=i5HkU28Ey4Su/dHHODoPLy4Sgc+xzjtfBXCh3i3RI2bYzRydfGenqCvZ0MlKDM55t9
         ZUe23/wol7VecXZLTRSmYkppH11icZKzBTRjNssGTlez5pz3BdADTCVogciwPW/OOPJz
         GwL8XSN5MDwep6/aN8o0/hiZ19y26sD+cX6q/OccrI5ebnc/PjZbxPfGBv6VDATra/NO
         /30PrXDTFhs+56xDME4nZk8lWClz8MVZTvjjwXaWeCTYM5lH1Kr7fCjAneFtbLMFO3TZ
         H1Y0BCQNuZGnOS8idqC8VoRb8tO7lAh13J/ZNO3gv/rUQ9qpO8PLaVr2rHoFXY20f2MJ
         NKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q71sfuDpSTxt6fvWZzA8RCfU/BngLdxXFJt4It6rlCA=;
        b=onxL8aRYxIitHRzyrNS9uehoGgGTC7yPvSDW00y66/WrOQTc0kNdYwoqXWD7K5p3aV
         K8FP9+NENMqqRCTT59dICe8iDETK/vkGCgTsMhJPLk5+uv952L4TneRsfRpcWSAEkLes
         F+7/pqYom3+3pRSedi0U5xQCffHN1tc+wRZR/vS+a4BIOxRKDx/KVcdnmRRCvtkFzzz1
         8Dyj0NUzEkgSLmdscCTs+VzBkURxHk17AqdgoI4C72mnoE1fgrwuib3igRRVVNgbQKCJ
         8nRyDMdR1gWNZnP7k9Zbi5uASvsQRFaSN2ZHRsy81TsMhJOLQ8RAg1Kje0gdlsINjDmx
         1Z0w==
X-Gm-Message-State: AOAM531PF3u+jvqr56wMUOA0DgTQBRcEZ3ri6phgpP8gucD7ke+2NsTw
	CFEycWB76xpwIDThSPJByl8=
X-Google-Smtp-Source: ABdhPJyuzPPJ4F7bcLYDiWuzjYBZPTpualxUehhHy8yyykk3/11N9INnjtP/6/zscPSQ24+ZsM7Bug==
X-Received: by 2002:a05:6214:80a:: with SMTP id df10mr317569qvb.8.1623340343855;
        Thu, 10 Jun 2021 08:52:23 -0700 (PDT)
Received: from ubuntu ([191.96.170.82])
        by smtp.gmail.com with ESMTPSA id c26sm2457647qtj.41.2021.06.10.08.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 08:52:23 -0700 (PDT)
From: Philippe Dixon <philippesdixon@gmail.com>
To: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: Philippe Dixon <philippesdixon@gmail.com>,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: rtl8723bs: core: add blank line after variable declaration
Date: Thu, 10 Jun 2021 08:51:15 -0700
Message-Id: <c5eedc7a5298b05beb576b7b9e108794ca7bb58c.1623339773.git.philippesdixon@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623339773.git.philippesdixon@gmail.com>
References: <cover.1623339773.git.philippesdixon@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

WARNING: Missing a blank line after declarations

Signed-off-by: Philippe Dixon <philippesdixon@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index f82f8289bf3b..3199386f5850 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -223,6 +223,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
+
 		if (c2h && c2h != (void *)pevtpriv)
 			kfree(c2h);
 	}
@@ -563,6 +564,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	/* prepare ssid list */
 	if (ssid) {
 		int i;
+
 		for (i = 0; i < ssid_num && i < RTW_SSID_SCAN_AMOUNT; i++) {
 			if (ssid[i].SsidLength) {
 				memcpy(&psurveyPara->ssid[i], &ssid[i], sizeof(struct ndis_802_11_ssid));
@@ -574,6 +576,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	/* prepare channel list */
 	if (ch) {
 		int i;
+
 		for (i = 0; i < ch_num && i < RTW_CHANNEL_SCAN_AMOUNT; i++) {
 			if (ch[i].hw_value && !(ch[i].flags & RTW_IEEE80211_CHAN_DISABLED)) {
 				memcpy(&psurveyPara->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));
-- 
2.25.1

