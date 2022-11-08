Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198FD8BE1;
	Tue,  8 Nov 2022 15:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56848C433C1;
	Tue,  8 Nov 2022 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667920630;
	bh=X/TsswHOqHKp8413KVgyA0sdzCNAqy6BNPALW3AUwjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZqHf5MaHCqWEFmI1oLVApLkDBt+aWoI77q7s5nconquu8YR1Rhzcb9r5MDynGLYZ
	 wW/yZpiyQqdYkn8EpAiNy6jgcRvdcdUsY25nDtsYhi2jFefkN5sHW/HY91I+gm9dj+
	 bXOt68rK7POsjyKVfIQ1cz529a4xowdtuuPPRSIs=
Date: Tue, 8 Nov 2022 16:17:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: vt6655: change the function name
 s_vFillRTSHead
Message-ID: <Y2py83KhnWSSlX2W@kroah.com>
References: <Y2QTON8cjU/D0GqO@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2QTON8cjU/D0GqO@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Thu, Nov 03, 2022 at 07:15:04PM +0000, Tanjuate Brunostar wrote:
> Remove the use of Hungarian notation, which is not used in the Linux
> kernel. Reported by checkpatch
> 
> Add indentation to the affected function headers to follow the Linux
> kernel coding style
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
> 
> v2: corrected confusing changlog message on this patch
> 
>  drivers/staging/vt6655/rxtx.c | 48 ++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 31ae99b3cb35..debc5d5daede 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -23,7 +23,7 @@
>   *      s_uGetTxRsvTime- get frame reserved time
>   *      s_vFillCTSHead- fulfill CTS ctl header
>   *      s_vFillFragParameter- Set fragment ctl parameter.
> - *      s_vFillRTSHead- fulfill RTS ctl header
> + *      fill_rts_header- fulfill RTS ctl header
>   *      s_vFillTxKey- fulfill tx encrypt key
>   *      s_vSWencryption- Software encrypt header
>   *      vDMA0_tx_80211- tx 802.11 frame via dma0
> @@ -85,15 +85,15 @@ static const unsigned short fb_opt1[2][5] = {
>  #define DATADUR_A_F1    13
>  
>  /*---------------------  Static Functions  --------------------------*/
> -static void s_vFillRTSHead(struct vnt_private *pDevice,
> -			   unsigned char byPktType,
> -			   void *pvRTS,
> -			   unsigned int	cbFrameLength,
> -			   bool bNeedAck,
> -			   bool bDisCRC,
> -			   struct ieee80211_hdr *hdr,
> -			   unsigned short wCurrentRate,
> -			   unsigned char byFBOption);
> +static void fill_rts_header(struct vnt_private *pDevice,
> +			    unsigned char byPktType,
> +			    void *pvRTS,
> +			    unsigned int cbFrameLength,
> +			    bool bNeedAck,
> +			    bool bDisCRC,
> +			    struct ieee80211_hdr *hdr,
> +			    unsigned short wCurrentRate,
> +			    unsigned char byFBOption);
>  

Again, this function prototype is not needed, please drop it.

thanks,

greg k-h
