Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEE93A4521
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446533; cv=none; b=SJgaDleBfafrx0DMmQ0oTu8L0iM3VdQg1cK4hP9JA0iqy267Ik/l5oZUDRmTTQw/PoXZBO69xM7wDhMz37/OAyUc7KSZuw26pUZuAxdKyHmz0QcdzlpUFbrkZrdh3AGnM/4LMUcxMh778TMJhB6epfKA1hjX8So5l8Tgls031NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446533; c=relaxed/simple;
	bh=zpzAEBV8jc7P1oysBRRvTJFbERVkSfVBROgd/6CGJhY=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=SXlX5Ms8o6Riekzb41IHfDQsTEnvziMFqCrhzhj5GuNhnQNvaqot8Qg7xBlJ8ySD60d7PhZJ75+5WIXqRKzp/WeW3Jk6OnxlpSYG7u3dg8ShgAnmZdSATmGoFg3+JDvTuW64bj1s+eQkLJ26tx/GaxvS7KSfn61XE8aE5sNHZ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PypyT4WU; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PypyT4WU"
Date: Wed, 29 Apr 2026 09:08:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777446527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=I0T7ooeVUTLQA1kFyECElNFV8NJbALc17kUMcA0e314=;
	b=PypyT4WUX8vhnyASt2SWkEgMsXiB3ArKUB202+HQc9F4gcxz6k+4LNQe2NHtl0lMlh8koU
	AZEmBLkBarOvOsQs61HkQlxM2aDImCZWRd/fcfVvpPYWWsXzOp9383u114GoMKJdbR0xsO
	WZ3VeUOs8a2r3MFfWxhJj+aTqE3oTis=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: mahamaryamjavaid@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix typo in rtw_pwrctrl.c
In-Reply-To: <20260429034156.11523-1-mahamaryamjavaid@gmail.com>
Message-ID: <2CFB6073-89CC-47B5-BACE-BF1F86710E0C@linux.dev>
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

> Fix spelling mistake: willl -> will
>=20
> Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail=2Ecom>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl=2Ec | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl=2Ec b/drivers/st=
aging/rtl8723bs/core/rtw_pwrctrl=2Ec
> index f074ea6e0f38=2E=2Eca1cb58fc801 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl=2Ec
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl=2Ec
> @@ -576,7 +576,7 @@ void LPS_Leave_check(struct adapter *padapter)
>   *
>   * This will be called when CPWM interrupt is up=2E
>   *
> - * using to update cpwn of drv; and drv willl make a decision to up or =
down pwr level
> + * using to update cpwn of drv; and drv will make a decision to up or d=
own pwr level
>   */
>  void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm =
*preportpwrstate)
>  {
> --=20
> 2=2E34=2E1
>=20
LGTM,

Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Best regards,
Luka Gejak
