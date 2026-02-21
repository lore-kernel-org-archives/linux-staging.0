Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADFA231A21
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771701087; cv=none; b=PhE6zs9QCeRUruMiwvlzXkfiLy8d3QYyNGn06vJOUREhPS2q9ucMBkDtfiI+xc59pO1Dp5tErzUdmCJ2yBzmcGoOOPQlhfup+yfZAoNTXrIHDGskOZ2dIg811kHep55tW2YgBtPn5XL1qKFduuMuKoOFuYwSjcuneyNCierajtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771701087; c=relaxed/simple;
	bh=YW2MHtu4BX5PpdvF2kWST6cAlvywTMR2LqAThPB29wA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T74G16dqbkXk4NTs6ayPbOLEqBWUvzqgACczigi7QDjxh6nk3J7FORo+XEl2vSynQ2OfFc1KraIW/TBBfI9MHi6RfgmVC8+YilGG0Yxy9zZPG+70U/2myj6kXlP65X+IbmlmLknWrG+CM2v9vKM2Z5PdZZkEAcTPBPG2NHC0oGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=kAjFGu5+; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="kAjFGu5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771701084; bh=YW2MHtu4BX5PpdvF2kWST6cAlvywTMR2LqAThPB29wA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kAjFGu5+lIa8/o2xOH25zf4BGMkfWvcP4s4UxHgG86WFwILj1SyeG5IiZv8MjRrnc
	 FHsuA0KTeHVUWQqFAizG0nuRfwIf9g13mye/JM3vjG/Esq3Iy3N4RQwIGDgB2q0kkK
	 EhefrbbaYXl9Zei7AKkz5rflhaVG7o02sSoR0uKaLGrYoXHXdr+69c/r57gUgieU2d
	 dMnTqyYmZ3gWqWxxTfrrajzQ12TJKOcn+RiKSWrm2/Qc0nQFfhKD+S2XmTEDiAUc3c
	 ZlKaCs7RjYY5TDceqx1wmCxcR9WoNol7t97e53u4nXGFOUCYaEsO7K0dMXWtL0icgu
	 Coomju9DHK8SQ==
Received: from localhost (0bd2-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::bd2])
	by mail.plaes.org (Postfix) with ESMTPSA id E1894405E6;
	Sat, 21 Feb 2026 19:11:23 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	Karthikey D Kadati <karthikey3608@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Erick Karanja <karanja99erick@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] staging: rtl8723bs: rtw_ieee80211: Reduce global symbols
Date: Sat, 21 Feb 2026 21:01:41 +0200
Message-ID: <20260221190628.50273-12-plaes@plaes.org>
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

Mark internally used symbols/functions as static and drop some unused
ones.
WPA_CIPHER_SUITE_WRAP/RSN_CIPHER_SUITE_WRAP are left as commented, as
these might be actually useful for understanding the code.

Changes since v1:
* Comment out unused variables WPA_CIPHER_SUITE_WRAP/RSN_CIPHER_SUITE_WRAP

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 41 +++++++++----------
 drivers/staging/rtl8723bs/include/ieee80211.h | 30 --------------
 2 files changed, 19 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 6cf217e21593..61280c349d9a 100644
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
+// static const u8 WPA_CIPHER_SUITE_WRAP[] = { 0x00, 0x50, 0xf2, 3 };
+static const u8 WPA_CIPHER_SUITE_CCMP[] = { 0x00, 0x50, 0xf2, 4 };
+static const u8 WPA_CIPHER_SUITE_WEP104[] = { 0x00, 0x50, 0xf2, 5 };
+
+#define RSN_SELECTOR_LEN 4
+static const u8 RSN_CIPHER_SUITE_NONE[] = { 0x00, 0x0f, 0xac, 0 };
+static const u8 RSN_CIPHER_SUITE_WEP40[] = { 0x00, 0x0f, 0xac, 1 };
+static const u8 RSN_CIPHER_SUITE_TKIP[] = { 0x00, 0x0f, 0xac, 2 };
+// static const u8 RSN_CIPHER_SUITE_WRAP[] = { 0x00, 0x0f, 0xac, 3 };
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

