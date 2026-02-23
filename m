Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBDA221FB1;
	Mon, 23 Feb 2026 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854706; cv=none; b=Ot04CzgbFqLx8e9twL632ABrVRX66a2YeLpMSxRMJVNgowpCVMUw5kNzqhok1vPALDpfpYn5TOhQB7cDChHaAu7Gn+gVpS0fKpehBDAUXvvMje9Q7BGV4W1WAfYKGTtmMtMww3I4FICirqzNXUMDg45GfVhQbJ19dYniKRK3jVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854706; c=relaxed/simple;
	bh=LInD/PINw+4KKtrw8+IjQhb+oJxw6J3vToqFGe1qA1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQ9uFjV/7px9IsuCLqcwJPlEVguEfPrE/bneGyZZPwY1SPAdxAWNfnkTVrkt+yFYXXWdWhewivXn0XOdwYszZBMQ248XsWmbkn2yYbuvyHp+Tx47F5IWzM3x7VHvcUx1aA/uZ6bEpz5/uEDo9wjvl0a2eruHaTQ67Txv5RgZFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gkKxgV0y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gkKxgV0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35861C116D0;
	Mon, 23 Feb 2026 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771854705;
	bh=LInD/PINw+4KKtrw8+IjQhb+oJxw6J3vToqFGe1qA1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkKxgV0ynd/kMavlPM1gLYLJGK5++oN2yeDQTUvuCJbWwgwcfu0Vz/XkhSatb3Qij
	 6Mor14k2Rz2L5Ksr7sRoJfsLBaNHHrhIHsFeTVwL5D7GCQhU9W6wAYdklHNGK0nf5D
	 YWx5Ac2MMO/II+9VWrueZXvHuKU5Bctr+M00xN8s=
Date: Mon, 23 Feb 2026 14:51:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Samyak <samyak.bambole07@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vme_user: use kmalloc_obj instead of kmalloc
Message-ID: <2026022345-essay-pedometer-cce8@gregkh>
References: <20260214164519.678428-1-samyak.bambole07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214164519.678428-1-samyak.bambole07@gmail.com>

On Sat, Feb 14, 2026 at 10:15:19PM +0530, Samyak wrote:
> From: Samyak Bambole <samyak.bambole07@gmail.com>
> 
> Replace kmalloc(sizeof(*ptr), GFP_KERNEL) calls with kmalloc_obj(*ptr,
> GFP_KERNEL)
> 
> This addresses scripts/checkpatch.pl warnings and follows the preferred
> allocation pattern.
> 
> Signed-off-by: Samyak Bambole <samyak.bambole07@gmail.com>
> ---
> v2 -> v3 : fix spelling: preferred (not preffered)
> v1 -> v2 : remove changelog details as suggested by gregkh
> 
> v2: https://lore.kernel.org/linux-staging/20260214161321.669459-1-samyak.bambole07@gmail.com/
> v1: https://lore.kernel.org/linux-staging/20260214155157.663800-1-samyak.bambole07@gmail.com/
> 
>  drivers/staging/vme_user/vme.c        | 24 ++++++++++++------------
>  drivers/staging/vme_user/vme_fake.c   |  6 +++---
>  drivers/staging/vme_user/vme_tsi148.c | 14 +++++++-------
>  3 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index 2095de725..8496c722a 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -287,7 +287,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
>  	if (!allocated_image)
>  		goto err_image;
>  
> -	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
> +	resource = kmalloc_obj(*resource, GFP_KERNEL);

If you look at 7.0-rc1, this should just be:
	kmalloc_obj(*resource);
right?

thanks,

greg k-h
