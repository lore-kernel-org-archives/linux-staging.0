Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C035502F
	for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340084; cv=none; b=JP7ehxdNFSdkLyvZcjE80Jn0IKfxgIma+WhyI5TvS7GLuzJGWeHpTznSmRUGBiV29wiA3aOUcLUMImE1QFLqc6pHGO5+YgJlPwfcfWrq0vy4RyDx5fuxjQeSx+Qvl28v1u7Z+ZJHeHcKSwLzNayWbTgy4CY3FL+A+GXrtByOfL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340084; c=relaxed/simple;
	bh=zD1cYTwrpeMLdcCxoMkYS88NUcDEvkmAxBl4i9GUmxo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jmaZmbixDKu7rMwSBSin4no//1uRVopGrVp9bCyMybPsNGg4aBwvMsDbaMAVtVskNTMEYpTeUJ6eUnMMI1PGdQzWjI37RPqdPqG9TMLGkvR712nsb8aK6rJQtJOZktfn/SdON1JfrFiXsosgcghuwrtKSNfVUZGZQgGzh/scM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ns/G1yf1; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ns/G1yf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=mecl3d2w6ncgncw6vcuengd7pa.protonmail; t=1771340072; x=1771599272;
	bh=zD1cYTwrpeMLdcCxoMkYS88NUcDEvkmAxBl4i9GUmxo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ns/G1yf1x4VecflKx7X2GGcj8tRTlaoEqIorj45ERGddZQL7HY5YZfn5KZkAA5HsO
	 6vZVdmYcSWL/M70V1GsU3xNjlVz7XIWK25VG6KpmWwdotJhd7nmFgp7Uu3ZWtuRkwR
	 MR7qd+zprTSGl6uBw2ZUcIy3M5w/EN5xqPAYViRrzGbtXAuVV+8xA36vowaZK/E1f/
	 ScHzbNTmCPiTh/s8EyrpVyqVzdjchmEeCMeUPnA/73uGbRS7HTAmlu25yZrIKIEao7
	 j4bAnIlZ+YgSS8qEQ72YkFKBb2goQJ4SAEfx6DTRGBLJ0ifpvlXfwoLyRbzj9Sp9Xv
	 ZRfr716GZA08w==
Date: Tue, 17 Feb 2026 14:54:28 +0000
To: gregkh@linuxfoundation.org
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, Bryant Boatright <bryant.boatright@proton.me>
Subject: [PATCH v4 2/2] staging: rtl8723bs: Rename camel case variable
Message-ID: <20260217145352.2172407-3-bryant.boatright@proton.me>
In-Reply-To: <20260217145352.2172407-1-bryant.boatright@proton.me>
References: <20260217145352.2172407-1-bryant.boatright@proton.me>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 8fc17ab848148bd7420cd259a558741f1987529c
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
index 3c3ab3694b4a..0673dd411283 100644
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


