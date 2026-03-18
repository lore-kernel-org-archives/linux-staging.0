Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894C6387360;
	Wed, 18 Mar 2026 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847734; cv=none; b=UMd76WiM06YaG3UcSgePpXrMRhM8mh29I9kLK2u/5kO60s8SVkJcGznmWXClFyOdmDPb/D+S8+6qwUJKKnFn0OuSSwXhdli9THP7ElFN3nP0DLUyvdHb6hDQ/FhbxeXk1cGmObryVTkLBpF1q8h4TpNVS1M3XT1mVq0TKIHyh5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847734; c=relaxed/simple;
	bh=OQg2pQPYWWqEenOyiQJ06QMk8akcW/HSmK2hxfh92tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtbkgd8aoCbwAykmLmEwH1Vn/EvisOeIrrjWawf2EORG2En/T5Dhk8MnLN7i1dRHearakng+Qks2Vi//m0IElPn19KK6dhomgDe2Zr8qjLydx6PY4cb4J1zXLePJDk5WRLll84iRM56N4Y/VMUaFj9QPSV/6BEktc37s1yvkYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yWREdfFk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yWREdfFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704FBC19421;
	Wed, 18 Mar 2026 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773847733;
	bh=OQg2pQPYWWqEenOyiQJ06QMk8akcW/HSmK2hxfh92tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yWREdfFkLs2iRFai8ctvhwiGXqdDPp6iDbl16KFc9/sTcrE/Gz4yR57Z+DI6HM9wx
	 MlQ8fp70qDfIBZvZ/FKWzPFLtgNfbIyTVn6dkUlw+s0m1nZwO2C1Se66rmZlvfIANX
	 VXRN3s8giVgqCqf2K+H6k5QdpWsenc+gUGLmefgk=
Date: Wed, 18 Mar 2026 16:28:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-staging@lists.linux.dev, parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: remove BUG_ON() calls
Message-ID: <2026031825-delicious-capsule-f1bf@gregkh>
References: <20260310013304.39169-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310013304.39169-1-marusik.adamenko@gmail.com>

On Mon, Mar 09, 2026 at 06:33:04PM -0700, Mark Adamenko wrote:
> All BUG_ON() calls in this file are redundant either because of
> impossible conditions or prior error handling. Remove all BUG_ON()
> calls.
> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---
>  drivers/staging/most/dim2/dim2.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index 66617e89e028..c8fdc6a52467 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -165,9 +165,6 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
>  	unsigned long flags;
>  	struct dim_ch_state st;
>  
> -	BUG_ON(!hdm_ch);
> -	BUG_ON(!hdm_ch->is_initialized);
> -

Please only remove one at a time, and provide the "proof" in the
changelog for why the case can never be hit.

thanks,

greg k-h
