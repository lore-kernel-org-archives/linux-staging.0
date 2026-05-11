Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1077A3033C6;
	Mon, 11 May 2026 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486202; cv=none; b=h0gybTHgLqsXSx2aKhgG5RQLA5RLtiYxw0MEytRn1VsOpOPVDpNMJEfwV+CWZwBd/mT0+GWEYphoB5sF1aIAsmc482F8QRHfa7pElrELBG6vmdll9dh1He4xWJzTcAGTDSKNwaM32UK3daSDGnz7tX6pbCDAquojNlOHK1QxyaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486202; c=relaxed/simple;
	bh=iwUKA/GtkeaeJFLBaiMXtL1N0kWwbhBJZbZ2FevjzJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=av3K2ZnMk5rDF4mALqbCvn6wzCMQo3bKcCW0OZKPCox+EM1plxawdJaXrjWxRlb5Q8i0eP7XhQ6e5ic1QtWmmFpcIWCV0wFTNWlwZmVOC311jGK0Y+pK+Nc8A7KC5JtiSTvltDfyN1bnCI6X6YcxJaIfnuK0eT8KL7OZAJNrnko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u0SPstLc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u0SPstLc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C27DC2BCB0;
	Mon, 11 May 2026 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486200;
	bh=iwUKA/GtkeaeJFLBaiMXtL1N0kWwbhBJZbZ2FevjzJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0SPstLcSf0St8rqyoEFZIpD/N+oyQcxUPE/TTvWU1M38FGTfJkHxd4qNHon1few5
	 qUmEP5PkhZQgS6iZR6xcIrw1P2ugYCZPzXfTVVgsdj4Glhl/RPNq6YxZyWEczqLPGg
	 ZNJbAU0LL28Vp/LgzhbkpZ/gBNQEy4pSCEbESB3w=
Date: Mon, 11 May 2026 09:56:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] staging: octeon: ethernet-mem: replace pr_warn
 with dev_warn in free functions
Message-ID: <2026051112-fanning-oversleep-5b0f@gregkh>
References: <20260504174146.117026-1-ayushmukkanwar@gmail.com>
 <20260504174146.117026-2-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504174146.117026-2-ayushmukkanwar@gmail.com>

On Mon, May 04, 2026 at 11:11:44PM +0530, Ayush Mukkanwar wrote:
> Add struct platform_device parameter to cvm_oct_free_hw_skbuff,
> cvm_oct_free_hw_memory and cvm_oct_mem_empty_fpa. Replace pr_warn
> calls with dev_warn, using &pdev->dev for device-aware logging.
> 
> Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
> ---
>  drivers/staging/octeon/ethernet-mem.c | 31 ++++++++++++++++-----------
>  drivers/staging/octeon/ethernet-mem.h |  5 ++++-
>  drivers/staging/octeon/ethernet.c     |  6 +++---
>  3 files changed, 25 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet-mem.c b/drivers/staging/octeon/ethernet-mem.c
> index 532594957ebc..11036c6eb36f 100644
> --- a/drivers/staging/octeon/ethernet-mem.c
> +++ b/drivers/staging/octeon/ethernet-mem.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2003-2010 Cavium Networks
>   */
>  
> +#include <linux/platform_device.h>
>  #include <linux/kernel.h>
>  #include <linux/netdevice.h>
>  #include <linux/slab.h>
> @@ -40,11 +41,13 @@ static int cvm_oct_fill_hw_skbuff(int pool, int size, int elements)
>  
>  /**
>   * cvm_oct_free_hw_skbuff- free hardware pool skbuffs
> + * @pdev:      Platform device for logging

You are adding a line here, and then "fixing it" in patch 3/3 :(

Please just do it right the first time.

thanks,

greg k-h
