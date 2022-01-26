Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B7E168
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 08:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44118C340E7;
	Wed, 26 Jan 2022 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1643185885;
	bh=5XhiZ9KX1O+6kUkna4BitOhkQ8ITLiIjnAMjcJq/erA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulYF2aCwDeYsDSKdzal7qDeMVH8cUyYiRLAB9ET7S50sbVis5gDUOO6oBhAk0ZiaF
	 SaoD1q/qMWN2CmDguFhFPlpE5IMHIDsbgQOk0y5r46raaWZ7EY0NY8cKcZSmT60Jl+
	 pTiO25aD0DFIFJgJrJLxp8MPUO7RvYWovnOaq0WA=
Date: Wed, 26 Jan 2022 09:31:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Lee Jones <lee.jones@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Carlis <zhangxuezhi1@yulong.com>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Helge Deller <deller@gmx.de>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfEG2qVO9K9G+g1d@kroah.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>

On Tue, Jan 25, 2022 at 10:21:14PM +0200, Andy Shevchenko wrote:
> Let's maintain occasional fixes to the fbtft driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea3e6c914384..16e614606ac1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7372,9 +7372,11 @@ F:	Documentation/fault-injection/
>  F:	lib/fault-inject.c
>  
>  FBTFT Framebuffer drivers
> +M:	Andy Shevchenko <andy@kernel.org>
>  L:	dri-devel@lists.freedesktop.org
>  L:	linux-fbdev@vger.kernel.org
> -S:	Orphan
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-fbtft.git

I'm ok with the files moving if the dri developers agree with it.  It's
up to them, not me.

thanks,

greg k-h
