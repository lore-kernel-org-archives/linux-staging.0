Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAA272
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 17:34:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D47E61355;
	Tue, 19 Oct 2021 17:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634664860;
	bh=LxCy7V7FFhZ58tHforyZgzxk8XztgJ6eqwh3Y/AkEcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ama9XIU9kCXKwVbPdT6i1UD21dd4EyEGiv1KbL6EZS7f6kwojyO0Avyr7FylmRZVU
	 laeZFMcX3DAMALKdD4Ft518NMsrgGPe2joQXI31ek/W5BdhbTWVf5JLsecaqCEBp5S
	 orHPmtekkIlklaZOUhoglDD9kywb4qQw5uzFNhxY=
Date: Tue, 19 Oct 2021 19:34:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/8] staging: prepare for const netdev->dev_addr
Message-ID: <YW8Bmq6EuZRRAvPB@kroah.com>
References: <20211019171243.1412240-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019171243.1412240-1-kuba@kernel.org>

On Tue, Oct 19, 2021 at 10:12:35AM -0700, Jakub Kicinski wrote:
> Hi Greg,
> 
> This set prepares staging for netdev->dev_addr being const.
> We need to sprinkle const around some variables and arguments
> and use appropriate helpers to write to netdev->dev_addr.
> 
> I'll do another pass over staging before the merge window,
> this set is based on what's already there in net-next.

Are these ok to take through my tree now?  Or are you wanting to take
them all through netdev?

thanks,

greg k-h
