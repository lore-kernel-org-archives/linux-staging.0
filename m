Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905AB7A
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 07:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CA5C340EC;
	Thu, 17 Mar 2022 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647503558;
	bh=OL8OrlSScfrDStw2fOrQwAyTowg3Pyni7oYdVnzOErE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F4WUKjAu2g6SIAQZcMkLzAIkEVbP/JXP/bIIQluP/LgJPqWv9vC4HEcSD9ZcV7qu+
	 jSSZHAxnS+mILYR58nG8R2xp8lmmvyoxorDJzZtAZGRGqaC/uezERUs9SIpc+I4/8Z
	 riqptY/+Apn0mYD+NNzpQuJ8HUxf1SD/grZswK9Q=
Date: Thu, 17 Mar 2022 08:52:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Message-ID: <YjLow39rzMmL/qmD@kroah.com>
References: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLiMzVvbLgrePlq@kroah.com>
 <PAXPR02MB7310426E4B8329062656D8A681129@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB7310426E4B8329062656D8A681129@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Thu, Mar 17, 2022 at 07:38:28AM +0000, Czerwacki, Eial wrote:
> Greetings Greg,
> 
> >On Wed, Mar 16, 2022 at 06:13:04PM +0000, Czerwacki, Eial wrote:
> >> Introducing the vSMP guest driver which allows interaction with the vSMP control device when
> >> running a Linux OS atop of the vSMP hypervisor.
> >> vSMP is a resource aggregation hypervisor from SAP.
> >> 
> >> the driver comprises of 3 modules, vsmp which includes all the api needed to interact with the
> >> control driver, vsmp_logs which allows reading logs from the hypervisor and vsmp_common_info which
> >> allows reading generic information the hypervisor exposes, currently only the version is exposed.
> >> 
> >> Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>
> >> ---
> >>  MAINTAINERS                             |   6 +
> >>  drivers/staging/Kconfig                 |   2 +
> >>  drivers/staging/Makefile                |   1 +
> >>  drivers/staging/vsmp/Kconfig            |  14 +
> >>  drivers/staging/vsmp/Makefile           |   7 +
> >>  drivers/staging/vsmp/api.c              | 402 ++++++++++++++++++++++++
> >>  drivers/staging/vsmp/api.h              |  61 ++++
> >>  drivers/staging/vsmp/common/Kconfig     |  11 +
> >>  drivers/staging/vsmp/common/Makefile    |   7 +
> >>  drivers/staging/vsmp/common/common.c    |  64 ++++
> >>  drivers/staging/vsmp/common/common.h    |  27 ++
> >>  drivers/staging/vsmp/common/version.c   |  85 +++++
> >>  drivers/staging/vsmp/logs/Kconfig       |  10 +
> >>  drivers/staging/vsmp/logs/Makefile      |   7 +
> >>  drivers/staging/vsmp/logs/active_logs.c | 112 +++++++
> >>  drivers/staging/vsmp/registers.h        |  16 +
> >>  16 files changed, 832 insertions(+)
> >
> >800 lines of code turn into 3 modules?  Why isn't this just one module?
> >Why split them at all?
> >
> 
> imho it is more flexible, if a developer needs only the api part but wants the ability to read only the logs, he can do so without the need to have the module up
> if you think that merging it to one will increase the changes the driver will be merged to head soon, I'll merge them to one module

I do not know, as I do not know what the code does (didn't really look
at it.)

Leave it as-is for now, we can review it properly in future submissions,
you have bigger issues to fix up first :)

thanks,

greg k-h
