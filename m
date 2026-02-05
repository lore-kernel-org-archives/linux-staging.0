Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F8B2D7D59
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 03:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770262778; cv=none; b=f2w1jiu5vKN0aiAwcRatqL3VzEMBKKVD1XAO/SqMbfPQtVzMY4TbSTlbj7gUKcCpETNcECh+4ngx72RCgbOJUF+u0AyvBJFrNmLju05L8Q5YB8jF+Pt2AAnNXHgC3goRlY9nmoKZnpPrCTA1I06hXhhvQd4v0RACGG17C/yZmcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770262778; c=relaxed/simple;
	bh=Al6Z9jlvpH+1NEk+DsTa37Opdm7Adx2zc8LMGLSXE+k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JHw/tDLBbOqIsfUS17bjR1Y+Z1uGfJIRvmerVa+i0NCz/UbWWVLD9UoWdny/XjFrdy9Uxlq76n35nOgBc5l/OcN739PihYqmLgCtTQQuGbyq7m+6g+XnWM8EuZa3PhMzYzyoxanb2iE1ODjH5XwX4mPpZRomOdgikcOrFcso/6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmWHyoqi; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmWHyoqi"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79503150783so5008537b3.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 19:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770262777; x=1770867577; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnNhAenIX79KYnMWvCTfI21RIpCPxkwiRMZvGIMdbjo=;
        b=jmWHyoqipEMuj1zRHbzesCCdpqtM+fw35IQY8oBoPWTxWoOem0myrBrA6FaFrBoXBD
         AYP9ZTnqz9RvIVXkpcNl2eGcFSACex/mp+EN6KrJk4wbSJpq8ZPjRIvhS07cJIbwBTPb
         uaQsvXesOKp6vYSoKkguellUsv+fFbjaqy8fg0TKRWEXHbdezoIZX5MWOHd4mlLAD4LO
         8HmPTOct0m+MVLCMUq4bZJVZvOcNl+YzC4noFwAJ9gK+GPr2g46CUMqN7ToibBaG1FNz
         L3daqp0Y/ZlN5pZDq0mxQ6G8Dd1soIJ7ZEHufiXKrNI6ZVWJL13d3uUfSG5JrKJIPVnD
         v4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770262777; x=1770867577;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EnNhAenIX79KYnMWvCTfI21RIpCPxkwiRMZvGIMdbjo=;
        b=wemSSB65ILTl5qAqr7Y/xdc00kcho6rqeWjbqmYw/Er5DFyq4KfA1m/9nO7qvriLDr
         wjdz/INuwsq+t8vk87TWs5Vm3+4o15/wmWiiz05QE+I0XTjS+O33sL2Ot6BqaKRGdy5U
         +ownUsHffQbBTGT+5BeinOqjigO9gi5iQc361BBx2j2pwwZybFlROnjRe3TY7Zgw5sh7
         b/GxtHK+I/6D9KVL1E5c+KqKY4t8aOTohvv0LQLgCR6hgMprHlKESEwPELG+kx1EPipO
         vmLrxOiTOUfS+If+hhW4ARaVl2Xg6vRlOpMIACsx9lp3gV6URSuH4r0PiOpfVBeBrYPf
         vFzA==
X-Gm-Message-State: AOJu0Yy9dvjIfiuUJPjnMnaxdCJmQPZu92aMZM/mk0dTdwpA08zPf2BF
	62fp0gJxq6kXohuNWK9gNFmDFfDJooczp8ue11w8zTJiF0bE34wLoQ2t/vhnaw==
X-Gm-Gg: AZuq6aJsai0M7cOOTJwMJflZDMr4PzHSGQu08cAzYLi1uyZ8gU6G3R3B8jOxXQeLUi8
	phxXhTLcAITLyTxx5UNss8wiX2YF6JtpyPb/qQzoQJLL6+wy+c+1WFKwdOi61S4xe5OUngzAu2G
	6NkZujFGPsmlfoHt7lL9uGG4cpRVmjfpjEYqdvrAGxiYimvfxfspECZTg4c+MeOwTpXbi1YtGr4
	qKyX7TodpAFY/6cLyxQb3BXEhd05DNCY9Rev72k2TmQjb2HIc3rB0s24n8ytGjj6B3qFSq9PBNV
	MKpXrfbpZQs9aTfT9jinWE2Gw83jtdzs+jcNd9aRysoJvnU7d3gkB/NEMwPFFV7Cym0q8kk/cIa
	BUlWdJAuWSYqbgmkh3OR5vVISIuQfonQ9UR4L/KHc6ZfEcQUy5SsyHY5/P7iIfCjd476Adp0kBb
	SWCUaGAK3WSW4zUmZAkIR6enn2qcQX4+0=
X-Received: by 2002:a05:690c:3587:b0:786:25e9:387c with SMTP id 00721157ae682-794fe6845b5mr47625377b3.20.1770262777215;
        Wed, 04 Feb 2026 19:39:37 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794feeb1937sm36505807b3.21.2026.02.04.19.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 19:39:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 21:39:22 -0600
Message-Id: <DG6PRXWV23JA.1KGO8FYJV4M8O@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix checkpatch.pl warnings in rtw_ieee80211.c.
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Haroen Tmimi" <tmimiharoen@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260204184133.142511-1-tmimiharoen@gmail.com>
In-Reply-To: <20260204184133.142511-1-tmimiharoen@gmail.com>

On Wed Feb 4, 2026 at 12:41 PM CST, Haroen Tmimi wrote:
> 1. Fix "Yoda condition" style issues by moving constants to the right
>    side of the comparison (e.g., changing "_SUCCESS =3D=3D val" to
>    "val =3D=3D _SUCCESS").
>
> 2. Change the _action_public_str array to "static const char * const"
>    to ensure the array entries are read-only, preventing accidental
>    modification of the pointers.
>
> Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
> -		if (_SUCCESS =3D=3D rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher,=
 &pairwise_cipher, &is8021x)) {
> +		if (rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_ciphe=
r, &is8021x) =3D=3D _SUCCESS) {
>  			pnetwork->bcn_info.pairwise_cipher =3D pairwise_cipher;
>  			pnetwork->bcn_info.group_cipher =3D group_cipher;
>  			pnetwork->bcn_info.is_8021x =3D is8021x;
> @@ -1019,7 +1019,7 @@ static int rtw_get_cipher_info(struct wlan_network =
*pnetwork)
>  		pbuf =3D rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetw=
ork->network.ie_length-12);
> =20
>  		if (pbuf && (wpa_ielen > 0)) {
> -			if (_SUCCESS =3D=3D rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_ciphe=
r, &pairwise_cipher, &is8021x)) {
> +			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cip=
her, &is8021x) =3D=3D _SUCCESS) {
>  				pnetwork->bcn_info.pairwise_cipher =3D pairwise_cipher;
>  				pnetwork->bcn_info.group_cipher =3D group_cipher;
>  				pnetwork->bcn_info.is_8021x =3D is8021x;
> @@ -1139,7 +1139,7 @@ int rtw_action_frame_parse(const u8 *frame, u32 fra=
me_len, u8 *category, u8 *act
>  	return true;
>  }

This has already been fixed in staging-next. Next time use the
staging-next branch when creating patches.

> =20
> -static const char *_action_public_str[] =3D {
> +static const char * const _action_public_str[] =3D {
>  	"ACT_PUB_BSSCOEXIST",
>  	"ACT_PUB_DSE_ENABLE",
>  	"ACT_PUB_DSE_DEENABLE",

This looks good, make it it's own separate patch however. Please have
one logical change per patch.

Also, your header should have "staging: rtl8723bs" at the beginning.
Thanks.

ET
