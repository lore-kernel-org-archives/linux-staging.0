Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4B415A9
	for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 06:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395ACC385A9;
	Fri, 20 May 2022 06:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1653026626;
	bh=kavH15HxjDABcLAwAacr39uq4nUfy4tlsuWMTt/128Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aOfHvGMOxvEuR9SFoPJZPTQfK8HRiFCRtbgNpYwHFUbKX3pf+N/k1xxGmITkUsOpI
	 SS9npiymCKID5I11EguHR33/+NDyFPVNu6x5OtdUK25T+jL+V2MqA0wvAx1BhAPHDo
	 o7X3eCexebnDZx9IxiGdZZRoA/h369PY02RtaiuU=
Date: Fri, 20 May 2022 08:03:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uri Arev <me@wantyapps.xyz>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Len Baker <len.baker@gmx.com>, Sam Ravnborg <sam@ravnborg.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Srivathsa Dara <srivathsa729.8@gmail.com>,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix checkpatch.pl struct should normally
 be const
Message-ID: <YocvQJNfA8726Kf6@kroah.com>
References: <20220519172503.10821-1-me@wantyapps.xyz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519172503.10821-1-me@wantyapps.xyz>

On Thu, May 19, 2022 at 08:25:01PM +0300, Uri Arev wrote:
> This simple patch fixes a checkpatch.pl warning in `fbtft/fbtft-core.c`.
> 
> Reported by Checkpatch:
> WARNING: struct fb_ops should normally be const
> 
> Signed-off-by: Uri Arev <me@wantyapps.xyz>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Always test-build your patches before submitting them :(
