Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1DD20E3
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 04:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C47C43470;
	Thu, 13 Oct 2022 04:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665636328;
	bh=1zZPtIczMxHjAq3MHY4iIJHG2cg65zT4AQmHABsQBxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMwzx8bHOLCUrPk0zwfK0H+l/+olN2ERx/pzrS9PTBvvMoAoIjgZfQVIx0zR4yeIf
	 jDUScsaLzyhmFnZwaOiwDXtemJC1cLXIwGeCCVm7NWt7U1QWqDqdJAskL3HQPp/cRm
	 ovyboyUo1i5KeD25WvTBJGXANCj7IWpfPTJn6qZ4=
Date: Thu, 13 Oct 2022 06:46:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
	paskripkin@gmail.com, gszymaszek@short.pl, fmdefrancesco@gmail.com,
	makvihas@gmail.com, saurav.girepunje@gmail.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 5.19 01/63] staging: r8188eu: do not spam the
 kernel log
Message-ID: <Y0eYFF7Wl7Cb2hfK@kroah.com>
References: <20221013001842.1893243-1-sashal@kernel.org>
 <60af3294445ba2d2289a32ef7e429111ff476b44.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60af3294445ba2d2289a32ef7e429111ff476b44.camel@perches.com>

On Wed, Oct 12, 2022 at 08:08:58PM -0700, Joe Perches wrote:
> On Wed, 2022-10-12 at 20:17 -0400, Sasha Levin wrote:
> > From: Michael Straube <straube.linux@gmail.com>
> > 
> > [ Upstream commit 9a4d0d1c21b974454926c3b832b4728679d818eb ]
> > 
> > Drivers should not spam the kernel log if they work properly. Convert
> > the functions Hal_EfuseParseIDCode88E() and _netdev_open() to use
> > netdev_dbg() instead of pr_info() so that developers can still enable
> > it if they want to see this information.
> 
> Why should this be backported?

I agree, Sasha please drop this from all branches.

thanks,

greg k-h
