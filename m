Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF483939C9
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777661633; cv=none; b=DYeT9kCuK4aQsalQkb/j6zUzSr0c/JBEFet6t6IQp18aiqA4CDvoKdE97hV5UadMxqJvg4R3CMWDn5qMYbx0Hkxjmvv3D5nUKwqPRMCYiYdRg2Gf8SR60K/pAlg4rB+KS+Hi2SSiRYLUfEv1ikaCiT4cyBisGpq8nmF5RUYkNK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777661633; c=relaxed/simple;
	bh=mHHD9hmI1Lf1fNsOkw4LyGe8dSw1/9WYpT7QL++N+Nw=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=Ptb1j1Ta/nke59p1xndTmGx7aXYX6/7YbBgZQifQRQjYX3lYNxlrhHUcDPne1klR1HjIYTWJGXcklFo5o5/fzrMCvc6PxM73YqHNdwlIGIOEMAjwtiaoD7aEjPRgU+VNMTp6aaTvBZ68BIn6554cGhUI+9PF2ETcRVFZRnnxSUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WdK2SvRy; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WdK2SvRy"
Date: Fri, 01 May 2026 20:53:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777661628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=cn7SygbxR3awPsqpJWnIzOzHvZY/R2qLhB2tr8n2xTo=;
	b=WdK2SvRyEfjj+yCCIf0MlBpPn9QtWHlvLz1DrgZK2sVb2YcFXQozRcPa9SA2l69J4GCLT7
	TYO/5wyC/EPDY26EiLFL1nuG8L/WeGqKaIn/E9mM186d6E6JH7jGyZmbKf9YlRmsld1vtn
	mjaS0K3o1BdsU5HD6pYV+LJtq3loCLo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: sozdayvek@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_staging=3A_rtl8723bs=3A_drop?=
 =?US-ASCII?Q?_duplicate_blank_lines_in_core_files?=
In-Reply-To: <20260501165917.1504-1-sozdayvek@gmail.com>
Message-ID: <049BBF22-CAA9-4F09-8B27-0434C8710DFB@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

> Remove redundant blank lines flagged by checkpatch=2Epl in three core
> source files of the rtl8723bs driver:
>=20
>   rtw_btcoex=2Ec:    multiple blank lines
>   rtw_efuse=2Ec:     multiple blank lines
>   rtw_ieee80211=2Ec: blank line before a close brace
>=20
> No functional change=2E
>=20
> Signed-off-by: Stepan Ionichev <sozdayvek@gmail=2Ecom>
> ---
>  drivers/staging/rtl8723bs/core/rtw_btcoex=2Ec    | 1 -
>  drivers/staging/rtl8723bs/core/rtw_efuse=2Ec     | 1 -
>  drivers/staging/rtl8723bs/core/rtw_ieee80211=2Ec | 1 -
>  3 files changed, 3 deletions(-)
>=20
> diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex=2Ec b/drivers/sta=
ging/rtl8723bs/core/rtw_btcoex=2Ec
> index 0191a943f=2E=2E27dfd00b4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_btcoex=2Ec
> +++ b/drivers/staging/rtl8723bs/core/rtw_btcoex=2Ec
> @@ -65,7 +65,6 @@ void rtw_btcoex_LPS_Leave(struct adapter *padapter)
>  {
>  	struct pwrctrl_priv *pwrpriv;
> =20
> -
>  	pwrpriv =3D adapter_to_pwrctl(padapter);
> =20
>  	if (pwrpriv->pwr_mode !=3D PS_MODE_ACTIVE) {
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse=2Ec b/drivers/stag=
ing/rtl8723bs/core/rtw_efuse=2Ec
> index 099320e4e=2E=2E0cd7ce242 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse=2Ec
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse=2Ec
> @@ -232,7 +232,6 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter,=
 u8 efuseType)
>  	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
>  } /*  EFUSE_ShadowMapUpdate */
> =20
> -
>  /*---------------------------------------------------------------------=
--------
>   * Function:	EFUSE_ShadowRead
>   *
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211=2Ec b/drivers/=
staging/rtl8723bs/core/rtw_ieee80211=2Ec
> index 72b7f731d=2E=2E5fb1fe5b7 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211=2Ec
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211=2Ec
> @@ -593,7 +593,6 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi=
_ie, u16 *wapi_len)
> =20
>  			if (wapi_len)
>  				*wapi_len =3D in_ie[cnt + 1] + 2;
> -
>  		}
> =20
>  		cnt +=3D in_ie[cnt + 1] + 2;   /* get next */
> --=20
> 2=2E33=2E0=2Ewindows=2E2
>=20

These changes are already present in staging-next branch=2E Please use=20
staging-next for development, not mainline repo=2E
Best regards,
Luka Gejak
