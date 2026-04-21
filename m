Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EBB3D88E4
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 14:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782105; cv=none; b=QfAKPoDwDMilVQvtURO81xn+xaVvnUbhk0sVPGe/HL8nohW0aTIDHVPWdaFkB6M8HhHaz9EDy3GMoysbyO8zrhT1a72277VAa1sCSWQ7INddtrB/hJT2a5PW2lpOZq5JRHCVAw0E69lSPrWShXmBZISqWU2Z7cYDTUkvuw6GCCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782105; c=relaxed/simple;
	bh=R8FbH+gfNd5fc821Yg9zJ2esTHFRO3g6WLDHYgMxu5M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=tYocMeSyGvBioQhtUMtzG9rKjgKPqpMC2b1//eRdEbGT1fMLKPYpaNLsjppVmsWUiXg9VYRZWjn2UnPjqXHhoL4wWjIri8pv1ggjZnQKubEm4daTpKssislaxvYUqj42HHxHYS8K0ccgCiKeaGJHOa8pflAYg/z2wOx2y94BhFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m8oDS2CY; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m8oDS2CY"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776782102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ox0ghsjGBMOuQtIIO2JXO3UwJwMek1IS48D84/g59uQ=;
	b=m8oDS2CYmErXii328uKmNcmGBs49jRSbJZFonl34jIXoJ577TowbgB8eLFf63cmaaFpPhB
	UN0av0ZDHwXW1jniM5OOCkHrWDkcvCqNH/maMzCoyvooVU+cq8sD0BdJCxHeaqqMmFFVx3
	w6ch/oH9MZDYx75KJ+K89hNxwiZ/lyc=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 16:34:59 +0200
Message-Id: <DHYWOS6IDJYZ.38RPFER7RAFSK@linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant else block in
 sdio_halinit.c
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: =?utf-8?q?Demir_=C3=96zdemir?= <demirozdemir@disroot.org>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <aeY1Mc2uEUKkr-dB@archlinux>
In-Reply-To: <aeY1Mc2uEUKkr-dB@archlinux>
X-Migadu-Flow: FLOW_OUT

On Mon Apr 20, 2026 at 4:16 PM CEST, Demir =C3=96zdemir wrote:
> Remove redundant else block after a return statement within if block in
> rtl8723bs_hal_init(). Identified through checkpatch as a warning.
>
> Signed-off-by: Demir =C3=96zdemir <demirozdemir@disroot.org>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagi=
ng/rtl8723bs/hal/sdio_halinit.c
> index f2f73c65a636..809f07855bb8 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -654,11 +654,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>  		padapter->bFWReady =3D false;
>  		pHalData->fw_ractrl =3D false;
>  		return ret;
> -	} else {
> -		padapter->bFWReady =3D true;
> -		pHalData->fw_ractrl =3D true;
>  	}
> =20
> +	padapter->bFWReady =3D true;
> +	pHalData->fw_ractrl =3D true;
> +
>  	rtl8723b_InitializeFirmwareVars(padapter);
> =20
>  /* 	SIC_Init(padapter); */

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
