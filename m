Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D463F787A
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 20:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952515; cv=none; b=Q4Ji/zEPqpwnGgOSd7ja96WoRElVfZKy1rr4m25SljZFeLLBJywjfw9Yu91b6cPF7HNJRXWZEoYWeQVB4L2/GyZnGSUgoLd/fwhu991xroLZzX4O/fsCAvr5lWqYr2qZ/U4fMUaNrs+QWVQ76GLszEvqfs0jHP+9Y41uLQaD80w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952515; c=relaxed/simple;
	bh=rJ8d2dpwOb+UnFtOBT1brM+gkjc70JaCQeE/DiwBuX8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g/VjYEbsTZ6aHCXUIL24Nec8aTzGlWi079dwqgw0xjYrV38jsY8kqruVlXRVEreb6d0jjN4c8mfPp3lx5qB8Shh5ahqxT0JeXtYcKqQ9QxDUFB2W3raiy4L/+M8XKwirP12jVS7942CdZdXn2LbmN8A1GfJHZOyVZAiCC1+nZZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=rJv7KjQM; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="rJv7KjQM"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50b266413fbso8929261cf.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773952513; x=1774557313; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wnMNno8u5LdEPo1G+uE9IC/t6x6B/3bja+wkr+PXl5w=;
        b=rJv7KjQMCrjm1aPHDcPx9koFN58rXzeXleCuzjQrV+tnEeDoBtc4qtBaxLnBig0Y7d
         V7lIldKxdB3mlmPEXMuTBgPEuN0JdISmZxaejyn2R5AGHBRgMk2kQtr+k5Kija3K/yM7
         zn4CN0s67N9heLVyUiK6IKB0brSH8Q/5STB4xAow2v5RDH+K8COy44ggoOVDWrlsWfsu
         tweWMnciaCRoMOvJLbUJdnU4D3QrtnPRu1yKYnHwa/+WDDTjFSmq0iyl1JECVjgvjx8b
         jwGe6PdQBdIpRRs1TuZXkQ+v5zPlm1FmSSH/sNXMz8JGcJOwuu7kClkoXDaNwcYOX3v4
         WttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952513; x=1774557313;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnMNno8u5LdEPo1G+uE9IC/t6x6B/3bja+wkr+PXl5w=;
        b=e+owuG/WYHEw1JohgkJzeRtZnXqAJKEoxDrF+xl4zESzOIJN+S3OxDEwuLYfBVyG8x
         /jYomVdSpGW4+BrVRhCY7sbkdDA9AhYjL9C1ssmgDrIo0qcJRxmKOpSSc1zHqQo/kuPz
         B9Od4A4kw/3wrcu+IDr6sGrJeNDS409avujGfniMrIZGHV4zmIY+1edNFXLhf0uvpQGO
         a4SGoibmbnx8HUKZKd/uVPsBkTmFBxkToaj3F+spVwrgi7h4yccDQi8wNU3GimY0cd/o
         gkbRU29cl18o8G2Dj3wfzQHMhL+cMW0n2vL1KIri7Tsm/u0L1+voMTzpCUvTd777b6Py
         ocsA==
X-Forwarded-Encrypted: i=1; AJvYcCU7N9tichxIwMRyLd2FF9DPZJo/uVkOOMGmSQRIz7y4K7HupyYJ8kKiA/IYweqWOlav8E2fFgF3jHOZWtfY@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4qThArO5gk+rBWdIN0EjjWAJzeOMlGHn0IUQV+8/dM832PljM
	Ha9MGv9Rxd90QfuMEabF2lPsjaQ8AFoApiPt3kzLijo5ktzl+4xh99NzapuptkNHEPY=
X-Gm-Gg: ATEYQzyYmq/yivOtPBsBg2lwIZT+q+SBXwXOqlCwo6Zg0KiATvVTKkZR3EhBOXwOY7l
	MumRbtLnojj/XkVD5iGsOnxg+TpJhYFDEKrg2k2+gFXVjaPNejrIXkwxvo2jS3uIYUoME7zUZjq
	4aMcyrzOzpfaYcArtUdAEA5+3rEGoaNaFvJgSqQlbVxBIrKXOuiXD2asU7H87Jqr3thtkx2TpXv
	ehSGe2RUPlri0BHDhLQc2ZZmzcX4A8oMt8IjTCkGJLMwFQh+numpHtb5aYr77lIoMD+oZYQQOuG
	5GO/h8sAsFuxXJnnwJACvjVZQYeP8dWoqv2Qx/9J2yMXxzhnC5aCUSrAYOWqR3v7NRuZik76voE
	9sAumhHFyNtrfCc/EEOz0lpzhpr9goqmUb2Su8ERqu/lryfMb8R7FtbBG4jsoUDj57UW3ST1BMT
	N77ErzSskL5kB0jQb0hMQYvn0X60MM
X-Received: by 2002:a05:622a:4c0b:b0:509:2d05:6979 with SMTP id d75a77b69052e-50b3748dfabmr9614041cf.26.1773952512773;
        Thu, 19 Mar 2026 13:35:12 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36cb3c91sm5393191cf.4.2026.03.19.13.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:35:11 -0700 (PDT)
Message-ID: <9db109a657e18d1e5ead67d7db06cfaf68f7fa84.camel@ndufresne.ca>
Subject: Re: [PATCH v1] media: meson: vdec: Fix memory leak in error path of
 vdec_open
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Anand Moon <linux.amoon@gmail.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Jourdan
 <mjourdan@baylibre.com>, Hans Verkuil	 <hverkuil@kernel.org>, "open
 list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS"
 <linux-media@vger.kernel.org>, "open list:MESON VIDEO DECODER DRIVER FOR
 AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, "open list:STAGING
 SUBSYSTEM"	 <linux-staging@lists.linux.dev>, "moderated list:ARM/Amlogic
 Meson SoC support" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Thu, 19 Mar 2026 16:35:10 -0400
In-Reply-To: <20260304100557.126488-1-linux.amoon@gmail.com>
References: <20260304100557.126488-1-linux.amoon@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-cIsShmpVIGkp2hMkk7aV"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-cIsShmpVIGkp2hMkk7aV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 04 mars 2026 =C3=A0 15:35 +0530, Anand Moon a =C3=A9crit=C2=A0:
> If vdec_init_ctrls(sess) fails, or any subsequent initialization step
> during vdec_open fails, the control handler allocated for the session
> is not released. This causes a memory leak of the v4l2_ctrl_handler
> and its associated control objects.
>=20
> Add a call to v4l2_ctrl_handler_free() in the err_m2m_release error
> path to ensure resources are properly reclaimed.
>=20
> unreferenced object 0xffff0000205d6878 (size 8):
> =C2=A0 comm "v4l_id", pid 5289, jiffies 4294938580
> =C2=A0 hex dump (first 8 bytes):
> =C2=A0=C2=A0=C2=A0 40 d2 49 18 00 00 ff ff=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @.I.....
> =C2=A0 backtrace (crc d3204599):
> =C2=A0=C2=A0=C2=A0 kmemleak_alloc+0xc8/0xf0
> =C2=A0=C2=A0=C2=A0 __kvmalloc_node_noprof+0x60c/0x850
> =C2=A0=C2=A0=C2=A0 v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
> =C2=A0=C2=A0=C2=A0 vdec_open+0x1f4/0x788 [meson_vdec]
> =C2=A0=C2=A0=C2=A0 v4l2_open+0x144/0x460 [videodev]
> =C2=A0=C2=A0=C2=A0 chrdev_open+0x1ac/0x500
> =C2=A0=C2=A0=C2=A0 do_dentry_open+0x3f0/0xfe8
> =C2=A0=C2=A0=C2=A0 vfs_open+0x68/0x320
> =C2=A0=C2=A0=C2=A0 do_open+0x2d8/0x9a8
> =C2=A0=C2=A0=C2=A0 path_openat+0x1d0/0x4f0
> =C2=A0=C2=A0=C2=A0 do_filp_open+0x190/0x380
> =C2=A0=C2=A0=C2=A0 do_sys_openat2+0xf8/0x1b0
> =C2=A0=C2=A0=C2=A0 __arm64_sys_openat+0x13c/0x1e8
> =C2=A0=C2=A0=C2=A0 invoke_syscall+0xdc/0x268
> =C2=A0=C2=A0=C2=A0 el0_svc_common.constprop.0+0x178/0x258
> =C2=A0=C2=A0=C2=A0 do_el0_svc+0x4c/0x70
>=20
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index 4b77ec1af5a7..a5ab0c2390f5 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -914,6 +914,7 @@ static int vdec_open(struct file *file)
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_m2m_release:

This goto is used twice. The second time is when vdec_init_ctrls() fails, a=
nd in
that case the v4l2_m2m_ctx is leaded. Can you add the missing label and cal=
l
v4l2_m2m_ctx_release() accordingly. This way we don't have to revisit again=
.

regards,
Nicolas

> +	v4l2_ctrl_handler_free(&sess->ctrl_handler);
> =C2=A0	v4l2_m2m_release(sess->m2m_dev);
> =C2=A0err_free_sess:
> =C2=A0	kfree(sess);
> @@ -926,6 +927,7 @@ static int vdec_close(struct file *file)
> =C2=A0
> =C2=A0	v4l2_m2m_ctx_release(sess->m2m_ctx);
> =C2=A0	v4l2_m2m_release(sess->m2m_dev);
> +	v4l2_ctrl_handler_free(&sess->ctrl_handler);
> =C2=A0	v4l2_fh_del(&sess->fh, file);
> =C2=A0	v4l2_fh_exit(&sess->fh);
> =C2=A0
>=20
> base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af

--=-cIsShmpVIGkp2hMkk7aV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxd/gAKCRDZQZRRKWBy
9PaoAP9PoxyrdYiXm0RCBS8FInF86DoW/B9AvzEmZ/gHCIdlSQD/dYT0Q3twNY80
YmxdwR1+9TJyEj0XviEmd4JDTuYSxQQ=
=SUeq
-----END PGP SIGNATURE-----

--=-cIsShmpVIGkp2hMkk7aV--
