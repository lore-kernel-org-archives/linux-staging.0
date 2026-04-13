Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B293DEFE9
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776090722; cv=none; b=LuWlPBEENOGj6/3ipwVhuzGRY6jZi7cIjC1TG6dOriwhw0PAPkCCtkycOYczT2JCM6qpwDpFa8kZw4Nfoe330ua5/HvsaK3fke6prCir4zYj+nMOVIE0sydNYSbbL/AZCkzhD4yLtQ0ojOkt1sP2hleBD94pc8YvaeePm6/kn0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776090722; c=relaxed/simple;
	bh=qbmIdi5zD54DK8WbgQDywwh+jbcdsMIyjp0QlW39t7Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=CXOTARuw2yU/c2k8uIc9Cs/Bdi0UM8R6NyVqLrUA9A26ZgjGm1Q1kWZj24/tA2pfzZEKRfUtnzYIrMmZzhAowIWGTEI7elOpWGtI1z63uVe+hKd2AOt0U3Hs/+sLALPGYqsP1/X6r1LOu4XMSzUyAnJ04XNjJ1eGtuFshGATOzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YzojmU00; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YzojmU00"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776090719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6LUK7O9Fa21fUvfyHMghIu7d0seJXa+aN5oOCW2wwQ=;
	b=YzojmU00Sp15Tv5bI8Dts5x23or0LsmGfo2BZrasM0FcY6Z1mdDbp1BcuE1bWVQ95nZsOT
	rBVyUcfjndayXcukwEhuOxeC03+lkb+xOm5l7jLJLzVTpMZookCXUAr3OHmEV/Sdatwwem
	pYx9pI4qWvHMb8USAerb+r1mTNJtvW8=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 16:31:52 +0200
Message-Id: <DHS3M1KRGUSB.3O6K3J3LSC83A@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Feng Ning" <feng@innora.ai>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix heap buffer overflow in
 cfg80211_rtw_add_key
References: <adQ4yU-Pc0uHXtb5@ans-MacBook-Pro.local>
In-Reply-To: <adQ4yU-Pc0uHXtb5@ans-MacBook-Pro.local>
X-Migadu-Flow: FLOW_OUT

On Tue Apr 7, 2026 at 12:50 AM CEST, Feng Ning wrote:
> From: Feng Ning <feng@innora.ai>
> To: gregkh@linuxfoundation.org
> Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
> Subject: [PATCH] staging: rtl8723bs: fix heap buffer overflow in cfg80211=
_rtw_add_key
>
> The cfg80211 framework allows key sequence counters (NL80211_KEY_SEQ)
> up to 16 bytes, but ieee_param.crypt.seq is a fixed 8-byte buffer.
> When cfg80211_rtw_add_key() copies the sequence counter via memcpy()
> without checking seq_len, a heap buffer overflow of up to 8 bytes
> occurs, overwriting adjacent fields key_len and key[].
>
> Cap the copy length at the buffer size using min_t().
>
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Feng Ning <feng@innora.ai>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/=
staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 7cb0c6f22..4fba53c2d 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -883,8 +883,11 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy,=
 struct net_device *ndev,
> =20
>  	param->u.crypt.idx =3D key_index;
> =20
> -	if (params->seq_len && params->seq)
> -		memcpy(param->u.crypt.seq, (u8 *)params->seq, params->seq_len);
> +	if (params->seq_len && params->seq) {
> +		size_t seq_copy =3D min_t(size_t, params->seq_len,
> +				       sizeof(param->u.crypt.seq));
> +		memcpy(param->u.crypt.seq, (u8 *)params->seq, seq_copy);
> +	}
> =20
>  	if (params->key_len && params->key) {
>  		param->u.crypt.key_len =3D params->key_len;

Hi Feng,
one quick question, why did you send same patch as before? If it is=20
because it hasn't been merged yet please wait because it is currently=20
merge window and we are not accepting any new patches. We will come to=20
your patch eventually, just be patient.
Best regards,
Luka Gejak
