Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DCC14884C
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771700910; cv=none; b=GIVY7DKGXtspVqX/z47Mfb83IMhrFLgRorzHDPtTC2tDhV0ubzCw8reuyXxdQaPFDlcwymx0uqv0OdtF05VrgggsiSJts6ezfwdo/6Bz4qK6k6IJzYkM5T5xJeMuSgRozi+svyxaEjnxZiT3auM1gWPGyWmXF53kKPWJy4nuIGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771700910; c=relaxed/simple;
	bh=hwCQRywmvHqRuyBahiI4sZ82bYWbHHqhqlXz/JcLCZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVm4s+y+vhWgp0BUeSeGcxsZCzThjDISoalbj7QYIorfgqybUSPS6dvufdy7Swrwi+hvlWY2ptuaUjYXYhwafSYRQOCLlftIc+mkm0BZoEKqf/eT4SvxxC77qKMLJ51ZoJ3NMdEQ+O4Qdg7iIj4pcerqleAKZ85Iuzawoft7eMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=nc7VqkAX; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="nc7VqkAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771700908; bh=hwCQRywmvHqRuyBahiI4sZ82bYWbHHqhqlXz/JcLCZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nc7VqkAXPjiJTcyk41TFa3JgzaP6dBIRdRTumoE514J3Y0hk4iF+r1te/Af39rJuQ
	 KgLXCoHGNBhsqn1iuoaHmCVZSCdZICrE/2YVt6o+fvmiz18bF6LlV2Kn067j6pDJbH
	 l/mMLl6YMFgb0kPpa2HnRutARkQm2CqOXV425d+iTS39LDfCHhJaggUmIMI8mgm/vS
	 PWXjOGJTMttTiEs1xpzgVz3sDzUkRIpyuS2FDPEgvSJeexmXlTLfpgQ/akdmKJxbmC
	 E4cX1DG26BN8cwLMry/2KbbCGhiOUPlBa7wQBbFNG5CQKMy4g8yK3efuNrGfpzUKzq
	 h5Rwwm5TB8sXQ==
Received: from localhost (0bd2-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::bd2])
	by mail.plaes.org (Postfix) with ESMTPSA id 10C98405E6;
	Sat, 21 Feb 2026 19:08:28 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	Milos Puric <milospuric856@gmail.com>,
	Karthikey D Kadati <karthikey3608@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/11] staging: rtl8723bs: Drop empty rtw_bug_check function
Date: Sat, 21 Feb 2026 21:01:33 +0200
Message-ID: <20260221190628.50273-4-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221190628.50273-1-plaes@plaes.org>
References: <20260221190628.50273-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtw_bug_check was no-op returing true, so get rid of it
and remove calls to it.

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

