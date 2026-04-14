Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F733E6396;
	Tue, 14 Apr 2026 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183771; cv=none; b=g54am2vsqjdhA+RVG+TTkskQgFgWnrE/PLwjY4RX9JJlunhmOoHN1DVSxaSl3t3zWMWcRLegfcIraI/4xclxLhNs8M3GWVB4BbRPYTHhEeaP+bW5F/IZaGJo9cwjRHjOufGrkbYD72vCVINtDd/+okfFpjVl8RUUI5uhRZhgRcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183771; c=relaxed/simple;
	bh=1Rmp6C46RFnVawVKESRcyICS1LZq3YdDd4IOGKyILSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYPZeuX2yPlHXf8xQXraXLGL0jfK0uaDhKRpHV57maD52VK7v6MqrczSgaVIukBExScBsPlIQmmueLsk93hCd02z662zQwvOv4iwECnrxcBbUFYbRZ3xOmuFwt/QU4ZLCjM43QYQJTbNHc7EfclreLx+efXmPg0cv1fiMV+uPRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TxcrThB5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TxcrThB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435E4C2BCB5;
	Tue, 14 Apr 2026 16:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776183770;
	bh=1Rmp6C46RFnVawVKESRcyICS1LZq3YdDd4IOGKyILSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TxcrThB5WlccmYiZ8t7RFTqO9udQUAhikf/x5wbiLoyGAYW8n4LK0mN2qGulC8bo0
	 DqEOFp5Rbp2kA8PURdwV/ZjwtwAMheCWTLXpKltuzGVVvU94sAaMU0j4zlmAIUcdRG
	 yOhvO5byV0JQu0rcPWznQ6MFRvhvlMO5uYJjP64o=
Date: Tue, 14 Apr 2026 18:22:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Souradipto Das <souradiptodas6@gmail.com>
Cc: linux-staging@lists.linux.dev, kees@kernel.org, nadzya.info@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vme_user: add blank lines to struct
 fake_driver
Message-ID: <2026041406-credit-eloquent-047d@gregkh>
References: <20260414143217.47529-1-souradiptodas6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414143217.47529-1-souradiptodas6@gmail.com>

On Tue, Apr 14, 2026 at 02:32:17PM +0000, Souradipto Das wrote:
> Fix checkpatch.pl warnings regarding missing blank lines after
> declarations. This improves readability by grouping related
> Location Monitor variables together.
> 
> Signed-off-by: Souradipto Das <souradiptodas6@gmail.com>
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
