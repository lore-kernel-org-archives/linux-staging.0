Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488C33E7163;
	Tue, 14 Apr 2026 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175437; cv=none; b=Wy0NiJ4v40LDqXgMMYZWpUZswYv8z1ifUZChNAdffVn2PtrWWctsO/YPFC4oENUHzM6fhXiXzYa8sKIjnfEZd/wllSUzfNvwtX8N0FMndoQi3Tb6N1tbqBpHkm/jkIS5BAZv7Te21UzMuubTCZ4QNl42P4vDlCG7HQaTcIi4rx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175437; c=relaxed/simple;
	bh=zszwGQbkdDIK3hpJnu5NmDQXJ3Xv1DWpL/aA6df6Vkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWRrL79kxDShEJhmQzVmNglkIjPTTEHw2rqsRlX+JrMH7QCdAgvznNBEDHFfVHOt5s3WVQVh2yXZEAQOIbcIg0eBUc94mHhdDVMnSt3a8Hk1JCpzNUxioN8qPKNdmaJcWSWfJq6RDvZRwwB+b9rFiqTrF5uKOEtW9LqCB7pNrGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h+nvvhri; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h+nvvhri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5B3C2BCB5;
	Tue, 14 Apr 2026 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776175436;
	bh=zszwGQbkdDIK3hpJnu5NmDQXJ3Xv1DWpL/aA6df6Vkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+nvvhrifABZQbFsgB1coyFQnpZBLmSEPpnBNLGr8HoAfKpb5fW3IAkVq/CCkSLeN
	 o3PiSAiYsS/+BJTVt8wklcOyx6W1b9s8k/7X1r3i2wH6X3MynwEn+qgbO0kCDxLxXP
	 gvT0RTq3/XCcEhxxiK6+EwpVUb8s//IrLEQsrzVQ=
Date: Tue, 14 Apr 2026 16:03:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Enthusiastic-coder999 <souradiptodas6@gmail.com>
Cc: linux-staging@lists.linux.dev, kees@kernel.org, nadzya.info@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: add blank lines to struct fake_driver
Message-ID: <2026041412-ogle-upper-c7c7@gregkh>
References: <20260414133734.22106-1-souradiptodas6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414133734.22106-1-souradiptodas6@gmail.com>

On Tue, Apr 14, 2026 at 01:37:34PM +0000, Enthusiastic-coder999 wrote:
> Fix checkpatch.pl warnings regarding missing blank lines after
> declarations. This improves readability by grouping related
> Location Monitor variables together.
> 
> Signed-off-by: Enthusiastic-coder999 <souradiptodas6@gmail.com>
> ---
>  drivers/staging/vme_user/vme_fake.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index be4ad47ed526..7ec14bf15fbe 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -67,8 +67,10 @@ struct fake_driver {
>  	unsigned long long lm_base;
>  	u32 lm_aspace;
>  	u32 lm_cycle;
> +
>  	void (*lm_callback[4])(void *);
>  	void *lm_data[4];
> +
>  	struct tasklet_struct int_tasklet;
>  	int int_level;
>  	int int_statid;
> -- 
> 2.52.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
