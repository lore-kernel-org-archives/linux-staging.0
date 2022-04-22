Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCF97A
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 05:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4D8C385A0;
	Fri, 22 Apr 2022 05:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650604239;
	bh=smjUvc4uRg4xhlUXc3p/Lm4IGHpy+jmRl0IetThwUbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9WDC/ShXMFmHld2O1ExU8pkUltO8/Pt6GePZWh6W8UJqEFIs1m4N3RSm+6NmMAzm
	 4PWRbZ3gyxOsSpZRI57hFyC+tq9xNI8GFro0ArneJtxs6LutYYsG9qxC5FMVvd34kD
	 GxFc4VAlFk/LyY2cxwyOmLmwBZUZerv2GEz2IQJs=
Date: Fri, 22 Apr 2022 07:10:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ian Cowan <ian@linux.cowan.aero>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, clabbe@baylibre.com,
	mchehab@kernel.org, mjpeg-users@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: zoran: refactor printk debugging function
Message-ID: <YmI4yh88pYVvVE/X@kroah.com>
References: <20220421002316.873109-1-ian@linux.cowan.aero>
 <20220421142153.GA2462@kadam>
 <YmF2mM+Lqv/HOgFl@fedora>
 <20220421155203.GB2462@kadam>
 <YmH3IZhUrvEzZlZU@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmH3IZhUrvEzZlZU@fedora>

On Thu, Apr 21, 2022 at 08:30:25PM -0400, Ian Cowan wrote:
> On Thu, Apr 21, 2022 at 06:52:04PM +0300, Dan Carpenter wrote:
> > On Thu, Apr 21, 2022 at 11:22:00AM -0400, Ian Cowan wrote:
> > > 
> > > For using the dev_dbg() macro, do you define this in the header file
> > > (i.e. for this it would be videocodec.h), or where should this be
> > > included from?
> > 
> > dev_dbg() is defined in include/linux/dev_printk.h.  Look around at how
> > it's used.  pr_debug() might be an option, but I don't know if we will
> > accept that, we prefer dev_dbg().
> > 
> > regards,
> > dan carpenter
> > 
> 
> I'm about to submit the modified patch, but I went and looked and we
> cannot use dev_dbg() because these specific drivers do not have any
> association with a device struct.

Then please fix that issue, as there is a real struct device that they
are using somewhere.  That is the correct solution as drivers should
never use pr_* calls directly.

thanks,

greg k-h
