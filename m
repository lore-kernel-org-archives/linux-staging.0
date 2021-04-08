Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CA66D0D
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 07:28:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B911560FF1;
	Thu,  8 Apr 2021 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617866889;
	bh=gcJhxO7zG1UWVPzhBXJ9hDMruGendR5CYueJVXAxcoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wh2R21NzLJ1GMVWoZlOR6+9g/gTbhkjUHJwwdvCfOZfmxBFst5286vBCuvkLa/mfK
	 nt+fq/yR5kz2V+dIEXHT6DRYDYg9yjnC5S6M0oHzZSxMYwDEoxYj6ziResxkzhVIbN
	 kT/5BLCueaVE090xtPPinl7wFLLC+TsS4YUe3OqA=
Date: Thu, 8 Apr 2021 09:27:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-staging@lists.linux.dev,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
Message-ID: <YG6wZ3roO76kgmbH@kroah.com>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com>
 <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <YG3rUN0fvyA6HCpf@kroah.com>
 <31138c5e-9272-fc05-2c79-234101f8d5dd@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31138c5e-9272-fc05-2c79-234101f8d5dd@mev.co.uk>

On Wed, Apr 07, 2021 at 07:20:45PM +0100, Ian Abbott wrote:
> On 07/04/2021 18:26, Greg Kroah-Hartman wrote:
> > On Wed, Apr 07, 2021 at 04:39:25PM +0100, Ian Abbott wrote:
> > > On 07/04/2021 16:10, Greg Kroah-Hartman wrote:
> > > > On Wed, Apr 07, 2021 at 03:01:37PM +0100, Ian Abbott wrote:
> > > > > The code under "drivers/staging/comedi/drivers/tests/" is built when the
> > > > > CONFIG_COMEDI_TESTS option is enabled.  That currently needs to be done
> > > > > on the "make" command line since the option does not appear in the
> > > > > Kconfig files.
> > > > > 
> > > > > This patch series fixes a compilation error and various other niggles
> > > > > including checkpatch.pl stuff.
> > > > > 
> > > > > 1) staging: comedi: tests: ni_routes_test: Fix compilation error
> > > > > 2) staging: comedi: tests: ni_routes_test: Put complex values in parentheses
> > > > > 3) staging: comedi: tests: ni_routes_test: Avoid CamelCase: <RVi>
> > > > > 4) staging: comedi: tests: ni_routes_test: Lines should not end with a '('
> > > > > 5) staging: comedi: tests: Correct unittest_fptr
> > > > 
> > > > Should we move these to the normal kernel testing directory instead, so
> > > > that they do get some build testing?
> > > 
> > > I'm not sure since they are in "drivers/staging".  However, we could add
> > > something to comedi's Kconfig to allow the tests to be built.
> > 
> > We need to get the comedi code out of staging, I really don't think
> > there is any need to keep it in here anymore, do you?  I'll try to carve
> > some time next week to look at the code and if I can't find anything
> > left to do, start moving it out.
> 
> What do you mean - it's only been in staging for 12 and a half years! :-)

Yeah, it's about time :)
