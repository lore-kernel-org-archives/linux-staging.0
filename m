Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C42417AB8
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 12:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80DDC433C8;
	Wed,  9 Aug 2023 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691583714;
	bh=8/mp+c8K0ueF8LcnfsS29bvzQH+bohf0vQ2LRiNZ/oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NvOewq2c3RaqpBcnY1w7/A8jCAFL2pX8aZYY4dvF7sU+vX7g8Qg5vhuBpRAbrZbn9
	 BdSS4//1QZu7FQf6Sdz+UxAHVKRu4FwR6yv7SelLg2TzOXFycKsRmWA6q7pLZU3xHJ
	 eRfzIhL6XHj+kelK5XHO5GAAjLxmtxPu59tPqYf8=
Date: Wed, 9 Aug 2023 14:21:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mingzai Sun <szp2017@gmail.com>
Cc: forest@alittletooquiet.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: Change camel case variables to snake
 case
Message-ID: <2023080933-customs-undercoat-ba4d@gregkh>
References: <20230805035739.376502-1-szp2017@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230805035739.376502-1-szp2017@gmail.com>

On Sat, Aug 05, 2023 at 11:57:39AM +0800, Mingzai Sun wrote:
> Change camel case to snake case.
> Issue found by checkpatch.
> 
> Signed-off-by: Mingzai Sun <szp2017@gmail.com>
> ---
>  drivers/staging/vt6655/srom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/srom.c b/drivers/staging/vt6655/srom.c
> index ee5ca4db74dc..812964ab68c5 100644
> --- a/drivers/staging/vt6655/srom.c
> +++ b/drivers/staging/vt6655/srom.c
> @@ -49,7 +49,7 @@
>   * Parameters:
>   *  In:
>   *      iobase          - I/O base address
> - *      byContntOffset  - address of EEPROM
> + *      by_contnt_offset  - address of EEPROM

Why did you keep the unneeded "by" prefix?

thanks,

greg k-h
