Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461BF28EA
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 07:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D973C433D6;
	Mon,  5 Sep 2022 07:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662361286;
	bh=GOfVfMl+hxGm72nNgisK+inq1mOHxDkxN2LmN4JromY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDXVFPpabN38aCoxwtnFkqb1q/6QqES+Oe5bjXZHIRCF76aSJSZDfwuB4KuJGz0Af
	 iLIvNeBO+haaNCOvi79Fx+miD09rJtYIRknO4ggRqzTNwzQdZKinncU1F2PvJxEyDy
	 7f5jmgp9JOkdZl6bfXGiXB5tGhhdbwSlN911efMA=
Date: Mon, 5 Sep 2022 09:01:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"Hammer, Gal" <gal.hammer@sap.com>
Subject: Re: invalid drv data in show attribute
Message-ID: <YxWewlIruFL500al@kroah.com>
References: <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWN7Fm07segTeqU@kroah.com>
 <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Mon, Sep 05, 2022 at 06:07:07AM +0000, Czerwacki, Eial wrote:
> > 
> >On Sun, Sep 04, 2022 at 02:37:32PM +0000, Czerwacki, Eial wrote:
> >> Greetings,
> >> 
> >> while working on a driver, I've found a bug that I'm unable to understand.
> >> I assume that I'm doing something wrong. here is my reduced c file:
> >
> ><snip>
> >
> >I'll provide a better review after my coffee, but just one comment
> >first.  Ok, two:
> >
> >> #ifndef sysfs_emit
> >> #define sysfs_emit sprintf
> >> #endif // sysfs_emit
> >
> >Wait what?  You mention at the end that you do nto have sysfs_emit in
> >your kernel tree, but all activly maintained kernels does have this
> >function.  You should NEVER be working on a kernel tree that is not
> >actually supported, and for new code like you are wanting to submit, you
> >should always work on Linus's tree, or the last release, or something
> >newer.
> >
> >Please move to 5.19 now, it will save you so much time later on...
> well, I'm kinda binded to this kernel version buy you are right.

What kernel version does not have sysfs_emit()?

> I'll move to newer kernel.
> I'll worry about backports later

backports are always easier than forward-ports.

> >> static int vsmp_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
> >> {
> >>        struct data *d;
> >>        int ret_val = 0;
> >> 
> >>        d = devm_kzalloc(&pci->dev, sizeof(*d), GFP_KERNEL);
> >>        if (IS_ERR(d))
> >>                return PTR_ERR(d);
> >> 
> >>        d->pdev = pci;
> >>        pci_set_drvdata(pci, d);
> >>        d->kobj = kobject_create_and_add(ROOT_SYFS_FOLDER, &d->pdev->dev.kobj);
> >
> >This is the issue, no driver should ever be calling any kobject_*() or
> >sysfs_*() calls, unless something went very very wrong.
> >
> >Drivers and devices have their own tree in sysfs, with 'struct device'
> >to use.  You have a device here, use that, don't try to create a whole
> >new sysfs tree somewhere else in the heiarchy which does not reflect the
> >actual device you are using here.
> >
> >You then try to tie a device as a child to a kobject, which breaks the
> >whole logical chain here, and then confuses your callback as you really
> >don't have the device pointer anymore, it's some other random thing.
> >
> >So step back and try to describe first what you want to see in sysfs,
> >and then maybe it will be more obvious as to what you need to do here.
> >
> >Write the Documentation/ABI/ entries first, what do they look like for
> >your new sysfs files?
> 
> I thought that is my issue but wasn't sure.
> what I'm looking for is this tree:
> - vsmp
> -- version
> -- summery
> --- data#1
> ...
> --- data#n
> -- boards
> --- 0
> ---- data#1
> ...
> ---- data#k
> --- 1
> ...
> --- l
> 
> each board has a predefine set of attributes when I need to add another depending on the type.
> also there are shared attributes between summery folder and the boards. that I was able to implement based on the name of the entry

So "boards" are devices, and then you need a bus to manage them.  Are
you sure you need/want all of this?

And what exactly is in the other files?

> that I'd like to see under /sys/hypervisor

/sys/hypervisor probably isn't the place for all of that mess.  You are
going to have devices and a bus and all sorts of other complex things.

Step back and explain exactly what you are trying to export, who will be
using it, and what format you want it in.  This feels like a lot of
stuff that is probably not needed except for debugging.

If this isn't for debugging, it's going to be a lot more complex than
"simple" attributes for a driver, sorry.  You are going to need as I
mention above, to use a bus and other things which feels kind of wrong
as odds are this isn't a bus, right?

> I have no problems using link from the device's path to /sys/hypervisor

Why would you create a link?  Look at what existing hypervisors do in
/sys/hypervisor, there's no links there, only a small set of information
that userspace can use for the Xen code, or a more complex virtual
filesystem that the s390 hypervisor mounts at that location.  No one
creates a symlink under there, why would that be necessary?

But again, stop and think about the information you want to export and
who would be using it.  If you can explain that first, that might make
it easier to point out how to do it best.

thanks,

greg k-h
