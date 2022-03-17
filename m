Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9CE369B
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 08:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A82C340E9;
	Thu, 17 Mar 2022 08:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647506155;
	bh=tFObloEApOpbVJhBLJ6aU2o8fMFKxyKlWpdsDyjEtls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AqKugbOl7cXxMSKRVJ1vOHaFj6bBfGi1L05Mimzf6TJp1N3oF9DhD37j8LOywcT59
	 WoDwbSpjC1+fBfw2LKkg+bMMsEX+nSDQ//y/bQ38rwS3wspqGq1p3XjLdqBubnjUwd
	 bNCBjGx9dGXcXk75YsbafZMsNSjNaZdFeyuHz2fo=
Date: Thu, 17 Mar 2022 09:35:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Message-ID: <YjLy5wHtdYZvUU8t@kroah.com>
References: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLiC82wSBO1oUIq@kroah.com>
 <PAXPR02MB7310E037FFE7E641C582F67381129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLolEqaRgZKawHl@kroah.com>
 <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Thu, Mar 17, 2022 at 08:17:04AM +0000, Czerwacki, Eial wrote:
> Greetings Greg,
> 
> >On Thu, Mar 17, 2022 at 07:34:30AM +0000, Czerwacki, Eial wrote:
> >> Greetings Greg,
> >> 
> >> >On Wed, Mar 16, 2022 at 06:13:04PM +0000, Czerwacki, Eial wrote:
> >> >> Introducing the vSMP guest driver which allows interaction with the vSMP control device when
> >> >> running a Linux OS atop of the vSMP hypervisor.
> >> >> vSMP is a resource aggregation hypervisor from SAP.
> >> >> 
> >> >> the driver comprises of 3 modules, vsmp which includes all the api needed to interact with the
> >> >> control driver, vsmp_logs which allows reading logs from the hypervisor and vsmp_common_info which
> >> >> allows reading generic information the hypervisor exposes, currently only the version is exposed.
> >> >
> >> >Please wrap changelog text at 72 columns, like git asks you to.
> >> git didn't asked me to do so, I'll fix it in the next iteration.
> >> 
> >> >
> >> >Also, why did you not cc: the staging maintainer?  :(
> >> I've probably missed that when I was going over the docs, my bad.
> >> 
> >> >
> >> >> Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>
> >> >> ---
> >> >>  MAINTAINERS                             |   6 +
> >> >>  drivers/staging/Kconfig                 |   2 +
> >> >>  drivers/staging/Makefile                |   1 +
> >> >>  drivers/staging/vsmp/Kconfig            |  14 +
> >> >>  drivers/staging/vsmp/Makefile           |   7 +
> >> >>  drivers/staging/vsmp/api.c              | 402 ++++++++++++++++++++++++
> >> >>  drivers/staging/vsmp/api.h              |  61 ++++
> >> >>  drivers/staging/vsmp/common/Kconfig     |  11 +
> >> >>  drivers/staging/vsmp/common/Makefile    |   7 +
> >> >>  drivers/staging/vsmp/common/common.c    |  64 ++++
> >> >>  drivers/staging/vsmp/common/common.h    |  27 ++
> >> >>  drivers/staging/vsmp/common/version.c   |  85 +++++
> >> >>  drivers/staging/vsmp/logs/Kconfig       |  10 +
> >> >>  drivers/staging/vsmp/logs/Makefile      |   7 +
> >> >>  drivers/staging/vsmp/logs/active_logs.c | 112 +++++++
> >> >>  drivers/staging/vsmp/registers.h        |  16 +
> >> >
> >> >Without looking at the code, I do not see a TODO file here that lists
> >> >the tasks that need to be completed to get this out of the
> >> >drivers/staging/ directory.  This is a requirement.
> >> there are tasks to complete it however I'm not sure they are blockers.
> >
> >What tasks?
> support of other information bits like stats

I have no idea what that means :)

> >> >Also, why is this submitted for drivers/staging/ ?  What prevents it
> >> >from being merged to the "correct" place in the kernel tree today?
> >> afaiu, the correct order for new drivers is staging => mainline.
> >
> >No, not at all.  This is the "hard way" to get drivers merged.  I would
> >never recommend doing it this way for anyone as it will take more time
> >and effort than just doing it the correct way the first time.
> I understand, thanks for clearing it up
> 
> >
> >> in addition, from past experience with the main kernel mailing list, I
> >> thought the driver will get more traction here than in the main kernel
> >> mailing list.  unless there is a specific mailing list for drivers
> >> beside the staging tree one
> >
> >There are zillions of subsystem mailing lists out there.  Always target
> >the specific one you are interested in.  For this code, it should live
> >in drivers/virt/ right?  Ah, no mailing list specific for that one, but
> >I usually am the one that merges the code in there, so cc: me and Arnd
> >and lkml and we can go from there!
> drivers/virt looks like the correct place, so I need to send it as [PATCH] to the lkml with Arnd and yourself in the CC of the mail?

Yes please!

> >Also, you have a bunch of sysfs files, all of those need to be
> >documented in Documentation/ABI/ entries as you will see if you run
> >scripts/get_abi.pl with your driver loaded.
> will do.
> 
> >
> >Also, rip out the old-school PCI bus scanning stuff.  That hasn't been
> >needed since the 2.4 kernel days :)
> can you point me to a doc that states how I can retrieve the dev struct of the device in question?

The device in question is passed to you in your pci probe function
callback.  You do NOT allow any random PCI device number to be passed as
a module parameter, as that way lies madness.

If you MUST allow userspace to bind a specific PCI device to your
driver, then use the sysfs "bind" file that the driver core provides to
you.  Then the normal pci probe callback will be called and all is good.

In short, your driver is doing a lot of extra work that it doesn't need
to do at all, just remove all of that code.

thanks,

greg k-h
