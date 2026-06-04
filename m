Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79861355F57
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780599942; cv=none; b=JYli+282gq2hJjJWGXjUK8aqxKhhiIzFASdJl65C4/vj2H0TcXQW2NvNxcNJuOE4jj2ueI6Gtcn4xM/rb+zu0kyMDDIPL6cI93j6aCUSIKN4/ODX9wUOodamqqOLYDX6ytuU2edA0nUHh8X3r3XzWS0ro7bbyNKn7akyktrWPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780599942; c=relaxed/simple;
	bh=t7HTSXQedCZiYZaYzlpBFRKtS8iVv2rqPb54+tDX3TM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C+pN/sOURy4m3wExf/YUdAbDa7mGxpMoJ/X5rE5Z5XaLRRd0cvpnEAhIlTGSms39RNv20JSO+0nqNX53pf3g9L9gyV1P+pAlAIy48kXnsY5ENyhLX8IwNNI8iu7ZJJKXeMFTYNhOaTOIOUOnVfdFKS85fVlRsB33ybBPqe/i948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhvpzCRl; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhvpzCRl"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso840581a91.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 12:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780599941; x=1781204741; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ffqDjSgGQ5QaASBEo3eqt9MQXd5NnLhzD6IscnM1OA=;
        b=DhvpzCRlKIThfcVNtDziqZBhrM1JF//Ixv34PPmDmBVftZR7BMcnbS8NDnIbZwnUyn
         x8E3xDjgGF4qr3dV5GUeJ3jJhONHC3+Wn/K98G3Bh5P9d9fE40mCHuLHIViZc7JruzO3
         MwcCf0SS8K/uX6VKGJUkTLUtqJ4C0/bTVToogTDO4a4nsD24VeCaQiUlxDIinO1tG/KP
         9M8Aep+nAjm91F4gc56FvWTQKD2/Z8pOocIK7iBL5Jj7MH9OedVDfofnAw8nlCwZFob1
         nJoLGmec+cFMXJXs3YZYKq0rY2+Ec68L8rOL+Y7DcwrOMnlW/Dcx95V1IVUZ8LN+iWMK
         oQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780599941; x=1781204741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ffqDjSgGQ5QaASBEo3eqt9MQXd5NnLhzD6IscnM1OA=;
        b=MgQzjeOtFNqMMw0fKUmzzdTysAyDlW05JeB1oH5KhE5hJ2Cl8dQJrJR/pB4pELNXo0
         HKGU/+Kc+NvEeiCtFN2vZ2rFNO75AAnnpV7w/U7gQer1W82+RSNC4qjcImszys+/oqXk
         vPw/VGYaOequ4Ih+TlnmpzuHoJYX4rMwEXR6kvQ3lWp2nAqkmkAV+SXG+7kS2ms1FTSC
         xAXy+Al69Hv4EZw/U5zbOulq8AA3ZT/hY9UTbfmqi3Y2EmEc4vz42E70zb5EKYCLJvOP
         gzm+skW5QwgTK6JVrA9FQzUkYyFd3DsoB2MxZg1XSlpB78W8arvDZGd/Jnef8A/tAHxZ
         JC5A==
X-Forwarded-Encrypted: i=1; AFNElJ8Iaxb4eZGYwxuZulA7BGVU/RdJS7hwlXbQSK7JkS8KIpCfUPbeYZW+92eQninyNrDWdXXFSlV/T+KAfBCS@lists.linux.dev
X-Gm-Message-State: AOJu0YwNhooofgX7O9OnmfeLJZx9bUkY1JsUW5ELUAvuhNYuI5A2Bowh
	wLWoooHpe0xhv6U1MCBAomXDaoaQRYkS2pAAfELTopEbr0cyFbA70tVk
X-Gm-Gg: Acq92OHfe3sSizHg9tatLVKSMNu990Z3BEUjaYlsamgBpuqunqAIgrrmWGtHlWOdcwn
	92hRKNI9EFub2SnBa1rr54aP1pCsAeB4ut4fde+a12fPlMp3GWiQmg3Vnj+vRC0H9DrHwRx+Hsu
	9o7iW5SaI5uTdiX+qZqNPpG7ak6arEaQ3FQQIDUGacKnPcErn1g+VxRnSjyXo9ena1LTPVce0KO
	4eq54oaCXmhFwM7vByfS0E5WduBbTBpzsf9SZ4r5OmpEiKWuCxUhh87shJKPA5iV8q9p9Vy1Mjn
	ju1Ucu50AtKgaDFqAY1sncE+RRDUBAnmMLp9CUEN/qIIovjV4vU1yD18kLiwuG278p3GB8FD5w+
	ZJ98oodqW64kf2BF7YrQEHjXSvadPMIBF/Euw6X4oSzqpNf0IFXHuuX8wWWgllAJS/Bb3wcwfJm
	rgLnkQhuZvv+WBxYILQvky1/LiKAkITjv8W/mL//Tedquyyi86TH8vVUIBl1FwqIlgC6G2mBuf
X-Received: by 2002:a17:90b:57c4:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-370ee64373dmr263208a91.5.1780599940600;
        Thu, 04 Jun 2026 12:05:40 -0700 (PDT)
Received: from archslayer ([2607:fb90:7781:358:d68e:f592:7305:af5a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df032df5sm5818299a12.6.2026.06.04.12.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 12:05:40 -0700 (PDT)
From: William Elder <williamxelder@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: williamxelder@gmail.com
Subject: [PATCH v3] staging: rtl8723bs: remove comparisons to boolean literals
Date: Thu,  4 Jun 2026 13:05:07 -0600
Message-ID: <20260604190508.404642-1-williamxelder@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove comparisons to true and false as they are error prone.
Use the idiomatic C forms instead

v3: Fix inverted logic for ht_option checks

Signed-off-by: William Elder <williamxelder@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..1f7f24dc8f7c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -236,7 +236,7 @@ void Restore_DM_Func_Flag(struct adapter *padapter)
 
 void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
 {
-	if (enable == true)
+	if (enable)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_SET, (u8 *)(&mode));
 	else
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_CLR, (u8 *)(&mode));
@@ -340,7 +340,6 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 
 	center_ch = rtw_get_center_ch(channel, bwmode, channel_offset);
 
-
 	/* set Channel */
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->setch_mutex)))
 		return;
@@ -847,7 +846,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (!phtpriv->ht_option)
 		return;
 
 	if (pIE->length > sizeof(struct HT_info_element))
@@ -892,7 +891,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 		pmlmeinfo->bwmode_updated = false;
 	}
 
-	if (true == pmlmeinfo->bwmode_updated) {
+	if (pmlmeinfo->bwmode_updated) {
 		struct sta_info *psta;
 		struct wlan_bssid_ex	*cur_network = &(pmlmeinfo->network);
 		struct sta_priv *pstapriv = &padapter->stapriv;
@@ -931,7 +930,7 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (!phtpriv->ht_option)
 		return;
 
 	pmlmeinfo->HT_caps_enable = 1;
@@ -994,7 +993,7 @@ void HT_info_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (!phtpriv->ht_option)
 		return;
 
 	if (pIE->length > sizeof(struct HT_info_element))
@@ -1689,7 +1688,7 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
 	/* dump for  adaptive_early_32k */
-	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
+	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done)) {
 		u8 ratio_20_delay, ratio_80_delay;
 		u8 DrvBcnEarly, DrvBcnTimeOut;
 
@@ -1737,7 +1736,7 @@ void rtw_alloc_macid(struct adapter *padapter, struct sta_info *psta)
 
 	spin_lock_bh(&pdvobj->lock);
 	for (i = 0; i < NUM_STA; i++) {
-		if (pdvobj->macid[i] == false) {
+		if (!pdvobj->macid[i]) {
 			pdvobj->macid[i]  = true;
 			break;
 		}
@@ -1762,7 +1761,7 @@ void rtw_release_macid(struct adapter *padapter, struct sta_info *psta)
 
 	spin_lock_bh(&pdvobj->lock);
 	if (psta->mac_id < NUM_STA && psta->mac_id != 1) {
-		if (pdvobj->macid[psta->mac_id] == true) {
+		if (pdvobj->macid[psta->mac_id]) {
 			pdvobj->macid[psta->mac_id] = false;
 			psta->mac_id = NUM_STA;
 		}
-- 
2.54.0

