Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D0A1841
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 11:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B178FC385A1;
	Wed, 20 Apr 2022 11:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650454948;
	bh=4NSnyqz75tNPvfHGUoYNFp112JPsPpBcSlPOZfBGfk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZmfwcSWrcyE5RhztphDyuLz//9KLILOB0OFIHI7YfYMIm7neobFDRUwORMzXiaWIY
	 lnYfy8t9aexv4hmzBsc3KhKyP8n/V0ZIH/ohQ//6b0IBXXKz9WjGIIyRnsM1opScl4
	 WK8T/mAmtpI0WOkk04/4B3r3zaiS3oTlFZ/zCBE4=
Date: Wed, 20 Apr 2022 13:42:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Message-ID: <Yl/xoWttIba3UdIM@kroah.com>
References: <PAXPR02MB7310E037FFE7E641C582F67381129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLolEqaRgZKawHl@kroah.com>
 <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLy5wHtdYZvUU8t@kroah.com>
 <PAXPR02MB73100E24FCE4E04B45F9285781129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjL4Y2l6oOabjmpX@kroah.com>
 <PAXPR02MB7310CEC795999B590704AF4181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <PAXPR02MB7310E609A200F01F77F2D2C381F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <Yl/tU5BDIPl9VuJw@kroah.com>
 <PAXPR02MB73103C308D5942977331A28881F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR02MB73103C308D5942977331A28881F59@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Wed, Apr 20, 2022 at 11:38:57AM +0000, Czerwacki, Eial wrote:
> >From: Greg KH <gregkh@linuxfoundation.org>
> >Sent: Wednesday, April 20, 2022 14:24
> >To: Czerwacki, Eial <eial.czerwacki@sap.com>
> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
> >Subject: Re: [RFC] staging/vSMP: new driver 
> > 
> >On Wed, Apr 20, 2022 at 11:18:15AM +0000, Czerwacki, Eial wrote:
> >> Greetings Greg,
> >> 
> >> >From: Czerwacki, Eial <eial.czerwacki@sap.com>
> >> >Sent: Thursday, March 17, 2022 11:04
> >> >To: Greg KH <gregkh@linuxfoundation.org>
> >> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
> >> >Subject: Re: [RFC] staging/vSMP: new driver 
> >> >
> >> >>On Thu, Mar 17, 2022 at 08:52:37AM +0000, Czerwacki, Eial wrote:
> >> >>> >> >What tasks?
> >> >>> >> support of other information bits like stats
> >> >>> >
> >> >>> >I have no idea what that means :)
> >> >>> in short, the hypervisor can provide stats it collects, future implementation will export that too
> >> >>
> >> >>The trick will be _how_ you export this information.  Let's wait on that
> >> >>one for now, your current api has lots of other questions to work out
> >> >>first :)
> >> >
> >> >sure, thanks for all the help.
> >> >
> >> >Eial
> >> 
> >> I was wondering, after I've switched the driver flow to the pci driver one, I lost the ability to prevent vsmp.ko from loading in case no device was found.
> >> is there a way do to so?
> >
> >No, that is not how drivers have worked since the 2.4 kernel days (i.e.
> >20 years ago?)  It is fine for your driver to be loaded even if there is
> >no device present.
> >
> >But, your driver will NOT be loaded automatically unless a device is
> >found, so why would it be present in that situation?
> >
> >thanks,
> >
> >greg k-h
> 
> because there are other modules which depends on it.

I do not understand the question.

> I guess I can detect it as part of the other module's init

Huh?

Try it and see, the linker will properly pull in the needed modules if
you have symbols in one module that are needed by another one.

But if that is the case, why split them up into different modules?

I do not understand the question really.  Try it and see first and if
you have specific problems, please post the code and we will be glad to
review it.

thanks,

greg k-h
