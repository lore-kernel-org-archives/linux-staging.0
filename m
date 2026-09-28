Received: from mail-qk2-f6.google.com (mail-qk2-f6.google.com [74.125.230.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC7E45A2AA
	for <linux-staging@lists.linux.dev>; Mon, 28 Sep 2026 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624993; cv=none; b=tQ1RTezQRw043lLNn+F8hhooFy/te6sHddSWW9JjtA/RjUuqoAEr23DcA+cjpE/+B+VrtC31OzT8/tnVmP7yRqSwBp1mzPA/YJ4+8jW8AfdcLh/wNQxRHm8imqllOLrmaUmR4YR1haOFvNvaZA5dOrySdtwsyroI1OBqvo/CwG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624993; c=relaxed/simple;
	bh=fMONoEBgG4nLBh7c5SXZ6poRJnWQ2qCJel9Yj+ssiBQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NTSywIhRwtcdjDXRAXwvPKJW2Gqqv8zsWDdMrBGF52tATqN/iKilBkbAF5zuk6DoXuX3uhNBhq71LZysdJnAIbUjvjBYEKUSc6qkPMoabSPcOU1IVNa2tQAP+tQm38TK3JvRMf0a5Qw+GWtzOziViP9sgpgI7ka3il6vGDwCBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=AhwCqq1r; arc=none smtp.client-ip=74.125.230.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="AhwCqq1r"
Received: by mail-qk2-f6.google.com with SMTP id af79cd13be357-93bfb25817cso218331685a.0
        for <linux-staging@lists.linux.dev>; Mon, 28 Sep 2026 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790624989; x=1791229789; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lk8F8JKc1EoPYwR92nVb2I5Z7QuoWCCQFi9uhIFiIbw=;
        b=AhwCqq1rHQVlfgyXSizYQtY8aiTQB9WJEXQ8cUDrz20SdZ8YHnruJ64kPMzWcIsf+b
         kgQ3vgwCGAuVWWwtTQAn5G/sctffZazVKhK0EVj/9AtlS3v4RGmdmaro4JUgXmzQ1teM
         3C+WH3OO8UoyLBeO38rUE1Z7L4JNRlaSp9Mrd3mgcSRHgRE+1euo80paBRpuaGSJkvET
         tz4BCEDq41qs+y5Nqpo5c4CPyJNRHbAKstWTeVUuZGlI6uApT1Uby26rpwge5wu6YYmI
         PxBPLTpa9cKdoUdfXz57npI/0FDD60C2E/hl3BjSOYJwfVKiZSzdKflnSmDzqX4Nc4yK
         b4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624989; x=1791229789;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lk8F8JKc1EoPYwR92nVb2I5Z7QuoWCCQFi9uhIFiIbw=;
        b=xa3ftueVUY1Xag7ZvudTFhJcAjdAkPnT0MOld7ZC62o6XMrUqqcfUc4M/Q0SQSPQmP
         8dzgm+qBUkr4LggJdhSgOiYD0ud+M5wVtubZhdbyXApkEGvi8xjymfVVrE394ORAdXfU
         lb5wwDPRDWfzvP1wROg3QRh8K3c5VhL+FQo9N1v3dxEZ8h8kpuyCn8EXw+Zznk0t0T2s
         b3hWlC8sA+jiodhw+33G/rz7mmp0P9eVvXFciLLHs3C+9IHbm8CbyzG17lzL3ApNGqVN
         SqSilzFYFgxUFru9b7FvnHvkK+1XFVwmbMGswi6dPrVcbkwx6St8sU/Pty3ESGuTDP9y
         M8cw==
X-Forwarded-Encrypted: i=1; AKwUvBz0nE6v322YrBn4AZ/qLsWk/v5lO7RUsAhThdgO4z3xqXEVuVr4lXznorVhEnN8CqgaNkW1UZHL2+3x84m0@lists.linux.dev
X-Gm-Message-State: AFuF++nkAiH/FKzgWTO72IN8AyDt1xGEcsmNTrGIc7+deNPQPIT8Cuat
	4rX1jiULAErXQXbxEmdvFzsRd4Fu7PCmS+bSZxZk6kJBe7lUepP5YDpya4DAJOY7SX8=
X-Gm-Gg: AYBFou31ub4ElszwyhjAmu+Ty7CvKgwDezmjM3jYBi6n7APv0TpCQ0A6OyQiIH7OS6D
	4s7IcPokajhAGebHeF3tCqPYwn8fQtLpJRf9ccP4bumPjaDJATePnTxDPcMohbiw2hX35rK0Bwo
	eYFvfSP/NzCFq8E+qWzQYU9ea0ECbJcYj9lwg/l72Ht9+ZXqB2iJU+DqFI5oy5FGcEb6fEFZAqZ
	otBJmXi06oapNR+/Q+6Y19dQl/x9qZD5XMzNJQ18eR0CX8GAH5abrEkh6CVXCRu2uC3IvhWqlId
	Rb0vmjDSWJFTubXpSR5XM+H89raf22/2JcBim+GjQnvt8rN7ollx+ffVpVozt5sA2u0EGqw4Jy8
	kh0NkEy4Wzg1JXH2dcpFO0HwXqeXTBtkIVsUfFq7yYVq6kyN30kkRHgBS1hpXh18+taGLJBH1Ll
	lzd7C/TzU04B3bUzmbu6hkNGWRsOolWF9NXTxdO/56VpGwCshOaOPKIChd83+8edEKhG5KK8iIJ
	YMIbhMyDMxTBUNKypYnSA6m
X-Received: by 2002:a05:620a:2628:b0:93b:beb3:5898 with SMTP id af79cd13be357-93c43ce7bfcmr2220308485a.49.1790624989158;
        Mon, 28 Sep 2026 12:49:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c813dca59sm227347285a.22.2026.09.28.12.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:49:48 -0700 (PDT)
Message-ID: <b4666dae3ded36f157d77f839f692a19a3ad9d06.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of in-use
 frames in codec_vp9_rm_noshow_frame()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Doruk Tan Ozturk <doruk@0sec.ai>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Kevin Hilman	
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, 	linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 15:49:46 -0400
In-Reply-To: <20260627063905.79363-1-doruk@0sec.ai>
References: <20260627063905.79363-1-doruk@0sec.ai>
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
	protocol="application/pgp-signature"; boundary="=-ZDhsxysEA1cWoT9Xmzeg"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-ZDhsxysEA1cWoT9Xmzeg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 27 juin 2026 =C3=A0 08:39 +0200, Doruk Tan Ozturk a =C3=A9crit=C2=
=A0:
> codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
> ref_frames_list without excluding frames that are still in use. When the
> previously decoded frame was a non-show (alt-ref) frame and the current
> frame is a non-show inter frame, the freed object is the one
> vp9->prev_frame still points to; codec_vp9_set_mpred_mv() then
> dereferences the stale pointer (use_prev_frame_mvs and
> codec_vp9_get_frame_mv_paddr()), a use-after-free. Freeing a frame that
> is still an active reference (codec_vp9_is_ref()) or the current frame
> has the same in-use-then-free shape and additionally desyncs the
> reference bookkeeping in codec_vp9_sync_ref().
>=20
> The sibling cleanup codec_vp9_show_frame() already guards exactly these
> cases before freeing:
>=20
> 	if (codec_vp9_is_ref(vp9, tmp) || tmp =3D=3D vp9->prev_frame)
> 		continue;
>=20
> rm_noshow_frame() simply omits the same check. Add it, also skipping
> cur_frame, so both cleanup paths agree on which frames are safe to free.
>=20
> The fields that drive this path (show_frame, frame_type, intra_only) are
> parsed from the VP9 bitstream, so a crafted stream fed to the stateless
> decoder can trigger the free-then-use.
>=20
> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> Found by static analysis; not yet runtime-reproduced (Amlogic Meson
> hardware required).
>=20
> Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>

I can't really do anything about this patch without an actual Tested-by. Pe=
rhaps
try and ping someone with the hardware to let this patch progress, meanwhil=
e
I'll pass.

This is also a staging driver that is likely to be removed in few cycles
considering it not being maintain and there is several competing drivers be=
ing
developed.

Nicolas

> ---
> v2: Per Dan Carpenter's review, also skip active reference frames
>     (codec_vp9_is_ref()) and cur_frame, matching codec_vp9_show_frame()
>     exactly =E2=80=94 freeing an in-use altref/reference frame here also =
caused a
>     codec_vp9_sync_ref() desync, not just the prev_frame UAF.
>=20
>  drivers/staging/media/meson/vdec/codec_vp9.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/stagi=
ng/media/meson/vdec/codec_vp9.c
> index 8e80ecf84193..dad75950933c 100644
> --- a/drivers/staging/media/meson/vdec/codec_vp9.c
> +++ b/drivers/staging/media/meson/vdec/codec_vp9.c
> @@ -1238,6 +1238,8 @@ static void codec_vp9_show_existing_frame(struct co=
dec_vp9 *vp9)
>  	pr_debug("showing frame %u\n", param->p.frame_to_show_idx);
>  }
> =20
> +static bool codec_vp9_is_ref(struct codec_vp9 *vp9, struct vp9_frame *fr=
ame);
> +
>  static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
>  {
>  	struct codec_vp9 *vp9 =3D sess->priv;
> @@ -1247,6 +1249,18 @@ static void codec_vp9_rm_noshow_frame(struct amvde=
c_session *sess)
>  		if (tmp->show)
>  			continue;
> =20
> +		/*
> +		 * Mirror codec_vp9_show_frame(): never free an active
> +		 * reference frame, the previously decoded frame, or the
> +		 * current frame here. prev_frame is still dereferenced by the
> +		 * MV predictor in codec_vp9_set_mpred_mv(), and freeing an
> +		 * in-use altref/reference also desyncs codec_vp9_sync_ref();
> +		 * either is a use-after-free of an in-use frame.
> +		 */
> +		if (codec_vp9_is_ref(vp9, tmp) || tmp =3D=3D vp9->prev_frame ||
> +		    tmp =3D=3D vp9->cur_frame)
> +			continue;
> +
>  		pr_debug("rm noshow: %u\n", tmp->index);
>  		v4l2_m2m_buf_queue(sess->m2m_ctx, tmp->vbuf);
>  		list_del(&tmp->list);

--=-ZDhsxysEA1cWoT9Xmzeg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrE2gAKCRDZQZRRKWBy
9BjOAQCcJJZ7xjpltnqzUdi6P6d2itMrbhl41cjmeE/c74heSQD/fIwpHsmavr36
/iKd8Y6urOm/Xeb/2/lPx2ob8TKg3gQ=
=dr9M
-----END PGP SIGNATURE-----

--=-ZDhsxysEA1cWoT9Xmzeg--
