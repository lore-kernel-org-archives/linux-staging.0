Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532C37B
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 12:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84032C385AA;
	Tue, 26 Apr 2022 12:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650974992;
	bh=xoae0+k/0Edw3GjuBUNFOTXme0o2rtmSPr17eSxpIpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3gRR8l956Op/10/09O5HChVy5DSbCPOgAxDwsNJdZpxjTdk5pNlenqs2uMm8hY9I
	 ZkI9qrjVF6HI6ryi5S1LPlK2dbIM8C6lNYhj1vuEHouHA68Wfn/Cn+EJRgoNTImYpi
	 gUQUE8ZN1N9RowDgkMDmpZRnxeMmp2szYnNpSO+4=
Date: Tue, 26 Apr 2022 14:09:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC V2] drivers/virt/vSMP: new driver
Message-ID: <YmfhB6fTTNNS+HYv@kroah.com>
References: <PAXPR02MB7310EA802697DCDE90EF187581F99@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YmVTTvQBSd5nzN3k@kroah.com>
 <PAXPR02MB7310B471C4AFAE6FCC2D26DF81FB9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB7310B471C4AFAE6FCC2D26DF81FB9@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Tue, Apr 26, 2022 at 11:58:19AM +0000, Czerwacki, Eial wrote:
> >From: Greg KH <gregkh@linuxfoundation.org>
> >Sent: Sunday, April 24, 2022 16:40
> >To: Czerwacki, Eial <eial.czerwacki@sap.com>
> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
> >Subject: Re: [RFC V2] drivers/virt/vSMP: new driver 
> > 
> >On Sun, Apr 24, 2022 at 11:44:33AM +0000, Czerwacki, Eial wrote:
> [snip]
> 
> >> +static struct kobject *vsmp_sysfs_kobj;
> >> +static struct pci_dev *vsmp_dev_obj;
> >
> >static variables are not global :)
> >
> >And you should not need this, again, use the proper PCI api insted.
> >
> [snip]
> 
> >
> >Do not use global data for anything, that's a huge hint that your driver
> >is incorrectly written.
> >
> [snip]
> 
> >
> >greg k-h
> 
> I understand the logic behind that, however, I'm not sure I understand what PCI api I can use to replace such vars?

pci_register_driver() is all you need.

> for example for the pci_dev struct of the device or the sysfs object which is used for the other modules
> is there a doc on this I can be pointed to?

I do not understand, why would your driver ever care about any other PCI
device in the system other than the one that you are wishing to be bound
to?

> as for saving the iomapping, I assume that I should map the bar regions rather than having it mapped all the time, am I right?

I have no context here, sorry.

thanks,

greg k-h
