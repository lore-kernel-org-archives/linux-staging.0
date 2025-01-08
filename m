Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D7E1A9B48;
	Wed,  8 Jan 2025 08:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736324028; cv=none; b=TswzniBXVaqaGK2u7uDQaYqrC0IsvyWGeM18oenbqiKsDl+BqOk4MK1Z5N3pNdwEEAj01KtsFScL/283vigrRfIlwDmE4mcYWyhgMUxJWx+DyEl2rYkSIVbnhuKaLSYx4ulQvFxXyhNbUJ4mjqSPF0tAtwcSneEgxOHue2cURdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736324028; c=relaxed/simple;
	bh=gSoJWANRYgLw7Dg5/le74mCK1MVa9m5Y9gkHSrJ+33I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KG3YJY2CLyFyBhVmSfNP42JxrWXw9vYZq4n88+xh5tihWlRIknPsUX62CuaeyPCe7P63X7Ct3s4sy+/xiS3G3Dv39RdzbGcsZN5IEHxTJXnQZBmZxEtvvwkr3F9ZMQwfaNZd0hmqQ0rUoToYyifB/6nh6z/j4QZHodRzfAD131Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D6qqs1xX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D6qqs1xX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80293C4CEE0;
	Wed,  8 Jan 2025 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736324027;
	bh=gSoJWANRYgLw7Dg5/le74mCK1MVa9m5Y9gkHSrJ+33I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6qqs1xXn6axR1UgdikpvxpbvuwO6cEzjZHNDygw7gk8Mmeo5GZ9key+VExNi5Y8M
	 9EYcVlSb2U4jaz9QiNJhqRIhTP1giUxgL4CJ4bgNtcRDWb65Y1+M1858SSewUm1rAS
	 xAq0Yz5Cd/RYZ1USGQzAq/V7UqBOZVEM9aZAXFB4=
Date: Wed, 8 Jan 2025 09:13:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sandeep Salwan <salwansandeep5@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Convert // comments to kernel-style block
 comments
Message-ID: <2025010827-crablike-giggly-c261@gregkh>
References: <20250108002757.43896-1-salwansandeep5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108002757.43896-1-salwansandeep5@gmail.com>

On Tue, Jan 07, 2025 at 07:27:57PM -0500, Sandeep Salwan wrote:
> This patch replaces several // single-line comments with multiline
> block comments in agilent_82350b.c. According to kernel coding style
> guidelines, we should prefer /* ... */ over // comments, especially
> for multi-line or verbose text. This is purely code cleanup only.
> 
> Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
> ---
>  drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> index 53006d0cc79c..3cd01613d067 100644
> --- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> +++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> @@ -31,8 +31,10 @@ int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
>  	int i, num_fifo_bytes;
>  	//hardware doesn't support checking for end-of-string character when using fifo
>  	if (tms_priv->eos_flags & REOS) {
> -		//pr_info("ag-rd: using tms9914 read for REOS %x EOS %x\n",tms_priv->eos_flags,
> -		// tms_priv->eos);
> +		/*
> +		 * pr_info("ag-rd: using tms9914 read for REOS %x EOS %x\n",tms_priv->eos_flags,
> +		 * tms_priv->eos);
> +		 */

That's not really a valid comment, right?  Why not just delete the line
entirely?

thanks,

greg k-h
