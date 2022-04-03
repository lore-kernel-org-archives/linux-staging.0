Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F349A7C;
	Sun,  3 Apr 2022 11:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64351C340F0;
	Sun,  3 Apr 2022 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648983946;
	bh=tNVwT/q3PJXvzpsVpXOF5IQfYuQeNb4rj36DibYNmlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DbFkpC0c1ShrEEJpJMHS7tg9b//XrfGBo5CNZrB77oNn/QMboH7avLl4xFP56zZhq
	 30oUpVqRNcX93FPWXTzeoZ1YhFP04nDppjvXEHCCF9owUe8PpuRs7I/ZqkhcVQqUIe
	 P5bgLLPL3U22wHX7ZYsmhCUkYFt7/kCID0vpFJos=
Date: Sun, 3 Apr 2022 13:05:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bruno <codeagain@codeagain.dev>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: vme: Adjusted VME_USER in Kconfig
Message-ID: <Ykl/iBR+pDaaLImA@kroah.com>
References: <20220401050045.3686663-1-codeagain@codeagain.dev>
 <YkaW0ThT8Ah3z0wW@kroah.com>
 <YkaXRpIElW1BwKGb@kroah.com>
 <37e5203d1efd310ea82cf91c18c6a07eea743ac7.camel@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37e5203d1efd310ea82cf91c18c6a07eea743ac7.camel@codeagain.dev>

You sent this twice?

Anyway...

On Fri, Apr 01, 2022 at 03:21:50PM -0300, Bruno wrote:
> With my tests in my, I have found two other things that I think are
> remarkable to mention. First one is a missing `depends on` line for
> `VME_BRIDGE` in drivers/staging/vme/devices/Kconfig, not visible
> because they were in the same tree, but now unveiled. I'm fixing it,
> do you think it's best to add it in the same patch?

Make that a second patch, and resend it as part of a patch series since
your first patch here is gone from my queue.

> Finally, not directly related with the patch, yet remarkable, I
> happened to notice something. When probing the vme_user module
> (compiled with CONFIG_VME_USER=m), I naturally get the following
> messages on my log and command output for `modprobe vme_user`:
> | [177666.590400] vme_user: module is from the staging directory, the
> quality is unknown, you have been warned.

That is expected.

> While this is completely expected, the message about the code from
> staging directory does not appear when compiled with
> CONFIG_VME_USER=y, as shows a `grep -i vme` on the console log:

That is because you built the driver into the tree, so there is nothing
to cause the taint code to run as there is no module loader involved.

It's expected and works the same for all staging drivers.  Try it
yourself with a different one to verify this.

> | [0.000000] Linux version 5.17.0lsa-t-vme_user=y-13483-gfeb94431c35c-
> dirty (bruno@AN5Bruno) (gcc (GCC) 11.2.0, GNU ld (GNU Binutils) 2.38)
> #7 SMP PREEMPT_DYNAMIC Fri Apr 1 14:33:16 -03 2022
> | [1.974450] vme_user: VME User Space Access Driver
> | [ 1.975405] vme_user: No cards, skipping registration
> 
> Do you think it would be interesting for a future patch to provide
> some output when drivers from the staging tree are present in the
> running kernel image?

If you can figure out how to do so, that would be interesting to see.

thanks,

greg k-h
