Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8068296BCB
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 22:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770503483; cv=none; b=RW6NuiHzqRUgfg5oSnhc2lXvIvBk4p6ldMejXMfvzCJ6z8jNstf+OEMjR8AN2pWra9jg+BmrkSp4oMC6pCz7HxuCshmXq3mwGKSNlffjAADMUt7yK+y1DJJBqblZjxS7+p2cxMENZ7L4uOJXA3xujhBevpo/MwjC/uN9ZJCfzD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770503483; c=relaxed/simple;
	bh=3XyvSOP6kFVR1xaLqBiGN0oHnixD21SKCZKLJrvMIzA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=mPvgBVLdeTGgUxKJD3qiu4DjdNTqD8Hvcr6/yeOkYnaI/Eo1x8hxRDL3VNFT/5zCxZ+0xgpCURrLRTHZqbi5TUhSkphuSzpwq4nN7r4kpsGLEo/YaOYoxIk7kTS9+pxjolRyZrVquDdK07hXkRYzjpiCEhGKB5Yv/ZlH3sXmgLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5ikvUmF; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5ikvUmF"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-404254ffe8aso2220372fac.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 14:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770503482; x=1771108282; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3Zar8UvYGL2HDa4Uj3rH657Lt9+T552vCr1ZsJi0j4=;
        b=E5ikvUmFZHxWNQhEdYs8a1F9Ly8Jku7cMQTW/lf85PhCgg3jWEu3rDk1jk9bb8bx3I
         RtKGMNz3LJEnaiQJcKZjn+kvXRbsNadi+Et9d/E9isn20r05l2w2scT2dhVhfxujabbJ
         kVAkvwLeXxYejD4UNM/TQPTpq5uD1yRZ/dc3kEwEBG9qU+OgGPEBIsf5FhJofWdjFuua
         ao4fHyOOy25f6efEcyDWtEbOmPCAozehlGcllLmdzOwYyl/H5rz6zm7ntfnM29KAHsWU
         7FI05rAy1L4CXW3Btc/quAe31iOXLzP2MsW+yvOjhp2uaGOWpZR8qye50x4yjVB5w5wF
         p7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770503482; x=1771108282;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g3Zar8UvYGL2HDa4Uj3rH657Lt9+T552vCr1ZsJi0j4=;
        b=mjU+sW7JvJ3O4z2fCoInH/K0puH28zkdyNotcn49SWvbBbemALib7JX3n+azSMroHU
         RD/wUMCvwobybdwydfJc22aiiEmOmUhxMZeFVhBpmtCFkcMMSRcyWb8RJuy3HKUn9t3U
         La3uKfAH8TO+jxQZkqjuAHRDrpootn0WoKHvgHL0BNVEpfR/FdhtGJggvLFbxW1Sa6Wf
         RyDb8+CrrTt5BYsnN3jTscmGja8Y9c9twygZ7jsTiHt06ywBz0F/MnZsZxXd+GlqdguX
         fuKjY69P0hawVhsWEeOphQ+P1FUzlPcnHuNICW+hv/v9UW3Ml288LSNGCeEKAwBRdght
         cnBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg/ZSD1ZcXNliXOtpl8wLXFQEemuIC4WFEOniCqxxTSkyhMtWzHXgtoawvtqKX/1sDI0vu0PwKEhughc4x@lists.linux.dev
X-Gm-Message-State: AOJu0YwWfg+3l/BLJSlw0DxOQgQItpMN88LX2ZBBsE8AMpAqla892nSg
	xKy2AmSM3G7lz4tQalecKyG2fl5rZoliYo90Y6sQRM1Plx6NzlYJQAyq
X-Gm-Gg: AZuq6aJRpU99SZKsOGTOJF3/mBwSmGdzddoK0CwJ/CtGfXJ1EmCjW1OpNxR8Z4zy3jx
	9IJrzMiYJUoJXWLo/nUkJueoWascbcj3CMloEFSha1dj4kx3J88nE1rIwZKOApOEp2Mz5a1bQJE
	9XSh88Bs5gIqrCQ4FxAlhFxnBh+gS38JRS7PKNZeISnic9Gd/J0f1rDBJbOK/YwFs9gZAa1rkem
	uvJA1EFWapPNZbAFk2utO2a6etvZzSzA71gUtAtEXXef6k+aFFYxrQRepZ7wQPqXF61Vt8igUI4
	HygWoEVv4BZdX7SCkdQ0vaoDXsVq0z0oFLSqynoqMHuY6OKJoJFkvStuaFqtXqVbEsZFqmSpoVc
	oyBOZOadaw4TuSdj575uZgKsaJmHqgiBHBeCjhCNlP2EFB5r1YvaOOuNkXpwh4cp62pe1lKKpQT
	nuO+4YAYB5A9puoqNo5Yuxu1QKH86sCpZlVLkECuB1s1Cfx9+N3DJeqoRdWbK/LCRw3wrQn0R/E
	bJ8iCBcS3TKZ0qOuTotXLuzH+oPoMklj0lzZ/5l8D5u1JsKv4jammUGgQ==
X-Received: by 2002:a05:6870:e2cf:b0:409:5e29:e899 with SMTP id 586e51a60fabf-40a96d4717dmr3784899fac.6.1770503482391;
        Sat, 07 Feb 2026 14:31:22 -0800 (PST)
Received: from localhost ([2600:100d:b16d:c41f:3d7b:1f53:769e:a0fb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40a996456d4sm4183236fac.13.2026.02.07.14.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 14:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2026 16:31:18 -0600
Message-Id: <DG933PFQ8WC8.T2CFFOKHSDDX@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Azamat Rakhim" <azamatrakhim8@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <karanja99erick@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: clean up checkpatch warnings in
 rtw_btcoex.c
X-Mailer: aerc 0.21.0
References: <20260207210124.10094-1-azamatrakhim8@gmail.com>
In-Reply-To: <20260207210124.10094-1-azamatrakhim8@gmail.com>

On Sat Feb 7, 2026 at 3:01 PM CST, Azamat Rakhim wrote:
> Remove unnecessary comparison to true and extra blank lines
> to address checkpatch warnings.
>
> Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/stagin=
g/rtl8723bs/core/rtw_btcoex.c
> index f4b19ef7b341..8c17ac994bbc 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> @@ -11,7 +11,7 @@
>  void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_sta=
tus)
>  {
>  	if ((media_status =3D=3D RT_MEDIA_CONNECT)
> -		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) =3D=3D true)) {
> +		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))) {
>  		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
>  	}

You fixed one checkpatch.pl error on this line, but left another one.
Logical operators need to go at the end of the previous line
not the beginning of it. So that'd be "if ((media_status =3D=3D
RT_MEDIA_CONNECT) &&".

> =20
> @@ -54,7 +54,6 @@ void rtw_btcoex_LPS_Enter(struct adapter *padapter)
>  	struct pwrctrl_priv *pwrpriv;
>  	u8 lps_val;
> =20
> -
>  	pwrpriv =3D adapter_to_pwrctl(padapter);
> =20
>  	pwrpriv->bpower_saving =3D true;
> @@ -66,7 +65,6 @@ void rtw_btcoex_LPS_Leave(struct adapter *padapter)
>  {
>  	struct pwrctrl_priv *pwrpriv;
> =20
> -
>  	pwrpriv =3D adapter_to_pwrctl(padapter);
> =20
>  	if (pwrpriv->pwr_mode !=3D PS_MODE_ACTIVE) {

These whitespace fixes should be their own patch. Please keep one
logical change per patch.

Also, your subject line should say what you fixed not the tool you used to
find it. Next time before sending patches off run "$
./scripts/checkpatch.pl --strict <patch>" to find problems like this.

Thanks,

ET
