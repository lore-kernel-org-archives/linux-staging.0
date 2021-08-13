Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76368168
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 15:00:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8564C61042;
	Fri, 13 Aug 2021 15:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628866834;
	bh=I1FekdfmiRJknOkcQKVglzJj1Ot+dwBi5XK4Uv4qoLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fuY6lYyOpl7hDr0+1ihFss0W58HDyFd8HTcmfb6hCWldAsyNOZKLP6QDAubN5Ho30
	 td0c9NzbhV791kLwVF6DHPULiHtRnJvQaECbafz7hKPIDiVcneNG5cn9fCumnYXiSs
	 4gEgVbzkauaN+75E0Uq+qBMctxTS74Qaem0aZfoc=
Date: Fri, 13 Aug 2021 17:00:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Graute <oliver.graute@kococonnector.com>
Cc: Carlis <zhangxuezhi1@yulong.com>, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] fbtft: fb_st7789v: added reset on init_display()
Message-ID: <YRaJDyYquuklht6C@kroah.com>
References: <20210813062511.14537-1-oliver.graute@kococonnector.com>
 <YRYrPfEHrcvDL4va@kroah.com>
 <20210813125430.GA1527@optiplex>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813125430.GA1527@optiplex>

On Fri, Aug 13, 2021 at 02:54:30PM +0200, Oliver Graute wrote:
> On 13/08/21, Greg KH wrote:
> > On Fri, Aug 13, 2021 at 08:25:10AM +0200, Oliver Graute wrote:
> > > staging: fbtft: fb_st7789v: reset display before initialization
> > 
> > What is this line here, and why is this not your subject line instead?
> 
> I'll put the line as subject instead.
> 
> > > In rare cases the display is flipped or mirrored. This was observed more
> > > often in a low temperature environment. A clean reset on init_display()
> > > should help to get registers in a sane state.
> > > 
> > > Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> > 
> > What commit does this fix?
> 
> this is a fix for a rare behavior of the fb_st7789v display. Not a
> bugfix for a specific commit.

So if it has always been broken, list the commit where the code was
added to the kernel, as this should be backported to the stable kernels,
right?

thanks,

greg k-h
