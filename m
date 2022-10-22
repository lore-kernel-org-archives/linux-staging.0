Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F228F3;
	Sat, 22 Oct 2022 08:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DACC433C1;
	Sat, 22 Oct 2022 08:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666426665;
	bh=31ACgIXwKFnBWqgJtqPn3um1i8y9zw8fx+VhoFg5ems=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOsArMbSdh8FxBb5thkVDq/WHbNrQfeEvMZd7WDQiS/YVVnAUxMgIxLoK7G2mSYZC
	 9/Qc3DxfrjKeW0C1I3OcqGMNpXAbmBLH3uaTiPUvAJbJKOgiDItNo31qOwbhK7aloc
	 nZoCCWux9OnTi41Uzt6mhEnNGbEk3yha7OzDMFWQ=
Date: Sat, 22 Oct 2022 10:10:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3 1/6] staging: vt6655: fix lines ending in a '('
Message-ID: <Y1OlaBVGgHvAipuB@kroah.com>
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
 <20221022070612.13009-2-tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022070612.13009-2-tanjubrunostar0@gmail.com>

On Sat, Oct 22, 2022 at 07:06:07AM +0000, Tanjuate Brunostar wrote:
> fix serveral checkpatch errors related to lines ending with a '(' by
> refactoring the code lines
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 149 ++++++++++++++--------------------
>  1 file changed, 63 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 1e5036121665..f9d0b00d7cff 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -141,13 +141,11 @@ static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
>   */
>  static
>  unsigned int
> -s_uGetTxRsvTime(
> -	struct vnt_private *pDevice,
> -	unsigned char byPktType,
> -	unsigned int cbFrameLength,
> -	unsigned short wRate,
> -	bool bNeedAck
> -)
> +s_uGetTxRsvTime(struct vnt_private *pDevice,

You have a strange mix of choices here for how you changed the code.

This time you did not move the "static" or "unsigned int" to the same
line as the function name, but then:

> +		unsigned char byPktType,
> +		unsigned int cbFrameLength,
> +		unsigned short wRate,
> +		bool bNeedAck)
>  {
>  	unsigned int uDataTime, uAckTime;
>  
> @@ -215,19 +213,16 @@ static __le16 get_rtscts_time(struct vnt_private *priv,
>  
>  /* byFreqType 0: 5GHz, 1:2.4Ghz */
>  static
> -unsigned int
> -s_uGetDataDuration(
> -	struct vnt_private *pDevice,
> -	unsigned char byDurType,
> -	unsigned int cbFrameLength,
> -	unsigned char byPktType,
> -	unsigned short wRate,
> -	bool bNeedAck,
> -	unsigned int uFragIdx,
> -	unsigned int cbLastFragmentSize,
> -	unsigned int uMACfragNum,
> -	unsigned char byFBOption
> -)
> +unsigned int s_uGetDataDuration(struct vnt_private *pDevice,

You moved "unsigned int" here, but then:


> +				unsigned char byDurType,
> +				unsigned int cbFrameLength,
> +				unsigned char byPktType,
> +				unsigned short wRate,
> +				bool bNeedAck,
> +				unsigned int uFragIdx,
> +				unsigned int cbLastFragmentSize,
> +				unsigned int uMACfragNum,
> +				unsigned char byFBOption)
>  {
>  	bool bLastFrag = false;
>  	unsigned int uAckTime = 0, uNextPktTime = 0, len;
> @@ -316,17 +311,13 @@ s_uGetDataDuration(
>  }
>  
>  /* byFreqType: 0=>5GHZ 1=>2.4GHZ */
> -static
> -__le16
> -s_uGetRTSCTSDuration(
> -	struct vnt_private *pDevice,
> -	unsigned char byDurType,
> -	unsigned int cbFrameLength,
> -	unsigned char byPktType,
> -	unsigned short wRate,
> -	bool bNeedAck,
> -	unsigned char byFBOption
> -)
> +static __le16 s_uGetRTSCTSDuration(struct vnt_private *pDevice,

You did both the static and the return type here.

Pick one style and stick with it please.  Consistancy matters, that is
why we have a coding style to start with.  Brains and pattern matching
and all that.

In this case, this last one (both static and the return type), should be
used.

thanks,

greg k-h
