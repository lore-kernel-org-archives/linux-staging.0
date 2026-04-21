Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF31E3A4F58
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782426; cv=none; b=YMN/4qMeeHmWALzEu9QSiSwl7u8CrBpFKEnIR/GEOH6Pc4YVSy7URQ577ryzctF/UnW6sm8zFrpcCcKddq7Wjg1ISkiNjDqSDjpugm1Xzsf8NJ0lM1kjFeroCD5UVveY191CY8eiPuwdnbS4lpFqZqksz6TTIZHjkK+qBQxPjoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782426; c=relaxed/simple;
	bh=5wG+APcr1JHd2EGxAPouI6P2F4hukwcRnB9UdasgeiA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UdZcjhhRkYTSPzAKnB8/Gbu8FOk57nrxVC8RF2TkiL2anldRlVksl5elpkFgBkWImSEba8lvakgrr3ZcYn9fmxanTdWKq2bSghAf1DIS6JgDSYzDoJNu+BJ54vDzsBW/8ji9+JBC5v7siL7ncLkHNdv4y2oTRuwWEbEBD+Na21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ouY+AbAF; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ouY+AbAF"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776782423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bkWWTbkGz55P2NNqlDb4FkohGArD1vj/VXxtGWQCjLU=;
	b=ouY+AbAFvdkRw/JQvHH//woEP9PfnSNApzfIyAHpDj4TV0gXoip6D3qGKeIYYGhfpYalIZ
	Rq7LJUikNHufBDuM4YJldR2Dd/0ubIcYBcyQPfal5lzDnfe4xnihhuP1cMa/zxAkBDsyaI
	V12T+Ylp2Z1hLwumadu292Cesd0zz50=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 16:40:17 +0200
Message-Id: <DHYWSUFIWZIM.3C0KFC5EYNHB5@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH 1/2] staging: rtl8723bs: fix OOB write in
 HT_caps_handler()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Alexandru Hossu" <hossu.alexandru@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20260420140807.152739-1-hossu.alexandru@gmail.com>
In-Reply-To: <20260420140807.152739-1-hossu.alexandru@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon Apr 20, 2026 at 4:08 PM CEST, Alexandru Hossu wrote:
> HT_caps_handler() iterates pIE->length bytes and writes into
> HT_caps.u.HT_cap[], which is a fixed 26-byte array (sizeof struct
> HT_caps_element).  Because pIE->length is a raw u8 from an over-the-air
> 802.11 AssocResponse frame and is never validated, a malicious AP can set
> it up to 255, causing up to 229 bytes of out-of-bounds writes into
> adjacent fields of struct mlme_ext_info.
>
> The parallel function HT_info_handler() already carries the correct guard=
:
>
>   if (pIE->length > sizeof(struct HT_info_element))
>           return;
>
> Apply the same pattern to HT_caps_handler().
>
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/sta=
ging/rtl8723bs/core/rtw_wlan_util.c
> index 6a7c09db4..b75e7f4f8 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -934,6 +934,9 @@ void HT_caps_handler(struct adapter *padapter, struct=
 ndis_80211_var_ie *pIE)
>  	if (phtpriv->ht_option =3D=3D false)
>  		return;
> =20
> +	if (pIE->length > sizeof(struct HT_caps_element))
> +		return;
> +
>  	pmlmeinfo->HT_caps_enable =3D 1;
> =20
>  	for (i =3D 0; i < (pIE->length); i++) {

Hi Alexandru,
this fix has been made already by Greg HK therefore this patch is=20
unnecessary. You can see his patch at [1].
Best regards,
Luka Gejak

[1]: https://lore.kernel.org/linux-staging/2026041408-grill-mahogany-d1e3@g=
regkh/
