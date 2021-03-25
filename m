Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A6F5F
	for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 14:52:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BB77619FC;
	Thu, 25 Mar 2021 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616683955;
	bh=ANaYj3ch1gtGahdxMwsKFrqXT9ozTgZoAdbtYKveX4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuBq+Pboh8ELbtdKroOFreFMOcms+2OVhrdOE6KnCV59LEbH6uxVO/JCBCdpiFc2Q
	 nsAdBF0XSzP1mbrgNb+anznpQNLL96NSJ3bNY2V+Gfkh8MdNTUuZAaE1aCyreTKeJk
	 yCL232OPaON/QglO54yCoVGJQemmYrsKbd/UojV8=
Date: Thu, 25 Mar 2021 15:52:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Rob Springer <rspringer@google.com>,
	Todd Poynor <toddpoynor@google.com>,
	Ben Chan <benchan@chromium.org>, Richard Yeh <rcy@google.com>,
	linux-staging@lists.linux.dev, devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gasket: remove it from the kernel
Message-ID: <YFyjsAtilH+3fggx@kroah.com>
References: <20210315154413.3084149-1-gregkh@linuxfoundation.org>
 <CALTjKEP_+uBU8K-=Cnose8wCv9Wrv8oFnKfRUywLEHV4U_jWjQ@mail.gmail.com>
 <30ee6d6b-9206-acad-b224-591fdeb0dad7@siemens.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30ee6d6b-9206-acad-b224-591fdeb0dad7@siemens.com>

On Thu, Mar 25, 2021 at 03:46:10PM +0100, Jan Kiszka wrote:
> On 15.03.21 17:10, Rob Springer wrote:
> > Acked-by: Rob Springer <rspringer@google.com>
> > 
> > 
> > On Mon, Mar 15, 2021 at 8:44 AM <gregkh@linuxfoundation.org> wrote:
> >>
> >> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>
> >> As none of the proposed things that need to be changed in the gasket
> >> drivers have ever been done, and there has not been any forward progress
> >> to get this out of staging, it seems totally abandonded so remove the
> >> code entirely so that people do not spend their time doing tiny cleanups
> >> for code that will never get out of staging.
> >>
> >> If this code is actually being used, it can be reverted simply and then
> >> cleaned up properly, but as it is abandoned, let's just get rid of it.
> >>
> >> Cc: Rob Springer <rspringer@google.com>
> >> Cc: Todd Poynor <toddpoynor@google.com>
> >> Cc: Ben Chan <benchan@chromium.org>
> >> Cc: Richard Yeh <rcy@google.com>
> >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> OK, so is there a plan of the HW vendor to improve the user experience
> for this hardware? Is there a different software architecture in sight
> which will not need a kernel driver?

What hardware vendor makes this thing?  What systems require it?  And
why can't you use UIO instead?

> Just wondering loudly while fiddling with dkms packages and starring at
> the code diffs between what was removed here and what I still have to
> install manually from remote sources.

Where are the remote sources for this thing and why didn't they ever get
synced into the kernel tree?

thanks,

greg k-h
