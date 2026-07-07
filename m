Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E4C3E3D9C;
	Tue,  7 Jul 2026 10:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420029; cv=none; b=r5j56Scqiw1HZeGKIdHFueS28MwD+ZOEp5YRfGakENfVCYbvevtNVFczWpMyMz1bQPuEMXx2Ge0dy+Xknh86mk7EsufHzFOutjLYTkaZFFn72NJ7IX8+nEh8e6ji+PQlKzpKwKty6zJAe7Fhxo3TmVFfvcOX0us6/FLYRuBAhzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420029; c=relaxed/simple;
	bh=SolqK98Hg25vmdSpppPARJWo4MuIs//jYF6XN2Jtdu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDEeDyWO5KG8nr1kr2B9qAZGOHARy0Htn0gbeMnBrWc2QnaKGwURzH1/kPU/xG0wJFm6qeBlHyx/R9T3pjEChIlHv0QWeTezFS55stcrIGy2o8vbAAvSNSmfoHwVVFDOW1er9MQ27VKBQE7M2UkCPy1qxB0Lqv+J3Dc/8VqhK9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k7xJ5ePB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k7xJ5ePB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EF61F000E9;
	Tue,  7 Jul 2026 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783420026;
	bh=OkTGGusC3puhGGieiji4FISEepBQRtw7C08TghiNzOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k7xJ5ePBRwCmAeUsm5qUhiYBOFw2FPvhlD+v112Z+UysL8ygGVALvJNyLbFyw6/gY
	 MrUiyyvr4MtiIVEdpyKSFzEu5juyTT3Lh04amaqppbsthrQbvKAHGdMu13KE0G/hIx
	 /wWk+gSUsPSMW3eGwMlbwAyWLK+vn1j6GP4sYP58=
Date: Tue, 7 Jul 2026 12:27:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bruce Ou <oubruce1234@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: fix CamelCase warning for
 bResult
Message-ID: <2026070739-poem-scale-6118@gregkh>
References: <20260623120815.14737-1-oubruce1234@gmail.com>
 <20260623120815.14737-2-oubruce1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623120815.14737-2-oubruce1234@gmail.com>

On Tue, Jun 23, 2026 at 08:08:13PM +0800, Bruce Ou wrote:
> Fix the coding style warning reported by checkpatch.pl regarding
> the CamelCase local variable bResult by renaming it to result.
> 
> No functional changes are introduced.
> 
> Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
> ---
> Changes in v2:
>   - Split from a single comprehensive patch into a standalone patch.
> 
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index a40d6eab7249..4bf205e078e7 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -89,7 +89,7 @@ u16	addr,
>  u8	*data)
>  {
>  	u32 tmpidx = 0;
> -	u8 bResult;
> +	u8 result;

Why isn't this a boolean variable now?

thanks,

greg k-h
