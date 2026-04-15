Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBAE3BD237
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261459; cv=none; b=LXmW/ibHsdqVMzLvljsrFoqUO1H88kCF6kwWkuBP6K7n4cFd9UxheNf8gbxBp2PFWzl7QRfk1T9Qkk6Cw/YsREUdhYFnzuyDGs04DqSLFQyInOT8VkY7bNesIFF741bXtVPdHg3AoTLlR8pp/Q5Z8Aw8EMpJ6Oz72irswsouiDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261459; c=relaxed/simple;
	bh=/eZXNVcqkVxZ+pggOnjz2adr052KOmaOsHZWLwgoNsw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NWpZE0trkpMxN89T8sUMky38aZgKq+eFRU4q6APRoSLnwT3vNwV8bF8tFA1gjI3gYobkteIsUhn7lDfI+jq62ianoRhujUpLuGFVHgp1mg5yd2H/Ge/PgJoKkPbsOdZ3VpIweZdRBA/8Wts+LylQ6xy4/sbzdGlsMusmV6cFfnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eIJhmYBe; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eIJhmYBe"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776261446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aseQ+kQ59jHpmDWBR2uArl/6qQLjlrqFuHhLd42ULcU=;
	b=eIJhmYBejKS4FjAje9rjfbOGrHW5KxNLpZb7nsd1OPqq++SQNFP5RL5uggXWdasPINTbrU
	dSVnTG8EhaQVObL88bBR+g+PcKmG8duZwp5AebfONodIEI/EuLfTTEFmiVcZOaisI1FoSn
	X5fr9JTGmoIHv1x85d82p4IyntL4WnI=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 15:57:15 +0200
Message-Id: <DHTS4M6YM7C4.3FLQQK0QO9LRE@linux.dev>
Cc: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Sam Daly" <sam@samdaly.ie>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] staging: rtl8723bs: fix out-of-bounds read in
 portctrl()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Delene Tchio Romuald" <delenetchior1@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20260405101548.124829-1-delenetchior1@gmail.com>
 <20260405101548.124829-4-delenetchior1@gmail.com>
In-Reply-To: <20260405101548.124829-4-delenetchior1@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sun Apr 5, 2026 at 12:15 PM CEST, Delene Tchio Romuald wrote:
> In portctrl(), the pointer is advanced by hdrlen + iv_len +
> LLC_HEADER_LENGTH and then 2 bytes are read via memcpy() to extract
> the ether_type field. There is no check that the frame is large
> enough to contain these fields, so a short frame leads to an
> out-of-bounds read on kernel heap memory.
>
> This code is reachable during 802.1X authentication when the station
> is in the ieee8021x_blocked state.
>
> Add a frame length check before the pointer arithmetic and wrap the
> existing ether_type extraction in the else branch so that short
> frames are dropped safely.
>
> Found by reviewing memory operations in the driver.
> Not tested on hardware.
>
> Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
> ---
> v3:
>  - Rebased on staging-next
>  - Sent as numbered series with proper Cc from get_maintainer.pl
> v2:
>  - Rebased on staging-next
>
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 28 +++++++++++++++--------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/=
rtl8723bs/core/rtw_recv.c
> index 11ae99e53b86a..8e38cb9791755 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -539,17 +539,25 @@ static union recv_frame *portctrl(struct adapter *a=
dapter, union recv_frame *pre
> =20
>  			prtnframe =3D precv_frame;
> =20
> -			/* get ether_type */
> -			ptr =3D ptr + pfhdr->attrib.hdrlen + pfhdr->attrib.iv_len + LLC_HEADE=
R_LENGTH;
> -			memcpy(&be_tmp, ptr, 2);
> -			ether_type =3D ntohs(be_tmp);
> -
> -			if (ether_type =3D=3D eapol_type)
> -				prtnframe =3D precv_frame;
> -			else {
> -				/* free this frame */
> -				rtw_free_recvframe(precv_frame, &adapter->recvpriv.free_recv_queue);
> +			/* Ensure frame has LLC header and ether_type */
> +			if (pfhdr->len < pattrib->hdrlen +
> +			    pattrib->iv_len + LLC_HEADER_LENGTH + 2) {
> +				rtw_free_recvframe(precv_frame,
> +						   &adapter->recvpriv.free_recv_queue);
>  				prtnframe =3D NULL;
> +			} else {
> +				/* get ether_type */
> +				ptr +=3D pattrib->hdrlen +
> +				       pattrib->iv_len +
> +				       LLC_HEADER_LENGTH;
> +				memcpy(&be_tmp, ptr, 2);
> +				ether_type =3D ntohs(be_tmp);
> +
> +				if (ether_type !=3D eapol_type) {
> +					rtw_free_recvframe(precv_frame,
> +							   &adapter->recvpriv.free_recv_queue);
> +					prtnframe =3D NULL;
> +				}
>  			}
>  		} else {
>  			/* allowed */

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
