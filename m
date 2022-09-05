Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4753D82
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 12:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EFFC433D7;
	Mon,  5 Sep 2022 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662379858;
	bh=vW9ERmA/3jqFsuCFItax9fIJVPSndkgMVoIFNBxBr/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTLJGiV38urMHfzPEbEPJPLKpaR2YISUkjaYeyHNJ+8Kmk35gp3nAoDu1amR5YCyc
	 pVp3rafUOnF/CYsQc03Mguz0cp1+6DKy6jhFn4P8ybtSAMlj6Aj5eXJc17x7JN9dIf
	 y7A4u6BpQskZPQpcEEQlKDg5CMqJz7HcvAnVIKlE=
Date: Mon, 5 Sep 2022 14:10:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"Hammer, Gal" <gal.hammer@sap.com>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: invalid drv data in show attribute
Message-ID: <YxXnT42bNR0got/E@kroah.com>
References: <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWN7Fm07segTeqU@kroah.com>
 <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWewlIruFL500al@kroah.com>
 <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXgfRx/E26kl/N7@kroah.com>
 <PAXPR02MB73100F851CC17B941A5CA49D817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR02MB73100F851CC17B941A5CA49D817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Mon, Sep 05, 2022 at 12:02:47PM +0000, Czerwacki, Eial wrote:
> >On Mon, Sep 05, 2022 at 07:28:02AM +0000, Czerwacki, Eial wrote:
> >> >On Mon, Sep 05, 2022 at 06:07:07AM +0000, Czerwacki, Eial wrote:
> >> >> > 
> >> >> >On Sun, Sep 04, 2022 at 02:37:32PM +0000, Czerwacki, Eial wrote:
> >> >> >> Greetings,
> >> >> >> 
> >> >> >> while working on a driver, I've found a bug that I'm unable to understand.
> >> >> >> I assume that I'm doing something wrong. here is my reduced c file:
> >> >> >
> >> >> ><snip>
> >> >> >
> >> >> >I'll provide a better review after my coffee, but just one comment
> >> >> >first.  Ok, two:
> >> >> >
> >> >> >> #ifndef sysfs_emit
> >> >> >> #define sysfs_emit sprintf
> >> >> >> #endif // sysfs_emit
> >> >> >
> >> >> >Wait what?  You mention at the end that you do nto have sysfs_emit in
> >> >> >your kernel tree, but all activly maintained kernels does have this
> >> >> >function.  You should NEVER be working on a kernel tree that is not
> >> >> >actually supported, and for new code like you are wanting to submit, you
> >> >> >should always work on Linus's tree, or the last release, or something
> >> >> >newer.
> >> >> >
> >> >> >Please move to 5.19 now, it will save you so much time later on...
> >> >> well, I'm kinda binded to this kernel version buy you are right.
> >> >
> >> >What kernel version does not have sysfs_emit()?
> >> SELS 15 SP2, it uses kernel 5.3.18-24.67
> >
> >Ick, never work on an enterprise kernel for new stuff, they are crazy
> >and you will need to usually redo your whole thing for upstream in the
> >end.
> >
> >Just work off of the latest tree please and then backport when needed.
> understood, that is the main focus now
> 
> >
> >> >> >Write the Documentation/ABI/ entries first, what do they look like for
> >> >> >your new sysfs files?
> >> >> 
> >> >> I thought that is my issue but wasn't sure.
> >> >> what I'm looking for is this tree:
> >> >> - vsmp
> >> >> -- version
> >> >> -- summery
> >> >> --- data#1
> >> >> ...
> >> >> --- data#n
> >> >> -- boards
> >> >> --- 0
> >> >> ---- data#1
> >> >> ...
> >> >> ---- data#k
> >> >> --- 1
> >> >> ...
> >> >> --- l
> >> >> 
> >> >> each board has a predefine set of attributes when I need to add another depending on the type.
> >> >> also there are shared attributes between summery folder and the boards. that I was able to implement based on the name of the entry
> >> >
> >> >So "boards" are devices, and then you need a bus to manage them.  Are
> >> >you sure you need/want all of this?
> >> no, boards are not devices, they logical partitions inside the hypervisor.
> >
> >Which can be a device, we have loads of virtual devices, it's how the
> >driver model works.
> >
> >> each board has its own data I'd like to export.
> >
> >Then they should be treated as a device.
> not sure I understand how they are connected, is there an example I can look at?

The kernel has loads of busses and classes as real-world examples :)

Think of it this way, each of your board will have a `struct device` in
it, and then you will add them to the system.  As you don't really have
a complex thing, each board will just be bound to the "same" driver, and
your bus will only have one driver, but that will allow them all to be
enumerated and handled easily.

And they will all hang off of the PCI device that you had here, it's up
to you if you want to make a "bus device" in the middle or not like many
busses do, but that's getting ahead a bit I think.

Go read the documentation and try it out, there's a lot of concepts here
that I think you need to learn up on in order to make this work well.
Sorry it's not the simplest thing, but then again, it is an operating
system :)

And aren't there others at your company that can help you with this?

> >Great, make them devices.
> I still need to understand how to make them as devices.
> if I understood you correctly, your suggestion is to run modprobe vsmp and there will be virtual device per board?
> then for each I'll create the relevant sysfs entries?
> if so, where can I find the global sysfs entries?

What do you mean by "global" here?  Just put those below /sys/hypervisor
if you want, that should be simple, but not for the individual devices.

> also, how can organize the entries so they will appear under one location which is static?

The kernel device tree is never static.

> I'd prefer not adding complex code to the utils which need to traverse the sysfs tree to collect the right data

for device in $(ls /sys/bus/vsmp/device/); do

that's not that hard :)

thanks,

greg k-h
