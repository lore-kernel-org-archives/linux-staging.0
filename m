Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB76C1D1E89
	for <linux-staging@lists.linux.dev>; Sat, 19 Oct 2024 08:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729325112; cv=none; b=kNU8KOCRD/0MYk3PIlhf+rHxnWsxEjL8L1NCCSZJTnVAXSHP36vzl7RP68gcKwqRpiVyYhyD6P+NB2iHAkXlXOKFmYQxIa8Xg4w8RFK8+046l7thpw0VZn0tb6pUUhAJpr5QX7hbjA6qKS1KNkYrCR4cwmW9E3Ofdu5FIvUEfiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729325112; c=relaxed/simple;
	bh=ZoOSt4NA9uYPTK1cqTro7J4mZJuq0/sShCEHwBdCJAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G88GZQgEDLhITnIn3lpirMJGG9uvrzWmUsO3H7nlgixRafqe05qz1fXzYQjiVAj6nC9Vx28bHq5SniK1gE+zEvr5grSw8MVWPSCz+QD1IwZ/gbo1+QsBCh+AtpgvEH3AzNLyWGOFmeZi2UE/iad1+oI2JHVk2Xd069PZTsbJ+sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ELVB5Ymm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ELVB5Ymm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8705C4CEC5;
	Sat, 19 Oct 2024 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729325112;
	bh=ZoOSt4NA9uYPTK1cqTro7J4mZJuq0/sShCEHwBdCJAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELVB5YmmbT3zyR+OuSlLYoydKCSSyOloAbWVqAd4mqfgAtXDpBm/z0VyfngtyxjLO
	 xZ6OQElHLbVX7l+VP9tJ9xoyqH2HkWIDlEsshuKHnHFKL5cj7lQeFf7amC6FN5iuN2
	 xJGcp16P9wO4GBohuFMgKwpvssDBrxgrTW7oeYa8=
Date: Sat, 19 Oct 2024 10:00:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: gpib: ni_usb: Move kfree after last use of
 in_data
Message-ID: <2024101925-comprised-letter-e970@gregkh>
References: <20241017181522.7798918DAF2@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017181522.7798918DAF2@bout3.ijzerbout.nl>

On Tue, Oct 15, 2024 at 10:45:58PM +0200, Kees Bakker wrote:
> In ni_usb_read() there was a kfree before the last use of in_data.
> 
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> ---
>  drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> index 1da263676f2a..75f39e1f3ed1 100644
> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> @@ -690,12 +690,12 @@ static int ni_usb_read(gpib_board_t *board, uint8_t *buffer, size_t length,
>  		kfree(in_data);
>  		return parse_retval;
>  	}
> -	kfree(in_data);
>  	if (actual_length != length - status.count) {
>  		pr_err("%s: actual_length=%i expected=%li\n",
>  		       __func__, actual_length, (long)(length - status.count));
>  		ni_usb_dump_raw_block(in_data, usb_bytes_read);
>  	}
> +	kfree(in_data);
>  	switch (status.error_code) {
>  	case NIUSB_NO_ERROR:
>  		retval = 0;

Does not apply to my tree, what branch did you make this against?

thanks,

greg k-h
