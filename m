Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460134575D
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743843; cv=none; b=O1+VGSgebekSrug4urRXhsOXp+A75RbBP137wmEsQBDMd6+mdFZuIhYLhuxC5/60BXmDLx0fyHFjyC8tYwB+Ctze9bAPWC2KHzodj0ryY8XcXngO8eckl2yrQdTYy6v4m5b7e6DTZgyzsmanqJ6geODtZBC8Qc0UYJa3tM+2TXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743843; c=relaxed/simple;
	bh=ege3VbBiJa7ATNLiFVU0SsVasBd6S0SkWPduHl5jgjs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=r9re/xMezoOxAtwnjkl1dfDtIjnsaxk+DAsRKMQd6CYMmdFjzKMZHvFikO46zi5e1JkcM+/zqLtPoNiX1T7xl/s9dDEuU7S4xwxCi6pngLnpyZxzcqo4EXNiUJJkrRzSti1Py/SM+pA3gs7dO2iE46oaUDA4O2zaPfnKAM0vuOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wvDMWpsK; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wvDMWpsK"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775743825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+Qu5hj+kNU9GIQ+2B4QzJw8p7aK4i6b37e2smrkaG4=;
	b=wvDMWpsK3WweXX/3O1R3MjQfLodY05J7i0LB7IwjXDsrroSUjBrUttY5nq2OXpLw9Phn4d
	A8YJzVaN2tA7w/oXitadgSyOQzZoOTZSheyhf5eSuZFESYxy+vzN0zf05uL38u+LYlLKgW
	hbtYhsoE0XfSRMPrUhuzvHzIq8kIAF0=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 16:10:18 +0200
Message-Id: <DHOONCA4SEWT.1C6W6Z75S2358@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <david.hunter.linux@gmail.com>, <khalid@kernel.org>
Subject: Re: [PATCH v4 2/5] staging: rtl8723bs: remove empty if statement
 block
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Prithvi Tambewagh" <activprithvi@gmail.com>,
 <gregkh@linuxfoundation.org>, <abrahamadekunle50@gmail.com>,
 <b9788213@gmail.com>, <straube.linux@gmail.com>, <tmimiharoen@gmail.com>,
 <filippo.muschera@gmail.com>, <ethantidmore06@gmail.com>,
 <andriy.shevchenko@linux.intel.com>, <rayfraytech@gmail.com>,
 <david@cardinalsystem.net>, <weibu@redadmin.org>,
 <dharanitharan725@gmail.com>, <ignacio.pena87@gmail.com>,
 <dan.carpenter@linaro.org>, <karanja99erick@gmail.com>,
 <luka.gejak@linux.dev>, <khushalchitturi@gmail.com>, <suunj1331@gmail.com>,
 <s9430939@naver.com>, <nikolayof23@gmail.com>,
 <bryant.boatright@proton.me>, <ysinghcin@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <20260409135026.137904-3-activprithvi@gmail.com>
In-Reply-To: <20260409135026.137904-3-activprithvi@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> Remove empty if statement block for cleaning up code.
>
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/sta=
ging/rtl8723bs/hal/HalPhyRf_8723B.c
> index 0780847e287d..6ab65e9e8bee 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -1415,9 +1415,6 @@ static void phy_IQCalibrate_8723B(
>  		}
>  	}
> =20
> -	if (0x00 =3D=3D PathAOK) {
> -	}
> -
>  /* path B IQK */
>  	if (is2T) {
> =20

LGTM.
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
