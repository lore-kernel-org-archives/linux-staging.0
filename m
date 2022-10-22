Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2949328F3;
	Sat, 22 Oct 2022 08:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80670C433D6;
	Sat, 22 Oct 2022 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666426672;
	bh=ck2PIMCpu7WLJ4pcTWHGkPQz1XgG2v2Y6OKRZYY0sRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWajY1800jwv29NfuO2U54/65JDN/6fMHxncyZfqDAveaASpIzXUIklmfbaJ7pljx
	 leIvMovZC6FjBdepVdaY4pTqSXXhpPt4HCy51ehByYOfWFpLDOd5nQ9XBk+8+XhBeP
	 AbMuV3R6HUYMAqPoS0ieKTpv3kvDFjM4gNcyAwcI=
Date: Sat, 22 Oct 2022 10:12:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3 3/6] staging: vt6655: refactor long lines of code in
 s_uFillDataHead
Message-ID: <Y1Ol7aLwJVdNtzph@kroah.com>
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
 <20221022070612.13009-4-tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022070612.13009-4-tanjubrunostar0@gmail.com>

On Sat, Oct 22, 2022 at 07:06:09AM +0000, Tanjuate Brunostar wrote:
> fix checkpatch errors by refactoring long lines of code in the function: s_uFillDataHead
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 97 ++++++++++++++++++++++++-----------
>  1 file changed, 67 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 01e72999831b..dc853b83459b 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -484,19 +484,28 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
>  			} else {
>  				/* Get Duration and TimeStamp */
>  				buf->duration_a =
> -					cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength,
> -									    byPktType, wCurrentRate, bNeedAck, uFragIdx,
> -									    cbLastFragmentSize, uMACfragNum,
> +					cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A,

Why is this function not returning u16 to start with?  Everywhere it is
used it is casted.

Please fix that up first, then fix up the function name itself, and then
work on shortening these lines, as that will be much better overall.

thanks,

greg k-h
