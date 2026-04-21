Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0643CE4BD
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782004; cv=none; b=c4yd+U3Kip5nxLGkBUvBoR9GEScBorLIhzsyNfizbc41R6IApG3eR551tFiYg6UWNkFoxPoHhvCk3wACdz44AgF3UNm0WCVg4MyDleccwof9Z+IFxRd0vlF2oOwO10mI/HRGyAubkW72jvxoYVsClfj7h8cDLagXH2KT3WcQGog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782004; c=relaxed/simple;
	bh=vzCTLudpF4C01RWtxD6HaTmInReorM3mZfiuLXhUbls=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BH3GzauQo1k9VEXzf/ZL9vQOcUoOkGaBcMPuPIcNmZbGI6geE9j2356EQ0M5fjIIxbPMr5hMNe2oqHjwEbRxzIKf3NJwzp4Ck1Y3tgzKzTO3R/zrLV6eFYC3Hkttc6zlKUw5boHs0wVZt5HrGe0MPoUMOrrDfDzJ6/qMzA0/ps0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VL370Xbd; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VL370Xbd"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776782000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9d+Zf4HN1ZVE9Pso1ZaDrVaSQboLdNoIcrritVKuxDg=;
	b=VL370XbdxPajJb7/FRmX2ZBqK76HHL/kQ6Uyl+4CYipra3PmPs9RgstBiGc2eE8KqoUj5f
	LTrj+3jp/lFimMhCYIsLhzYm0XUheZmoJBH0acqz6+rXcUh7mg8pRVGdaWdxInBeTjd2WO
	Dxt56hbP31S4SQqneBxIi3LY0VZS1Kc=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 16:33:08 +0200
Message-Id: <DHYWNCY622RH.J9Z0VTVKXYX1@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <skhan@linuxfoundation.org>, <me@brighamcampbell.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused offset in phase 2
 _BlockWrite()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Robertus Diawan Chris" <robertusdchris@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20260420044651.164450-1-robertusdchris@gmail.com>
In-Reply-To: <20260420044651.164450-1-robertusdchris@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon Apr 20, 2026 at 6:46 AM CEST, Robertus Diawan Chris wrote:
> Commit c1314fe4d28f ("staging: rtl8723bs: remove all RT_TRACE logs
> in hal/ and os_dep/") removed the unnecessary RT_TRACE logs in hal/
> and os_dep/ files, but left the variable "offset" in the Phase 2
> _BlockWrite() function unused, so delete it.
>
> This is reported by Coverity Scan with CID 1408950 as UNUSED_VALUE.
>
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/=
staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index e794fe3caf9d..988829d5f3c3 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -68,8 +68,6 @@ static int _BlockWrite(struct adapter *padapter, void *=
buffer, u32 buffSize)
> =20
>  	/* 3 Phase #2 */
>  	if (remainSize_p1) {
> -		offset =3D blockCount_p1 * blockSize_p1;
> -
>  		blockCount_p2 =3D remainSize_p1/blockSize_p2;
>  		remainSize_p2 =3D remainSize_p1%blockSize_p2;
>  	}

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
