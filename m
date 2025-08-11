Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E118DB35
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920135; cv=none; b=aSJFM/du2FUEvPE3UtocjEPJtq9rt8N4lipL7/Ael2qTLEWdLLe/b/R0z4yPiXt/mAL+kMpuXeB03Kq/sVBo6lt2+ET6E7686L2WhasizPOy9t4uKEEx08IAG6jUjMniXXsNePJZa4zLcPz1s1n3jML9tLpAj4yerKOJAvmzkjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920135; c=relaxed/simple;
	bh=UKSmwahiogqW1pXeYgXf8Eygszt2u88JnqRx0xZfhNE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ItHxu/PjnSyeOKidE21OfOJjxN1ZMz+VAo1X0SO5w1VKoWb5jxseIQE0HTdRcdYQA3w0VGMQt6Hvaa33wWAdVwfulKG6LtkhoGoyXv23m2g6QdIUOze95UHSk8hxdjCeeMiblR3OfDRhc+mM821Re9VowidTkUkubgAKC6e5oGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Q7KdweYX; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Q7KdweYX"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-70736b2ea12so22348606d6.1
        for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1754920133; x=1755524933; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VWV2hjLplr0Slgw9ppK6HuD7SF+ufb5rfXPdExiThcw=;
        b=Q7KdweYX2fZOaA7eCZr+fEgZlI8bRRIG1bophtY+bn+Csnz/i8scrXa+ddWmQAT1qs
         0Zt6vEnRRyusn9jP4Rqa7ANB78TFQPr3Z/y9u6QmO4WlNnOE6QJbSmxX7lwOPPzmS/1d
         YqFmGBjQU+CfAeNuWBhbEL6/QQz9UfjOp7zTR/8mkfBlCY2DGtKc90JeCtdRIpPzpS4r
         amCBFlylFkHdeUFs2b4g27XujvxHmnQqygRRNOfyXNClj3sxgaHfp6YrtAYkWVO5DlIO
         nSaQYWOvBvAY3flcuRSpftVzUAU7QwAqb7Eq+smdojg0iWyDFDBzIscdr1nMmkOV60A7
         sxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920133; x=1755524933;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWV2hjLplr0Slgw9ppK6HuD7SF+ufb5rfXPdExiThcw=;
        b=rKaLT75zkK82F6YsD3y7b7oqe3sXOA4O+0iwS/Z19fnd3axZOAeKN22HdWqxwQy/Hq
         d/fF+OJTC2FZa+VSlouM99Fjf8/8oPypWxE0TjDwnNdi8nttFKYLl8TjGa1cTFc/V00e
         QFdnOtDPR8COopthE+Rgak3kopd5UZKaLJZ9X+N6gZ0tsjB9KEirVNyYrKZkKzFIep4i
         lgnymJfPNV+Y69m2B12ooXIpzMqC6fVBgvybp/ut14J7RIZ/ifvEJeGkBNFU5f6UxE5r
         IyvutK3oLloQLL8PF8QAUKDKLALPnQn/DU737jfOUs2Gw0390r0gvp0heE5swu7bK4yO
         PmGg==
X-Forwarded-Encrypted: i=1; AJvYcCUiN2WcjQ9MLUIaTmki4TtSgJzKzQM8kLFHII1V4FMlsc8Gk3CBqRAPMNttQgnwk1suf+YBT2Z1va5c3uo6@lists.linux.dev
X-Gm-Message-State: AOJu0YyGm25dMqzFIww+hH8WaZaYj7vjmWJW0heDvghj72/5scjU0GJg
	MmUmBWwlg6okTXPlr+CXcyy2rm647eiT66LjYM1GZVy+VAGGNavHfANeKSwAiVQTqw8=
X-Gm-Gg: ASbGncsi0CtelyHYhzuIjY6qdyVkV5U2mSc8W4YuU8MykCuYc55xir1S27eQKHrO8tW
	u8+7kR4DoqKL+KIneytMwAN9MdoZ469wT2wg4cizp02gwN+rPJeNcytG0tFMynO9mTbaBRQi/3m
	93Iqi9tDpIReW9IIYWXwto/8T8Jp+ax6fjyvOuX7Gc4RNYmXRLo25B8Y15tW2R87skzl2Tm1f90
	DLfCMdCwKbqs+8VLDUHVvPwpHTr1riaieChO6auykFX+JxIkXHKvpYbyUNIERuqX+uhj8AgalAE
	Lh9bZvcTHdxhz0YtIKCtTP+UKbBaQAG0/KiuJBmZ7zJbAuXNOdcjABuVfwhN8SH1hB4eG05VO/T
	YKJMeQqc16sCovb1nvQATc8QFE5w=
X-Google-Smtp-Source: AGHT+IGWo1UxGtBJWVYSzxpvE5ZF5/dBz2Is5MsjfG1C/pxYl+/rzztidkfAyi1zkWZdsKT8xJCVpw==
X-Received: by 2002:a05:6214:2466:b0:6fb:1c3:f527 with SMTP id 6a1803df08f44-7099a4833a2mr205043136d6.39.1754920132919;
        Mon, 11 Aug 2025 06:48:52 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::c41? ([2606:6d00:11:5a76::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cd89d8dsm156083316d6.53.2025.08.11.06.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:48:51 -0700 (PDT)
Message-ID: <9b86fb9ac5b9cfdb773fef2db33fc13d011f53f4.camel@ndufresne.ca>
Subject: Re: [PATCH 64/80] media: rkvdec: Remove redundant
 pm_runtime_mark_last_busy() calls
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Mon, 11 Aug 2025 09:48:50 -0400
In-Reply-To: <20250704075450.3221972-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
	 <20250704075450.3221972-1-sakari.ailus@linux.intel.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-mWE7/NTeJOJLJAFXEhhw"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-mWE7/NTeJOJLJAFXEhhw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Le vendredi 04 juillet 2025 =C3=A0 10:54 +0300, Sakari Ailus a =C3=A9crit=
=C2=A0:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:
> https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@li=
nux.i
> ntel.com>.
>=20
> In brief, this patch depends on PM runtime patches adding marking the las=
t
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git://git.kernel.org/pub/scm/l=
inux/kernel/git/rafael/linux-pm.git \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pm-runtime-6.17-rc1
>=20
> =C2=A0drivers/staging/media/rkvdec/rkvdec.c | 1 -

This driver was de-stage during 6.17, I will port it, no action required.

Nicolas

> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c
> b/drivers/staging/media/rkvdec/rkvdec.c
> index d707088ec0dc..445f7c92eee3 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -765,7 +765,6 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec =3D ctx->dev;
> =C2=A0
> -	pm_runtime_mark_last_busy(rkvdec->dev);
> =C2=A0	pm_runtime_put_autosuspend(rkvdec->dev);
> =C2=A0	rkvdec_job_finish_no_pm(ctx, result);
> =C2=A0}

--=-mWE7/NTeJOJLJAFXEhhw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaJn0wgAKCRDZQZRRKWBy
9DLPAQCqPt0lXZfnbdVvPntu1sqxcp/kkdwbjcqoHkgLxA145AD+NS/iRHqsrNt9
OFMoxaM4XZImGCGuuAnhiF3H/IWu/AM=
=SIv5
-----END PGP SIGNATURE-----

--=-mWE7/NTeJOJLJAFXEhhw--
