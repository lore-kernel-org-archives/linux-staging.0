Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12C23A5E73
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 20:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777580851; cv=none; b=JvOTF6e+NaTmh86PuvqBFUyul3FglWEu274hGYuW/hU549DjmxZcqDQy9dbWe4w1AwZiwkfCGCJjZea/Jc8LAwM60K5w4uT2Fe+zz05JyTMddY2wmIxk2nA6A87wOe4K1NgI7U0hIitHvSzXUSxLCxrGFXX2Nt6HyM/IFnS8av4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777580851; c=relaxed/simple;
	bh=VK75E0LuuDps19E0ab9WQCuyy5n5rN+KwkgdSpJqQhk=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=vCuNJ3no2hm4JHlQuIiL1LzwMWIvrhtUb5sU24PFCxjXkci65rzY7IAYeuFlGPPqxKVOhlEvoIs+b38snmtjMcIBOmsI0rvdaGQ5jHtk7QQoXGIqeOJBzTBczJqs+6JAlOqvV/yV2jh0RSOMXZGpiFfu+XrfG094jqiWo4I5kkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Loh6QwgU; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Loh6QwgU"
Date: Thu, 30 Apr 2026 22:27:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777580847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=3JbUdRGHexl/icGGE19NwbEIgcad4kXVe4/ly8Pjbjs=;
	b=Loh6QwgUPNKjnVc+v+w+tCcCr5Nwtux+CdEw9uPThpQobhGA4jpQPbei4OdQpq3gWklcTb
	mwU9IaW+mchVquPYwJaGMJuEX9qlZ67lECELEKMn5Y2xuFyR5pJuHpHVfmuve84M9OimyR
	UFdO/YK21OUEYsPA0eKeT/a5NLWYU5U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: abhai@protonmail.com
CC: gregkh@linuxfoundation.org, hansg@kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, straube.linux@gmail.com, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_staging=3A_rtl8723bs=3A_simplif?=
 =?US-ASCII?Q?y_NULL_pointer_comparisons_in_rtw=5Frecv=2Eh?=
In-Reply-To: <20260430201158.2807823-1-abhai@protonmail.com>
Message-ID: <E34BC08B-D9F1-444A-8D67-692B44819B29@linux.dev>
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

> Fix checkpatch=2Epl warnings regarding explicit comparisons to NULL=2E
> The kernel coding style prefers the shorter if (!ptr) idiom over
> if (ptr =3D=3D NULL)=2E Clean up the inline functions in rtw_recv=2Eh to
> match this standard=2E
>=20
> Signed-off-by: Abhai Kollara <abhai@protonmail=2Ecom>
> ---
>  drivers/staging/rtl8723bs/include/rtw_recv=2Eh | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/rtl8723bs/include/rtw_recv=2Eh b/drivers/st=
aging/rtl8723bs/include/rtw_recv=2Eh
> index 8e45871f07f0=2E=2E9c32d480a20a 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_recv=2Eh
> +++ b/drivers/staging/rtl8723bs/include/rtw_recv=2Eh
> @@ -349,7 +349,7 @@ s32  rtw_recv_entry(union recv_frame *precv_frame);
>  static inline u8 *get_rxmem(union recv_frame *precvframe)
>  {
>  	/* always return rx_head=2E=2E=2E */
> -	if (precvframe =3D=3D NULL)
> +	if (!precvframe)
>  		return NULL;
> =20
>  	return precvframe->u=2Ehdr=2Erx_head;
> @@ -362,7 +362,7 @@ static inline u8 *recvframe_pull(union recv_frame *p=
recvframe, signed int sz)
>  	/* used for extract sz bytes from rx_data, update rx_data and return t=
he updated rx_data to the caller */
> =20
> =20
> -	if (precvframe =3D=3D NULL)
> +	if (!precvframe)
>  		return NULL;
> =20
> =20
> @@ -387,7 +387,7 @@ static inline u8 *recvframe_put(union recv_frame *pr=
ecvframe, signed int sz)
>  	/* after putting, rx_tail must be still larger than rx_end=2E */
>  	unsigned char *prev_rx_tail;
> =20
> -	if (precvframe =3D=3D NULL)
> +	if (!precvframe)
>  		return NULL;
> =20
>  	prev_rx_tail =3D precvframe->u=2Ehdr=2Erx_tail;
> @@ -414,7 +414,7 @@ static inline u8 *recvframe_pull_tail(union recv_fra=
me *precvframe, signed int s
>  	/* used for extract sz bytes from rx_end, update rx_end and return the=
 updated rx_end to the caller */
>  	/* after pulling, rx_end must be still larger than rx_data=2E */
> =20
> -	if (precvframe =3D=3D NULL)
> +	if (!precvframe)
>  		return NULL;
> =20
>  	precvframe->u=2Ehdr=2Erx_tail -=3D sz;
> --=20
> 2=2E43=2E0
>=20

LGTM,

Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Best regards,
Luka Gejak
