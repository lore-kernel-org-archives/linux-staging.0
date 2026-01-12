Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD9F35292A;
	Mon, 12 Jan 2026 10:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215443; cv=none; b=G87Y4C5auqJrCV0DRKckQig1+GFshIdyXeTrcktxMu4n08IBgbkwTvzYrYwawwmZIrvlQ/q8D/M74KlsV+V03v1crHQ/JxDZmoMHS3BF8WMMgdYUw5Zf8WSDgTQTzR1m/3XvPiYpjCyPpiA4iXY8uF4xVCfToRmTyhK401Lu6FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215443; c=relaxed/simple;
	bh=qIm9SOkEoLWFj10u/xcLaBCa64YI+CDb5AznQjdG57w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqwJW8FdTxpTvNlrmuxr/DUdwNRGjjONQFIhEKdNN8G7fpPHnCQ9tHO9iMhaLXSiYh6Uf/1CqD2keqybLcg4EMEJtfO3O4/BscG7mHU5GjWH2IDf1SWx/oKLdoKqLEkUulDRDzReiIo9mt6ideMo5PnDb7WQ1rPqoneP438vyVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bfn87p+3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bfn87p+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45277C16AAE;
	Mon, 12 Jan 2026 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768215442;
	bh=qIm9SOkEoLWFj10u/xcLaBCa64YI+CDb5AznQjdG57w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bfn87p+3JDSMHNVf24lMEvsCrdsTFqPYiyZP0pKGO0Tuj3QmJoDx6SJkZlouX5Ely
	 hcrgoVDaoatB8DP/8ulLBnI4gbt8Sfc/B+fJ9rcr4ln8VGa3HkZ1OloVeSTkHB+KWQ
	 wS4ybf7fC/kVd1UGrxB3Qo/s2hypHpSxZaBUTyJc=
Date: Mon, 12 Jan 2026 11:57:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nayana Mariyappa <nayana.mariyappa@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 1/4] staging: rtl8723bs: fix block comment style
Message-ID: <2026011246-both-jovial-afee@gregkh>
References: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
 <20260112104654.45175-2-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112104654.45175-2-nayana.mariyappa@gmail.com>

On Mon, Jan 12, 2026 at 10:46:51AM +0000, Nayana Mariyappa wrote:
> Fixed multi-line block comments in osdep_service.c to follow kernel
> coding style. Fixing the non-kernel-doc comment has been merged into this
> patch.
> No functional change.
> 
> Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> index a00f9f0c85c5..9d676a61981c 100644
> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> @@ -7,9 +7,9 @@
>  #include <drv_types.h>
>  
>  /*
> -* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
> -* @return: one of RTW_STATUS_CODE
> -*/
> + * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
> + * @return: one of RTW_STATUS_CODE
> + */
>  inline int RTW_STATUS_CODE(int error_code)
>  {
>  	if (error_code >= 0)
> -- 
> 2.43.0
> 

You seem to have ignored my review comment where I asked this just to be
one line.  No need to have the @return: stuff, right?

thanks,

greg k-h
