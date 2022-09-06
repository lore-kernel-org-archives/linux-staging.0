Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F644431
	for <linux-staging@lists.linux.dev>; Tue,  6 Sep 2022 12:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCBAC433D6;
	Tue,  6 Sep 2022 12:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662466178;
	bh=FburGughC3UdMUyiT+347JXOtOVvhzTxxJZ50hawq5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlEpz8T42qcmskLQO+M8nnA5AG9Q0Ge4rmjVjBCAfAK6OTYnwb0+t8IqFjG5Pighh
	 hgEPWQ2rsubX6+btFBMJ99mlGg9PrQqAEkcbOM8epEKz+25VDaKmERnCPv4KNxOw2i
	 N91G3aQ7sm70WiHq4LBr1WGqmjOPjwRKJ/oifcAg=
Date: Tue, 6 Sep 2022 14:09:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"Hammer, Gal" <gal.hammer@sap.com>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: invalid drv data in show attribute
Message-ID: <Yxc4gLCBtvM9fQ2M@kroah.com>
References: <YxWewlIruFL500al@kroah.com>
 <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXgfRx/E26kl/N7@kroah.com>
 <PAXPR02MB73100F851CC17B941A5CA49D817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXnT42bNR0got/E@kroah.com>
 <PAXPR02MB7310E5970299650B7B81B399817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxYR5SyPB6G5vDXH@kroah.com>
 <PAXPR02MB7310AAA80455E4B3A97C3A1F817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxYdjBiOSWhqI/M8@kroah.com>
 <PAXPR02MB731082B5F72C5E2D9D35A4D6817E9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR02MB731082B5F72C5E2D9D35A4D6817E9@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Tue, Sep 06, 2022 at 07:30:20AM +0000, Czerwacki, Eial wrote:
> >> >> so I can create entries in /sys/hypervisor/vsmp for the global info
> >> >
> >> >Yes.
> >> >
> >> >> and link /sys/bus/vsmp/device/ to /sys/hypervisor/vsmp/boards?
> >> >
> >> >No symlink needed at all, they are independent things, right?  What
> >> >would require such a symlink?
> >> >
> >> >thanks,
> >> >
> >> >greg k-h
> >> I'd rather have all the info under one place than in multiple places if possible.
> >> is seams more logical to me
> >
> >That's not how sysfs works, sorry.  :)
> >
> >Hypervisors are not normal, the fact that you are using that location in
> >the first place is very very odd, only 1 other in-kernel user is using
> >that.  So maybe you don't even need that at all?
> >
> >thanks,
> >
> >greg k-h
> as vSMP is an hypervisor, I've thought /sys/hypervisor is an appropriate location.

For generic stuff related to your hypervisor, yes.  But for devices that
are part of your hypervisor bus, no, they do not belong there.

thanks,

greg k-h
