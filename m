Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743C23A1;
	Sun, 16 Oct 2022 15:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66CEC433C1;
	Sun, 16 Oct 2022 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665934918;
	bh=+4RVTTrbXN+/4vqERN49TufdDPKikKJhXlmgMKsWEa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW1hVPZRwRW6UK3mrJJuJqasNXV0IR0NECIEAanaRD2TVTXTPm4K2quhIRScFnvyD
	 nztnlhqv0E0AEoQY20/2wDgsc0alYVQfbSWdaLVRjeGK93AKQRT7mjHVOXRTLvQFT/
	 uEtiHeh+aeJmO5USr66hvm9ntpAVO3/LspBlDPCQ=
Date: Sun, 16 Oct 2022 17:40:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: loopback: enclose macro statements in
 do-while loop
Message-ID: <Y0wmC2oi0TOpvpPM@kroah.com>
References: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
 <alpine.DEB.2.22.394.2210161649400.2876@hadrien>
 <Y0wdDTUBrUT/cr9w@lion2204>
 <alpine.DEB.2.22.394.2210161709440.2876@hadrien>
 <Y0wi4itS3d8aExFc@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0wi4itS3d8aExFc@debian-BULLSEYE-live-builder-AMD64>

On Sun, Oct 16, 2022 at 11:27:30AM -0400, Deepak R Varma wrote:
> On Sun, Oct 16, 2022 at 05:10:17PM +0200, Julia Lawall wrote:
> >
> >
> > On Sun, 16 Oct 2022, Deepak R Varma wrote:
> >
> > > On Sun, Oct 16, 2022 at 04:51:09PM +0200, Julia Lawall wrote:
> > > >
> > > >
> > > > On Sun, 16 Oct 2022, Deepak R Varma wrote:
> > > >
> > > > > Include multiple statements of macro definition inside do-while{0} loop
> > > > > to avoid possible partial program execution. Issue reported by
> > > > > checkpatch script:
> > > > >
> > > > > ERROR: Macros with multiple statements should be enclosed in a do - while loop
> > > >
> > > > I don't think this change will compile.  See if you can figure out why
> > > > not.
> > >
> > > It did compile. I built the greybus driver and loaded it as well with the
> > > modinfo tool. Can you please tell why you think it won't compile?
> >
> > Do you have a .o file for the .c file that you changed?
> 
> I see many .o files and a greybus.ko as well, but not the loopback.o
> Am I missing anything with my configuration? I did set Greybus Support to (M) in
> the menuconfig.

CONFIG_GREYBUS_LOOPBACK has to be enabled in order to build the
drivers/staging/greybus/loopback.c file.

A simple check would be to do:
	make drivers/staging/greybus/loopback.o

does that work with your change?

thanks,

greg k-h
