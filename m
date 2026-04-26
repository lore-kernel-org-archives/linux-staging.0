Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF03E363090;
	Mon, 27 Apr 2026 03:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261834; cv=none; b=P7OF0Aj9S8SBE+Z5CUQ2V4W0Ryoa36vpfkjxCBfQqrmqGvm4iP73rhIkBa3JIklpwqhg6rn+g3hKFs/rocFTGHgNs7GUiwda7wlcVqTRki50L/AIFIkASnAAe9ZAQyCrt/DQw1RszA+Xpk5rHNTpJgo4nxR+g9cUVY6Qil870zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261834; c=relaxed/simple;
	bh=xYdcc+rq80AayOcA5/+otBmT4HrO9TWfYWtr2qHvhQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRTF49DKj77K+X9Si/Co5KVu92PZnTyGkwVIPxokwZLAJGaVDxbxLmRiMpzAweY+1/ePumd+eZgI2PT1uihz/qBlelfpa8u0SOY/Amw29RxwU44QYuiA+w31kdZFt0M44sWJL3PfEII6AzjY08aYnaSMpS1kYQKOa8u9eE85QAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NfVytP8g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NfVytP8g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0031FC2BCB5;
	Mon, 27 Apr 2026 03:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261833;
	bh=xYdcc+rq80AayOcA5/+otBmT4HrO9TWfYWtr2qHvhQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NfVytP8gn8i6j/JX4v0c+if/6O3x9FYOhpoJcjdMWIFMuKSQt7dnKvKl5dKmr+g8d
	 QEg6nHwOgdluzfzDUqyEB5PV1CI7zo9yBLVU1U3nNPCYx44aUB1TkN3B7lfFDJq2OJ
	 pSCNY5sUrrPvSb+9WI/qBQI8+/AZMxiomNVLW9Fs=
Date: Sun, 26 Apr 2026 21:04:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	akhilesh@ee.iitb.ac.in
Subject: Re: [PATCH] staging: vme_user: fix missing blank line after
 declaration
Message-ID: <2026042634-stonework-promenade-0a00@gregkh>
References: <20260418115858.5072-1-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418115858.5072-1-shyamsunderreddypadira@gmail.com>

On Sat, Apr 18, 2026 at 05:28:57PM +0530, Shyam Sunder Reddy Padira wrote:
> Fix checkpatch.pl warning regarding:
> -Missing a blank line after declaration
> 
> Add a blank line after variable declarations to comply
> with kernel coding style and improve code readability.
> 
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
> ---
>  drivers/staging/vme_user/vme_tsi148.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
> index f73ac92320bb..3102b94a0a86 100644
> --- a/drivers/staging/vme_user/vme_tsi148.h
> +++ b/drivers/staging/vme_user/vme_tsi148.h
> @@ -34,6 +34,7 @@ struct tsi148_driver {
>  	void __iomem *base;	/* Base Address of device registers */
>  	wait_queue_head_t dma_queue[2];
>  	wait_queue_head_t iack_queue;
> +
>  	void (*lm_callback[4])(void *);	/* Called in interrupt handler */
>  	void *lm_data[4];
>  	void *crcsr_kernel;
> -- 
> 2.43.0
> 
> 

This is a structure, not a function, checkpatch fooled you :(
