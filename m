Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98642362;
	Thu, 16 Mar 2023 14:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D2FC433EF;
	Thu, 16 Mar 2023 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678977003;
	bh=JhkESV526pzCMfXYIVB0sC2lcuQvYPbJky11zSTcTHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Py6CjtegcA/pB97b3EXPuY/bgdUkddGxTiSk4sU+J/5pyfuS0DIMd60o36+49M8VG
	 jn0jd8zUYofxz4t30hPbYE33PjTxzRyX1m9dwu9X+VlxNV4c889J9sbz5Ot/qNxRZp
	 VcVKz2r8kXy+IAQvCySaLCyi2iQ8UjYgYP4QkRKY=
Date: Thu, 16 Mar 2023 15:30:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging: octeon: Fix Lines should not end with a '('
Message-ID: <ZBMn6H3RPW+TgMeQ@kroah.com>
References: <20230316130647.GA81281@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316130647.GA81281@sumitra.com>

On Thu, Mar 16, 2023 at 06:06:47AM -0700, Sumitra Sharma wrote:
> checkpatch.pl CHECK: Lines should not end with a '('
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
>  drivers/staging/octeon/octeon-stubs.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 7a02e59e283f..3e7b92cd2e35 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -1372,9 +1372,7 @@ static inline void cvmx_fau_async_fetch_and_add32(uint64_t scraddr,
>  						  int32_t value)
>  { }
>  
> -static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(
> -	int interface,
> -	int port)
> +static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interface, int port)
>  {
>  	union cvmx_gmxx_rxx_rx_inbnd r;
>  
> -- 
> 2.25.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
