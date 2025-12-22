Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A621030FC03
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393108; cv=none; b=mrcPdNNxIUj75h1mqbRFxNMNe6haJhgbXt5Y8pk4k5yb4C+tYPbndNE1ESX42Yw3Nie48oD4gD+XQlwqw7ysJEIVDtYYWW35Wl4QkalIL/AmdSuyf9d8CCNuwUF7uozc0su5L5XdtzHaJkGav/P2bohtpC1GBiRbMvHhBL9LdMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393108; c=relaxed/simple;
	bh=xrh205yY+BkD8kVFVFR/2GiqlLCkH9LaG49yx0W45bA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rs5JWxB0DxZcoERBlJvI3iZQP7dQINBXZIQfEqLIoVe6fZ9H+QxMpU3yd73XZCUTV6gwQi0cwtmi0MfgRbMHeoyisZt3tqJsjSLmeHobjTixwqRAOyBgxUhCnT5JEp1DayqLZaoKH11oL9mU4eNK50EONpeFPje3MrHJBLJexj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l1HO9rgq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l1HO9rgq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AA3C4CEF1;
	Mon, 22 Dec 2025 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766393106;
	bh=xrh205yY+BkD8kVFVFR/2GiqlLCkH9LaG49yx0W45bA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1HO9rgqJtqJFx67Deea54MiRMBGuezjG87orOTwMQ9SZ6F+137rtk+ByAyo8Fgaa
	 r9hbIIJV4Z8QfwVrq1QFlVdstsBolIaArUtFE0PfDPPR5zVdsAN1tS7t1u7KK0udo8
	 3AmD5uvJ8af43VAJbO9P37aJIbvZMUoLyCPu4Mz0=
Date: Mon, 22 Dec 2025 09:45:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: linux-staging@lists.linux.dev, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH 1/4] staging: greybus: spilib: fix function parameter
 indentation
Message-ID: <2025122207-friday-santa-3251@gregkh>
References: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
 <20251219063415.46818-2-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219063415.46818-2-zhanxusheng@xiaomi.com>

On Fri, Dec 19, 2025 at 02:34:12PM +0800, Zhan Xusheng wrote:
> Fix checkpatch.pl warning:
> "Alignment should match open parenthesis"
> by aligning wrapped function parameters with
> the opening parenthesis.
> 
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  drivers/staging/greybus/spilib.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index 24e9c909fa02..416ca27a25ce 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -159,8 +159,10 @@ static struct spi_transfer *get_next_xfer(struct spi_transfer *xfer,
>  }
>  
>  /* Routines to transfer data */
> -static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
> -		struct gb_connection *connection, struct spi_message *msg)
> +static struct gb_operation *
> +gb_spi_operation_create(struct gb_spilib *spi,
> +			struct gb_connection *connection,
> +			struct spi_message *msg)

This is where things get messy :(

The original is still best, as you can see the function name, and the
return type, on the same line, which many search tools really want to
show you when searching code.

So the existing code is fine, no need to worry about this warning here.

thanks,

greg k-h
