Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8FA384CD1
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 07:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785224079; cv=none; b=nsOwaQYgrIXP3jc2+fQseSM6RXFhwOELtkPgpp/bmcTI5EpOhtw5s3CEhUruxUwi4nJQZ0pRDz1E5ZdW3CTjwdF0VuYC1MTkcBp4HhZ8VZo6cOgbt4VifUL7NGOxt9gaeNiTcFyMrhw4ZwUok1yU96uY/6QE6dhZAGOfR9kNrIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785224079; c=relaxed/simple;
	bh=HrvNjlwnGYCXBPWPZcYOaIBD+9mszcsK1UTTsmY9V9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQpVwHjylyCsl9ynXe4T5YiuzDtTTrf2+ZOsyKFb7Qq95eqvs9BwfvPxF+tg/AFdcxthwepiBJYa00ae2qOI97dOHHmkpOCD9FwWFLtFqDGY9uqgKYI5miCRMqgN5DP6yptXrv40CZR4O2IrlgKoJyzXBEY5DKveIvdnbyK9gYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u2mPE1d4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u2mPE1d4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E4F1F000E9;
	Tue, 28 Jul 2026 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785224077;
	bh=fvgvGKGn6jSTPLZK4jTaYtuBMQzX/OfEuc5WtsZrP60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=u2mPE1d4TvoEuqYTe1jb3BG10qfVf75J0ywzfS+n0YK++CHfWNsLufrZs6pNnIRr0
	 mGY7oho2RyrJCAIaeiCFvvKXDDWtgXl5kBlQJzK0wakDZn6aibinxmZtcpxvialzBM
	 1HZJVZtA/g4aZbbMHZ338sxoGesgRPJGLBIjEb+s=
Date: Tue, 28 Jul 2026 09:34:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akhmad <akhmad100913@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace yield() with cond_resched()
Message-ID: <2026072802-cherisher-broadband-342c@gregkh>
References: <20260725181837.39951-1-Akhmad100913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725181837.39951-1-Akhmad100913@gmail.com>

On Sat, Jul 25, 2026 at 09:18:37PM +0300, Akhmad wrote:
> From: Akhmad Zubairugadzhiev <Akhmad100913@gmail.com>
> 
> Replace deprecated yield() calls with cond_resched() in
> rtl8723b_hal_init.c. The yield() function is considered
> wrong practice in kernel code as it can lead to unexpected
> behavior. cond_resched() is the recommended replacement
> for conditional rescheduling in polling loops.

What "unexpected behavior" can happen here?

> 
> Signed-off-by: Akhmad Zubairugadzhiev <Akhmad100913@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index bcaf63b28..6fc3774d2 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -191,7 +191,7 @@ static s32 polling_fwdl_chksum(
>  		value32 = rtw_read32(adapter, REG_MCUFWDL);
>  		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved || adapter->bDriverStopped)
>  			break;
> -		yield();
> +		cond_resched();

Are you sure this is correct?

thanks,

greg k-h
