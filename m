Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F6128A408
	for <linux-staging@lists.linux.dev>; Thu, 22 May 2025 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918561; cv=none; b=CPuVyA6Bc5iwIfFLw7fAIqL0IkV0CunmNCCVey3X9Ai9fgd/2gJ5/dshV2Ftfi23Hl4pxkCBI6WT7v1t7fd3cUv+SvNW3RzkzKU7xXpwpxeJ3fbcKpVVClBICLXaXLOn0j1eT1jpnEgkTpVDdVoyvaO40Gt/LcCM2Iy8YVcR97k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918561; c=relaxed/simple;
	bh=WEPlIuQ+RFFb/j9YtESN6MrKs/oKqhI2Zekq0qvuXPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzsgPvP8kR8ZDq0h5gQlfnjwIn0RIOHxaMycTPb83EgIEh1MtWnxS5UfzTcJJYggNfKvvRDZzWvo47rlC9Oni7qBlCp/8hvuysSWzG3ez8HnW7d+J5D/p9wyxpwbg65cF0Q03k2ynz5umVuyJRarViCRcagjouX6dP4C6bGbHfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1twCoz+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1twCoz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B832C4CEE4;
	Thu, 22 May 2025 12:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747918561;
	bh=WEPlIuQ+RFFb/j9YtESN6MrKs/oKqhI2Zekq0qvuXPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1twCoz+jQwaGWMyr+OiCWX8KbJSb3F6mvEYDLfw6d1xptOXtX9PQCIJe6GmWY7C3
	 UiS2DpmU3CQuRIKmIWRilsaL/2Wlz4seJnNQyZQJAW6P4n9oniR1/EcCizx7aG/ILA
	 k0fC4yvNoU90trTj/5W0JHyTfKV9xhkLynlPPwxaokgtt2sAFgJ0IGdgAn+KoeAJvj
	 iqtW1jwRPmOt9YiHrkzvWIAteUc36xlKSiGq7DOaCvxUx0obp2/HC747tAn8pcJUnO
	 LKybYAU0lSV55uAJbP7fXFryoueOEgxbEZrJkrZbskzC7cz9AfZbTVuCSV1wId1oc6
	 Epkk22plnsIGA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uI5So-000000002iy-0ThG;
	Thu, 22 May 2025 14:55:58 +0200
Date: Thu, 22 May 2025 14:55:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: gbphy: fix up const issue with the
 match callback
Message-ID: <aC8e3ldqe6j2vxv7@hovoldconsulting.com>
References: <2025052155-peddling-happier-f825@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025052155-peddling-happier-f825@gregkh>

On Wed, May 21, 2025 at 04:55:55PM +0200, Greg Kroah-Hartman wrote:
> gbphy_dev_match_id() should be taking a const pointer, as the pointer
> passed to it from the container_of() call was const to start with (it
> was accidentally cast away with the call.)  Fix this all up by correctly
> marking the pointer types.

This one too should have a:

Fixes: d69d80484598 ("driver core: have match() callback in struct bus_type take a const *")

> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/staging/greybus/gbphy.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
> index 6adcad286633..ab8a1af36808 100644
> --- a/drivers/staging/greybus/gbphy.c
> +++ b/drivers/staging/greybus/gbphy.c
> @@ -102,8 +102,8 @@ static int gbphy_dev_uevent(const struct device *dev, struct kobj_uevent_env *en
>  }
>  
>  static const struct gbphy_device_id *
> -gbphy_dev_match_id(struct gbphy_device *gbphy_dev,
> -		   struct gbphy_driver *gbphy_drv)
> +gbphy_dev_match_id(const struct gbphy_device *gbphy_dev,
> +		   const struct gbphy_driver *gbphy_drv)
>  {
>  	const struct gbphy_device_id *id = gbphy_drv->id_table;
>  
> @@ -119,8 +119,8 @@ gbphy_dev_match_id(struct gbphy_device *gbphy_dev,
>  
>  static int gbphy_dev_match(struct device *dev, const struct device_driver *drv)
>  {
> -	struct gbphy_driver *gbphy_drv = to_gbphy_driver(drv);
> -	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
> +	const struct gbphy_driver *gbphy_drv = to_gbphy_driver(drv);
> +	const struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);

Making the dev pointers const is arguably a separate change, but I guess
it's related enough:

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
