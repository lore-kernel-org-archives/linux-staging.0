Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3522C9A
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 18:15:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 292B760ED3;
	Tue, 19 Oct 2021 18:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634667342;
	bh=2TUzVw5ZA8w8DxiVN943nQjmgkrvwH6z904KMqjq99g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=13xZMANQ5KBexO+SCZFyJ60dte1ssohR9wWReIsvozgWYjmp2PgjWpJsGBijVsoL6
	 cPkByNcJcOLBDp+7+n1manYrOiD15V1GWRSayLrjeQY/a2GksHwOcaSPRbbWYylDqx
	 XtSIOpL2tpNBCJVkLOFGvBXheFvt1c3CoVUbqy4g=
Date: Tue, 19 Oct 2021 20:15:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/8] staging: prepare for const netdev->dev_addr
Message-ID: <YW8LS5XGqpaCo8t5@kroah.com>
References: <20211019171243.1412240-1-kuba@kernel.org>
 <YW8Bmq6EuZRRAvPB@kroah.com>
 <20211019110159.7936901a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019110159.7936901a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>

On Tue, Oct 19, 2021 at 11:01:59AM -0700, Jakub Kicinski wrote:
> On Tue, 19 Oct 2021 19:34:18 +0200 Greg KH wrote:
> > On Tue, Oct 19, 2021 at 10:12:35AM -0700, Jakub Kicinski wrote:
> > > Hi Greg,
> > > 
> > > This set prepares staging for netdev->dev_addr being const.
> > > We need to sprinkle const around some variables and arguments
> > > and use appropriate helpers to write to netdev->dev_addr.
> > > 
> > > I'll do another pass over staging before the merge window,
> > > this set is based on what's already there in net-next.  
> > 
> > Are these ok to take through my tree now?  Or are you wanting to take
> > them all through netdev?
> 
> I was expecting you to take them, I'll only mark netdev->dev_addr const
> after the next merge window so no rush until then. 

Ok, I'll apply them to my tree tomorrow, thanks!

greg k-h
