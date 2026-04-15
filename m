Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89E628DB54
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 04:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776228468; cv=none; b=BhTsWkwyXDHfMYqitzdo0VM9J4O3KqP5mn7W72mVtDECKScxPmhRuwRGz/ZKytkVua9kmlqiuYvhyLk7F0IUTvREoo99FKQpHvO6UMut3RrrDNJq5RPbkoZsL7c4TJM96vxd7XbpQfqyL1EuEDsE4dUYfkKgHrl4Z8pJI0ckBnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776228468; c=relaxed/simple;
	bh=V4tWRgfrZHqFRIp8Iloxse17iPng/gnEL8wg0RiELes=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=aUAj9w14H1z0p3suyFeYem5++hhmjZnB3zQXMQDS44QZ1vWqdEB54D25wHqgTzYUDQXK34pugkmIHGnB2BGI12Zqo4iV4h+lweuiD2T9STjLHN5jK2k1m+Iri2K+wnsW3/dFNOaRnIqLS9YjgMuhkupybqqh7oTfNY+/MdUZErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DV5ve2dW; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DV5ve2dW"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776228463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cr4IcaatDSq2o82btypoJMqcFwPBKgoNsLuXtTkdZ1M=;
	b=DV5ve2dWahbmepJavofCzLXOiUSwlEZidf/R2s7+wgflEKOfJ/nK9Il6BFzhCm+MgZMpqa
	zeb8wWZi+RTbsShSgLiyIgzfB2S9sSD++ogWD5RNU8ngCN404ejb+yXk74CtVNesa3NMQC
	k1Eq7/a1krkfSEC981mNLf82d2BV3EE=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 06:47:35 +0200
Message-Id: <DHTGFRNBOT79.2SLRPIN3GFMMV@linux.dev>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix missing frame length checks
 in OnAuthClient
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Alexandru Hossu" <hossu.alexandru@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <error27@gmail.com>, <stable@vger.kernel.org>
References: <20260414213959.1028301-1-hossu.alexandru@gmail.com>
In-Reply-To: <20260414213959.1028301-1-hossu.alexandru@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue Apr 14, 2026 at 11:39 PM CEST, Alexandru Hossu wrote:
> OnAuthClient() accesses pframe without first verifying that pkt_len is
> large enough to contain a valid 802.11 management frame header:
>
> - get_da(pframe) reads bytes 4-9, requiring pkt_len >=3D 10
> - GetPrivacy(pframe) reads the FC field at bytes 0-1
>
> Additionally, when pkt_len < WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_ the
> unsigned subtraction passed to rtw_get_ie() wraps around, causing it
> to scan well past the end of the buffer.
>
> Add an early check against WLAN_HDR_A3_LEN before any pframe access,
> and a second check against WLAN_HDR_A3_LEN + offset + 6 after computing
> offset to guard the seq/status reads and the rtw_get_ie() call.
>
> Suggested-by: Dan Carpenter <error27@gmail.com>
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
> Changes in v2:
> - Replace incorrect Reported-by tag with Suggested-by: Dan spotted the
>   missing length check during code review of the heap overflow fix; he
>   did not file a separate bug report
> - Add missing version changelog (the initial submission was incorrectly
>   labeled v2; no v1 was ever sent to the list)
>
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stag=
ing/rtl8723bs/core/rtw_mlme_ext.c
> index 90f27665667a..884cd39ec756 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -860,6 +860,9 @@ unsigned int OnAuthClient(struct adapter *padapter, u=
nion recv_frame *precv_fram
>  	u8 *pframe =3D precv_frame->u.hdr.rx_data;
>  	uint pkt_len =3D precv_frame->u.hdr.len;
> =20
> +	if (pkt_len < WLAN_HDR_A3_LEN)
> +		goto authclnt_fail;
> +
>  	/* check A1 matches or not */
>  	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
>  		return _SUCCESS;
> @@ -869,6 +872,9 @@ unsigned int OnAuthClient(struct adapter *padapter, u=
nion recv_frame *precv_fram
> =20
>  	offset =3D (GetPrivacy(pframe)) ? 4 : 0;
> =20
> +	if (pkt_len < WLAN_HDR_A3_LEN + offset + 6)
> +		goto authclnt_fail;
> +
>  	seq	=3D le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + of=
fset + 2));
>  	status	=3D le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN +=
 offset + 4));
> =20

LGTM.
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Best regards,
Luka Gejak
