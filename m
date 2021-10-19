Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1572
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 18:02:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEFDF6135E;
	Tue, 19 Oct 2021 18:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634666520;
	bh=rzpApEL5rMrCvSONz+6GxjN8Klajn+HxRaPT11WWAws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dOvy64uRWVCBTtNwmfbn+1df85dJFdB/v6bJEHPIK1b+thtkHvAzR3m4oI3DwsVfv
	 t+yJXRCQ2MFNc7/7DnZwK25jIcNrp5kFewx3mEngQj21891AgZfYNT19zit8ppDXUE
	 9WGt5iQld9QUHAOFC0VYrb8wVVUePskJ3A3zdH4jxbYTIBhIIV+rCCfN3BJjEWKEbP
	 ommWOdMmJfhC0ZTrxTgMFnKMUZxPjA3nwp05+bnNdL5YjiTIlqucKVZ9H/s3SBHXw2
	 InNgA+oLIMVvqdy/v6tJirjjF6Ylg/1zCyQN/mwyJJ/qj+3Q1lygVPneuy6eDyU5gw
	 egKUg1lAhLmvw==
Date: Tue, 19 Oct 2021 11:01:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/8] staging: prepare for const netdev->dev_addr
Message-ID: <20211019110159.7936901a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <YW8Bmq6EuZRRAvPB@kroah.com>
References: <20211019171243.1412240-1-kuba@kernel.org>
	<YW8Bmq6EuZRRAvPB@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 Oct 2021 19:34:18 +0200 Greg KH wrote:
> On Tue, Oct 19, 2021 at 10:12:35AM -0700, Jakub Kicinski wrote:
> > Hi Greg,
> > 
> > This set prepares staging for netdev->dev_addr being const.
> > We need to sprinkle const around some variables and arguments
> > and use appropriate helpers to write to netdev->dev_addr.
> > 
> > I'll do another pass over staging before the merge window,
> > this set is based on what's already there in net-next.  
> 
> Are these ok to take through my tree now?  Or are you wanting to take
> them all through netdev?

I was expecting you to take them, I'll only mark netdev->dev_addr const
after the next merge window so no rush until then. 

And there's already a small conflict between this set if generated on
top of net-next and changes you have in your tree.
