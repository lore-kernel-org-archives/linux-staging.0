Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51D388E6A
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782629; cv=none; b=tCPlmbu8sNUOHs5lAtMfZi4WpznVxp+Ba5A31qR/KNGI3Cw24APdw/SguGa4GOtGOKllEYiyvgbzoWVPqW6XsNt01I4IjDGkWH45bbJ7FAOc8uICueMZ24FN2Vt/xiTKpV4aGIRXJ9FXPvEvsUXHHRYlPgZPkoHeDM+xZrdSVgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782629; c=relaxed/simple;
	bh=iF0r9CedFAhx1YohCiwNYG7V6EBfYnFV32MgfwQizEE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Okl0YU4pHBObeiJq5RPVCV6zK5yY7EkF7NztxsVIZas5pHX0vXEHnzeD1GpzSCOoTp5WziQobyvD3ewueJXyJwSSU971OP5xGYfVzIP6cG9cWUIgSJwMRs0uq39m2BuaZdrYP6cRCv6Rd4Pt6Y31vzRr9mdTJ71OLEu+9CFc13Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D55tbslG; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D55tbslG"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776782623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+6T2yQx5eAduv1NQgTWRy2LsaqmcnZcbgNHVCNXQkBQ=;
	b=D55tbslGnCmtD20OM8ThJgROsjKXqLZDjEDoCn0LmLeELB/0g6URze2ET1BEaSrplRsBCK
	FTXn2vaTKxHVGAXUVwjyEJd+JF9za3NLidqoXtuJJjhRAZIigAhoP2rEodaQ0dqW6lD0z4
	zEwEE++OokTsx0YCOV9Xwf8nKcWqXoI=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 16:43:32 +0200
Message-Id: <DHYWVBRIZNU1.MKVUCEULETQL@linux.dev>
To: "Alexandru Hossu" <hossu.alexandru@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH 2/2] staging: rtl8723bs: fix OOB read in OnAssocRsp() IE
 loop
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
References: <20260420140807.152739-1-hossu.alexandru@gmail.com>
 <20260420140807.152739-2-hossu.alexandru@gmail.com>
In-Reply-To: <20260420140807.152739-2-hossu.alexandru@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon Apr 20, 2026 at 4:08 PM CEST, Alexandru Hossu wrote:
> The IE parsing loop in OnAssocRsp() advances by (pIE->length + 2) each
> iteration but only guards on i < pkt_len.  When a malicious AP sends an
> AssocResponse whose last IE has only one byte remaining in the frame (the
> element_id byte lands at pkt_len-1), the loop reads pIE->length from
> pframe[pkt_len], which is one byte past the allocated receive buffer.
>
> Additionally, even when the header bytes are in bounds, pIE->length itsel=
f
> can extend the data window beyond pkt_len, silently passing a truncated I=
E
> to the handler functions.
>
> Add two guards at the top of the loop body:
>   1. Break if fewer than sizeof(*pIE) bytes remain (can't read the header=
).
>   2. Break if the IE's declared data extends past pkt_len.
>
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stag=
ing/rtl8723bs/core/rtw_mlme_ext.c
> index 5f00fe282..9666226a6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1400,7 +1400,11 @@ unsigned int OnAssocRsp(struct adapter *padapter, =
union recv_frame *precv_frame)
>  	/* to handle HT, WMM, rate adaptive, update MAC reg */
>  	/* for not to handle the synchronous IO in the tasklet */
>  	for (i =3D (6 + WLAN_HDR_A3_LEN); i < pkt_len;) {
> +		if (i + sizeof(*pIE) > pkt_len)
> +			break;
>  		pIE =3D (struct ndis_80211_var_ie *)(pframe + i);
> +		if (i + sizeof(*pIE) + pIE->length > pkt_len)
> +			break;
> =20
>  		switch (pIE->element_id) {
>  		case WLAN_EID_VENDOR_SPECIFIC:

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
