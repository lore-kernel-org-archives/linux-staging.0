Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0883CF023
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261481; cv=none; b=GQQK2kOtLkxdVFoZEf6TbLpoBLvoHSpnUDjlBVCnOPPh+gs7S9QMpkl0t9yRNMgSEDetJLJIvBlthQKtpcyNXaGDvFNsQnuYXj9GQIjs67JLJE6vxZJWzePYHRsfXu3T+XkYVlwVwDQFCT45o3+r6YBg8m9Pz42w+dorWfDVe8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261481; c=relaxed/simple;
	bh=EOZjU47CHf+B/t5uXb0Ov89ZLgo2NALEUOUnjFLj6Gk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FEKoXsoDYFm6is8BCJm6HPXrsj3THM9Oax6dRpJHbjpep0ETwFvuDULf9hg3A5y+R7lNZPzSnNldK9V9eV6SDGJTzf1WKIB71BaPomckEKohfmQF1w1cMfcLXO2JrzaD4NhaptTJGszK+SOZ/kMrA7fgFRkfmYxz/H9jI7pIG88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Fd2+bQvb; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fd2+bQvb"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776261478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfiul3MGhwYAtmX4Dlqc942dPm8uLGAlgS/Hnt4ARlU=;
	b=Fd2+bQvbnFLBm+NNalPzoiytNRlYzzmWQO1OjVj0m4ZpOUeRTinNXVYrsCmHnhWAPrsGMG
	JJYMqjzotRlxkBvWAkxqRML2vdLApETckGmBANBPNK3X/wnohgAkcwh4x91XOwQuSEU8Yz
	XHVoTzN7k5UR/5AoT4C7qkjqiAOIlVQ=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 15:57:41 +0200
Message-Id: <DHTS4Y8QKDSA.28VLQAVTLYHIJ@linux.dev>
Cc: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Sam Daly" <sam@samdaly.ie>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] staging: rtl8723bs: fix negative length in WEP
 decryption
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Delene Tchio Romuald" <delenetchior1@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20260405101548.124829-1-delenetchior1@gmail.com>
 <20260405101548.124829-6-delenetchior1@gmail.com>
In-Reply-To: <20260405101548.124829-6-delenetchior1@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sun Apr 5, 2026 at 12:15 PM CEST, Delene Tchio Romuald wrote:
> In rtw_wep_decrypt(), length is declared as signed int and computed as:
>
>   length =3D len - hdrlen - iv_len;
>
> If the received frame is shorter than the combined header and IV
> lengths, length becomes negative. It is then passed to arc4_crypt()
> which takes a u32 parameter, causing the negative value to be
> implicitly cast to a very large unsigned value (e.g., -8 becomes
> 4294967288). This results in a massive out-of-bounds read and write
> on the heap via arc4_crypt(), and a similar overflow at the
> subsequent crc32_le() call using length - 4.
>
> Add a minimum frame length check before the subtraction to ensure
> length is always positive.
>
> Found by reviewing memory operations in the driver.
> Not tested on hardware.
>
> Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
> ---
> v3:
>  - Rebased on staging-next
>  - Sent as numbered series with proper Cc from get_maintainer.pl
>
>  drivers/staging/rtl8723bs/core/rtw_security.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/stag=
ing/rtl8723bs/core/rtw_security.c
> index a00504ff29109..f3bc2240749a4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -113,6 +113,12 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *=
precvframe)
>  		memcpy(&wepkey[0], iv, 3);
>  		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11=
PrivacyKeyIndex].skey[0], keylength); */
>  		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keyl=
ength);
> +
> +		/* Ensure the frame is long enough for WEP decryption */
> +		if (((union recv_frame *)precvframe)->u.hdr.len <=3D
> +		    prxattrib->hdrlen + prxattrib->iv_len)
> +			return;
> +
>  		length =3D ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hd=
rlen - prxattrib->iv_len;
> =20
>  		payload =3D pframe + prxattrib->iv_len + prxattrib->hdrlen;

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
