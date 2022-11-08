Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8BB8BE1;
	Tue,  8 Nov 2022 15:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8AFC433C1;
	Tue,  8 Nov 2022 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667920600;
	bh=VyObGno3eWCppLggnWSbcxxTvObvPyRmksOsBBBl7WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fy5/LIDtHF/+VUnhwnkeFl4WowNnzzkCvBAMzvZWRQ6IynAx+dDXVqYRnGxfnDCCa
	 gURISwHChRbdJKfMWMKq3qGaI53m3MRcPDXgmNCCg0lg1CJG/B1Pgrvd27q8sbtr39
	 F1lA16Ce/E3VZZucEEYJZfilaBT9FZxeP+IaPNgg=
Date: Tue, 8 Nov 2022 16:16:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: vt6655: change the function name
 s_vGenerateTxParameter
Message-ID: <Y2py1M0HC/olQxWD@kroah.com>
References: <Y2OmAuBswNbWFWRd@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2OmAuBswNbWFWRd@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Thu, Nov 03, 2022 at 11:29:06AM +0000, Tanjuate Brunostar wrote:
> Remove the use of Hongarian notation which is not used in Linux kernel.
> Join some lines of code to avoid a line ending in a '('
> Reported by Checkpatch
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 54 ++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index debc5d5daede..793a63b2ff46 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -10,7 +10,7 @@
>   * Date: May 20, 2003
>   *
>   * Functions:
> - *      s_vGenerateTxParameter - Generate tx dma required parameter.
> + *      generate_tx_parameter - Generate tx dma required parameter.
>   *      vGenerateMACHeader - Translate 802.3 to 802.11 header
>   *      cbGetFragCount - Calculate fragment number count
>   *      csBeacon_xmit - beacon tx function
> @@ -95,17 +95,17 @@ static void fill_rts_header(struct vnt_private *pDevice,
>  			    unsigned short wCurrentRate,
>  			    unsigned char byFBOption);
>  
> -static void s_vGenerateTxParameter(struct vnt_private *pDevice,
> -				   unsigned char byPktType,
> -				   struct vnt_tx_fifo_head *,
> -				   void *pvRrvTime,
> -				   void *pvRTS,
> -				   void *pvCTS,
> -				   unsigned int	cbFrameSize,
> -				   bool bNeedACK,
> -				   unsigned int	uDMAIdx,
> -				   void *psEthHeader,
> -				   unsigned short wCurrentRate);
> +static void generate_tx_parameter(struct vnt_private *pDevice,
> +				  unsigned char byPktType,
> +				  struct vnt_tx_fifo_head *,
> +				  void *pvRrvTime,
> +				  void *pvRTS,
> +				  void *pvCTS,
> +				  unsigned int	cbFrameSize,
> +				  bool bNeedACK,
> +				  unsigned int	uDMAIdx,
> +				  void *psEthHeader,
> +				  unsigned short wCurrentRate);
>  

This function prototype is not needed at all, right?  So just delete it
instead of renaming it.

thanks,

greg k-h
