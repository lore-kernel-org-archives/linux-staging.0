Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CFE13AA2A
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 18:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729189409; cv=none; b=r6QKyV27i/1IdNZ2pNJONK6NC8o3UxDNxVnqqxjedmV3JFICvR/stUBZeNqRCisv0BHKeLfGZC8ZqGS3v8mIdXtdInQD+Jhor36MCRxDS125z/ENHYw5jNpJZ0ZzPChTs3/QlRw4eDh50Oz1S826s2e5dPoSMhoqPYP2wiJNf+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729189409; c=relaxed/simple;
	bh=f5dbArMq+5ZS+iM4/ZQFCtQ+qxv1LwBsHd6LM08NYXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPEggsRPzLUENFBdtmlQRjpFfT/L3qAsN+1x2W7WcO/NGvOnosnVpY53OfMx+p3rIFKeRxfHvMNReaQrbWb0cXk94AyrWvrpcd3G9CG3dI+PgOXTngKHUL4pBLbHo+dKR/S5Y1rrM59adM382LpfHXbNeZp3RKGjTQSfZG7hWZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ijhB0HWU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ijhB0HWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8DEC4CED0;
	Thu, 17 Oct 2024 18:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729189409;
	bh=f5dbArMq+5ZS+iM4/ZQFCtQ+qxv1LwBsHd6LM08NYXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijhB0HWUkLZFxrZqViK8MXRxHOA9lfG6ZPhLMmULWSTYpgMdG0650hU36PeXwEagt
	 tpTSsq0TPWigJqTC5SqwU4qUicn5xMrKSklsyjUD6b0twt0IIcjlXyXC4Yz4T0Dj75
	 IRr59CuIVMUL2SujR+KtHs9s6vUxUXORe5SkKdlw=
Date: Thu, 17 Oct 2024 20:23:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: gpib: avoid buffer overflow
Message-ID: <2024101759-petticoat-prone-52ad@gregkh>
References: <20241017181435.70D2B18DAF2@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017181435.70D2B18DAF2@bout3.ijzerbout.nl>

On Tue, Oct 15, 2024 at 08:38:13PM +0200, Kees Bakker wrote:
> The remaining buffer size for snprintf also depends on `pos`.
> 
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> ---
>  drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> index 1da263676f2a..4df1ceaa138f 100644
> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> @@ -364,7 +364,7 @@ static void ni_usb_dump_raw_block(const u8 *raw_data, int length)
>  			pr_info("%s\n", print_buf);
>  			pos = 0;
>  		}
> -		pos += snprintf(&print_buf[pos], RAW_BUF_SIZE, " %02x", raw_data[i]);
> +		pos += snprintf(&print_buf[pos], RAW_BUF_SIZE - pos, " %02x", raw_data[i]);
>  	}
>  	if (pos)
>  		pr_info("%s\n", print_buf);

The better thing to do would be to delete this whole function and just
use the in-kernel hex_dump_to_buffer() function instead, which handles
all of this logic properly.

Can you do that instead?

thanks,

greg k-h
