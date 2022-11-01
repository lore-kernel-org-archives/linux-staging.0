Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23662641;
	Tue,  1 Nov 2022 09:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF2EC433C1;
	Tue,  1 Nov 2022 09:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667296637;
	bh=1Bxrnk+9FXXmhGagERBq1YQ+2rMQximZy39dIJDtQpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2N9RCz2VCHu1rPbXfsv82ufhgj2dGpJuJ4fmdHYF2iujo048kuXV7qwTgc0TT0Xv
	 F1QO5aH7XeJOAJ3aTrSxozQBszzGmbLEznYEGwOa0Nnggz3UlxoVEv2Tn61iMUhLip
	 cR46D+Oti2dhldvP1gzs93z75PBXrvIlbFE9JmZU=
Date: Tue, 1 Nov 2022 10:40:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: vt6655: change variable name wTimeStampOff
Message-ID: <Y2DpfhfnZMFh/Ysn@kroah.com>
References: <Y2DXsnrQjQeP2PfO@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2DXsnrQjQeP2PfO@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Tue, Nov 01, 2022 at 08:24:18AM +0000, Tanjuate Brunostar wrote:
> Change the variable name wTimeStampOff to adhear to Linux kernel coding
> style, which does not allow naming variables in CamelCase. error is
> reported by checkpatch
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 1e5036121665..9bdcf2337235 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -54,7 +54,7 @@
>   */
>  #define CRITICAL_PACKET_LEN      256
>  
> -static const unsigned short wTimeStampOff[2][MAX_RATE] = {
> +static const unsigned short time_stamp_off[2][MAX_RATE] = {
>  	{384, 288, 226, 209, 54, 43, 37, 31, 28, 25, 24, 23}, /* Long Preamble */
>  	{384, 192, 130, 113, 54, 43, 37, 31, 28, 25, 24, 23}, /* Short Preamble */
>  };
> @@ -130,7 +130,7 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
>  
>  static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
>  {
> -	return cpu_to_le16(wTimeStampOff[priv->preamble_type % 2]
> +	return cpu_to_le16(time_stamp_off[priv->preamble_type % 2]
>  							[rate % MAX_RATE]);
>  }
>  
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
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
