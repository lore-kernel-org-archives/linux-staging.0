Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9CD2DEA68
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764848778; cv=none; b=Jel+JPcKOfdlastQwonts9X5dh8aVsxpUe+arm1+kB+g/05DKZk7NysKYYIf+TsfrrkwIhSXPYbwWVJayQbL/4AWCvzEsSUdEuDBvJ7pM4DSZvEFuOx10vfkFnSdx2BuAP6GZXdmwYQ2DEufMIRe09seXYnrCChWG4mkWq67Bss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764848778; c=relaxed/simple;
	bh=npDHgTgyPY3ucFFaDwrdSLbPCdofWw8fYy4XOYZvHK4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MLQRT538VVRQu9bb7L0m3DNayGjFMvz0VrlhYQWPhSZ4lJdFNgwwQj1pZUzONR0rTIFtjcAuB3GkmTLNjJ3TIJv8yo9kdv11JUC3XV7epUWIFtWRotzrjDdY++CYpMWyIxJMEcbkldN9OSjjSVVfRr8phGBrqVVJNkfuLRIMs1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Lp8tDpvp; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Lp8tDpvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1764848769; x=1765107969;
	bh=jPbju85S1/gio1c4oElkkZDp0MO5LCj15+wzGgdW0qY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Lp8tDpvpIkx+N56cjj8VDzTAAUquI82gZZct80hv5XJL3DKU4oChdz0oWIcCjGdJR
	 q5QrB8Gow2dxJ0ZhuVQNNMSR2Y72rOZ1+ZCObNhlHD0WPuwkT2PMQFj0JnplHBJlYN
	 JRLvJXtyUEq+RMhopKb1JsF7uGUqWynytnezsGPZXqJAhZciajNH58RHRb6W3+BZzi
	 3lGAwf/2T7go7GaJ/aex8Ccl9Y8BuCe1+/aXkBuYxQ2d+ctd/09JRySYIWW3URncSj
	 jip3a9/oNQFIoBVXcCi0l6heT0Pp/r+hG/Tq24KqYuk7wjdJZrpSklKDKylAOI/lgJ
	 v3V2uKg2Mf4xA==
Date: Thu, 04 Dec 2025 11:46:02 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] staging: rtl8723bs: Rename camel case variable
Message-ID: <aTF0diMdLrA6v-WI@ubuntu-desk>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 0b468bd74d469c2c30f1ac9341d41fa87b0c4ccc
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
Changes in v3:
    1 - Correct typo in commit message.

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_ieee80211.c
index 469388a4062c..95539d6405b5 100644
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


