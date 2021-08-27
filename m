Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF4C72
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 10:23:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45B8C60FE6;
	Fri, 27 Aug 2021 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630059834;
	bh=GlcuY2UtDqbSR3JyfcQrDkWEl5GGT63iUq4fz3sDAjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aB6OORNEDyR0kVgoykJhdsLhGROyL2TNixGBFr/ZA4Y9FRbrusoJEkVwNrI4Gus9s
	 gxCP7x9sjTPjb5VYaLKlURuKWr5dR3McK5XOFr91zt88ukMTiqjjwZHYu0dFM9Wshd
	 asSw/3gkb9i3lPm8hapCKlx8MoFSRXmTtJJj3MvU=
Date: Fri, 27 Aug 2021 12:23:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Joe Perches <joe@perches.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-scsi@vger.kernel.org, storagedev@microchip.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/5] vsprintf and uses: Add upper case output to %*ph
 extension
Message-ID: <YSi9NufNS18rRpmE@kroah.com>
References: <cover.1630003183.git.joe@perches.com>
 <YSiZlyQzgW8umsjj@smile.fi.intel.com>
 <4b8e2987c1ff384bac497a20fcd75f9051990cff.camel@perches.com>
 <YSimXPUVcy9zhpYG@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSimXPUVcy9zhpYG@smile.fi.intel.com>

On Fri, Aug 27, 2021 at 11:46:20AM +0300, Andy Shevchenko wrote:
> On Fri, Aug 27, 2021 at 01:10:41AM -0700, Joe Perches wrote:
> > On Fri, 2021-08-27 at 10:51 +0300, Andy Shevchenko wrote:
> > > On Thu, Aug 26, 2021 at 11:43:00AM -0700, Joe Perches wrote:
> > > > Several sysfs uses that could use %*ph are upper case hex output.
> > > > Add a flag to the short hex formatting routine in vsprintf to support them.
> > > > Add documentation too.
> > >
> > > Thanks!
> > >
> > > Unfortunately I have got only first patch and this cover letter. Can you,
> > > please, Cc entire series?
> > 
> > It's on lore.
> > 
> > https://lore.kernel.org/lkml/cover.1630003183.git.joe@perches.com/T/#u
> 
> Thanks. So, you won't me to review them in a regular way :-)
> 
> TBH, I think those examples may pretty much be safe to use small
> letters always.

I agree, let's just fix the users here to use small letters instead of
adding another modifier to the kernel.

thanks,

greg k-h
