Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7CCBA51;
	Fri,  4 Aug 2023 13:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19B9C433C8;
	Fri,  4 Aug 2023 13:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691155310;
	bh=XJa6I1bwCmmRMLQnibGWH5nBJOa4fCDitx42YrwLs6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RuYw7+DxRUXTtjN3QZHHKDWP09+eOl016mq7VtsNUeVUceV+jZsFz4vWhYuPie4tp
	 82lVzCc92yEWbUuUm5mhdOTFYABEAiyx0qPX7kXIGolMbTjDG273UzmWv6YdXf2607
	 UuzJQNt4lzelNrmcqNfxtxCn9Y7VnvPt2O/M7XRk=
Date: Fri, 4 Aug 2023 15:21:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pavan Bobba <opensource206@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: replace camel case by snake case
Message-ID: <2023080431-rethink-smog-c029@gregkh>
References: <ZMztgcr3GYqSF9sW@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMztgcr3GYqSF9sW@ubuntu.myguest.virtualbox.org>

On Fri, Aug 04, 2023 at 05:52:25PM +0530, Pavan Bobba wrote:
> Replace array name of camel case by snake case. Issue found
> by checkpatch
> 
> Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> ---
>  drivers/staging/vt6655/baseband.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
> index 0e135af8316b..8b913c64845c 100644
> --- a/drivers/staging/vt6655/baseband.c
> +++ b/drivers/staging/vt6655/baseband.c
> @@ -499,7 +499,7 @@ static const unsigned char by_vt3253_init_tab_rfmd[CB_VT3253_INIT_FOR_RFMD][2] =
>  };
>  
>  #define CB_VT3253B0_INIT_FOR_RFMD 256
> -static const unsigned char byVT3253B0_RFMD[CB_VT3253B0_INIT_FOR_RFMD][2] = {
> +static const unsigned char byvt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
>  	{0x00, 0x31},
>  	{0x01, 0x00},
>  	{0x02, 0x00},
> @@ -2005,8 +2005,8 @@ bool bb_vt3253_init(struct vnt_private *priv)
>  		} else {
>  			for (ii = 0; ii < CB_VT3253B0_INIT_FOR_RFMD; ii++)
>  				result &= bb_write_embedded(priv,
> -					byVT3253B0_RFMD[ii][0],
> -					byVT3253B0_RFMD[ii][1]);
> +					byvt3253b0_rfmd[ii][0],
> +					byvt3253b0_rfmd[ii][1]);
>  
>  			for (ii = 0; ii < CB_VT3253B0_AGC_FOR_RFMD2959; ii++)
>  				result &= bb_write_embedded(priv,
> -- 
> 2.34.1
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
