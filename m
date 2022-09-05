Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0652561
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 15:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6A0C433C1;
	Mon,  5 Sep 2022 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662390761;
	bh=BSlwGzouF4rZhyWM7zDqGLelKA0QnmksCDYwt2aAi0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEltJ6hHtKIngsw1wbEIEppn9q81PooFROdAJvFTHue4rBoi9Zka+ftH1/CU3AsL+
	 fMAP6HdRiEWyJZvCLa6/Z+decVkHv8PLExpP8HjTCNj+Qw7gkg0IC+cc8Uh/e5xXhu
	 ao4ZV7du1X2f12rku1jVHq4199hCbdx79y5OGUY8=
Date: Mon, 5 Sep 2022 17:12:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"Hammer, Gal" <gal.hammer@sap.com>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: invalid drv data in show attribute
Message-ID: <YxYR5SyPB6G5vDXH@kroah.com>
References: <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWN7Fm07segTeqU@kroah.com>
 <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWewlIruFL500al@kroah.com>
 <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXgfRx/E26kl/N7@kroah.com>
 <PAXPR02MB73100F851CC17B941A5CA49D817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXnT42bNR0got/E@kroah.com>
 <PAXPR02MB7310E5970299650B7B81B399817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB7310E5970299650B7B81B399817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Mon, Sep 05, 2022 at 12:56:29PM +0000, Czerwacki, Eial wrote:
> >And aren't there others at your company that can help you with this?
> afaik, there is not expert on kernel in the company.
> there are some workers that have experience in kernel development but they are from our team

SAP is a big company, I think you should seek them out if you are
wanting to add new subsystems to the kernel to get their help as doing
this is not a trivial task.

> >> I'd prefer not adding complex code to the utils which need to traverse the sysfs tree to collect the right data
> >
> >for device in $(ls /sys/bus/vsmp/device/); do
> now I understand!
> that is what I was missing.
> so inside /sys/bus/vsmp/device/ I can find the following tree?
> 1
> 2
> 3
> ...
> n
> ?

Yes, or how ever you want to name these "boards".

> so I can create entries in /sys/hypervisor/vsmp for the global info

Yes.

> and link /sys/bus/vsmp/device/ to /sys/hypervisor/vsmp/boards?

No symlink needed at all, they are independent things, right?  What
would require such a symlink?

thanks,

greg k-h
