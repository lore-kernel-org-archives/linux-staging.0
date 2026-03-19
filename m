Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26AA3EF0D3
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773954544; cv=none; b=h6JyXr6kUA4z1fUwtusdR10mWHjOjkkJPhdRmIz1aV8FNYrHQc75i5s34PWei6Mx39+v7MS8EbBi14WsBE/LLwcbBr/mmZdDUPmvCJ6cc6kCDYSxry2I5d/hfXwfuJJgEgpaLWq9TByy8jTaE6u2NHiXNXWYgPsqCmoXyDPAvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773954544; c=relaxed/simple;
	bh=8CMszLdlY0/NUEelAR0v025hIftqH9LzabpmqiAqBag=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g+TlKfhsXywXIVAsn+zveH8OWFs0D+ya8Gf0CTO2toyAMdta3MAqtn8FE2iGBKBg1mSrYihtoqVLEXVYOOehcNfIW5C7kyFkIi7df4eAJbzzQiEsChj2U0V17kavdldru+pMWVurFXSrTEVQYv1PclZ4JvEn99F9jFpAPQHR0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=f7uP1yGX; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="f7uP1yGX"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-509064418a8so14898151cf.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 14:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773954541; x=1774559341; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NMbfSQLQ1xEd+7s0+CT4TDbp3oywa75VWIVmbsOBScc=;
        b=f7uP1yGX8ebugHYd1liLgFR6XI3BND0iQ2PpSoMGZowHuoQhbdZ5kc8DkaoVEkxljp
         zGddUZeM7vrwYwtF4SobSfjGpx4aL4pvxi+qOPV9/EZ/Gz/eoN9fRfaIjIYxieOrfC0r
         8lRPaneuRhj1FFJblSaO4aJaVsMHKTGj01Inlaj0jjwcTET134fx7kl6J2mXkU93w27u
         hupXdrvpYQC8Peb0uHdNtJuQg2fNOAmbpu64NUW3JrEgPYEj75aCs4gooOJyAtOd/Zfv
         ZIoQhIOuqPQnZzY+T3KX+ZK4Bjem4zLGREZFB5pNKDpeERuDcKO777XBIoz5WgxGrY27
         tZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773954541; x=1774559341;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMbfSQLQ1xEd+7s0+CT4TDbp3oywa75VWIVmbsOBScc=;
        b=egupLIL+5w8zbvsnShgIq4rqrYJeeGbcPS+gVb+r8vXAbAbaipisEZ+sR5yDRztdyS
         XKxC1vaptVGlUI7X2NTUo6PaTAb/laNDG1OIr570yY5HuNZvaqNuE1xuf9GXSV+2o9Sd
         O/u1njPUhnrS+rCSvjBxSY/X9KXMB3B71kAP5w+umMMPL9eY1DMB8sEaLLA5eIjg+Hjw
         p0IH4bHG9AoTlKle7MaWbIpYxs2PhWy6aUpLzL9iN8iIOdJ3KlSiHA3kGYkzhNm1jZ8c
         8XrNEhB2NYleZhuKe1ZP3V9UG1+DlNZCi2cVIdGSUcBLV6xr8WuKB/5CcKtFif0fgNHx
         OJgg==
X-Forwarded-Encrypted: i=1; AJvYcCW4xY5QbqypPF02zSM7ctROVhFLhJrdo1Oc3dqs4oQhbjB8RLRFkx4DH7VxKV9MPcgS17l6MsdYI63NaGlB@lists.linux.dev
X-Gm-Message-State: AOJu0YyXA2bc0lTOynhb7rTSwdbvNneRoa7ljF2SoabpHZzZB2nWj194
	xYihhI4vHUQGeOQ8Kob716I9bTFYElXqpEuay7z0F8gHGblpRYmIckv0jlFNnuwZ/5I=
X-Gm-Gg: ATEYQzyCstqkZVa5HDsbdPNr41TGv7GFvrfGwVHQOgbad2fdy07AOkqTd2AtDSuL+uz
	ScTgXnRWqANFU9l8OgHVlRdZGOYWooTAztDKc5St4lOsqWoA7CVMmD00FiKqOL59xR6C0p+rL71
	DQKf0QfPyYl+Tv8prD/o+V1OuMl4nBLcF/iWmzlhb9svD4IUgdgkDSib+elIZyBWbU78Sgx9+Ft
	GLCbF2bGQqgagrXEqviTGbHpiUZ+Chsv0BR50vs3XVxBOfvAupqdsB8zKtRBTE327ngz5lEtHU1
	DzcsJz4p961vsmBMnysGCtOJqgs1XN0rQo8q195zv5sH6BHFKR63iunA78OjhvdhhY9DF8mVgG3
	1hiu2Cu4wWqIknmujNJ3qwBU38rgp8JBXDOOf3i4b2qp6ES4I2x4Lr4g5kxMWhQCgkztfPOzhJY
	giKMTmZ0HGodM0UtJwfe6fsawsPdu2CtoT5KfCAmQ=
X-Received: by 2002:a05:622a:8c4:b0:509:2527:d789 with SMTP id d75a77b69052e-50b373bdd66mr13176761cf.6.1773954540418;
        Thu, 19 Mar 2026 14:09:00 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85257c9bsm5961546d6.20.2026.03.19.14.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 14:08:59 -0700 (PDT)
Message-ID: <ebeb15d9479e651f31be59b797f4e95cf1713243.camel@ndufresne.ca>
Subject: Re: [PATCH 4/7] media: mediatek: vcodec: simplify cleanup using
 __free
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org, 
	m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de, 
	tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, 	matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, 	johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, 	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, 
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, 
	hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, 
	dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, 
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, 	tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, 	linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, 	linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
Date: Thu, 19 Mar 2026 17:08:56 -0400
In-Reply-To: <20260310200513.2162018-5-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
	 <20260310200513.2162018-5-sanjayembedded@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-P5pBQoC3BtsCjb7Hnh/k"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-P5pBQoC3BtsCjb7Hnh/k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 11 mars 2026 =C3=A0 01:35 +0530, Sanjay Chitroda a =C3=A9crit=
=C2=A0:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>=20
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
>=20
> No functional change intended for kmalloc().

While I like auto cleanup, I think consistency is key. kmalloc is a tiny li=
ttle
dot in the sea here. Most of our leaks are in probe() error handling. In v4=
l2,
you find a log of init() with matching releas() call, which get constantly
forgotton. My suggestion would be to focus on one driver at the time, not
kmalloc across the kernel, and try and "port" these driver to consistently =
use
the cleanup function. This should also come with usage of quard() as its th=
e
same objective.

You goal should be to return at any point in the function without risking o=
f
leaving lock/spinlock held or leaving memory.

Marking as change requested the codec releated patches in this series.

Nicolas

>=20
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
> =C2=A0.../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c=C2=A0=
=C2=A0 | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbg=
fs.c
> b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> index 2da11521fc7b..3184939f793a 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> @@ -96,7 +96,7 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, c=
har
> __user *ubuf,
> =C2=A0	int total_len =3D 200 * (dbgfs->inst_count =3D=3D 0 ? 1 : dbgfs-
> >inst_count);
> =C2=A0	int used_len =3D 0, curr_len, ret;
> =C2=A0	bool dbgfs_index[MTK_VDEC_DBGFS_MAX] =3D {0};
> -	char *buf =3D kmalloc(total_len, GFP_KERNEL);
> +	char *buf __free(kfree) =3D kmalloc(total_len, GFP_KERNEL);
> =C2=A0
> =C2=A0	if (!buf)
> =C2=A0		return -ENOMEM;
> @@ -134,7 +134,6 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp,=
 char
> __user *ubuf,
> =C2=A0	mutex_unlock(&dbgfs->dbgfs_lock);
> =C2=A0read_buffer:
> =C2=A0	ret =3D simple_read_from_buffer(ubuf, count, ppos, buf, used_len);
> -	kfree(buf);
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0

--=-P5pBQoC3BtsCjb7Hnh/k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxl6AAKCRDZQZRRKWBy
9KL5AP0StbOgEgmi9hNrOmp59Azp5ubjHNUiKBoy3k0YPFJl5wD+MXkfWFOYepSc
n+TSCme76s+FElTo92PrABWSwDA54g0=
=noWy
-----END PGP SIGNATURE-----

--=-P5pBQoC3BtsCjb7Hnh/k--
