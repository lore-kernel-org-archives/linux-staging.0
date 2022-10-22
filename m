Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C43128F3;
	Sat, 22 Oct 2022 08:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2CEC433D6;
	Sat, 22 Oct 2022 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666426678;
	bh=csr2wj0+2lRqlwVTQny0FPjc5vzdb5L6SnyFM3xAO28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yJIjstl32VyHqO620gx57psR/WeXUbZBrW5QZmi9eSMT/eEFeGjIpPKvw9MCDlCOy
	 UswbEZHRaVcoXEpcs9C3Xx0ezBq6rmAAmvGiCEyuud4bhhOS4izZCJg74eAJ1EGci8
	 rZL2LOZ7vWhf5sv11scLKAH9SUFV+5sasE6pWMBQ=
Date: Sat, 22 Oct 2022 10:14:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3 5/6] staging: vt6655: refactor long lines of code in
 the rest of the file
Message-ID: <Y1Omg6Tfv/lc7Fu4@kroah.com>
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
 <20221022070612.13009-6-tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022070612.13009-6-tanjubrunostar0@gmail.com>

On Sat, Oct 22, 2022 at 07:06:11AM +0000, Tanjuate Brunostar wrote:
> fix checkpatch errors by refactoring long lines of code in the rest of
> the file
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 105 ++++++++++++++++++++++------------
>  1 file changed, 67 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 951d4172e9f2..572be45cdbeb 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -1105,44 +1105,60 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
>  		if (byFBOption == AUTO_FB_NONE) {
>  			if (bRTS) {/* RTS_need */
>  				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
> -				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts));
> -				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
> +				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
> +					   sizeof(struct vnt_rrv_time_rts));
> +				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize +
> +						 sizeof(struct vnt_rrv_time_rts) + cbMICHDR);

Casting to void * is very odd.  Try working on fixing up that mess
first...

thanks,

greg k-h
