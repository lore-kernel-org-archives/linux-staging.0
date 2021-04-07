Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF66D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 17:26:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A175A61284;
	Wed,  7 Apr 2021 17:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617816403;
	bh=ylCJGk3sOjb2qaJMWyB0ZFcJoJ7NBgRasMpGZp2oYGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jIWxXAzjcrzRHzuIRFxaZtlB7BpGzm60VngWMPFt1PZRxgvpdeD71pPORp4e/Nmqw
	 rtgpPMAKCrV0KBsBnPgM4c6UEayKbWAHTai+JZ41BDcc7JBrwWGRpfdWmbUE+nnVbV
	 l7YWc0ABF1rTFxWtxYELUzuDKBcuZN6TI70NFCrs=
Date: Wed, 7 Apr 2021 19:26:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-staging@lists.linux.dev,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
Message-ID: <YG3rUN0fvyA6HCpf@kroah.com>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com>
 <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>

On Wed, Apr 07, 2021 at 04:39:25PM +0100, Ian Abbott wrote:
> On 07/04/2021 16:10, Greg Kroah-Hartman wrote:
> > On Wed, Apr 07, 2021 at 03:01:37PM +0100, Ian Abbott wrote:
> > > The code under "drivers/staging/comedi/drivers/tests/" is built when the
> > > CONFIG_COMEDI_TESTS option is enabled.  That currently needs to be done
> > > on the "make" command line since the option does not appear in the
> > > Kconfig files.
> > > 
> > > This patch series fixes a compilation error and various other niggles
> > > including checkpatch.pl stuff.
> > > 
> > > 1) staging: comedi: tests: ni_routes_test: Fix compilation error
> > > 2) staging: comedi: tests: ni_routes_test: Put complex values in parentheses
> > > 3) staging: comedi: tests: ni_routes_test: Avoid CamelCase: <RVi>
> > > 4) staging: comedi: tests: ni_routes_test: Lines should not end with a '('
> > > 5) staging: comedi: tests: Correct unittest_fptr
> > 
> > Should we move these to the normal kernel testing directory instead, so
> > that they do get some build testing?
> 
> I'm not sure since they are in "drivers/staging".  However, we could add
> something to comedi's Kconfig to allow the tests to be built.

We need to get the comedi code out of staging, I really don't think
there is any need to keep it in here anymore, do you?  I'll try to carve
some time next week to look at the code and if I can't find anything
left to do, start moving it out.

thanks,

greg k-h
