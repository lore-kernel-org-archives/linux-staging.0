Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70206D0E
	for <linux-staging@lists.linux.dev>; Mon,  9 Aug 2021 16:50:54 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id f5so6533299wrm.13
        for <linux-staging@lists.linux.dev>; Mon, 09 Aug 2021 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gfdfOq3fPaEyVy8vIu1pAlj6ZJZ6BE3vB+0GWCKQYmQ=;
        b=RKU4yacVmm8Lx3VEDg85AiVVqsnpvCsijrh7W/F+I30xYicCItP22F7hpTu8SD9Knm
         Jo7JGbfnqzIzHNAkhC03vApc5yQsY3hV7WQTrf7h5yPMGKlAhik/b7g4/XUHt4Ipc14D
         LcsALTh7nqX9e2+Tf0NjTL8b2N9oxLDMVheuj9B3/MhpNEp6uK+OBUNWXECBV7+xTtJ8
         ESVJzV1VeK9zToZy2tezzAWmIh8qaouue2MDB8L81U5EK+YsXbglb3Z0q8kNgwmB5c8i
         RC1kTXuoqvFRz3bc470C6mIrv5RgTBZGF9rzn5SR4/vHnqVETts+BSgDg36PlNheLKhP
         1VdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfdfOq3fPaEyVy8vIu1pAlj6ZJZ6BE3vB+0GWCKQYmQ=;
        b=m93fLmQ2p2nwbu5rqwOqCCQRR3ieb60cPiDNEdrpl6hubauYvYsXnLPNkK8l+XPhY3
         qyrUSWoNt031879uDG56g+QkfUneLtHUsybTnrgfS+otUo4Zs22dseJEOIEbe3g2nCOc
         hpw8daANqXFpAV5ir8ETGJRTnaSKTqyY2MOSS7w9jP3Nky2pD8RTWiNdVno155NvJ+D3
         VZubA7jfi0nv2Vm1M4C82Xdm1SqKsvD/5UpOlhwOYoAZQ1PPHGVy92aT6p6rj0cwT0Rv
         J6mmCTrV0ZlJEaIQhC6HAQ7gq3d/250BksvFbJiCRzUAdxY/GPC5l6yZCU1mcxDLWIQC
         yISQ==
X-Gm-Message-State: AOAM530fvv7FV8Gqi3EEdoFknZeGp9AyqqluldzCPuBm1UgM+6qrJkGu
	7qMlNKZd8aXPTVVgLxy3Yx0=
X-Google-Smtp-Source: ABdhPJwmDIiGavWc5Grj5GhdJlXCZr0tYjCpngDuINmooJu7VbSKMu2HCjYWhqVX3Nsg7RIw2/CuTw==
X-Received: by 2002:adf:bc52:: with SMTP id a18mr8935589wrh.176.1628527853203;
        Mon, 09 Aug 2021 09:50:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::996b])
        by smtp.gmail.com with ESMTPSA id q5sm20484469wrx.33.2021.08.09.09.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 09:50:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 08/17] staging: r8188eu: clean up comparsions to true/false
Date: Mon,  9 Aug 2021 18:49:58 +0200
Message-Id: <20210809165007.23204-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210809165007.23204-1-straube.linux@gmail.com>
References: <20210809165007.23204-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up some comparsions to true/false to clear chackpatch warnings.

WARNING: Unnecessary parentheses - maybe == should be = ?

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c | 4 ++--
 drivers/staging/r8188eu/core/rtw_mlme.c      | 2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index 1a4227729e0d..41c14a4cff1f 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -166,7 +166,7 @@ u8 rtw_set_802_11_bssid(struct adapter *padapter, u8 *bssid)
 
 			rtw_free_assoc_resources(padapter, 1);
 
-			if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+			if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 				_clr_fwstate_(pmlmepriv, WIFI_ADHOC_MASTER_STATE);
 				set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 			}
@@ -231,7 +231,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE)) {
 		if ((pmlmepriv->assoc_ssid.SsidLength == ssid->SsidLength) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.Ssid, ssid->Ssid, ssid->SsidLength))) {
-			if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false)) {
+			if (!check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 				if (!rtw_is_same_ibss(padapter, pnetwork)) {
 					/* if in WIFI_ADHOC_MASTER_STATE | WIFI_ADHOC_STATE, create bss or rejoin again */
 					rtw_disassoc_cmd(padapter, 0, true);
diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 4768d3ef350e..f28c30a6efb0 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -748,7 +748,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 0a755d7b8f19..018ee20553dd 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -740,7 +740,7 @@ s32 rtw_make_wlanhdr (struct adapter *padapter, u8 *hdr, struct pkt_attrib *patt
 	SetFrameSubType(fctrl, pattrib->subtype);
 
 	if (pattrib->subtype & WIFI_DATA_TYPE) {
-		if ((check_fwstate(pmlmepriv,  WIFI_STATION_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 			/* to_ds = 1, fr_ds = 0; */
 			/* Data transfer to AP */
 			SetToDs(fctrl);
-- 
2.32.0

