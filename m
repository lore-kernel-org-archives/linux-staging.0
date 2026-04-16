Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A0E30E0F1
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 20:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776372135; cv=none; b=Q8xVuVMrIrL52wBers7KeqQVjehRqyabtbt3YwpVcCnwSN/oFn3hm3LTg4GYKkbC+i1QIvhwqgxWFf+vY4WzIE+giqUqBTYqeshicSISZummZocaFEOMheyi431ZLsb588CDoxPsh2QdRnD88GYoyn371UsIO0Xu2ehLZByYOMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776372135; c=relaxed/simple;
	bh=F8di6AQXvK9NbhcXGrjY6WGk9KUNhceggzDYEKqvcDQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TIvcfT4AeGlmNDctlsqzfcgSnfupY5Bgs0ZMbyi013tbULhjwIfZ6tN27I8jhvVkz8/80z4j0hVlc9EryBhTVHVICyavkFN/FP98sJXBvsG1C7QIm7iiGPyRQ6Xcvc0b4CyXVh4Q7h9zTgWcbRXPC9EXlgBPEJic9bq5RZuiu8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HL235FiQ; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HL235FiQ"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776372131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62TMpMdKSNbH2l7xV0lgN/xOkU6uD25fVKpNXWsxo5Q=;
	b=HL235FiQg/TAAxcy/7lPgwXcrG96VRb2S8L0ZW0fvG/vNycoSbVQQ+sqi/hSfAEcAAYIM7
	UuXhaPWed2CrBqDEa3/GGDFElyyb12ug58rnhogux7Iurs/9vS1p4t8MNAcOpg+Hxyj+hr
	q0Ne8mSA4mQYaeyhcZwVCT21vSh652I=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 22:42:07 +0200
Message-Id: <DHUVD5N4JNX9.20NSTUBQJJNTC@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix stainfo check in
 rtw_aes_decrypt
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Maksym Pikhotskyi" <mpikhotskyi@gmail.com>,
 <gregkh@linuxfoundation.org>, <ethantidmore06@gmail.com>,
 <starpt.official@gmail.com>, <straube.linux@gmail.com>,
 <sameekshasankpal@gmail.com>, <arthur.stupa@gmail.com>,
 <luka.gejak@linux.dev>
References: <20260415184727.285753-1-mpikhotskyi@gmail.com>
 <20260416195338.324428-1-mpikhotskyi@gmail.com>
In-Reply-To: <20260416195338.324428-1-mpikhotskyi@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 16, 2026 at 9:53 PM CEST, Maksym Pikhotskyi wrote:
> The null-pointer-guard was incorrect, returning _FAIL on valid pointer.
> Invert the guard, so it returns _FAIL on invalid pointer.
>
> Fixes: e23ad1570028 ("staging: rtl8723bs: use guard clause for stainfo ch=
eck")
> Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/stag=
ing/rtl8723bs/core/rtw_security.c
> index a00504ff2910..f467cb5b1dca 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -1212,7 +1212,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *p=
recvframe)
>  	if (prxattrib->encrypt !=3D _AES_)
>  		return _SUCCESS;
>  	stainfo =3D rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
> -	if (stainfo)
> +	if (!stainfo)
>  		return _FAIL;
>  	if (is_multicast_ether_addr(prxattrib->ra)) {
>  		static unsigned long start;

You should Cc stable and also add Reported-by tag since you weren't the
one to point out the bug.
Best regards,
Luka Gejak
