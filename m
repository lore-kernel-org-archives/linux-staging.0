Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473077B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 07:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DA0C433EF;
	Sat, 11 Mar 2023 07:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678520392;
	bh=WRrhNX7dx4Q0m0Rku6/n3BTkKOlk74Vwk8ROyWglgPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vLeSZyQ6j5TgKaBBLk9B27OTCCEpn8JTsnosK6MRVlEtgSI15/nGbp8i2zBfZN+HT
	 Zcb1j/Io9a9WmHBiHNErIv9YIoU6252UZ2NPojeoXsBxLoxdriLAxorzL/yvqnpzgP
	 zQz3eZRMbeY3KTihV9nwlGDx5Z5pOurzwVTRzo0Y=
Date: Sat, 11 Mar 2023 08:39:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Archana <craechal@gmail.com>, drv@mailo.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] staging: wlan-ng: remove else statement
Message-ID: <ZAwwRnthlPFta9oL@kroah.com>
References: <20230310205917.2161-1-craechal@gmail.com>
 <20230310205917.2161-2-craechal@gmail.com>
 <a4096cdc-97d1-4265-8ce4-b8021ecf5933@kili.mountain>
 <14be11a8-722c-4520-9e1b-5b147bb3d3fc@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14be11a8-722c-4520-9e1b-5b147bb3d3fc@kili.mountain>

On Sat, Mar 11, 2023 at 07:58:51AM +0300, Dan Carpenter wrote:
> On Sat, Mar 11, 2023 at 07:34:25AM +0300, Dan Carpenter wrote:
> > On Fri, Mar 10, 2023 at 08:59:17PM +0000, Archana wrote:
> > > else block is not needed if j is set to -1
> > > before if block
> > > 
> > > Signed-off-by: Archana <craechal@gmail.com>
> > > ---
> > 
> > Is Archana your full legal name that you would write on a legal document?
> 
> Ah, never mind.  Apparently this policy has been updated.  Pseudonyms
> are allowed for people concerned about privacy but anonymous
> contributions are not allowed.
> 
> https://lore.kernel.org/all/ZAoMxSPKNLoLg7Wl@aschofie-mobl2/

That being said, I still have to ask this same question anyway, so it's
ok to ask this.

thanks,

greg k-h
