Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE873264DF
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953182; cv=none; b=JzvPeGRBmsHSJIoAreIQ7+G3gdxLAph/1emHR1ikAhb0c0AbgGbuQyMW495Rqj+py/qoMlf8JSPQmL4rSCso6qUVj6bvdRdJ+AMa9pM5R+UFCJ7MRA0UwU7fJgIAexlCUxqlxGiRM5xqFfW9zlq6+3nh3++zhg843QI7swYZ+Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953182; c=relaxed/simple;
	bh=YT3v/FZn1dupCArqWjgl9khdnQxgzpk3bqr3Gcui2no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exmmwBjcP9bfgs6wu5jASOhW7qz8ydgQazkFBN2b9KcJQG43ptgNecwBArloAU8UcHqWY58S4FoBlVID1O6dFG+EhO5BHGivhP/8N1+ftjiyR8AYOYtqjc4DLpH2YWTcjPuiQhTHx52It2OygRSL2t77SpLOl219rp3Y8CtR0ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VZzBm0Ub; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VZzBm0Ub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4411F00A3C;
	Thu, 28 May 2026 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779953181;
	bh=Ted+KWn9M5eBYeiB4HmyHSaS2kh4hiXjSBYe1X+7fhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VZzBm0UbxPf6JX1QqyWQNmFB88kJRGsyeVMYor5fB25cKXnDej8BIqaITk+a/ajh8
	 WrC4FsrLDA3jsrUauaEg0DXmihxhk+LrvCdtlTuT3jaXzW50NHBm3nayERPZ1eR0NB
	 BHuDYPd49Jj4Gflgqcdv22MWJPpfm37ot1j8TATo=
Date: Thu, 28 May 2026 09:25:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bastien Cossette <bastiencossette29@icloud.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary NULL check before
 vfree
Message-ID: <2026052856-hubcap-fruit-09c6@gregkh>
References: <20260528065723.39968-1-bastiencossette29@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528065723.39968-1-bastiencossette29@icloud.com>

On Thu, May 28, 2026 at 02:57:23AM -0400, Bastien Cossette wrote:
> The vfree() function handles NULL pointers natively. Cleaning up the
> redundant if check simplifies the code and adheres to core kernel
> coding styles.
> 
> Signed-off-by: Bastien Cossette <bastiencossette29@icloud.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index 728a2171fbcb..24dfae2dd759 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -23,14 +23,10 @@ u8 rtw_hal_data_init(struct adapter *padapter)
>  
>  void rtw_hal_data_deinit(struct adapter *padapter)
>  {
> -	if (padapter->HalData) {
> -		vfree(padapter->HalData);
> -		padapter->HalData = NULL;
> -		padapter->hal_data_sz = 0;
> -	}
> +	vfree(padapter->HalData);
> +	padapter->hal_data_sz = 0;

What about setting HalData to NULL?  Is other code relying on that?

>  }
>  
> -

This change is not relevant for the other one :(

thanks,

greg k-h
