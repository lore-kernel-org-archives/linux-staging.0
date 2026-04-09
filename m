Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D259831A045
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744070; cv=none; b=OlJFrk/w/ifcFyhiAMFAZsRCnKixvn++I+uXaC/jAYLFhL6ugi/psGwIK5Czuyd6yWy3CkPIDI/DpLV90jelpP9EPq8Xq6kXZLQIj+XQ4INj7VyR8xBMGdN3e9+o/3byXJjDQLcly1OBXB17HwD+NIwFOBcaOmCBJL9EUmVURe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744070; c=relaxed/simple;
	bh=1lYV5wxp1fvY9dfn23S2jpsf6Eph2SRbcZKN/9BY09s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cOckPNPnWgheosD83gWR//HqTPpiBEjAh5trZbP/ZilKDSP3aZT9ZCh7CFGaOU14GnXaF5giElbUfoI9hRBaA3TPWnTrBs5N8BwlUYlsgsw/BeEiLagrDV5mRv6UVtadCEU8inkgsqnunhyNNJCUv/8ftvq/2a6gaegDtXT5gx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uyWCpVIi; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uyWCpVIi"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775744065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1XOkTL6Vy9oXswTh4Ftv7uZVb70YfX+Re87k79xzSaM=;
	b=uyWCpVIirc70+5IDMCOQ+sazYjAsxoN+rb4tHnsqr8lblsJwQzEREBSC5LCg8epW+JkhgR
	zT9z18sgT11+AYPphXS6cUuIzhy0uyDAu6Tx4vL2nVyTAPpoQh/Bb7citUJJakk4xR302Y
	+cpjr4+KnL4OnpstAdHnWEa8blX5c4I=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 16:14:15 +0200
Message-Id: <DHOOQD5F4RMY.2BR4WXR07MDYP@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <david.hunter.linux@gmail.com>, <khalid@kernel.org>
Subject: Re: [PATCH v4 5/5] staging: rtl8723bs: remove duplicate rate checks
 in PHY_GetTxPowerIndexBase()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Prithvi Tambewagh" <activprithvi@gmail.com>,
 <gregkh@linuxfoundation.org>, <abrahamadekunle50@gmail.com>,
 <b9788213@gmail.com>, <straube.linux@gmail.com>, <tmimiharoen@gmail.com>,
 <filippo.muschera@gmail.com>, <ethantidmore06@gmail.com>,
 <andriy.shevchenko@linux.intel.com>, <rayfraytech@gmail.com>,
 <david@cardinalsystem.net>, <weibu@redadmin.org>,
 <dharanitharan725@gmail.com>, <ignacio.pena87@gmail.com>,
 <dan.carpenter@linaro.org>, <karanja99erick@gmail.com>,
 <luka.gejak@linux.dev>, <khushalchitturi@gmail.com>, <suunj1331@gmail.com>,
 <s9430939@naver.com>, <nikolayof23@gmail.com>,
 <bryant.boatright@proton.me>, <ysinghcin@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <20260409135026.137904-6-activprithvi@gmail.com>
In-Reply-To: <20260409135026.137904-6-activprithvi@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> The code previously checked (Rate >=3D MGN_MCS0 && Rate <=3D MGN_MCS7)
> condition twice - once for the (BandWidth =3D=3D CHANNEL_WIDTH_20) check =
and
> once for the (BandWidth =3D=3D CHANNEL_WIDTH_40) check. Fix if statement
> formatting to move that if check as an outer if check to improve code
> formatting.
>
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/sta=
ging/rtl8723bs/hal/hal_com_phycfg.c
> index 2746da0a9846..45dbe1782bae 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> @@ -473,11 +473,10 @@ u8 PHY_GetTxPowerIndexBase(
>  	if ((Rate >=3D MGN_6M && Rate <=3D MGN_54M) && !IS_CCK_RATE(Rate))
>  		txPower +=3D pHalData->OFDM_24G_Diff[RFPath][TX_1S];
> =20
> -	if (BandWidth =3D=3D CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
> -		if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
> +	if (Rate >=3D MGN_MCS0 && Rate <=3D MGN_MCS7) {
> +		if (BandWidth =3D=3D CHANNEL_WIDTH_20) /*  BW20-1S, BW20-2S */
>  			txPower +=3D pHalData->BW20_24G_Diff[RFPath][TX_1S];
> -	} else if (BandWidth =3D=3D CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
> -		if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
> +		else if (BandWidth =3D=3D CHANNEL_WIDTH_40) /*  BW40-1S, BW40-2S */
>  			txPower +=3D pHalData->BW40_24G_Diff[RFPath][TX_1S];
>  	}
> =20

LGTM.
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
