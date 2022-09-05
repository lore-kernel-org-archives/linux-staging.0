Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317ED4416
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 16:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6BAC433D6;
	Mon,  5 Sep 2022 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662393743;
	bh=87f79Dl/+xRI0j/bcX3ArhnDUtY0xVhWk+Y5obPVch8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bp8OYIswSShjXVAtNpfVhuvGKonN+yWcGSHF7y62zp0uzkAXkQclDRz51eRCqD59S
	 TuyoeFWh1mN5MCz+WmrsUDWn1UdM+QCtM2mZOx++FYZMkMX09VUejOdK1C4gqD/ZpN
	 qvTj3YW/5Nr8RuvYUwjiH/5EvvOFD1KW/j+Fui+w=
Date: Mon, 5 Sep 2022 18:02:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"Hammer, Gal" <gal.hammer@sap.com>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: invalid drv data in show attribute
Message-ID: <YxYdjBiOSWhqI/M8@kroah.com>
References: <YxWN7Fm07segTeqU@kroah.com>
 <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWewlIruFL500al@kroah.com>
 <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXgfRx/E26kl/N7@kroah.com>
 <PAXPR02MB73100F851CC17B941A5CA49D817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXnT42bNR0got/E@kroah.com>
 <PAXPR02MB7310E5970299650B7B81B399817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxYR5SyPB6G5vDXH@kroah.com>
 <PAXPR02MB7310AAA80455E4B3A97C3A1F817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR02MB7310AAA80455E4B3A97C3A1F817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Mon, Sep 05, 2022 at 03:52:01PM +0000, Czerwacki, Eial wrote:
> >On Mon, Sep 05, 2022 at 12:56:29PM +0000, Czerwacki, Eial wrote:
> >> >> I'd prefer not adding complex code to the utils which need to traverse the sysfs tree to collect the right data
> >> >
> >> >for device in $(ls /sys/bus/vsmp/device/); do
> >> now I understand!
> >> that is what I was missing.
> >> so inside /sys/bus/vsmp/device/ I can find the following tree?
> >> 1
> >> 2
> >> 3
> >> ...
> >> n
> >> ?
> >
> >Yes, or how ever you want to name these "boards".
> /sys/bus/vsmp/boards/ or /sys/bus/vsmp/device/board#?

You can not create /sys/bus/vsmp/boards/ the driver model will not let
you do that.

You will have the device/ directory created automatically.  It's how you
want to name the board itself is up to you, it just has to be unique on
the bus.

> >> so I can create entries in /sys/hypervisor/vsmp for the global info
> >
> >Yes.
> >
> >> and link /sys/bus/vsmp/device/ to /sys/hypervisor/vsmp/boards?
> >
> >No symlink needed at all, they are independent things, right?  What
> >would require such a symlink?
> >
> >thanks,
> >
> >greg k-h
> I'd rather have all the info under one place than in multiple places if possible.
> is seams more logical to me

That's not how sysfs works, sorry.  :)

Hypervisors are not normal, the fact that you are using that location in
the first place is very very odd, only 1 other in-kernel user is using
that.  So maybe you don't even need that at all?

thanks,

greg k-h
