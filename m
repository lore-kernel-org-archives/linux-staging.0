Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D761E33FE06
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 23:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196450; cv=none; b=ShLkKfjWeHYtQFucVdDxziZix9ONJ3pFAvjUb3EX3acmpthNyCPGVC/WHYCh8kTescplJQnDpmaag1mH7OvOGDVn2N/b0FM9JsEpyJMKxnzavowgH98acRUfmGTQfAogAdd7Q5MDHLU0S4oRXCWuulfLPZpdCzCLVu4haj584Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196450; c=relaxed/simple;
	bh=yL3ozqXIvNHQL09rzJqznkF0RKFhQNFidnZSc4uHoEg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H9kPUZi0em/nbez8+PDWxZf3q27xboQmctW9hCtD4dYl2gX3pWF4nNCX9gGzWH0ZAj3g0TzxaCr3qSnobKNpORz5rLcvLO1oeytvLrBpb9dZ9/PyoMW4fdonZ+huFeHeL6J7eu4WQaBZEisbnfN4KJNHkjuLaXMdJ29tLfvswfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=VuhPJVDw; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="VuhPJVDw"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8acb3daf2aaso18443426d6.0
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 16:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778196448; x=1778801248; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b6U2uX4TwvjS/3Q0UsrL7npn0f3jqdHzvW4G7Vy/bgI=;
        b=VuhPJVDwfJ6R++TtqKmiyeWQP5ftQxMnsmI5wLEUYqPa+MGyaRDA6pIzLk48a9IiiL
         b6Nxlc5mClDiJjBx5KcR6/A8bf5ijeXc/stz96hYKnD3bCzvU4RcrQ4QrZSy5vwdbYVv
         FuJb72soqNDFDdes7zKT6ME7nkX50eBF29pxLeZJlCT6F3gvIb492kUKhykIE/rAat77
         SSs35Mrl+Mxd43dabuOSDzdIitYsbpgEuId7DubPrf6z57Y+sc/GiofjlxkeqOtcAOkv
         fOnvwejDPYMv76fNzZ7TID6HU3dcDcSfnvVug8QmVG560hc2ouN9s+60xIZnQ1INYDd2
         YHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196448; x=1778801248;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6U2uX4TwvjS/3Q0UsrL7npn0f3jqdHzvW4G7Vy/bgI=;
        b=fa6oNFlhPLvbEA7sjf83oxyombai8yiNEyty4ky0vGJFy3nutaG98eyGqtbukpqlzm
         nQNW7394znpTgbuEinRST+C8QctFRe9u3PuQykHXJ/BOqK5riZMayBCoale9p9no26Hy
         MrQs8sTR28Bq2CJ7+A/oCHktJ3g5ylfLhIacck6oj8uUhuTonCG4cJ71zEQNoJ10YwhN
         qybbKWoRVPKPwp7iRqodOVQgdkR8eeKwpJVTyyAA/5+8Pwnnid0qE86L+hJnkAZlGyh2
         2J8Pa5r+g0eXvl8U25y1DBcFvd7VbVwWHsNvq+fNaXqGS/EsOcthPTPGTopBuZf0TBQ3
         2yTw==
X-Forwarded-Encrypted: i=1; AFNElJ9V/pR4/Lfer5EyRB2Pynm3oyubExXL0OGuf/JiEuv7RSJ8tEQeX/bR70hon02owhokJATz1NqKDQlqb+VG@lists.linux.dev
X-Gm-Message-State: AOJu0YypDHVd3Kd+GyzOY3A5cYeXHSaIywcGfQXQ27tQ3FfTX/3RQrA1
	DhA7qBgKG26S1azN0xk9YUOPT4yAa3R9REHaYGBcjAm0i3gcrgW+/LoaCdFZlFBD3+k=
X-Gm-Gg: Acq92OGnbjCDsubvwuFbAC/ER8Q37/5XE1KCXQfVUmLkUIRtuPh2m88MZwzf8YlWOph
	Ki0amXp64WBBzdJidzYUy4c4hUPvqG0ZDrDxkiiRJ672xmjBt81OvByTjhW8LWirdpu7iIxIBTk
	BcN5eEZke4Rg64+dQxc0/FdyfFbDj5gjIajdi7ESacC763bvomHZfwgX/W44+mwV3TZ/bBbgkVp
	LW2MC278rAFk2vh45yIBmpAjjtFZnPum+m6FKVaUaI+UEmDwY1FSN3vJ2zxrBjyzrwJGXG6Wd4B
	SsM6CgpBA1QN5POy8Q/XKqSWpmTsOlK6PEGgUzHXa9TR51g2R11ZKDnt1FfdXYATE+7oG/y8iML
	Z4jcePgSg97VdACdpqvyUagq69/qGhrFtfhImy876Nd9VItdLMrE7JpSrkaNH5Faxcc0qcrYnpL
	iN8FSBAQP6QkMQkaoue75YocQJ+Vdm
X-Received: by 2002:a05:6214:627:b0:8ac:a689:34ce with SMTP id 6a1803df08f44-8bc4600fe8bmr158890996d6.45.1778196447798;
        Thu, 07 May 2026 16:27:27 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a43636fsm2179986d6.21.2026.05.07.16.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 16:27:26 -0700 (PDT)
Message-ID: <2e891600319c2fd4219ed32d884c2b5bd975c3d0.camel@ndufresne.ca>
Subject: Re: [PATCH v4 4/6] media: chips-media: wave5: Add range checks for
 dec_output_info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
 <hverkuil@kernel.org>, Nas Chung	 <nas.chung@chipsnmedia.com>, Jackson Lee
 <jackson.lee@chipsnmedia.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Keke Li <keke.li@amlogic.com>, Yong Zhi
 <yong.zhi@intel.com>,  Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>
Date: Thu, 07 May 2026 19:27:24 -0400
In-Reply-To: <20260507-smatch-7-1-v4-4-cc195f142167@chromium.org>
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
	 <20260507-smatch-7-1-v4-4-cc195f142167@chromium.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-kS8qr0UdOx8Un+zOSSmW"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-kS8qr0UdOx8Un+zOSSmW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 07 mai 2026 =C3=A0 20:58 +0000, Ricardo Ribalda a =C3=A9crit=C2=A0=
:
> If the driver's dec_output_info contains invalid data the driver can
> write in invalid memory. Add a range check for that.
>=20
> This fixes this smatch error:
> drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588
> wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' =
64 <=3D
> 127
>=20
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

It theoretical, but considering its a warn_on, I'm fine with it.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 11 ++++++=
+++--
> =C2=A01 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index d26ffc942219..f77abd5e122a 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -584,8 +584,15 @@ int wave5_vpu_dec_get_output_info(struct vpu_instanc=
e
> *inst, struct dec_output_i
> =C2=A0		p_dec_info->num_of_decoding_fbs : p_dec_info-
> >num_of_display_fbs;
> =C2=A0
> =C2=A0	if (info->index_frame_display >=3D 0 &&
> -	=C2=A0=C2=A0=C2=A0 info->index_frame_display < (int)max_dec_index)
> -		info->disp_frame =3D inst->frame_buf[val + info-
> >index_frame_display];
> +	=C2=A0=C2=A0=C2=A0 info->index_frame_display < (int)max_dec_index) {
> +		u32 idx =3D val + info->index_frame_display;
> +
> +		if (WARN_ON(idx >=3D MAX_REG_FRAME)) {
> +			ret =3D -EINVAL;
> +			goto err_out;
> +		}
> +		info->disp_frame =3D inst->frame_buf[idx];
> +	}
> =C2=A0
> =C2=A0	info->rd_ptr =3D p_dec_info->stream_rd_ptr;
> =C2=A0	info->wr_ptr =3D p_dec_info->stream_wr_ptr;

--=-kS8qr0UdOx8Un+zOSSmW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaf0f3AAKCRDZQZRRKWBy
9CNGAP9gRqo81pnTjYo/Dv0B+1g35GzQWjGMHtczGWARA6nZpQEAt4GJoVEZNftD
pcOsX6aYlBZ5WpmmaVt+Vnn1wqk5ZAg=
=l+59
-----END PGP SIGNATURE-----

--=-kS8qr0UdOx8Un+zOSSmW--
