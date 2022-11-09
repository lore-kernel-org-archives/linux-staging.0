Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548D0257B;
	Wed,  9 Nov 2022 07:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667979968; bh=4y+p6G+6Eyrf3pYDyQ3PW7+HxDBRFvP76sfcfvr405o=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=Tx3A3hiw1+wUw/GGd3EY1Vy10Eu0OfaNks4pN6IpVUGYN0NPsu7J6GTniwOdr2OS+
	 OrFvVOtSWLzW4iqDe6C5CaMXmc4BPWWE27bCpCW3421zQSqM+JUCn+00wnXvZ1pijO
	 sPkMmsgjE5CZvrPAxec1kwNX0kFus2Tg3CMOiXIE=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Wed,  9 Nov 2022 08:46:08 +0100 (CET)
X-EA-Auth: 5WhwHM9XqEWUpElfHoVsyiSNRigbkBV1oekffDsZQS3OO3TMni5CBDdtyn7IdurPP3ccJ3dnRKFudoW0pY8qUOwkWzy7vJiN
Date: Wed, 9 Nov 2022 13:16:02 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, Sven Van Asbroeck <TheSven73@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fieldbus: replace snprintf in show functions
 with sysfs_emit
Message-ID: <Y2taurqOvGiPo3jB@qemulion>
References: <Y2tBJFSsyUzdb+eO@qemulion>
 <Y2tXEibm2QxH37FK@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2tXEibm2QxH37FK@kroah.com>

On Wed, Nov 09, 2022 at 08:30:26AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Nov 09, 2022 at 11:26:52AM +0530, Deepak R Varma wrote:
> > The show() methods should only use sysfs_emit() when formatting values
> > to be returned to the user space.
> > Ref: Documentation/filesystems/sysfs.rst
> > Issue identified by coccicheck.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> >  	/*
> > -	 * card_name was provided by child driver, could potentially be long.
> > -	 * protect against buffer overrun.
> > +	 * sysfs provides PAGE_SIZE long buffer to take care of potentially
>
> No need to ever mention PAGE_SIZE at all, this comment should just be:
> 	/* card_name was provided by child driver */

Sure. I will update the comment in the revision.

>
> But the larger question is, why did you only convert one of the sysfs
> show functions in this file?  Why not do them all?

I was limiting it to what is reported by coccicheck. I will review other such
show functions and send a consolidated patch.

Thank you,
./drv

>
> thanks,
>
> greg k-h
>


