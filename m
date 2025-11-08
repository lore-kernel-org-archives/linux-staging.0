Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D5F27EFE9
	for <linux-staging@lists.linux.dev>; Sat,  8 Nov 2025 04:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762577761; cv=none; b=j+SKfGEaVfOUCjI3dz6itUOfV1DqGCM3SuTmnym2O0Phg556hkN8W22FOrR7v+PSw9pD2H8TjF4UllOH3DmATIL1NnPuw6nWUp7Nr6Nnun0LeTQjKU9PuDp9YTksuDMRoq/uorfW+slhiKfbZiQQfA8GogEe5efr7s89+ZifAqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762577761; c=relaxed/simple;
	bh=HNKgZs982aUoYG41Pd5y8bl0nJPL7EkSqK77HiqBXZY=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iNAv96shJPWxlALe7Imi+ihCn2RxscON0NnK2RHFoNi3Ov+B88qPIGNT649/KB8yRFVBp6+sFBim+1B+M/voS17+td8sxIV26aDpZVfeLENOdSSFAoKwrrz/pNlPxXju46XPTfeVD1ddc2oAzBy7Mf89HddXyjqYWGVdjPtHTQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=GglcTsJO; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="GglcTsJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1762577755; x=1762836955;
	bh=HNKgZs982aUoYG41Pd5y8bl0nJPL7EkSqK77HiqBXZY=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GglcTsJO1AMcfyAViMDmpwqMbM6M+bgLlJRfG7X/iMAZHINZGidXPGkL/sRna7x4T
	 7P9Gc8xp5mEBd/Tw2+JxKoc9HgaYpNxj+4H44mhiU/FUJgPiTtLVhX+PSbUhHAsytw
	 s1Y9lL1byCVndSieFAu7mYn3SmfT5NrNCjA9A1YlU+hue1DWLQxL690V1xw5Rr6mSD
	 Ey074ocS8twdrWPimudTQXwyXDgTQyYPbX2pIwl90vXWHSEWNX5HMAOSQcdO98J7V9
	 p8wtLocloWbq8vGIJTQDtrxvAHMMYnM9Ngo9HiDtHD2XF/4d9cvuV4+GWBBfRD8Fqf
	 9Ku6HvfZd6zkQ==
Date: Sat, 08 Nov 2025 04:55:48 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
From: Bryant Boatright <bryant.boatright@proton.me>
Subject: [PATCH 3/3] staging: rtl8723bs: Rename camel case variable
Message-ID: <f913d0da35ddcb33dfea7b9eff855563986943a0.1762576396.git.bryant.boatright@proton.me>
In-Reply-To: <cover.1762576396.git.bryant.boatright@proton.me>
References: <cover.1762576396.git.bryant.boatright@proton.me>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 6469ea01894a3a9566027dd113dde2bfa67cc9cb
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Avoid CamelCase: <rateLen>

Signed-off-by: Bryant Boatright <bryant.boatright@proton.me>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_ieee80211.c
index d0bb09177bdf..6098425ed038 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -285,7 +285,7 @@ uint rtw_get_rateset_len(u8 *rateset)
 int rtw_generate_ie(struct registry_priv *pregistrypriv)
 {
 =09u8 wireless_mode;
-=09int=09sz =3D 0, rateLen;
+=09int=09sz =3D 0, rate_len;
 =09struct wlan_bssid_ex *pdev_network =3D &pregistrypriv->dev_network;
 =09u8 *ie =3D pdev_network->ies;
=20
@@ -320,13 +320,13 @@ int rtw_generate_ie(struct registry_priv *pregistrypr=
iv)
=20
 =09rtw_set_supported_rate(pdev_network->supported_rates, wireless_mode);
=20
-=09rateLen =3D rtw_get_rateset_len(pdev_network->supported_rates);
+=09rate_len =3D rtw_get_rateset_len(pdev_network->supported_rates);
=20
-=09if (rateLen > 8) {
+=09if (rate_len > 8) {
 =09=09ie =3D rtw_set_ie(ie, WLAN_EID_SUPP_RATES, 8, pdev_network->supporte=
d_rates, &sz);
-=09=09/* ie =3D rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rateLen - 8), (pd=
ev_network->supported_rates + 8), &sz); */
+=09=09/* ie =3D rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (p=
dev_network->supported_rates + 8), &sz); */
 =09} else {
-=09=09ie =3D rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rateLen, pdev_network->su=
pported_rates, &sz);
+=09=09ie =3D rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rate_len, pdev_network->s=
upported_rates, &sz);
 =09}
=20
 =09/* DS parameter set */
@@ -336,8 +336,8 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv=
)
=20
 =09ie =3D rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&(pdev_network->co=
nfiguration.atim_window), &sz);
=20
-=09if (rateLen > 8)
-=09=09ie =3D rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rateLen - 8), (pdev_=
network->supported_rates + 8), &sz);
+=09if (rate_len > 8)
+=09=09ie =3D rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pdev=
_network->supported_rates + 8), &sz);
=20
 =09/* HT Cap. */
 =09if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
--=20
2.43.0


