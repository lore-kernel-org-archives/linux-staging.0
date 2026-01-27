Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654A135DD13;
	Tue, 27 Jan 2026 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525017; cv=none; b=RY9+SMts+ogg1UZ81BV/Sf+Ca4VaM/vS69nQzjvLVJwizHKcKzIZl9URDmjEnJu5rFIMbA/U6e+R+6vzk02m4TwkZ9zTRJlBlXj2DbqFMDWDapYWYQEodcxukNPu5PNbLGdqm2du2S3mnGuDLAh9c+N+vEWfQQTgQ7wMPMZwy0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525017; c=relaxed/simple;
	bh=PTzVpQjbOoKgf2gcSQlAjuWaqXo0PV9P7yNvHz3BXjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZeRLWTH+jzrhjs4dXRlqPfTB5bMCf8P3ch+S7FflMsI/SYm47w5oSVkycf0mdw23vhQG3i89M5PjeTnKw4j04CC4psMmOah0nI+IqzuGt6L4CdN0VaQn4OScQPYpKPCBUTblmPFv913bOHMeQDkCtKWz2w9pXKEpYLXI0pDqHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uV9pOJ05; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uV9pOJ05"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82903C116C6;
	Tue, 27 Jan 2026 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769525016;
	bh=PTzVpQjbOoKgf2gcSQlAjuWaqXo0PV9P7yNvHz3BXjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uV9pOJ05LgSWlPrc4Iy9o4OgyoTHp07Vl9dbMx1Xwdszl15hXry8BH6siJRPzG/dt
	 DeXs0G5MJZMag9D6mIvQoYqW5LG60Q8CI+FeYDAwHkXythaaYB+6KIkfzemOVTdwOP
	 RGgKKvnqO8dT4sLvR92+YXSObX5fR7fMvmZzMe78=
Date: Tue, 27 Jan 2026 15:43:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace magic -2 error codes with
 proper errno
Message-ID: <2026012719-coerce-lark-192c@gregkh>
References: <20260125221219.26151-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125221219.26151-1-omer.e.idrissi@gmail.com>

On Sun, Jan 25, 2026 at 11:12:18PM +0100, Omer El Idrissi wrote:
> In xmit_xmitframes function:
> - Hardware busy condition previously
> returned -2; changed to -EBUSY
> - Transmit buffer allocation failure previously
> returned -2; changed to ENOBUFS
> 
> The caller checks both errors and handles retry logic.This improves
> readability and conforms to kernel error-handling
> conventions.
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index abb6fdfe7e1f..d1a427b2ef7f 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -205,7 +205,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>  			(padapter->mlmepriv.LinkDetectInfo.bHigherBusyTxTraffic)
>  		) {
>  			if ((phwxmit->accnt > 0) && (phwxmit->accnt < 5)) {
> -				err = -2;
> +				err = -EBUSY; // supposed to return -EBUSY for these conditions???

Why is this comment added?  Who is going to answer that?

thanks,

greg k-h
