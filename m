Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A97B2C236B;
	Thu, 30 Apr 2026 18:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572120; cv=none; b=NMjS+wNInSwwu9hPboZ2qwQ8JhI82kqh7bgOmAZLbvnkhyMKZqJ+7J2HfpQTJe/JO3mKszYXhMMplCXh5q8EvjPJv9xFySHbCmEaSVGgCu8d3vFc04Zb+kuZuvrMInPiNwopW3FVRVLCNvRUD+t92AbQnfhy677LopZ6fL5JADQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572120; c=relaxed/simple;
	bh=vefyYPDj4Y2rC615qhf74CFFYDJ3WU+Tjn60UMaVjIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XB86ZZinXIK3wfstQTdaxTLy1dIRf8T2x0Z1NfGxSkifT5bmUh8WMHeFKcVdhaJbP/YtH7CuqTPOl0HhQBnT+kunnOk+LD4qdhlouOkZOE5yTws3Gw0Y2ODPRQ3EeR20T5JHmdMnUo/tLd0+tPNwGcnqE6whRNUy4ZLL4nfwZWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Dy0++rQ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Dy0++rQ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD507C2BCB3;
	Thu, 30 Apr 2026 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777572120;
	bh=vefyYPDj4Y2rC615qhf74CFFYDJ3WU+Tjn60UMaVjIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dy0++rQ2/JD9CD8f0nJBUNS+TxnNCRmyWKsNW0it6mmUePpz4frotB+xG60ovXPGB
	 rCbRMiY25bfFo3Om2XlXE3+7e9+ou4srcKa+rY43mv1VpvcOAWwRjLe6Akr/4YqrJy
	 XykOdoz9IL7OKW2CHbI06pDYEJnxnMEfQyAiRvw4=
Date: Thu, 30 Apr 2026 20:01:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bentley Blacketer <sonionwhat@gmail.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: greybus: bootrom: replace dev_info with
 dev_dbg for firmware name
Message-ID: <2026043050-kinetic-unquote-f6b5@gregkh>
References: <20260430175437.3699-1-sonionwhat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430175437.3699-1-sonionwhat@gmail.com>

On Thu, Apr 30, 2026 at 01:54:36PM -0400, Bentley Blacketer wrote:
> The original dev_info call was intentionally temporary, with a FIXME
> comment noting it should be downgraded to dev_dbg once modules with
> valid VID/PID values were common. Project Ara was cancelled in 2016,
> so that time has long passed.

But other systems are now using greybus, and there was at least 2
different phone models that shipped with this code.  So are you sure
that there is no user for this anymore?

> 
> Remove the FIXME comment and downgrade to dev_dbg as originally intended.
> 
> Tested via code inspection only, as Project Ara hardware is no longer
> available.

You can run greybus on a beaglebone device today.

> Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>

You have an extra ' ' in there still.

> ---
> Changes in v4:
>  - Fixed duplicate Signed-off-by
>  - Fixed missing tab on snprintf line
> Changes in v3:
>  - Fixed author name mismatch
> Changes in v2:
>  - Fixed whitespace issues
>  - Moved testing note below --- line
> 
>  drivers/staging/greybus/bootrom.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 83921d90c..9e0f24d6d 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -168,13 +168,8 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
>  		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>  		 intf->vendor_id, intf->product_id);
>  
> -	// FIXME:
> -	// Turn to dev_dbg later after everyone has valid bootloaders with good
> -	// ids, but leave this as dev_info for now to make it easier to track
> -	// down "empty" vid/pid modules.
> -	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
> +	dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
>  		 firmware_name);
> -

Why did you drop the blank line too?

thanks,

greg k-h
