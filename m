Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66045222597
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359409; cv=none; b=mJ1R7uWirT0tFItrRJw4TSEVyqLF2NoPbT2KvYYbZOq1hr8DWHZHzD+29KaFYsaK/eBMLKpMarf/ZjWW/RJ569umiBpVnwJAZUfvXfNX/hGDAUYgrTtDKauGYelxDpqti7VWcV2QGXiK5+NNCt/1hdRH11t7nPnMyGIeh4cVt2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359409; c=relaxed/simple;
	bh=mN4fTlEMqB5OU2N2xh+ULJz/C9EE1JynQI73XqccPII=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=K+XeU/bntjYYh/ldUqJ52iIz4wp3HWjI9w543aUv0c3vAt0AxFGUWy2+OCg/iKnGsD9BBSosn6Edh4CZvkogGvD0s3RDaH6qHzRU9nxzSWkQZkZ+sgN3bjOVNIuW+6ORFjc56t539X0GR9dGbHrfnT5OgxCKAYwpK++7V8qLulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oNVlKk9c; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oNVlKk9c"
Date: Tue, 28 Apr 2026 08:56:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777359406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=CPpAn79ejrtnnj6TrAojk2oIxCq4LLw1baXPQOla5NI=;
	b=oNVlKk9cGhLXYcmlwI/J7ZCoELtTM/o6qeOylFNHK6CRQNiCqQiVjB4FlJOvTqy5xeUgiZ
	J4p+RcODhZd/qvEIkNjZ7TF8FFtZIAorPWIPpcqYlAwH8nOGKaiJLQtiqUu7WeVDPQNRdV
	0EUoqMGQuM4Xvrt2P0wst1de7OiExao=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: shyamsunderreddypadira@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: hal: add blank line after declaration
In-Reply-To: <20260427183456.6160-1-shyamsunderreddypadira@gmail.com>
Message-ID: <17A9C473-E8DD-4CDF-B2F6-4EA5D0C4E5C1@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

> Add missing  blank line after variable declarations to comply with
> kernel coding style=2E
>=20
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail=
=2Ecom>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_phycfg=2Ec | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg=2Ec b/drivers=
/staging/rtl8723bs/hal/rtl8723b_phycfg=2Ec
> index 6d5e531505f9=2E=2E7fac1c2ba8e0 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg=2Ec
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg=2Ec
> @@ -575,6 +575,7 @@ static void phy_SetRegBW_8723B(
>  )
>  {
>  	u16 RegRfMod_BW, u2tmp =3D 0;
> +
>  	RegRfMod_BW =3D rtw_read16(Adapter, REG_TRXPTCL_CTL_8723B);
> =20
>  	switch (CurrentBW) {
> --=20
> 2=2E43=2E0
>

Hi Shyam,
I am sorry to inform you but someone has does this change already in=20
the past=2E You are probably working on mainline or older tree, which is
why this change wasn't present for you=2E Please work on top of=20
staging-next branch in the future=2E
Best regards,
Luka Gejak
