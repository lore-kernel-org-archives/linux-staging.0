Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B129372
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 09:48:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB052610C8;
	Thu, 26 Aug 2021 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629971334;
	bh=pws6yEMx5CQmxG0eSLGORmnzzlW+g+uW697IABxaYho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdiKDdJQaCgiI+CuSLchYjZxNEa5AFlK4fqD9UCqMy1HSYmaTE87blVHY7l6HTO5I
	 extVD7JjuSCJDW820nlPC1cGFaEdbMGv370LCEfvarOynGK4wb5S39qkxldtkG+dsl
	 oadM1CysowNN7XicGgQ5u6mznotOleCtDntyr9xc=
Date: Thu, 26 Aug 2021 11:48:50 +0200
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
Message-ID: <YSdjgnUwt76cknQ6@kroah.com>
References: <20210826092854.58694-1-woodylin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826092854.58694-1-woodylin@google.com>

On Thu, Aug 26, 2021 at 05:28:54PM +0800, Woody Lin wrote:
> Add char device driver 'userpanic-dev' that exposes an interface to
> userspace processes to request a system panic with customized panic
> message.
> 
> Signed-off-by: Woody Lin <woodylin@google.com>
> ---
>  drivers/staging/android/Kconfig         |  12 +++
>  drivers/staging/android/Makefile        |   1 +
>  drivers/staging/android/userpanic-dev.c | 110 ++++++++++++++++++++++++

Why is this in staging?  What is wrong with it that it can not just go
into the real part of the kernel?  A TODO file is needed explaining what
needs to be done here in order for it to be accepted.

But why is this really needed at all?  Why would userspace want to panic
the kernel in yet-another-way?

thanks,

greg k-h
