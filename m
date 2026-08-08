Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC3034CDD;
	Sat,  8 Aug 2026 05:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786167943; cv=none; b=rf51niHG8tpVR76ejXntgYtfM8ARM5DiMsrGwDPrkk8VKD+VMWWiYAjYWY0HjvqiywsKl9b1pSb+39zOeI8d+uK5CTGVgC5sluOqM9TNluQ+nYznYZdpOChESckCheuaYM5AuCW2twDxv1eI/X5f5SnrcRUAhQqmUBw1rD8l92o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786167943; c=relaxed/simple;
	bh=lJsbIGhzFT2BzZCV2mx/wqn5ky/tsNDAukjIB/bv+ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slNo8zP4yOO9tRxZFtXJYa22vWaRw9VgCnvEhSIpR6CXMUuvcnC/1DwKt5F9mEhg7SlJGlxwoKfW756jIxeyrrKPZu/RzbNr/QtFxSlTUD6iaRA8M0HMTP+m250edB+6PbB/hN6OAhAVtwmeOi8NTxUIJJ6EX8lSCrL6hv7B6fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nx9dNgkU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nx9dNgkU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E921F000E9;
	Sat,  8 Aug 2026 05:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786167942;
	bh=ZU8wqmb71feBK7y4crhGsi77HaMJRxoQMfRzrhrAeg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nx9dNgkUXW98pSLAm6qX2uo9iSpdsxzKk9lXOQvANtbEmdp4m6QNNfMlqVnJJ3Lsf
	 fDwSLMAdPBj8ZubAy8O/qAMH2Ww/YwLjXRCr+RIsJomIWXcv9M/MQSWPvLz84B/+IX
	 X+Oyy3qh3toNT4qDRILaNUepsZrUMkwrdVQMyK+g=
Date: Sat, 8 Aug 2026 07:45:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Punnay Sharma <punnaysharma805@gmail.com>
Cc: mchehab@kernel.org, error27@gmail.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: media: av7110: fix corrupted BER
 reporting in sp8870
Message-ID: <2026080813-dimness-mammal-e7e9@gregkh>
References: <20260807183443.13912-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807183443.13912-1-punnaysharma805@gmail.com>

On Sat, Aug 08, 2026 at 12:04:42AM +0530, Punnay Sharma wrote:
> In sp8870_read_ber(), the 14-bit Bit Error Rate (BER) is assembled by
> reading two I2C registers: 0xC08 (lower 6 bits) and 0xC07 (upper 8 bits).
> 
> The current implementation masks the lower bits via `tmp = ret & 0x3F;`
> but subsequently overwrites `tmp` entirely when processing the upper
> bits using a direct assignment (`tmp = ret << 6;`). This logical error
> causes the lower 6 bits of the BER hardware metric to be silently
> discarded.
> 
> Fix this by using a bitwise OR (`tmp |= ret << 6;`) to correctly merge
> the MSB and LSB payloads before returning the metric to the DVB core.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
> ---
>  drivers/staging/media/av7110/sp8870.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
> index 29fb4934c..77bebf2c7 100644
> --- a/drivers/staging/media/av7110/sp8870.c
> +++ b/drivers/staging/media/av7110/sp8870.c
> @@ -401,7 +401,7 @@ static int sp8870_read_ber(struct dvb_frontend *fe, u32 *ber)
>  	if (ret < 0)
>  		return -EIO;
>  
> -	tmp = ret << 6;
> +	tmp |= ret << 6;
>  	if (tmp >= 0x3FFF0)
>  		tmp = ~0;
>  
> -- 
> 2.55.0
> 
> 

Did you forget the Assisted-by: tag?
