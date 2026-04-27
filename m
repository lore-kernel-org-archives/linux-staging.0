Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BD93EF673
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312753; cv=none; b=uEe2ST1Gbft+6/okeidcguxQJ+W8RNzZFLAbua/EAS54aW5xTfioUQsT00+62H1kBbdAC0ABGPFwVxXxif+39MxwW4Te1uu9rCRFwTMKAgse7WZsajpfE1ZI4nX0gcqvixzSAD0KOsCRhRS9MbmwiJnGSiWe+kpOJtFOfvmErBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312753; c=relaxed/simple;
	bh=hnipkFuTSgSFBTOmZvj6cGn7Zy6TxtOQRJwzog5EKos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUUZ8edDvIGEX9ne8uMW21+cZkHHevooE5VNZj9f+UWdWhq1PQrFB6Yk+KkmOxBQ8zWW+nWjO15g91hLz+Fahvlf1n9ePapOWyx3fHlfhnfSOzHqxEqF4mk3BqSX007T7OeQAoUe8DVQGkWtcnzf2UiN5bAKeowlv+cjVoRzXhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MUdHq4Qe; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MUdHq4Qe"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g4BCJ2Rcnz9tf7;
	Mon, 27 Apr 2026 19:59:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777312748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7GITjA3DjbZ3N94v+zs4PgBu83HLzItyke1cDNc/I+k=;
	b=MUdHq4QeA5EJctw9a5uWvyYxWNIrsQZq5AwX9/g5sCXVrNsGABHxriFsF+UCTR72n6vjNp
	N7tQIvnSSi0Sse2SGEla7eCYwatupVKsr7PD/EDlAWDv7GxRjnTOyyhFi3xy8Ks0+VWNpr
	S3of6ZEHlNZs137z+WkoN1ElqFBZHvXzbmhNhJHjl7v98bUNVBbkNogKS/ofNyx7QOatPT
	iFyvZUCXyjJFqYb637Lcm4iAR7FY4rPwoy7fhIofWLAcNmkEN6g6cc0TQwA954uV+fvbVp
	d6ig5U7l9yQ3JpvFR/J7S0XvaalbP0UB8JxoZw6PkoRW7bJd9hT33F3+zcouiQ==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v6 8/8] staging: rtl8723bs: wrap lines exceeding 100 characters
Date: Mon, 27 Apr 2026 20:58:46 +0300
Message-ID: <20260427175846.23470-9-khomenkov@mailbox.org>
In-Reply-To: <20260427175846.23470-1-khomenkov@mailbox.org>
References: <20260427175846.23470-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 98328176cbae19cd059
X-MBO-RS-META: 8yctc39irfrcussy7ad4knn51k3xc5hu

Wrap lines exceeding 100 characters to improve code readability
and conform to the Linux kernel coding style. This fixes the
LONG_LINE issues identified by checkpatch.pl.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c         | 6 +++---
 drivers/staging/rtl8723bs/core/rtw_recv.c         | 6 ++++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c         | 3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ++-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 ++-
 5 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4381df2b89d6..c07609f63e5d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1757,9 +1757,9 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 		goto exit;
 
 	if (rtw_to_roam(adapter) > 0) {
-		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms ||
-		    !is_same_ess(&competitor->network, &mlme->cur_network.network)
-		)
+		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >=
+		    mlme->roam_scanr_exp_ms ||
+		    !is_same_ess(&competitor->network, &mlme->cur_network.network))
 			goto exit;
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index d61b0fd4bfcd..b3a38ffa6ef7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -399,7 +399,8 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			if (bmic_err) {
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
-				if (is_multicast_ether_addr(prxattrib->ra)  && (prxattrib->key_index != pmlmeinfo->key_index))
+				if (is_multicast_ether_addr(prxattrib->ra) &&
+				    (prxattrib->key_index != pmlmeinfo->key_index))
 					brpt_micerror = false;
 
 				if (prxattrib->bdecrypted && brpt_micerror)
@@ -2170,7 +2171,8 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
-		    !is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
+		    !is_multicast_ether_addr(prxattrib->ra) &&
+		    prxattrib->encrypt > 0 &&
 		    (prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt) &&
 		    psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
 		    !psecuritypriv->busetkipkey) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 037a426ed15e..5251b12991ac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -424,7 +424,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	} else {
 		while (true) {
 			/* IOT action */
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && pattrib->ampdu_en &&
+			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) &&
+			    pattrib->ampdu_en &&
 			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index f8ba55e22638..b4dd9e9d41be 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -998,7 +998,8 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
+	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE |
+					       WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
 		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
 	}
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index de7b3179afdf..6c7b584ef023 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1210,7 +1210,8 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	spin_unlock_bh(&pwdev_priv->scan_req_lock);
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
-		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY | _FW_UNDER_LINKING)) {
+		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY |
+					     _FW_UNDER_LINKING)) {
 			need_indicate_scan_done = true;
 			goto check_need_indicate_scan_done;
 		}
-- 
2.53.0

