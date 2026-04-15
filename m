Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE3313277
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261471; cv=none; b=npfKw4yyf2NfnQSKU+uUzPtHg52WqWJqMQ7Lmt4Yeafa6RddBqrwTV4hPjBqNRFTrkgdI7boHfVKb2tr5fSqShPFtFXwZbZqckPL2IuUhX4nkiEW0BOMwdiEbRJa6uVbED0jvE/w5qhqGaEANfZBpYV0G46+JoGe5Su8PkLwriw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261471; c=relaxed/simple;
	bh=IKkoLTxem1QL9XOlJV6++jokPpKdY31YXeRIH+LI/mY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hnEOaxIKNgKOSI5kQLPVeB6b8HDpu2O7tr7PAOjsDkyGrpNYlnOhubGjMczb0G0NQHXNo2R7oOwR0zTOgXCsF0e+uitZMHEeSeiT4rtpfBTF2qrcXCS7j8gS0E3+ELwlPQEFRlZ3XtMi480Pfkwa7kMKlJyl9K2nwkzVT+m/Z20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QiE6YTVS; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QiE6YTVS"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776261468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2g/6S2zA7Qsk9VcLwlMbheqZX+RADZF8lxVfdjK1IT8=;
	b=QiE6YTVS/8n3gGi+cZOcZc+vaJE8xbIBU1rlspNdG8Ki+xyICnKX0ZbfiZucIEUh60eVQQ
	4C1E7CdxXGG3ez9ksyZte2XrIc/tgUuNhqkg/dMmlvd7upkBsYrJjVQi28x+QLUWhPjoKm
	glMd5epsy/2bMH4UiRVk1+O3OTQJQ0o=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 15:57:28 +0200
Message-Id: <DHTS4SJWXRYC.2NWMS9YXR1ZQN@linux.dev>
Cc: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Sam Daly" <sam@samdaly.ie>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] staging: rtl8723bs: fix out-of-bounds reads in
 IE parsing functions
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Delene Tchio Romuald" <delenetchior1@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20260405101548.124829-1-delenetchior1@gmail.com>
 <20260405101548.124829-5-delenetchior1@gmail.com>
In-Reply-To: <20260405101548.124829-5-delenetchior1@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sun Apr 5, 2026 at 12:15 PM CEST, Delene Tchio Romuald wrote:
> The IE parsing loops in rtw_get_wapi_ie(), rtw_get_sec_ie(), and
> rtw_get_wps_ie() check only that the element ID byte is within bounds
> (cnt < in_len), but then immediately access the length byte at
> in_ie[cnt+1] and data bytes at in_ie[cnt+2] and beyond without
> verifying that these offsets are within the buffer.
>
> A malicious access point can send beacon or probe response frames with
> truncated Information Elements, triggering out-of-bounds reads on
> kernel heap memory. No authentication is required.
>
> Add two bounds checks to each function:
>  - Ensure at least 2 bytes remain for the IE header (cnt + 1 < in_len)
>  - Validate the full IE fits in the buffer before accessing its data
>    (cnt + 2 + ie_len <=3D in_len)
>
> Found by reviewing memory operations in the driver.
> Not tested on hardware.
>
> Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
> ---
> v3:
>  - Rebased on staging-next
>  - Sent as numbered series with proper Cc from get_maintainer.pl
> v2:
>  - Rebased on staging-next (v1 did not apply due to code reformatting)
>
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/sta=
ging/rtl8723bs/core/rtw_ieee80211.c
> index 72b7f731dd471..e0fed3f42de0c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -582,9 +582,12 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi=
_ie, u16 *wapi_len)
> =20
>  	cnt =3D (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
> =20
> -	while (cnt < in_len) {
> +	while (cnt + 1 < in_len) {
>  		authmode =3D in_ie[cnt];
> =20
> +		if (cnt + 2 + in_ie[cnt + 1] > in_len)
> +			break;
> +
>  		if (authmode =3D=3D WLAN_EID_BSS_AC_ACCESS_DELAY &&
>  		    (!memcmp(&in_ie[cnt + 6], wapi_oui1, 4) ||
>  		     !memcmp(&in_ie[cnt + 6], wapi_oui2, 4))) {
> @@ -615,9 +618,12 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_=
ie, u16 *rsn_len, u8 *wpa_ie
> =20
>  	cnt =3D (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
> =20
> -	while (cnt < in_len) {
> +	while (cnt + 1 < in_len) {
>  		authmode =3D in_ie[cnt];
> =20
> +		if (cnt + 2 + in_ie[cnt + 1] > in_len)
> +			break;
> +
>  		if ((authmode =3D=3D WLAN_EID_VENDOR_SPECIFIC) &&
>  		    (!memcmp(&in_ie[cnt + 2], &wpa_oui[0], 4))) {
>  			if (wpa_ie)
> @@ -658,9 +664,12 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_i=
e, uint *wps_ielen)
> =20
>  	cnt =3D 0;
> =20
> -	while (cnt < in_len) {
> +	while (cnt + 1 < in_len) {
>  		eid =3D in_ie[cnt];
> =20
> +		if (cnt + 2 + in_ie[cnt + 1] > in_len)
> +			break;
> +
>  		if ((eid =3D=3D WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2],=
 wps_oui, 4))) {
>  			wpsie_ptr =3D &in_ie[cnt];
> =20

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
