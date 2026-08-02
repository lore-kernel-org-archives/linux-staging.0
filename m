Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436322045AD
	for <linux-staging@lists.linux.dev>; Sun,  2 Aug 2026 15:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785684927; cv=pass; b=FKTWMIW5bfRVlyO74G5iNGxjo49YvFQG/E37vg9ByQdliY6jrcOxNn6lHvptHp+zbbN71xJPdhQ9CPGg8pbUJ9y9kialVbFjfHzAMIlq5rZl0sE3ZajqRrj5uAcTQ5810Id4bmOqJbmLGMXB0QI0CvadNzqbFStnYy7bMvCXDic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785684927; c=relaxed/simple;
	bh=kqqj0VlBcepVYiJNr8uj11Pq8oC06zLCjlxrwo1mSDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRo8t1hIvqWfNTB2dtin+hVZyMgUxM62CnexVWRWc1NWrf4uMFrFD0g/D0/rWBpCPIyosMRna4Y9y1RlRNs8vF41qxvM3HU2TTtyeIwv5tcDICfzWOEgNl/+tLGexzLcbD9W1kCJbjDWZbpD/CbveV8sXAcddV8i8HyqX/8HDX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=bVH0gtIh; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="bVH0gtIh"
ARC-Seal: i=1; a=rsa-sha256; t=1785684921; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=VXvhvKIaDAEoHmsE5AgR5QixyQr31xH+FRhUcS46I2l0Dp3naRgKAPpwkveAq0wlgIu9MVPM2Nxr3kguy36AfQLuAELNsPneieWWmYGrLvitXZ2JHH7Q6Pnur0KITNfPHjXFaeH5dmvOEkpiwfUOmS6VVtIl1UH15TUDfGfZz9c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785684921; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bF+Fc+x1n9YEAt6qGIKU8KFgtOfwIS+2zIFPKKpWyxo=; 
	b=KSks8WRMmZr4ojrJRvhMvE6IAv55BKdWn5RyPtlcpyb4rzd91JA1GL8qF8wd4/rr/MS56EysfLj3s+RfOQx9UWiDceXLAKnTaZuV/LCv52KvIF6p4Ps6XJ/5DcGeQY5QH4FOVkBnxjlL6fn0K18fttD/tP1Ju2FZhpb31wijmjI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785684921;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bF+Fc+x1n9YEAt6qGIKU8KFgtOfwIS+2zIFPKKpWyxo=;
	b=bVH0gtIhmVlWLySmQZyRsf3orhkBRk4wHX+S7C/67JDg1ifuiDgJ/Z+fXKMmf+pS
	illfUmZfE598Yn4Up4r/AiBkb7uYqxuK7E9/bAXHM4wQr/jtf4L7Qv/8OZicdqWHkbC
	Z66xqx80It4pEmfqNu7HhfR6lXwIi4hu+vJepH6Y=
Received: by mx.zoho.eu with SMTPS id 1785684919692796.3558886520713;
	Sun, 2 Aug 2026 17:35:19 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: rtl8723bs: validate HT capability IE length before use
Date: Sun,  2 Aug 2026 15:35:08 +0000
Message-ID: <20260802153509.44263-2-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802153509.44263-1-ali@iusegentoo.com>
References: <20260802153509.44263-1-ali@iusegentoo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Four sites locate the HT capability element with rtw_get_ie() and then
read through it without checking that the element is long enough:

	p = rtw_get_ie(..., WLAN_EID_HT_CAPABILITY, &len, ...);
	if (p && len > 0) {
		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
		ht_cap_info = le16_to_cpu(pht_cap->cap_info);

rtw_get_ie() only bounds the element against the end of the IE buffer, so
len is whatever the sender put in the length byte. A beacon or probe
response carrying a one byte HT capability element passes len > 0 and the
driver then reads two bytes of cap_info, and in rtw_update_ht_cap() the
ampdu_params_info byte after that, from beyond the element.

An HT capability element is a fixed 26 bytes, so require that much before
dereferencing it. The frames come from the air, so the length is not
under local control.

Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 2 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 863ddf846218..2e66a6e86a32 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1094,7 +1094,7 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 	/* get bwmode and ch_offset */
 	/* parsing HT_CAP_IE */
 	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
-	if (p && len > 0) {
+	if (p && len >= sizeof(struct ieee80211_ht_cap)) {
 		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 		pnetwork->bcn_info.ht_cap_info = le16_to_cpu(pht_cap->cap_info);
 	} else {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011455..03dd4b5e94d6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2416,7 +2416,7 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	/* check Max Rx A-MPDU Size */
 	len = 0;
 	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
+	if (p && len >= sizeof(struct ieee80211_ht_cap)) {
 		pht_capie = (struct ieee80211_ht_cap *)(p + 2);
 		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
 		max_ampdu_sz = 1 << (max_ampdu_sz + 3); /*  max_ampdu_sz (kbytes); */
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a443b3530fb9..c884700d6e0d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3934,7 +3934,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 		struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 		p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_HT_CAPABILITY, &len, bssid->ie_length - ie_offset);
-		if (p && len > 0) {
+		if (p && len >= sizeof(struct HT_caps_element)) {
 			struct HT_caps_element	*pHT_caps;
 
 			pHT_caps = (struct HT_caps_element	*)(p + 2);
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index a4de538722b5..7fd032b89429 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1130,7 +1130,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	/* check bw and channel offset */
 	/* parsing HT_CAP_IE */
 	p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
-	if (p && len > 0) {
+	if (p && len >= sizeof(struct ieee80211_ht_cap)) {
 		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 		ht_cap_info = le16_to_cpu(pht_cap->cap_info);
 	} else {
-- 
2.55.0

