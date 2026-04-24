Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D93D9DBE
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038864; cv=none; b=GsE8ajfaqmd89KGOR4TKyn9pBsn27YjRSOf2+JwHbBzpYGUVGj2dS4bGZlv51iN7KOJuqDzCiw8GdZcMingr/GBPojbjMvpu1HnhorNXx0omzPWTMVHBwCVHuEe1j5T1i0/TGbW4weURoteczA1x4qXxfwEc2GP3s4+GKinLgtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038864; c=relaxed/simple;
	bh=N2mMPvxCDhHtbUGKgc/suVjic+00+6/OrK6qBJvApwY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dEuw5A6RcQVt9j2PZW+ryDbdWPIeU4LtFoftM2u997Q7+tsRKQYRmBey2JY0tTw4Jx9e4J6jfKz3QjeOc3uVW+HaC18phxUroLsITfdbsqvewfTh/2kv2m+UygpKCctIcFRxfsZBZtLrcbajeSfWQzvCyW4jWgDrdR2uimKt98c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q4/7YmU0; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q4/7YmU0"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777038855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHZUSvAIrHXEQGLl2jIv/c6iGxcZZwhyrUF5roNjSRQ=;
	b=Q4/7YmU0dyUg4rea3Guvzm6kCqHGvqMv0XdVACoTtzEQhy3iRJDDxZ+sITcIdH3BQRlY+v
	kznl0bB43zjay8IA9NaPNmTDVMJU9Q6QzxhlbE+T7iVubLt54Q7s3Fg6T0zNfzrcyI0abo
	As2BxWrU35T4zfpVWGWKq30SpXpcsPk=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 15:54:09 +0200
Message-Id: <DI1FP5D1H7G9.3QXHKZY9LPEQW@linux.dev>
Cc: <~lkcamp/patches@lists.sr.ht>, <koike@igalia.com>, "Luka Gejak"
 <luka.gejak@linux.dev>
Subject: Re: [PATCH]     staging: rtl8723bs: add spaces arround |
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Henrique Cazarim" <hcazarim@yahoo.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <gregkh@linuxfoundation.org>
References: <20260423201212.77701-1-hcazarim.ref@yahoo.com>
 <20260423201212.77701-1-hcazarim@yahoo.com>
In-Reply-To: <20260423201212.77701-1-hcazarim@yahoo.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 23, 2026 at 10:12 PM CEST, Henrique Cazarim wrote:

Hi Henrique,
thanks for the patch, few notes below.

>     Fix checkpatch error "CHECK: spaces preferred around that '|'"
>     in rtw_ioctl_set.c:154.

What is this indentation, it shouldn't be there especially not with=20
spaces. Also same in subject "[PATCH]     staging:" is wrong. There=20
should be only one space between [PATCH] and staging, so:=20
"[PATCH] staging:". One more thing regarding the subject, it should be=20
more descriptive of actual change. "add spaces arround |" doesn't give=20
any additional information. You should at least say what is change=20
affecting or where is the change located. Something like: "add spaces=20
arround | in rtw_set_802_11_ssid".

>
> Signed-off-by: Henrique Cazarim <hcazarim@yahoo.com>
> ---
>
 ^^^^^
Also you have unnecessary blank line above.

> Hey, this is my first patch, I appreciate any feedback, thanks!
> ---
>  drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/sta=
ging/rtl8723bs/core/rtw_ioctl_set.c
> index c70541f95a73..edfb4b5e8db0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> @@ -151,7 +151,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, stru=
ct ndis_802_11_ssid *ssid)
>  	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) =3D=3D true)
>  		goto release_mlme_lock;
> =20
> -	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) =3D=3D=
 true) {
> +	if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE) =3D=
=3D true) {
>  		if ((pmlmepriv->assoc_ssid.ssid_length =3D=3D ssid->ssid_length) &&
>  		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_lengt=
h))) {
>  			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) =3D=3D false) {

Please send v2 with mentioned changes, code itself it good and should be
left as is.
Best regards,
Luka Gejak
