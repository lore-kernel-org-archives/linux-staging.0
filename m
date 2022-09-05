Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206963D82
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 11:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB4DC433D6;
	Mon,  5 Sep 2022 11:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662378112;
	bh=OmUHSXkBBvZCMIDQpo1khQpuYJTDBtJ2jJixEdAPuJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K62CgVRzPhQT1SZash4usWR/SibPAx0x+Mik0o4+2klh/isK+CgJiIYL++l3qEqS/
	 PezKKwzgf7GcirhODHPHalJjeh3+wjABsubtiYNaxAdZ/JwLrnsOCplexljb7iAXLI
	 FG7gcn6zzgKDogbCFmjv48z6LnaVexszUemvVOC0=
Date: Mon, 5 Sep 2022 13:41:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"Hammer, Gal" <gal.hammer@sap.com>
Subject: Re: invalid drv data in show attribute
Message-ID: <YxXgfRx/E26kl/N7@kroah.com>
References: <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWN7Fm07segTeqU@kroah.com>
 <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWewlIruFL500al@kroah.com>
 <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Mon, Sep 05, 2022 at 07:28:02AM +0000, Czerwacki, Eial wrote:
> >On Mon, Sep 05, 2022 at 06:07:07AM +0000, Czerwacki, Eial wrote:
> >> > 
> >> >On Sun, Sep 04, 2022 at 02:37:32PM +0000, Czerwacki, Eial wrote:
> >> >> Greetings,
> >> >> 
> >> >> while working on a driver, I've found a bug that I'm unable to understand.
> >> >> I assume that I'm doing something wrong. here is my reduced c file:
> >> >
> >> ><snip>
> >> >
> >> >I'll provide a better review after my coffee, but just one comment
> >> >first.  Ok, two:
> >> >
> >> >> #ifndef sysfs_emit
> >> >> #define sysfs_emit sprintf
> >> >> #endif // sysfs_emit
> >> >
> >> >Wait what?  You mention at the end that you do nto have sysfs_emit in
> >> >your kernel tree, but all activly maintained kernels does have this
> >> >function.  You should NEVER be working on a kernel tree that is not
> >> >actually supported, and for new code like you are wanting to submit, you
> >> >should always work on Linus's tree, or the last release, or something
> >> >newer.
> >> >
> >> >Please move to 5.19 now, it will save you so much time later on...
> >> well, I'm kinda binded to this kernel version buy you are right.
> >
> >What kernel version does not have sysfs_emit()?
> SELS 15 SP2, it uses kernel 5.3.18-24.67

Ick, never work on an enterprise kernel for new stuff, they are crazy
and you will need to usually redo your whole thing for upstream in the
end.

Just work off of the latest tree please and then backport when needed.

> >> >Write the Documentation/ABI/ entries first, what do they look like for
> >> >your new sysfs files?
> >> 
> >> I thought that is my issue but wasn't sure.
> >> what I'm looking for is this tree:
> >> - vsmp
> >> -- version
> >> -- summery
> >> --- data#1
> >> ...
> >> --- data#n
> >> -- boards
> >> --- 0
> >> ---- data#1
> >> ...
> >> ---- data#k
> >> --- 1
> >> ...
> >> --- l
> >> 
> >> each board has a predefine set of attributes when I need to add another depending on the type.
> >> also there are shared attributes between summery folder and the boards. that I was able to implement based on the name of the entry
> >
> >So "boards" are devices, and then you need a bus to manage them.  Are
> >you sure you need/want all of this?
> no, boards are not devices, they logical partitions inside the hypervisor.

Which can be a device, we have loads of virtual devices, it's how the
driver model works.

> each board has its own data I'd like to export.

Then they should be treated as a device.

> >And what exactly is in the other files?
> version is the hypervisor's version, the summery is data the user can extract
> in order to build a complete image of the system configuration

Ok, those can be simple attribute groups, if they are static and do not
change.

> >> that I'd like to see under /sys/hypervisor
> >
> >/sys/hypervisor probably isn't the place for all of that mess.  You are
> >going to have devices and a bus and all sorts of other complex things.
> from what I understand, when I add a sysfs tree to a device, it exists in side the device's full path.
> as the device can sit on different slots, it will have different path.
> to enable simpler data extraction, I'd like place it under a constant path, like every block device
> can be accessed via /sys/block

Then you need to have a bus, or a class, as that is how you orginize
things.  Please read the driver model chapter in the Linux Device
Drivers book as an example of the basic ideas here.

> >Step back and explain exactly what you are trying to export, who will be
> >using it, and what format you want it in.  This feels like a lot of
> >stuff that is probably not needed except for debugging.
> each instance of vSMP is comprised of logical partitions.
> the instance has it's own data required to be exported.
> each logical partition has it's own data required to be exported.
> that is why the above tree was suggested.

Great, make them devices.

> the data will be used by a layer that gather the information and exports it to ui and to scripts that log the info
> it isn't a debug info because there are some tools that need to know the a partition's information to run properly

Ok, then they all need to be "one value per file" like sysfs requires.

good luck!

greg k-h
