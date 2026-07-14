Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19F42BC3C
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 21:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784063334; cv=none; b=l7Flr+62kD7qWvkUizvOwo6uDc4FhpjW2vnzZe4ePbY8WcSexFDl9WsxZYP1Lw5fDCnGDdINh3QZ3Al0XmEG74rL8yCTiXz+rpR8lNz7C/DoQnj4qZYW0IeNfskcMOuYHDR/9/yAQyMKEYjKO/tnIXcXbi9OuzLPlYywgk6fq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784063334; c=relaxed/simple;
	bh=rTkqe32vdpp3NuE6rtgVM93dRS4mF4Oc9eRIub6FXuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3ZwfUGds8KYQ81wGOEiQUsT0TICrb6mHubgYC/EpT6njW0lUAbKPuejDBLlRgskrcrR6ftgqYYNp9KOY+LiTwQgqXA1z67hc/aeL/aEkRgRh/qSy/ZdlQ09x+XSSzwI0G8kK9tzoeE1bwDK5MUNa2K3yEfhmgP4ZhVFc+o1Jkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jxket/TC; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jxket/TC"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7ec1e9d3359so1576930a34.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 14:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784063331; x=1784668131; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYbi+xyIz+ex++QixYBeThzkR5VqVZi07DDBFPRxtBM=;
        b=Jxket/TC3XlAC294s/aEa50pLB6ZsnjWtDIe3eADT70BTBFfqaUshtJ9Qc31STEDJj
         +P4dWzVvSpOwsvznfrA/4M0p1Xy6Elg5L5k32zMM0pNWbK77sLonNSKN5Wdkela/imzs
         QNMOQ6MR8RWicuJNneniQluCeMfpXka7MbgzKXI3NHBF5ISqJ1nqs1bfBcF/lkfcVLdO
         d/2s56eIBKjzdv2rcA11T1M3jW1tZYAhgBTgYvpZmbeKJ6a3MjVXh/2F33imPxjgVyPE
         CSFTzdtDWscJj5coALhCB7wOxb2N7OAYBtdtpYz2la/fM04fbSRhw4YOCSmLQ4+JC9my
         la0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784063331; x=1784668131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYbi+xyIz+ex++QixYBeThzkR5VqVZi07DDBFPRxtBM=;
        b=mlZRi/oK9xWK2g6jKdHYa0/0Hxf6ioUpEGuvIUERaCOF0TNoifJMX3S0lG2flRXbo2
         iZuPlliaHJh4TkNNO7cryWmjiadsgUO50A8TRVMwL+cyKxee7ZZtjz5ldDFJDJI2+GC7
         3TC3DJDeZOVFlxkxLi+to4rIuC5GmLDirFqmZTE4OHixiTXjG4VLXjisCiBnxgwa5XWn
         aGRDlQ20La3cj0UVP9nnPxOJY7pqfS4V+NlYY0gNSq00rjTmLtbhoJzxgtWuytYzJOg/
         3e+LEZfnFH6R791A1IHqDIQ0VJ8KS0yxt6NTl+XXyia0luQq3QVGX2n7io/9z3cwFM7T
         M8yw==
X-Gm-Message-State: AOJu0YwzDo3VBYN1aNEah8S6TG3VeGoEE//swScztHbMxmmXYFlNM0+B
	efz1OChu3b+4n7G4amP3C5eCIyIRrECyyqnK6tYy3+bJV30aNg4LIm0g
X-Gm-Gg: AfdE7clIaCaqGnUNlqKOYaxrLnwcC4F4iXOiAzvie33ZW8HFzgH7UgKJ+vsCqg1QNIZ
	DMT0ipxK0EIRZcMahp9qL6qT15HPgmcin07AZp026pd7XXG33wfSQkbqFPs2iupMyAbFI0c01hc
	ZdbswcUMrckxfBnFOBHHw3M9Z1awG6OyEhI3k9tc9v6PGBQPvbXIuITRJ6S0F6sAA7eKGzeIfvp
	r475a7aaLsnOa3yWc9LNQYTo4I893RwzZXI+RpyqnpXxbiQYxo63wQ+NSPyx+sZ8amy4N2BLK/B
	IAG27oUXvna2kG19F7H8TBHjBK3mfJNiVOAEXI5mU/S6TpZAeyCv3R5rUnX0p/TCRgdngD/qgmp
	Y6nv2jwmtlHCxRWC6hwQOoKY+SXLDYZkX056U3oVW6SqS94vjz03p+bncUnZqJZUW94ndt2a8/e
	X5fnOK5itNR/GAmxqFzlVPaezYedcvXu6SPO9dK5zB89kdz8g=
X-Received: by 2002:a05:6830:2a11:b0:7e3:d29b:fea4 with SMTP id 46e09a7af769-7ec423642f7mr3103535a34.22.1784063331427;
        Tue, 14 Jul 2026 14:08:51 -0700 (PDT)
Received: from archslayer ([72.174.138.11])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec2183a32csm6906825a34.23.2026.07.14.14.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:08:51 -0700 (PDT)
From: William Elder <williamxelder@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Elder <williamxelder@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: remove comparisons to boolean literals
Date: Tue, 14 Jul 2026 15:08:43 -0600
Message-ID: <20260714210843.72848-1-williamxelder@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026070738-usual-rinse-7c52@gregkh>
References: <2026070738-usual-rinse-7c52@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove comparisons to true and false as they are error prone.
Use the idiomatic C forms instead. Removed a stray blank line

Signed-off-by: William Elder <williamxelder@gmail.com>
---

v4: Per Greg's request, included all patch revisions and moved the
version notes below the --- line
v3: Fix inverted logic for ht_option checks
v2: No changes, resent v1 as a mistake
v1: Fix redundant boolean comparisons and introduce inverted logic on false conditions and removed a stray blank line

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

