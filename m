Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2241373
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 11:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EDDC385A1;
	Wed, 20 Apr 2022 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650453847;
	bh=fJpmxkCLvdCXuGogptXUUbt1bPMwKBxSAoanwzD9n2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z5hovpcvNioXVjhgv96JrIpL6NWRVHgMDyDa7uEhHK4OdXYo0qpSj+tDnm05YGtKJ
	 HtzQoSvd5yTIXhees4N6wFRWOiawjutw58rrRD/C+7FoOQIUpwSVm3EveCaTUdpgdm
	 TAbcBDfMhgJcIm8q7BgQNt+Tor8XqZnJF8EMx4tE=
Date: Wed, 20 Apr 2022 13:24:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Message-ID: <Yl/tU5BDIPl9VuJw@kroah.com>
References: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLiC82wSBO1oUIq@kroah.com>
 <PAXPR02MB7310E037FFE7E641C582F67381129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLolEqaRgZKawHl@kroah.com>
 <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLy5wHtdYZvUU8t@kroah.com>
 <PAXPR02MB73100E24FCE4E04B45F9285781129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjL4Y2l6oOabjmpX@kroah.com>
 <PAXPR02MB7310CEC795999B590704AF4181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <PAXPR02MB7310E609A200F01F77F2D2C381F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR02MB7310E609A200F01F77F2D2C381F59@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Wed, Apr 20, 2022 at 11:18:15AM +0000, Czerwacki, Eial wrote:
> Greetings Greg,
> 
> >From: Czerwacki, Eial <eial.czerwacki@sap.com>
> >Sent: Thursday, March 17, 2022 11:04
> >To: Greg KH <gregkh@linuxfoundation.org>
> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
> >Subject: Re: [RFC] staging/vSMP: new driver 
> >
> >>On Thu, Mar 17, 2022 at 08:52:37AM +0000, Czerwacki, Eial wrote:
> >>> >> >What tasks?
> >>> >> support of other information bits like stats
> >>> >
> >>> >I have no idea what that means :)
> >>> in short, the hypervisor can provide stats it collects, future implementation will export that too
> >>
> >>The trick will be _how_ you export this information.  Let's wait on that
> >>one for now, your current api has lots of other questions to work out
> >>first :)
> >
> >sure, thanks for all the help.
> >
> >Eial
> 
> I was wondering, after I've switched the driver flow to the pci driver one, I lost the ability to prevent vsmp.ko from loading in case no device was found.
> is there a way do to so?

No, that is not how drivers have worked since the 2.4 kernel days (i.e.
20 years ago?)  It is fine for your driver to be loaded even if there is
no device present.

But, your driver will NOT be loaded automatically unless a device is
found, so why would it be present in that situation?

thanks,

greg k-h
