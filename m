Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048553164C7
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 18:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192015; cv=none; b=IAuiBqy13L31OlTkG6aWpQetDNj2+wjoH8oV8Mo8B731bXxj22mheuXzJsG3y3mRZwwyAdOtzx/6SzSEeFIlRVGTO6zmEhOTJnxzn3+KEzNccC4cL9o4mrTMvlKcmuI1S23gE+yPZoDesT0MslxZc/89Ayj/bwAOhAXky7oJmHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192015; c=relaxed/simple;
	bh=wW27yZLyvqeKrURhgUbOTuLBkPHQ7LZhPLinriEWiZM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Yys+xwgC2RUKE/JCogBGI9VtTH82XxUpFS2Kxns8JF46Bmew7JrRvvsO4iwp4NVEfsGHOWmbeN+qm6NQmt4hwPmQRQ4izLgi4zoOtGylKzr1lUifnER5YZbzj7ZOOzOrfnoxl+32Mwg7TyBbp9v7fkeGr67BEsGj9ZDsZqWnxJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bXUEPLwh; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bXUEPLwh"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776192011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l1cFE1NV4xoy2G2rxXaFcUl5hhF1NXSQwoS+uheNdxY=;
	b=bXUEPLwh9oK20Hfymf6HMRiOwKK6XCpOpqtO2ejUlquV5pbs8F6ShGbHMuBiVPWlyL8A5+
	59Bdw1ga/jzW3vmwWhm59ANke8XsmYfo+v2aUuI0tB/NNm44rDJq/LARPqjfJDTOrEmDht
	iYtEJlQe9J4MJU5/8dzQP5CVFcSoggI=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 20:39:59 +0200
Message-Id: <DHT3IJS5RI4B.1GG2CZL3B47RU@linux.dev>
Cc: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB write in HT_caps_handler()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-staging@lists.linux.dev>
References: <2026041408-grill-mahogany-d1e3@gregkh>
In-Reply-To: <2026041408-grill-mahogany-d1e3@gregkh>
X-Migadu-Flow: FLOW_OUT

On Tue Apr 14, 2026 at 7:19 PM CEST, Greg Kroah-Hartman wrote:
> HT_caps_handler() loops up to pIE->length, the IE length byte taken
> directly from an over-the-air association response, and uses the counter
> to index pmlmeinfo->HT_caps.u.HT_cap[26].  A malicious AP can supply an
> HT capabilities IE with a length byte up to 255, AND-writing into
> adjacent fields of struct mlme_ext_info.  This is reachable in station
> mode (the default) via OnAssocRsp.
>
> HT_info_handler() already rejects oversized IEs so do the same thing in
> HT_caps_handler() to resolve this.
>
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Assisted-by: gregkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/sta=
ging/rtl8723bs/core/rtw_wlan_util.c
> index 3242978da36c..a2e016c6a01f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -932,6 +932,9 @@ void HT_caps_handler(struct adapter *padapter, struct=
 ndis_80211_var_ie *pIE)
>  	if (phtpriv->ht_option =3D=3D false)
>  		return;
> =20
> +	if (pIE->length > sizeof(pmlmeinfo->HT_caps))
> +		return;
> +
>  	pmlmeinfo->HT_caps_enable =3D 1;
> =20
>  	for (i =3D 0; i < (pIE->length); i++) {

Good catch. Trusting pIE->length blindly from an unauthenticated=20
association response is a classic oob write vector. Since HT_cap is=20
fixed-size within the mlme_ext_info struct, this is a clear remote heap
corruption risk if a malicious AP is in range.
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
