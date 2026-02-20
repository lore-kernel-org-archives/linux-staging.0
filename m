Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B332EDD7D
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604218; cv=none; b=isrSUhJXno6K2z4eMywC7ijLkWOYzcJy7Qf3kWtRkYFv1bj4phOP9AwK/NCwsGeyRx8wUi1tKsp5ehorf9nBJXi/bCxqBgrelbwaF0zLyMYHKgA7LJJGnBspYzQBCA5or3+bly33tvdV2TPkfpPNI1R1nDeCSCc/s3eorN19m8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604218; c=relaxed/simple;
	bh=8rRdw61F75lSzcMT0o9rvQOaFqjd8S2nCOILqy1uNaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=knM5Tojx8X1/GupJQM1tK72pQLv9oNZrzzOnfH4zZ4Q1F5gKqHg1yfBzb8XDAPmFfWtqXcOcZP74Ksmc2vrK7JvMnr56AeflZBx9P+vpn6s80zOxstAmcGNms0kTy/vi52Ueg8v0jbDZpQtfDYRDHogyK/PQg8BRt7oDvjPRI/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=cgIRgLBQ; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="cgIRgLBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771604212; bh=8rRdw61F75lSzcMT0o9rvQOaFqjd8S2nCOILqy1uNaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cgIRgLBQZbe9B7bM6ady7XkCutyA4FxSt6O5eOGlHREZ1SWF0PTpk1yJ8my6oBJb6
	 ZzMpVrG83oGe3NJ76IFV+noNYOsaffiwcUbu7THdOH+ij7940yDFJrfVQ0zXr7Md/P
	 DuGOy2WTFAFa07/XWZjkytJVuwyJnTKvYvsGCsHzFk+P0axKxFW/s4NId2CVYCzxtC
	 cVd8OHXauIT/EmRnNQeKvCs3NNhGtM/B4RIwDazsoPPLSkbY7xjTs1RtjigKu4i/Me
	 1GTZ1s3LMMdPKmfTOt2A2p8sHzpMcvU/60AaJcQ94gofd/pFRwKT4j34mBW4FYE9+J
	 vekRR0jtJqUaA==
Received: from localhost (0b7f-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::b7f])
	by mail.plaes.org (Postfix) with ESMTPSA id 5BCF5404CF;
	Fri, 20 Feb 2026 16:16:52 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] staging: rtl8723bs: Drop empty rtw_bug_check function
Date: Fri, 20 Feb 2026 18:15:14 +0200
Message-ID: <20260220161611.2398915-4-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220161611.2398915-1-plaes@plaes.org>
References: <20260220161611.2398915-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function was just returning True.

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c         | 10 ----------
 drivers/staging/rtl8723bs/include/osdep_service.h |  8 --------
 2 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 22dc36e8e38a..7a346cbf2708 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -358,9 +358,6 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 	u16 s_cap, d_cap;
 	__le16 tmps, tmpd;
 
-	if (rtw_bug_check(dst, src, &s_cap, &d_cap) == false)
-		return false;
-
 	memcpy((u8 *)&tmps, rtw_get_capability_from_ie(src->ies), 2);
 	memcpy((u8 *)&tmpd, rtw_get_capability_from_ie(dst->ies), 2);
 
@@ -464,11 +461,6 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
-	rtw_bug_check(&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network);
-
 	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
 		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
@@ -493,8 +485,6 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 	list_for_each(plist, phead) {
 		pnetwork = list_entry(plist, struct wlan_network, list);
 
-		rtw_bug_check(pnetwork, pnetwork, pnetwork, pnetwork);
-
 		if (is_same_network(&pnetwork->network, target, feature)) {
 			target_find = 1;
 			break;
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index f7b647db1a75..d6710e5835f0 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -65,14 +65,6 @@ static inline void flush_signals_thread(void)
 
 #define rtw_warn_on(condition) WARN_ON(condition)
 
-static inline int rtw_bug_check(void *parg1, void *parg2, void *parg3, void *parg4)
-{
-	int ret = true;
-
-	return ret;
-
-}
-
 extern void rtw_free_netdev(struct net_device *netdev);
 
 /* Macros for handling unaligned memory accesses */
-- 
2.53.0

