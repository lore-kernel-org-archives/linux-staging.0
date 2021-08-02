Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2E370
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 01:01:00 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id x14so22180131edr.12
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 18:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cm0KptdwqXyK8TKHm7XLOYj0tPg3467M28lr2Jc9UKw=;
        b=NMGzGGll+c8iBi74hvvQphtdZMvCr/lFuC9oAc02SMtvdeC9I1M7//GaegrTqgCh9P
         WS8s1Do6DBBEGhxirmyFDPVAVApkJ/Pnb/kpN50Qi8DKezPnq/r8pRfrIl+hNBr30rr4
         1trn73kZbWsD+9tbGrVhry3tP49kYH8AiyTzssYt53c+CnWAqsgrtxZ0ZfweD7bRx0Bu
         lOnJtcYdkssF+pawKmOrPa3YKTpmS1+Em78NIhPfFhGtppD1ffOntpznkkYX3gMvxMB1
         gYXImrQo2gEQfn7ydaIO1jGCGwqMXk5YGA4RI2T4fZnxGq0Jqce5PNPocKc8SEbAaQY/
         fUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cm0KptdwqXyK8TKHm7XLOYj0tPg3467M28lr2Jc9UKw=;
        b=RPxgcVpK1GWK/KeQ200InrbdNAw/HIChT9OBDE0ny5n7HJe/s2sT3ZtOHUWa9S1l6b
         v6DyYjP1vd4Pbj7ugct7DWsg5xb7SddJ2OmZXsQdpH855VvUBu11HGeLBNNdNfKGLvPb
         xVkH84w9WOgeak60wTFlyqgOc+Irj4ukF5zwILuQMslGkesZncB/kA0XhKM2EcSnEsNo
         FEBuo5WsJ4cdBKkxIBBqAei6T2ssvjr3uyPRciKgq76sPZhHrkGIn2GWlV4Q8/8MFEYB
         zkcfqjK9Ce5fsnIuD/142N/bIH0iqNbiST1yYrDVTFlrJTO5sDIRVtHW59+NX27pDQ3k
         o91w==
X-Gm-Message-State: AOAM533OWu4Qc8TTK91ISbzFwEvv+3hckuhSuA2vGj3rMiBQmRgeq+74
	2kO8jrg3smE+5rN2QTSSp8o=
X-Google-Smtp-Source: ABdhPJynj8LmyDz/Daft4vU1vB7w1EuZ83MIj7eQXyeFaMRRI6EUc3/+ILVAb66BYJIUO4EkHTXZlg==
X-Received: by 2002:a05:6402:c81:: with SMTP id cm1mr16718210edb.355.1627866059365;
        Sun, 01 Aug 2021 18:00:59 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id dh8sm4898756edb.14.2021.08.01.18.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 18:00:58 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Remove set but unused variables
Date: Mon,  2 Aug 2021 03:00:56 +0200
Message-Id: <20210802010056.20543-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but unused variables. Issues detected by sparse.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c        | 4 ----
 drivers/staging/r8188eu/os_dep/osdep_service.c | 3 +--
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index d692f1477cc8..dfe7a3621efe 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -759,7 +759,6 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 {
 	struct	mlme_priv *pmlmepriv = &(adapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext;
 	u8 timer_cancelled = 0;
 
 	spin_lock_bh(&pmlmepriv->lock);
@@ -854,9 +853,6 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 		p2p_ps_wk_cmd(adapter, P2P_PS_SCAN_DONE, 0);
 
 	rtw_os_xmit_schedule(adapter);
-
-	pmlmeext = &adapter->mlmeextpriv;
-
 }
 
 void rtw_dummy_event_callback(struct adapter *adapter, u8 *pbuf)
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 99ddc535e5ea..f1257999e855 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -390,7 +390,7 @@ u64 rtw_division64(u64 x, u64 y)
 
 void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 {
-	u32 ori_len = 0, dup_len = 0;
+	u32 dup_len = 0;
 	u8 *ori = NULL;
 	u8 *dup = NULL;
 
@@ -409,7 +409,6 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 
 keep_ori:
 	ori = *buf;
-	ori_len = *buf_len;
 
 	/* replace buf with dup */
 	*buf_len = 0;
-- 
2.32.0

