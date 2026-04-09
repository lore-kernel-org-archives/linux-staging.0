Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D93D3A5E62
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742079; cv=none; b=u41zbddIb6rk6UCmPSAgWdqLH7bhFa7lsXehccEt7FEqsiAlBAVogCw9BiM0l5Z5vDQl1OuVf39jnYEwpdeUEgNm3kirOZ8BRLJeEi0f3iuC6JxUAJ6upJsBWZ26NRlpHx7Mqdgv25dKqWOXHkA94B1ZJH29nWHxhbqsOnIwL1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742079; c=relaxed/simple;
	bh=jXQ+rBLwMiw6fyhRWWqgE8EJFJ3F46VtZZJxiqUDQlY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=c5tYGdloec5b2+Fd0iY8xhDup62eP3yuYzl7IV/9xmGvKkoaO8tZh2BeWe1EjyC4AJY/Wan1O5lAZ4neGdd7ehUzflkTnh9SU5Tz3eJQROXf/75wN+xZA6xf+CvY2WF+BQubSkAlmrGkrZH/Wv+9Z16xktX8/d7OXkU4SjU8+nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rzxMaoPE; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rzxMaoPE"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775742072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvgXZduaa1wpRG0BvImuMJaCk2iO8WJw/pSB9ycXoSY=;
	b=rzxMaoPEyvDUQm/f9KlYtD90UKev9ZnsCcPDoJS6yhWVHT+L1u50m9lITWuTTjigqtqNUx
	X0yTHOuvPWIQIq8rlPXd7jsHfKtNLqcXgiSesUTJFF4D6cuKELKML1nFiLx+46yVze+TZi
	TkL0z9SVRLtWnjpvnP2ccIngGxjV9Fs=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 15:41:06 +0200
Message-Id: <DHOO0ZO6AXHN.31AC1MJ5PUKES@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] staging: rtl8723bs: fix comparison to false
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Akhil Boyapati" <boyakhil978@gmail.com>, <gregkh@linuxfoundation.org>
References: <20260408174011.115915-2-boyakhil978@gmail.com>
In-Reply-To: <20260408174011.115915-2-boyakhil978@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 8, 2026 at 7:38 PM CEST, Akhil Boyapati wrote:
> Replace '=3D=3D false' with '!' operator for boolean test
> to adhere to Linux kernel coding style.
>
> Reported by checkpatch:
> CHECK: Using comparison to false is error prone
>
> RESEND adding cc to linux-staging@lists.linux.dev
This should be resent as v2 if any change is present. You should only=20
use RESEND if you don't edit context of email at all. Also such=20
messages for changes should go under --- as everything above is commit=20
message.
>
> Signed-off-by: Akhil Boyapati <boyakhil978@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rt=
l8723bs/core/rtw_ap.c
> index 864cd8b6d1f1..8f18175175ee 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapte=
r, u8 *pbuf,  int len)
> =20
>  		rtw_ht_use_default_setting(padapter);
> =20
> -		if (pmlmepriv->htpriv.sgi_20m =3D=3D false)
> +		if (!pmlmepriv->htpriv.sgi_20m)
>  			pht_cap->cap_info &=3D cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
> =20
> -		if (pmlmepriv->htpriv.sgi_40m =3D=3D false)
> +		if (!pmlmepriv->htpriv.sgi_40m)
>  			pht_cap->cap_info &=3D cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
> =20
>  		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
Hi Akhil,
I am also wondering why did you decide to resend the patch as it=20
impplies it was sent somewhere else, but I don't see it anywhere on=20
mailing list. Did you send it only to Greg?
