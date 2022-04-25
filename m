Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BC67E
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 04:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B70C385A7;
	Mon, 25 Apr 2022 04:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650861917;
	bh=2gZLH75MhvXmgXdEDwAZDudUMeUiaWw1yA8c9fQX3BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nu/2lXmc6Av6YAwdkfyQIuYYY1h8pQ22d5pz6yqUKpwZetniiPnxYrwwP6wEqirRZ
	 8JPDyZDPEWuJroM8bB50DdgNOUxWC7RheMpX1Yeq4ZRkvhK5MYRMHFTnYzLxtVJuMR
	 SHBQnTCcB5beTmU+G1T8sZ/2qhAabYmMYiZ7K9y4=
Date: Mon, 25 Apr 2022 06:45:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ian Cowan <ian@linux.cowan.aero>
Cc: LABBE Corentin <clabbe@baylibre.com>, mchehab@kernel.org,
	dan.carpenter@oracle.com, mjpeg-users@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] staging: media: zoran: add zrdev_dbg() macros
Message-ID: <YmYnVfYPrWkcee1m@kroah.com>
References: <20220423051745.292683-1-ian@linux.cowan.aero>
 <YmWiQsrPj0uIpZ7w@Red>
 <YmX31vg+lCx6rsKF@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmX31vg+lCx6rsKF@fedora>

On Sun, Apr 24, 2022 at 09:22:30PM -0400, Ian Cowan wrote:
> On Sun, Apr 24, 2022 at 09:17:22PM +0200, LABBE Corentin wrote:
> > Hello
> > 
> > Thanks for your patchs, removing dprintk is a good idea.
> > Please use pci_xxx() instead of dev_xxx() to be consistent with the rest of the driver.
> > The comment title is misleading, zrdev_err is not about debugging. What about Logging macros ?
> > 
> > Regards
> > 
> 
> I have made those modifications, and I will resubmit patches 1 and 2
> shortly. Those are the only patches that affected by this change; 3 and
> 4 will not change.

You should send a whole new series, properly versioned as the
documentation in the kernel asks you to.  Otherwise it is impossible for
reviewers and maintainers to know what is the "latest" version to
accept.

thanks,

greg k-h
