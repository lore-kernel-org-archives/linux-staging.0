Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFFE184A
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 14:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6574BC385A0;
	Wed, 20 Apr 2022 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650464655;
	bh=eAVDAFxf8HM5+CN1ahFormwSLOTCRn3/ZAPfBK/QfRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=joxjLbIHda9xLoK+yU5hopqfL2xtt+27KXqHtSQQridOKCWC+fy3AOnqlekVdMhPj
	 06HqEsjjcF5OMn9vr6NzKBzHpTAMlwEUPKMKTu2aLHMDdpWjhLBs9oZNdQXAvIVuA3
	 UNjC2g9bwGs/jKZaZGvCYTboggnSKLnbzYwa/RZY=
Date: Wed, 20 Apr 2022 16:24:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Message-ID: <YmAXjG4jxdpTREB2@kroah.com>
References: <PAXPR02MB73100E24FCE4E04B45F9285781129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjL4Y2l6oOabjmpX@kroah.com>
 <PAXPR02MB7310CEC795999B590704AF4181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <PAXPR02MB7310E609A200F01F77F2D2C381F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <Yl/tU5BDIPl9VuJw@kroah.com>
 <PAXPR02MB73103C308D5942977331A28881F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <Yl/xoWttIba3UdIM@kroah.com>
 <PAXPR02MB7310F3F8129ECA908C3A0B4E81F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <Yl/54NGq70g1QuQq@kroah.com>
 <PAXPR02MB73104582322690E1D95D1A8D81F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB73104582322690E1D95D1A8D81F59@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Wed, Apr 20, 2022 at 12:36:04PM +0000, Czerwacki, Eial wrote:
> >From: Greg KH <gregkh@linuxfoundation.org>
> >Sent: Wednesday, April 20, 2022 15:17
> >To: Czerwacki, Eial <eial.czerwacki@sap.com>
> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
> >Subject: Re: [RFC] staging/vSMP: new driver 
> > 
> >On Wed, Apr 20, 2022 at 11:57:51AM +0000, Czerwacki, Eial wrote:
> >> >From: Greg KH <gregkh@linuxfoundation.org>
> >> >Sent: Wednesday, April 20, 2022 14:42
> >> >To: Czerwacki, Eial <eial.czerwacki@sap.com>
> >> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
> >> >Subject: Re: [RFC] staging/vSMP: new driver 
> >> > 
> >> >On Wed, Apr 20, 2022 at 11:38:57AM +0000, Czerwacki, Eial wrote:
> >> >> >From: Greg KH <gregkh@linuxfoundation.org>
> >> >> >Sent: Wednesday, April 20, 2022 14:24
> >> >> >To: Czerwacki, Eial <eial.czerwacki@sap.com>
> >> >> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
> >> >> >Subject: Re: [RFC] staging/vSMP: new driver 
> >> >> > 
> >> >> >On Wed, Apr 20, 2022 at 11:18:15AM +0000, Czerwacki, Eial wrote:
> >> >> >> Greetings Greg,
> >> >> >> 
> >> >> >> >From: Czerwacki, Eial <eial.czerwacki@sap.com>
> >> >> >> >Sent: Thursday, March 17, 2022 11:04
> >> >> >> >To: Greg KH <gregkh@linuxfoundation.org>
> >> >> >> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
> >> >> >> >Subject: Re: [RFC] staging/vSMP: new driver 
> >> >> >> >
> >> >> >> >>On Thu, Mar 17, 2022 at 08:52:37AM +0000, Czerwacki, Eial wrote:
> >> >> >> >>> >> >What tasks?
> >> >> >> >>> >> support of other information bits like stats
> >> >> >> >>> >
> >> >> >> >>> >I have no idea what that means :)
> >> >> >> >>> in short, the hypervisor can provide stats it collects, future implementation will export that too
> >> >> >> >>
> >> >> >> >>The trick will be _how_ you export this information.  Let's wait on that
> >> >> >> >>one for now, your current api has lots of other questions to work out
> >> >> >> >>first :)
> >> >> >> >
> >> >> >> >sure, thanks for all the help.
> >> >> >> >
> >> >> >> >Eial
> >> >> >> 
> >> >> >> I was wondering, after I've switched the driver flow to the pci driver one, I lost the ability to prevent vsmp.ko from loading in case no device was found.
> >> >> >> is there a way do to so?
> >> >> >
> >> >> >No, that is not how drivers have worked since the 2.4 kernel days (i.e.
> >> >> >20 years ago?)  It is fine for your driver to be loaded even if there is
> >> >> >no device present.
> >> >> >
> >> >> >But, your driver will NOT be loaded automatically unless a device is
> >> >> >found, so why would it be present in that situation?
> >> >> >
> >> >> >thanks,
> >> >> >
> >> >> >greg k-h
> >> >> 
> >> >> because there are other modules which depends on it.
> >> >
> >> >I do not understand the question.
> >> >
> >> >> I guess I can detect it as part of the other module's init
> >> >
> >> >Huh?
> >> >
> >> >Try it and see, the linker will properly pull in the needed modules if
> >> >you have symbols in one module that are needed by another one.
> >> nothing prevents a user from loading the modules even if the device is missing.
> >> the driver's hierarchy is one api modules and two unrelated modules which depend on it.
> >> running modprobe vsmp_logs on a system where the device doesn't exists results with a kernel trace.
> >
> >What exact "kernel trace" is emitted?
> accessing the bar of an non existent device.

Which is impossible to do if your driver is written properly.

> thinking of it now, the api should return error in case the mapped region is not inited.

No, your code will just not be called if the device is not present.

> >> obliviously, this is not something accepted by the community.
> >
> >I do not understand what is not acceptable?
> a module crashing because a missing invariant testing
> 
> >
> >> >
> >> >But if that is the case, why split them up into different modules?
> >> splitting the driver into three modules is purely for flexibility reasons.
> >
> >Flexible for whom?
> the end user

How?

> >> e.g. on runtime a user can decide which parts of the driver to run
> >
> >How?  And why?  A kernel driver should "just work" no need to configure
> >anything or only load, or not load, a specific set of drivers.  That's
> >not how kernel modules work at all.
> that is why I think I should merge all the modules into one
> 
> >
> >> >
> >> >I do not understand the question really.  Try it and see first and if
> >> >you have specific problems, please post the code and we will be glad to
> >> >review it.
> >> maybe I just need to forgo the flexibility and add all features as a built-in which isn't configurable
> >
> >What exact "flexibility" are you trying to do here?
> per feature flexibility, for example, the ability to read logs via the device and display generic information
> each one is encapsulated inside a different module
> 
> >
> >And again, nothing should be configured, it should always "just work" if
> >the needed hardware is present.  If not, nothing should happen.
> >
> >Again, post your code for better answers, this is all just
> >hand-waving...
> I understand, I'd prefer to understand all the aspects of the issues I'm facing before I load more code for you to go through as I assume that your time is precious

Yes, and as such, you should submit code so that we can talk about this
with concrete examples instead of unknown vague questions.

Please just redo the patches based on the review and resubmit.

thanks,

greg k-h
