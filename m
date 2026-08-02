Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01253BC68E
	for <linux-staging@lists.linux.dev>; Sun,  2 Aug 2026 15:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785684928; cv=pass; b=HoOakWk0snhKQDxOW/B7we6ICoWR3JinfESVoKzsKU5jZrLPp3R9/wP3N6DUuAdovhHZP+laBvk4P/GvKfV0Ooz6Z/8k3CuKN98jr4clWCm9Xid6uzFEkaQNF2Ryu6+mgcdHqcPFMmmgPZ1S5TrZqAST8B9Ebz+0ddbvCLaJIBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785684928; c=relaxed/simple;
	bh=wPDDA021qFNTP8gg3ih8qeSKotDzkFGh6zuUhsuh5/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hifXYpVMRt91kX30WeM3S7VSlE001e6bEfam+PD/xAQHBDBw9gJNGs9dzF8K0DZFIZbBybJKAlwqEudl8YDFZw+1qphExfy7MTFzzxqciTIY9SVKg7D/LU2kZ+3PCusNHolXjEfpvADOBUp7V395ytiaYGnsDy3U2naTugm+G40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=UE2Cgzwd; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="UE2Cgzwd"
ARC-Seal: i=1; a=rsa-sha256; t=1785684922; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=U6S6Vx12U1mWpL4RXT2F+KVZoroqwm5ceyE4i9HKCl5CIbXrgtrAzuS7x7GFYymOTdx6hNyjcZ6nYwTqJF9SbQcsOaePSXNaz8l67TV29J757v+VRKXTVYoq6Tb9bv/WhdSYXY+qEgI+cum7bb6YeJWaATWHx6IiMeJS29SDrbQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785684922; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4Q3UZ9FF+kZanL0cghp5WdgJz4O58NIEjpKCeNIS7F0=; 
	b=d00i910yRwmPMFX6e9RO3GWTZwerIrVlHJgJnRuKg7wLw03CJpUoDNzMWj4Pdgk+hF1l7WJF0tec+0hOaJ1SEyWzT51c37+U0/kOjvalmxKFJzU2WvP2O7Ow1gO9xbshTAMrQNmo3n145K2tBtbscxRka4o7EJdRBIZj9mFh0Jg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785684922;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4Q3UZ9FF+kZanL0cghp5WdgJz4O58NIEjpKCeNIS7F0=;
	b=UE2CgzwdZrLDRbLydhyJtxVLSDMS6GYIYNJgb1VVM9+oXvrP8HW879rhyxMXZJUr
	07/8hKaj2A7ojyyl0lc78vwVTxTlXmWQhv8LbnZEAKJD3yhSZc/ZBHO2f4NKB5gVn3z
	xyM6HzLRnyzhb87LOzLZ2uoQdFBBhv4UEdp3g7co=
Received: by mx.zoho.eu with SMTPS id 178568492033180.75509870961241;
	Sun, 2 Aug 2026 17:35:20 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging: rtl8723bs: bound the SSID element length before copying it
Date: Sun,  2 Aug 2026 15:35:09 +0000
Message-ID: <20260802153509.44263-3-ali@iusegentoo.com>
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

rtw_check_beacon_data() copies the SSID element straight into a fixed
32 byte array:

	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_SSID, &ie_len, ...);
	if (p && ie_len > 0) {
		memset(&pbss_network->ssid, 0, sizeof(struct ndis_802_11_ssid));
		memcpy(pbss_network->ssid.ssid, (p + 2), ie_len);

rtw_get_ie() writes the raw element length byte to *len and only limits
it against the end of the IE buffer:

	tmp = *(p + 1);
	if (i + 2 + tmp > limit)
		break;
	if (*p == index) {
		*len = tmp;

so ie_len can be up to 255, while the destination is

	struct ndis_802_11_ssid {
		u32  ssid_length;
		u8   ssid[32];
	};

and the only length check the function does beforehand is len <= MAX_IE_SZ
on the whole buffer. An SSID element longer than 32 bytes therefore
overruns ssid[] and the members of struct wlan_bssid_ex that follow it in
pmlmepriv->cur_network.network.

The beacon comes from cfg80211 start_ap and change_beacon, so it needs
CAP_NET_ADMIN and a beacon that hostapd would not normally build, but
nothing stops it. Skip the copy when the element does not fit, which is
what already happens when the element is absent.

Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 065850a9e894..62f420636485 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -802,7 +802,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       WLAN_EID_SSID,
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
-	if (p && ie_len > 0) {
+	if (p && ie_len > 0 && ie_len <= sizeof(pbss_network->ssid.ssid)) {
 		memset(&pbss_network->ssid, 0, sizeof(struct ndis_802_11_ssid));
 		memcpy(pbss_network->ssid.ssid, (p + 2), ie_len);
 		pbss_network->ssid.ssid_length = ie_len;
-- 
2.55.0

