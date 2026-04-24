Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF263290A5
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777037991; cv=none; b=jejSrPPDPKzLyK+wwLkXs1bBenU7PiHPFAcapdKdu+V6Cay4QwxXPGKQQ7n+dJyGojg7F1snVcoH+3mGBE2UsCHHGfd38kPPiFvjcBLa50dnukHFcTtkhg5UrFnZK9XrZ/VUFJdWiOcQiOuBb0zvkIb8WqddjmB+XGR63Szs6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777037991; c=relaxed/simple;
	bh=ZPTq8pdZRgSr7qaMe05Z+NO27KrBPtq3Y++b4VEP7lU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=krkWE3ncoHbhydVeXXw6doMDckYajQCAaDVv4f6DKfGxBt7DlDXEnDGUhEjknhDwxbHnnFY8R3wVTUx1nzzIP5g39bZszK4kRPE4FCf8onB4MHgpQCW1e6BSbqeL+ouzIvPRcgye0ea9bcOoUM+PJiCNWsNd9tBVduVV6WGjnzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BcAsZ71M; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BcAsZ71M"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777037982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C5NL1lrDV5Rdr/FeHQNojdfAIEPvXz5amOPKNWZrK7w=;
	b=BcAsZ71MJgOXub/68V+fXq98XZV5EZA94bR2mUpqk3J6cI3l9XbiShOJvO5cM6Qk3gAAUY
	UI9UoqN1+40zdCjb7LfGvqhdXylyZAGCZy8OBmhqJn0abjtZCEUl2sOFnWVR2dk6rl3/l1
	QxAQnm5BUop+s5GgH6TKy3zPph9oBOw=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 15:39:39 +0200
Message-Id: <DI1FE1OD4X7Y.1CJRGF8RIZ11O@linux.dev>
Cc: <~lkcamp/patches@lists.sr.ht>, <koike@igalia.com>, "Luka Gejak"
 <luka.gejak@linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: replace NULL comparison with NOT
 operator
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "mgcvale" <miguelcvalealt@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>
References: <20260423184219.827694-1-miguelcvalealt@gmail.com>
In-Reply-To: <20260423184219.827694-1-miguelcvalealt@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 23, 2026 at 8:42 PM CEST, mgcvale wrote:

Hi Mgcvale,
thanks for the patch, few notes below.

> Fix checkpatch error "Comparison to NULL could be written
> "!psta"" in ioctl_cfg80211.c:2432

You shouldn't break line above like that, idealy break it at 70-72=20
characters, not 58.

>
> Signed-off-by: mgcvale <miguelcvalealt@gmail.com>

Signed-off-by tag must use real name to satify Developer's certificate=20
of origin, so Signed-off-by: Firstname Lastname <email>

>
 ^^^^
You also have unnecessary blank line above, which should be removed.

> ---
> Hey, this is my first patch, so I appreciate any feedback.
> Thanks!
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/=
staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index fd3bae31b0ed..8ae3adecafd9 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2429,7 +2429,7 @@ static int	cfg80211_rtw_dump_station(struct wiphy *=
wiphy,
>  	spin_lock_bh(&pstapriv->asoc_list_lock);
>  	psta =3D rtw_sta_info_get_by_idx(idx, pstapriv);
>  	spin_unlock_bh(&pstapriv->asoc_list_lock);
> -	if (psta =3D=3D NULL) {
> +	if (!psta) {
>  		ret =3D -ENOENT;
>  		goto exit;
>  	}

So please send v2 with mentioned changes, code itself is good and should
be left as is.
Best regards,
Luka Gejak
