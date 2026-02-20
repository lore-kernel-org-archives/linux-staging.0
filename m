Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E2F365A13
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 17:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771608760; cv=none; b=McxqenyeKeqhHZrKnf7koY78fb64UVuV1E6Gak2M3ySGDvLLU5hIzJ2wyIwr1JVvFA4CCk9QyoRTvc14NHEqXWrpDZIiSf450M7jzm2i/YNJJyPHYrYAX7X7RU+1WZRN3aUMPKvGwLlg8sAjmxfBHnmTUI9/xXew1xiTEzCmaqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771608760; c=relaxed/simple;
	bh=LjPACptXUR7U2YDX32J9MG7G0/8dJOmwfdkRl1sqHpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7RTmT9NDqVm0dvxBQUbNugNW0b8M9aTzEs4suka6VzEGzTqjEFkiuViV4cUixs7I0PZlgpUgnfnzsAlbjROXDfZm0MZQ+VhzEdVhQhTCRi9B5q9+YbZnxNuY2yFQXil4AyjsQZxTlo1FrbIPUtSARV6xTlsj5+AL5sdYIqHzMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=VhcTooAk; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="VhcTooAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771608756; bh=LjPACptXUR7U2YDX32J9MG7G0/8dJOmwfdkRl1sqHpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VhcTooAkwo+kn3aBDllgSU3ad15hqKuGTRy9iCRTDnbpg0BfLEvlb/H2H6+EUpBA7
	 2rRvz44b+f4JupQeDCoQ46/CKKRTdOkvVYn+h8frEpKAhxZC32bHNgLMPtUbHhtTfn
	 gHkILROkiWRkWsF4EeW6T1DmUVF1CqQXaV6shtYp/KhX88W0M/XGd1nEp1wkrFzecy
	 ftCe8hgFcjOnAoAgSX4bNl3expf2+2YXCKXk1AVcAdgMIhGF4At66nwvHvC4CcT3hR
	 ehODbyPbSoBSPfD/JccD86Sg3rFs982nO4hpCvK8s0en40EHwqAkU30vrOdebtDhe5
	 sxlTJ3G7bA6ew==
Received: from localhost (0b7f-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::b7f])
	by mail.plaes.org (Postfix) with ESMTPSA id 1AC4F4019D;
	Fri, 20 Feb 2026 17:32:36 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] staging: rtl8723bs: rtw_ieee80211: Reduce global symbols
Date: Fri, 20 Feb 2026 19:29:46 +0200
Message-ID: <20260220173104.2410217-1-plaes@plaes.org>
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

Also drop some unused

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 41 +++++++++----------
 drivers/staging/rtl8723bs/include/ieee80211.h | 30 --------------
 2 files changed, 19 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 6cf217e21593..c5dedf8a13f2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -11,26 +11,23 @@
 #include <linux/unaligned.h>
 
 u8 RTW_WPA_OUI_TYPE[] = { 0x00, 0x50, 0xf2, 1 };
-u16 RTW_WPA_VERSION = 1;
-u8 WPA_AUTH_KEY_MGMT_NONE[] = { 0x00, 0x50, 0xf2, 0 };
-u8 WPA_AUTH_KEY_MGMT_UNSPEC_802_1X[] = { 0x00, 0x50, 0xf2, 1 };
-u8 WPA_AUTH_KEY_MGMT_PSK_OVER_802_1X[] = { 0x00, 0x50, 0xf2, 2 };
-u8 WPA_CIPHER_SUITE_NONE[] = { 0x00, 0x50, 0xf2, 0 };
-u8 WPA_CIPHER_SUITE_WEP40[] = { 0x00, 0x50, 0xf2, 1 };
-u8 WPA_CIPHER_SUITE_TKIP[] = { 0x00, 0x50, 0xf2, 2 };
-u8 WPA_CIPHER_SUITE_WRAP[] = { 0x00, 0x50, 0xf2, 3 };
-u8 WPA_CIPHER_SUITE_CCMP[] = { 0x00, 0x50, 0xf2, 4 };
-u8 WPA_CIPHER_SUITE_WEP104[] = { 0x00, 0x50, 0xf2, 5 };
-
-u16 RSN_VERSION_BSD = 1;
-u8 RSN_AUTH_KEY_MGMT_UNSPEC_802_1X[] = { 0x00, 0x0f, 0xac, 1 };
-u8 RSN_AUTH_KEY_MGMT_PSK_OVER_802_1X[] = { 0x00, 0x0f, 0xac, 2 };
-u8 RSN_CIPHER_SUITE_NONE[] = { 0x00, 0x0f, 0xac, 0 };
-u8 RSN_CIPHER_SUITE_WEP40[] = { 0x00, 0x0f, 0xac, 1 };
-u8 RSN_CIPHER_SUITE_TKIP[] = { 0x00, 0x0f, 0xac, 2 };
-u8 RSN_CIPHER_SUITE_WRAP[] = { 0x00, 0x0f, 0xac, 3 };
-u8 RSN_CIPHER_SUITE_CCMP[] = { 0x00, 0x0f, 0xac, 4 };
-u8 RSN_CIPHER_SUITE_WEP104[] = { 0x00, 0x0f, 0xac, 5 };
+
+#define WPA_SELECTOR_LEN 4
+static const u8 WPA_CIPHER_SUITE_NONE[] = { 0x00, 0x50, 0xf2, 0 };
+static const u8 WPA_CIPHER_SUITE_WEP40[] = { 0x00, 0x50, 0xf2, 1 };
+static const u8 WPA_CIPHER_SUITE_TKIP[] = { 0x00, 0x50, 0xf2, 2 };
+static const u8 WPA_CIPHER_SUITE_WRAP[] = { 0x00, 0x50, 0xf2, 3 };
+static const u8 WPA_CIPHER_SUITE_CCMP[] = { 0x00, 0x50, 0xf2, 4 };
+static const u8 WPA_CIPHER_SUITE_WEP104[] = { 0x00, 0x50, 0xf2, 5 };
+
+#define RSN_SELECTOR_LEN 4
+static const u8 RSN_CIPHER_SUITE_NONE[] = { 0x00, 0x0f, 0xac, 0 };
+static const u8 RSN_CIPHER_SUITE_WEP40[] = { 0x00, 0x0f, 0xac, 1 };
+static const u8 RSN_CIPHER_SUITE_TKIP[] = { 0x00, 0x0f, 0xac, 2 };
+static const u8 RSN_CIPHER_SUITE_WRAP[] = { 0x00, 0x0f, 0xac, 3 };
+static const u8 RSN_CIPHER_SUITE_CCMP[] = { 0x00, 0x0f, 0xac, 4 };
+static const u8 RSN_CIPHER_SUITE_WEP104[] = { 0x00, 0x0f, 0xac, 5 };
+
 /*  */
 /*  for adhoc-master to generate ie and provide supported-rate to fw */
 /*  */
@@ -406,7 +403,7 @@ unsigned char *rtw_get_wpa2_ie(unsigned char *pie, int *rsn_ie_len, int limit)
 	return rtw_get_ie(pie, WLAN_EID_RSN, rsn_ie_len, limit);
 }
 
-int rtw_get_wpa_cipher_suite(u8 *s)
+static int rtw_get_wpa_cipher_suite(u8 *s)
 {
 	if (!memcmp(s, WPA_CIPHER_SUITE_NONE, WPA_SELECTOR_LEN))
 		return WPA_CIPHER_NONE;
@@ -422,7 +419,7 @@ int rtw_get_wpa_cipher_suite(u8 *s)
 	return 0;
 }
 
-int rtw_get_wpa2_cipher_suite(u8 *s)
+static int rtw_get_wpa2_cipher_suite(u8 *s)
 {
 	if (!memcmp(s, RSN_CIPHER_SUITE_NONE, RSN_SELECTOR_LEN))
 		return WPA_CIPHER_NONE;
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 0f28c904a714..7e6858c712c0 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -94,35 +94,7 @@ enum {
 #define WPA_CIPHER_TKIP		BIT(3)
 #define WPA_CIPHER_CCMP		BIT(4)
 
-
-
-#define WPA_SELECTOR_LEN 4
-extern u8 RTW_WPA_OUI_TYPE[];
-extern u16 RTW_WPA_VERSION;
-extern u8 WPA_AUTH_KEY_MGMT_NONE[];
-extern u8 WPA_AUTH_KEY_MGMT_UNSPEC_802_1X[];
-extern u8 WPA_AUTH_KEY_MGMT_PSK_OVER_802_1X[];
-extern u8 WPA_CIPHER_SUITE_NONE[];
-extern u8 WPA_CIPHER_SUITE_WEP40[];
-extern u8 WPA_CIPHER_SUITE_TKIP[];
-extern u8 WPA_CIPHER_SUITE_WRAP[];
-extern u8 WPA_CIPHER_SUITE_CCMP[];
-extern u8 WPA_CIPHER_SUITE_WEP104[];
-
-
 #define RSN_HEADER_LEN 4
-#define RSN_SELECTOR_LEN 4
-
-extern u16 RSN_VERSION_BSD;
-extern u8 RSN_AUTH_KEY_MGMT_UNSPEC_802_1X[];
-extern u8 RSN_AUTH_KEY_MGMT_PSK_OVER_802_1X[];
-extern u8 RSN_CIPHER_SUITE_NONE[];
-extern u8 RSN_CIPHER_SUITE_WEP40[];
-extern u8 RSN_CIPHER_SUITE_TKIP[];
-extern u8 RSN_CIPHER_SUITE_WRAP[];
-extern u8 RSN_CIPHER_SUITE_CCMP[];
-extern u8 RSN_CIPHER_SUITE_WEP104[];
-
 
 enum {
 	RATEID_IDX_BGN_40M_2SS = 0,
@@ -740,8 +712,6 @@ void rtw_set_supported_rate(u8 *SupportedRates, uint mode);
 
 unsigned char *rtw_get_wpa_ie(unsigned char *pie, int *wpa_ie_len, int limit);
 unsigned char *rtw_get_wpa2_ie(unsigned char *pie, int *rsn_ie_len, int limit);
-int rtw_get_wpa_cipher_suite(u8 *s);
-int rtw_get_wpa2_cipher_suite(u8 *s);
 int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len);
 int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x);
 int rtw_parse_wpa2_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x);
-- 
2.53.0

