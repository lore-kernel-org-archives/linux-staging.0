Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739422C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 15:33:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B274610C8;
	Mon, 18 Oct 2021 15:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634571221;
	bh=z9BHLKrRiJS2UW5H2hXxlZ4BmnXU3TOSvVGUv3NFvgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aO3uOnOT/0orgPQJ6aP29IfyxR4yMnoH1Cpi8JJlv4baYe2rNpPa+hLEEO/QKzPLP
	 KNkPjn9cmegQKJ8If17RmdeeOBkE1RTC1l2dup2EjicHigIpKpyiB9jXBdDy3B1nFR
	 DUb+yFDHTbMqatuBkCzMEA+tSNGzkSaRuJMDM7XY=
Date: Mon, 18 Oct 2021 17:33:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>
Subject: Re: [PATCH 1/2] staging: mt7621-dts: get rid of nodes with no
 in-tree driver
Message-ID: <YW2T06FWg2pGreOL@kroah.com>
References: <20211017070656.12654-1-sergio.paracuellos@gmail.com>
 <CAMhs-H_BKw8e6hObS3Tx-iO44xbyZh2Q+=jVtxykJ=6hx1Rheg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H_BKw8e6hObS3Tx-iO44xbyZh2Q+=jVtxykJ=6hx1Rheg@mail.gmail.com>

On Mon, Oct 18, 2021 at 05:29:16PM +0200, Sergio Paracuellos wrote:
> Hi Greg,
> 
> On Sun, Oct 17, 2021 at 9:06 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > Nodes for 'i2s' and 'nand' have no driver present inside the linux tree.
> > The normal approach for a dts file to be mainlined is start with those stuff
> > which is already mainlined and get rid of the other stuff. If needed it will
> > be properly added afterwards together with the suitable device driver. Hence,
> > remove both nodes from the device tree include file.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/staging/mt7621-dts/mt7621.dtsi | 36 --------------------------
> >  1 file changed, 36 deletions(-)
> 
> I noticed PATCH 2/2 of this series was added but not this one which is
> the first one in the series. Since I did not see any mail or something
> complaining about it... is it possible you missed it?

It did not apply to my tree as it seems to already be there.  Try
rebasing and resending if it really is not.

thanks,

greg k-h
