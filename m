Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F31EF39E;
	Sat, 25 Jul 2026 05:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784957657; cv=none; b=PS/yJD5D+MBXrMwGLYAjtSkJi7JhYBcwqfAzS6meZYE89ZFJa0ss+62qbG14Uix7FKt6FfOp0Rij1gaGgiQVXCnQ2gsqk0IpEAycKrDG94tBRm2QCjgImXmk6XKTy06R64VEKBDtcpRbKLkRIdNurgDA96zWY2GaRkQ2xt15N/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784957657; c=relaxed/simple;
	bh=qNY3cTcsNSTO2QshW9jpEeLPHcCGiNUN5JPWwZFMCZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OC0bupFpU1RHyNn2rFDUafT7aCbhxqG/4Fnx0n5rA8kBHf3thqJ7Q2NrGe5jmsyC7tHwECCpvywovEb+5rCAOm0gcSq5aijFIy7udZWxq7/WZ/7uoI/OigL9bF7P4xb+Ou9PkW8qiD+ral9gqE6jRUdOKLKuplpi8i63GgbXwO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FAjXdmTi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FAjXdmTi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103281F000E9;
	Sat, 25 Jul 2026 05:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784957655;
	bh=lEO/g5kxJJiekZz2X7T0epU375CYgIj50nH+2bcCE3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FAjXdmTinaM5EX+NaD9DL3ONOO4/1X02hnhy+bSIquKp98HPT2YiiyfoPdRmKhLGh
	 jw9+ALpnnPlWo2crCd6XQJaN1HZfVTfTlF0W/4dJsYUBXAYIQYFc/yDKqGCYyD7Dhm
	 EoRCe/KhVvB1smha1erMFWpxEt8m0joyCZzkEzBY=
Date: Sat, 25 Jul 2026 07:34:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paulo =?iso-8859-1?Q?Tom=E9?= <paulo.jorge.tome@gmail.com>
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: remove volatile qualifier from
 struct int_ch_state
Message-ID: <2026072515-domestic-cardboard-f657@gregkh>
References: <20260724204146.36726-1-paulo.jorge.tome@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724204146.36726-1-paulo.jorge.tome@gmail.com>

On Fri, Jul 24, 2026 at 09:41:46PM +0100, Paulo Tomé wrote:
> Remove the 'volatile' type qualifiers from request_counter and
> service_counter in struct int_ch_state.
> 
> According to Documentation/process/volatile-considered-harmful.rst,
> using volatile type qualifiers for structure members is discouraged in
> the kernel. Kernel locking and synchronization primitives or explicit
> accessors should be used instead of relying on compiler volatile semantics.
> 
> Signed-off-by: Paulo Tomé <paulo.jorge.tome@gmail.com>
> ---
>  drivers/staging/most/dim2/hal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/most/dim2/hal.h b/drivers/staging/most/dim2/hal.h
> index 5d69a5e7d299..bc04bd9451af 100644
> --- a/drivers/staging/most/dim2/hal.h
> +++ b/drivers/staging/most/dim2/hal.h
> @@ -34,10 +34,10 @@ struct dim_ch_state {
>  
>  struct int_ch_state {
>  	/* changed only in interrupt context */
> -	volatile int request_counter;
> +	int request_counter;
>  
>  	/* changed only in task context */
> -	volatile int service_counter;
> +	int service_counter;
>  
>  	u8 idx1;
>  	u8 idx2;
> -- 
> 2.47.3
> 
> 

You usually can not just remove the 'volatile' marking like this,
without actually fixing up the code at the same time.  Otherwise we
would have done so a long time ago :)

Please test to verify your change actually works properly for stuff like
this.

thanks,

greg k-h
