Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0A13FC2
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:54:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A207160FC1;
	Thu, 26 Aug 2021 10:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629975258;
	bh=3COvzkeM/l1x3SVib6kbANwKzq1rzz8/bNWnK5LJTh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjjbqPrErjAAwn/gK0egjwHkX1sjV9lqg3PgbElLuWvQZ/vtg3onfAeeqjepK+Jwk
	 IxkzDexi1m+XzGInKdti3lY4O1igyftWtPppa4u2dZHvFNwFDfrJn8jKu4lLLiLY3w
	 UoQwkqbfKGIxIWM+dcHdUv635O9ta7UMdSCEmbgU=
Date: Thu, 26 Aug 2021 12:54:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Woody Lin <woodylin@google.com>
Cc: Todd Kjos <tkjos@android.com>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <christian@brauner.io>,
	Hridya Valsaraju <hridya@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] ANDROID: staging: add userpanic-dev driver
Message-ID: <YSdy1pAS1hkLVEH9@kroah.com>
References: <20210826092854.58694-1-woodylin@google.com>
 <YSdjgnUwt76cknQ6@kroah.com>
 <CAHn4Deczc6gSSsxys6UeAMB99p1jHMZmLFj+KwZ2QhH7dx8E8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHn4Deczc6gSSsxys6UeAMB99p1jHMZmLFj+KwZ2QhH7dx8E8w@mail.gmail.com>

On Thu, Aug 26, 2021 at 06:23:53PM +0800, Woody Lin wrote:
> On Thu, Aug 26, 2021 at 5:48 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Aug 26, 2021 at 05:28:54PM +0800, Woody Lin wrote:
> > > Add char device driver 'userpanic-dev' that exposes an interface to
> > > userspace processes to request a system panic with customized panic
> > > message.
> > >
> > > Signed-off-by: Woody Lin <woodylin@google.com>
> > > ---
> > >  drivers/staging/android/Kconfig         |  12 +++
> > >  drivers/staging/android/Makefile        |   1 +
> > >  drivers/staging/android/userpanic-dev.c | 110 ++++++++++++++++++++++++
> >
> > Why is this in staging?  What is wrong with it that it can not just go
> > into the real part of the kernel?  A TODO file is needed explaining what
> > needs to be done here in order for it to be accepted.
> 
> Got it. No more TODO for this driver and I will move it to drivers/android/.
> 
> >
> > But why is this really needed at all?  Why would userspace want to panic
> > the kernel in yet-another-way?
> 
> The idea is to panic the kernel with a panic message specified by the userspace
> process requesting the panic. Without this the panic handler can only collect
> panic message "sysrq triggered crash" for a panic triggered by user processes.
> Using this driver, user processes can put an informative description -
> process name,
> reason ...etc. - to the panic message.

What custom userspace tool is going to use this new user/kernel api and
again, why is it needed?  Who needs to panic the kernel with a custom
message and where is that used?

thanks,

greg k-h
