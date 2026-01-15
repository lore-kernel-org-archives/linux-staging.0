Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5E436AB4D;
	Thu, 15 Jan 2026 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768476566; cv=none; b=NGK5kQ4C+GLmXgWY6mJWgSBkBkTaeayWXuckUeZP0P2MED/59zRlGPsm9n1DbIy2La0kLTCba++7AzLO6PU8qnUbmKdZszsNAXYc9U6MzL8ofbsVtO9bc37cKIzE+xvkUhG0IIw1ZhG5TrIkavvo2302+wwwEE+BKOsrfy6d/Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768476566; c=relaxed/simple;
	bh=IF6roekNzphGsE+vYaFH2TVHQ7Akt2UMmJu/u8U1VNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbruJDulkR4CMnrKs0va1SaAIOqONll2XTPE4jZG74Ef63Vcy0neptFeLgnunZhyNKXYObLI8G2iq/n48lUXK7A8Ikv+zZXQ4qw2UHzkfF4Ec0UNSb3b2KRdvenCPG4FJxsSHZselUUZ/JB/NHPyb655OWew9N5HT/GSIsOwjTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Vp/E1Wke; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Vp/E1Wke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26277C116D0;
	Thu, 15 Jan 2026 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768476565;
	bh=IF6roekNzphGsE+vYaFH2TVHQ7Akt2UMmJu/u8U1VNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vp/E1Wkej/chCeyYK3AkHOXnKtmlTM5NSZe20NwZ7efELV1SHrzW7VHKFPRvKRM/1
	 +7d/7G81PVmSVZd4ZH7lxkTsOsxvemyFUznflVBVqIIrLapONqHNdxjTM9NPJT+mtP
	 13Ykjegqyxv89/Ij74LpOsOsfU8XPtXlGu23HzB8=
Date: Thu, 15 Jan 2026 12:29:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH v2 2/2] staging: axis-fifo: Use bulk I/O accessors for
 data transfers
Message-ID: <2026011522-uncivil-freeware-f653@gregkh>
References: <20260115022509.3038062-1-s9430939@naver.com>
 <20260115022509.3038062-2-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115022509.3038062-2-s9430939@naver.com>

On Thu, Jan 15, 2026 at 11:25:09AM +0900, Minu Jin wrote:
> Replace manual for loops with ioread32_rep/iowrite32_rep.
> Add axis_fifo_read_data() and axis_fifo_write_data() wrappers to
> encapsulate these block-transfer operations.
> 
> No functional changes intended
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601141928.CyFxDTEk-lkp@intel.com/
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
> v2:
>  - Remove unused variable 'i' in axis_fifo_read() to fix build warning
>    reported by kernel test robot
>  - Add Reported-by and Closes tags
> 
>  drivers/staging/axis-fifo/axis-fifo.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 525156583c4a..009333cc398b 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -150,11 +150,21 @@ static inline u32 axis_fifo_read_reg(struct axis_fifo *fifo, int offset)
>  	return ioread32(fifo->base_addr + offset);
>  }
>  
> +static inline void axis_fifo_read_data(struct axis_fifo *fifo, void *buf, int count)
> +{
> +	ioread32_rep(fifo->base_addr + XLLF_RDFD_OFFSET, buf, count);
> +}

Are you _sure_ this is the same thing as:

> -		for (i = 0; i < copy; i++) {
> -			tmp_buf[i] = ioread32(fifo->base_addr +
> -					      XLLF_RDFD_OFFSET);
> -		}
> +		axis_fifo_read_data(fifo, tmp_buf, copy);

While it might look the same, can the hardware handle reading chunks of
memory like that all at once instead of in a loop like the driver is
doing?  If so great, but this needs to be tested on the hardware please.

And again, you are creating wrapper functions that are not needed, if
this really can be a replacement, just call ioread32_rep() directly.

thanks,

greg k-h
