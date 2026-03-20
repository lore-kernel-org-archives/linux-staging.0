Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F87B3B6356
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027837; cv=none; b=c15vsbcEx+iSR33F4hFg9KuNTp//NjGUO20PQxLJs5jnuvEtyqfsMjpKWEsFIIpvgSEfvcVl1XbIkPp6V9AP9x5TuXwO0GMNFiRsaZi2S+qo0w+jaObE+c2xo7P72fL8P5dzes2q06ee4pHnNpnNym4yuKx1hsyIJckl1/dmWcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027837; c=relaxed/simple;
	bh=C0CXGGQ2w4OmCl1emjp+ase/pKC9cf/Dc8xFFMmlHTI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DTG+/fvorXTAaSwnLFGJZ8jYH56FEvVJTVZBy3oygH4ftZ00q89aG6AIxRWr2p+RaHELSRLao/VPnUHBaJzcnBbbwrv64s4BF/OQdGbUROg+wAXuuEDQGfrywosm3yaK2Zf8dMoiKvpoBmE4xhwR70L0l7lwJ5qMZDLP/sgCUso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azMVYwK4; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azMVYwK4"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79885f4a8ffso20992967b3.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 10:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774027832; x=1774632632; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxezcNYyMm9A+IH6OgLwcwveGjNOF3gx419a4sAGURY=;
        b=azMVYwK4xLuOwoIaRq2wqH+C6YbAqlEt4wfwalj7haHJ18TusFFqyARBPMzD8mExU7
         v9dzmz0vvwZsrgauA3oE6NAytLYWEplkbnzlBjRnZB4EBWVBJHUOqiB5UQMtx/t1z9Oz
         7IrdWFwAb/tSTkH/SgojNL0AcAI/J92RsWRhUPN+0K6bDFfx4lehITui4QXwoQw2k0DJ
         KXizT9toUEuef11G+D3BQBHd2wH6QneNM7i6Nxp5VdHzh1u4AAFSdiT/5fLHqfW/Zpbd
         +iv8OPIKsFy5TKpKz9UOPZ1DnZ7yNF9MJNq14Zp5mK/SS8fpicU/Nx/J347kjo5K9nDV
         JYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027832; x=1774632632;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxezcNYyMm9A+IH6OgLwcwveGjNOF3gx419a4sAGURY=;
        b=U+PEWx5Q4ArS16LiBUj55x8QZrU34kxDI8L6VomUKLt/y7LiUy3ms9l0jvyD/Hdi6l
         8aha8/F8pDfkDdYiOp5j/ziyfExlCAyZTyofHCxBuioxYVg3M21tdRDB6M13oRRrjQcX
         YIcAmThREBweuqxBkUGPA0iP51jLWGnVa69RLRALNW2ICJRmebrdpJTzU599MOdW8JKU
         70VluoErQxajpq1SumvZd8YE/capYkukyzSwSBYbP8stJOlo3uEbZ+FuNYG/+vB5sNBG
         6JggiAU1AGzBcHN97KM8qq2BJ7giUhhKpNP5JxKUN3O3YlvsOByw9NSldB8uYpxFXkKj
         Ub2w==
X-Gm-Message-State: AOJu0YzbgRB2UAe0peRDKQEaQXsY4SjGC8q5y5S6MYv6itDFHFdPrryj
	ZmDD77b7c8zGCn05AoBmTXExdPOJj9o2n6EkfPgQtQ9OQLdWT/amD2EL
X-Gm-Gg: ATEYQzym+pNNcS4XcQJY4x4SxIwR8vBTpNmMbrWnObdY/dstpSEhVqzAZ2ldKZRVTwU
	KP7VSXb2bKm8lb6DKtxHjESR7MY5yUqaBSko05YV3NmtGxLBn4ZkgYdldU0xhSqP6SvyUGWeCCj
	GtYoQ/5vhsZcvpagWQA5FjhfSQC1EpnlxeXcSPjajwIFWgfeLZY58ukE6ZrEZnp5e5VYTiuv7+a
	sWUcfCpBBmZuYC569jKov1hvTpaccTdFWmISGQlKZBHkmqN2lMWStaPrcocgFHN3Hlw67AJoMEO
	NZEZuPKdjQBIutxYDBoswvXKAHSxF3ieDPQmKUaaBJIiC3WXQ34kRVTzSO+Szpy7si/mydt5tip
	SLaRQbNJnMpcMybGy0dK2XcNAuVOt7Kugh4bq2suOdrAaSUJnKKurlzfs61f7JYQgCi08OHvLOi
	rl/Bm5cfsGU9qPRvPJ2spVBXJ6Yfunc28VQGICprOBakKPXt3emj69vQWUEQtynfwgM5e/VLLsy
	84o9fSGy24ttcIEp86F5b4BpN1P6l4E
X-Received: by 2002:a05:690c:e3e8:b0:798:5951:f42b with SMTP id 00721157ae682-79a90be80abmr39661247b3.42.1774027832051;
        Fri, 20 Mar 2026 10:30:32 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a905bda3esm18642937b3.47.2026.03.20.10.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 12:30:31 -0500
Message-Id: <DH7SDQSN6CJX.O6RII1OVBDQK@gmail.com>
Cc: <linux-staging@lists.linux.dev>
Subject: Re: [PATCH 1/5] staging: rtl8723bs: replace deeply nested if-else
 with switch-case
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260320122119.19563-1-nikolayof23@gmail.com>
 <20260320122119.19563-2-nikolayof23@gmail.com>
In-Reply-To: <20260320122119.19563-2-nikolayof23@gmail.com>

On Fri Mar 20, 2026 at 7:14 AM CDT, Nikolay Kulikov wrote:
> The main logic of the validate_recv_mgnt_frame() function is deeply
> nested due to multiple if-else statements and additional block scope.
> Fix this by replacing identical if-else with switch-case statements,
> which will improve code readability and correct checkpatch.pl warnings
> about line lengths.
>
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 48 +++++++++++++----------
>  1 file changed, 28 insertions(+), 20 deletions(-)
>

...


>  	/* struct mlme_priv *pmlmepriv =3D &adapter->mlmepriv; */

Maybe create a patch to delete this commented out code since you're
already here.

> +	struct sta_info *psta =3D NULL;

You don't have to declare this as NULL rtw_get_stainfo() returns NULL.

> =20
>  	precv_frame =3D recvframe_chk_defrag(padapter, precv_frame);
>  	if (!precv_frame)
>  		return _SUCCESS;
> =20
> -	{
> -		/* for rx pkt statistics */
> -		struct sta_info *psta =3D rtw_get_stainfo(&padapter->stapriv, GetAddr2=
Ptr(precv_frame->u.hdr.rx_data));
> -
> -		if (psta) {
> -			psta->sta_stats.rx_mgnt_pkts++;
> -			if (GetFrameSubType(precv_frame->u.hdr.rx_data) =3D=3D WIFI_BEACON)
> -				psta->sta_stats.rx_beacon_pkts++;
> -			else if (GetFrameSubType(precv_frame->u.hdr.rx_data) =3D=3D WIFI_PROB=
EREQ)
> -				psta->sta_stats.rx_probereq_pkts++;
> -			else if (GetFrameSubType(precv_frame->u.hdr.rx_data) =3D=3D WIFI_PROB=
ERSP) {
> -				if (!memcmp(padapter->eeprompriv.mac_addr, GetAddr1Ptr(precv_frame->=
u.hdr.rx_data), ETH_ALEN))
> -					psta->sta_stats.rx_probersp_pkts++;
> -				else if (is_broadcast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_dat=
a)) ||
> -					 is_multicast_mac_addr(GetAddr1Ptr(precv_frame->u.hdr.rx_data)))
> -					psta->sta_stats.rx_probersp_bm_pkts++;
> -				else
> -					psta->sta_stats.rx_probersp_uo_pkts++;
> -			}
> -		}
> +	/* for rx pkt statistics */
> +	psta =3D rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->u=
.hdr.rx_data));
> +	if (!psta)
> +		goto exit;

Instead of adding a goto here, it'd be easier to read if this was just
wrapped in an if statement.

Thanks,

ET
