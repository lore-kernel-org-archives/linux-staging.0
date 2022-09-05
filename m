Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0F123AA
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 05:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6727FC433C1;
	Mon,  5 Sep 2022 05:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662356975;
	bh=vhMSOTB9znlOMXJHPCNYmmcVJOPCj7/dgieal2iZlNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wRY1Vl90EXpyl9OY1gbcE7Wf9OWfi9YBYkznE8khtnGEPAQyBceV+iz4eAuWWCMDM
	 usoblsAP4cA0IohyazUd5V2yXjFYCTRbFNRWyldc+58uyVZRBYWHCDOs5Hwp4MnvPo
	 yT+a4EoUJo12Gh71Tn/Rvr9ucTxgT0jzLU9YVDto=
Date: Mon, 5 Sep 2022 07:49:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"Hammer, Gal" <gal.hammer@sap.com>
Subject: Re: invalid drv data in show attribute
Message-ID: <YxWN7Fm07segTeqU@kroah.com>
References: <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Sun, Sep 04, 2022 at 02:37:32PM +0000, Czerwacki, Eial wrote:
> Greetings,
> 
> while working on a driver, I've found a bug that I'm unable to understand.
> I assume that I'm doing something wrong. here is my reduced c file:

<snip>

I'll provide a better review after my coffee, but just one comment
first.  Ok, two:

> #ifndef sysfs_emit
> #define sysfs_emit sprintf
> #endif // sysfs_emit

Wait what?  You mention at the end that you do nto have sysfs_emit in
your kernel tree, but all activly maintained kernels does have this
function.  You should NEVER be working on a kernel tree that is not
actually supported, and for new code like you are wanting to submit, you
should always work on Linus's tree, or the last release, or something
newer.

Please move to 5.19 now, it will save you so much time later on...

> static int vsmp_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
> {
> 	struct data *d;
> 	int ret_val = 0;
> 
> 	d = devm_kzalloc(&pci->dev, sizeof(*d), GFP_KERNEL);
> 	if (IS_ERR(d))
> 		return PTR_ERR(d);
> 
> 	d->pdev = pci;
> 	pci_set_drvdata(pci, d);
> 	d->kobj = kobject_create_and_add(ROOT_SYFS_FOLDER, &d->pdev->dev.kobj);

This is the issue, no driver should ever be calling any kobject_*() or
sysfs_*() calls, unless something went very very wrong.

Drivers and devices have their own tree in sysfs, with 'struct device'
to use.  You have a device here, use that, don't try to create a whole
new sysfs tree somewhere else in the heiarchy which does not reflect the
actual device you are using here.

You then try to tie a device as a child to a kobject, which breaks the
whole logical chain here, and then confuses your callback as you really
don't have the device pointer anymore, it's some other random thing.

So step back and try to describe first what you want to see in sysfs,
and then maybe it will be more obvious as to what you need to do here.

Write the Documentation/ABI/ entries first, what do they look like for
your new sysfs files?

thanks,

greg k-h
