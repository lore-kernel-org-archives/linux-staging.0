Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135E22EB874;
	Mon, 30 Mar 2026 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886056; cv=none; b=O34WoIRO8UBH7uIONHOHLjgI+t+1QSx2oNjMESQyLRbR15MAhdb3g1U2HOF3IU7ybylMr3QO4q6fuNkBgv5wmQQJDwOPPTeJZoBcnc2evcUIBZ+ZLA0G7QzAH3B/eLmYHumrLY1nr7wZova5tOw0mSQEwGoMz26ZXBFE3vlUeU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886056; c=relaxed/simple;
	bh=evRfJZ2H0f5w7cEuYrRalerBqdAFDdmPvV3Byn5zcKk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pSPQ81D05XwGGNAi07Yz0Il9TsttL5uSaWJJlEL+bUyhcVjhB1NEmLQ+FzSz6x25n6DhE8eA8ad8DqcEJSBwGBhD/GcEq/qnEXoGoPIak5MZOslU4HRpxsM/YpgLr8IkgsoemqTfG2O8G6IL6ZJC4pM+IQWFC3Pa1O+vzQQVq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fLMVzIO0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fLMVzIO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774886052;
	bh=evRfJZ2H0f5w7cEuYrRalerBqdAFDdmPvV3Byn5zcKk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fLMVzIO0WL+sc0qyr1bmUKPIeRxe5LGIhn01XN65Tdy4jP0Mbk93NzcokPLqcbb6g
	 Jw8Vef2vcRCoDEeEHmQMdEk+jzWy4PfbHSNdiJQRp+dllic3Jt0vONpxJRSAsoYXQZ
	 a8/34zeO0Qlfm/boSMeJiwrib/bcX3BLBId3CXAMdwAj9zPa4ZvAabKtbPYKrnOmOU
	 7PQN7uJdT+2/5Zi9Peg8rknUiCTsblsLtQ0KZTvrlV0ggTgAipAUPtI8qwo8HVcpL+
	 RJQTAFEulEKowN2/Uy333hWFXgye6g8tnk2TIsc/ad5nWcdTRhT0OrS3xjhBBg6Xl1
	 0It6wdX6YaP2g==
Received: from [IPv6:2606:6d00:15:e06b::c41] (unknown [IPv6:2606:6d00:15:e06b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC9FA17E4884;
	Mon, 30 Mar 2026 17:54:10 +0200 (CEST)
Message-ID: <ac0caac393dbc7dabe6e0fd530a6a2f9d2742f00.camel@collabora.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, mripard@kernel.org
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 30 Mar 2026 11:54:08 -0400
In-Reply-To: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-kv04JgWUz8A1UA6gWqGA"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-kv04JgWUz8A1UA6gWqGA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 mars 2026 =C3=A0 16:08 +0800, Pengpeng Hou a =C3=A9crit=C2=A0:
> Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> stateless slice control and later uses their indices to look up
> decode->dpb[] in _cedrus_write_ref_list().
>=20
> Rejecting such controls in cedrus_try_ctrl() would break existing
> userspace, since stateless H.264 reference lists may legitimately carry
> out-of-range indices for missing references. Instead, guard the actual
> DPB lookup in Cedrus and skip entries whose indices do not fit the fixed
> V4L2_H264_NUM_DPB_ENTRIES array.
>=20
> This keeps the fix local to the driver use site and avoids out-of-bounds
> reads from malformed or unsupported reference list entries.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> =C2=A0drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_ctx =
*ctx,
> =C2=A0		u8 dpb_idx;
> =C2=A0
> =C2=A0		dpb_idx =3D ref_list[i].index;
> +		if (dpb_idx >=3D V4L2_H264_NUM_DPB_ENTRIES)
> +			continue;

Matches how we skip inactive references (in this diff, though most userspac=
e
just don't pass them). Now, if I looked lower, we set a position for each
references. My understanding is that if no bits are set, it means "no posit=
ion".
How much testing have you done to confirm the HW behaves properly ?

Despite this question, I think this is going to work better then doing memo=
ry
overrun:

	Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

> +
> =C2=A0		dpb =3D &decode->dpb[dpb_idx];
> =C2=A0
> =C2=A0		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))

--=-kv04JgWUz8A1UA6gWqGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacqcoQAKCRDZQZRRKWBy
9DAQAPwKkG9KdjJow+AAJHKaPq3Zeel97DZlNnHZBVd/Ag0xRAEAs7QtX42z2jd5
4nollgoY5CGJnkjx9RVSHq+m86uwcgU=
=/FV6
-----END PGP SIGNATURE-----

--=-kv04JgWUz8A1UA6gWqGA--
