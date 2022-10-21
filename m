Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5562C80;
	Sat, 22 Oct 2022 19:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666467028; bh=JTheIU4xRSl5mc5GqAxkbn7h52Wsca6LkI5NJTEdf14=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=Qh53FDKBB8GpVmydYu0rAMSAIM7UQCNf0n1mm65q1cWDp/lhMAlJb0R198wts5ovT
	 KDdjRmXtmU5CXIt9eZw5hp95n7x5kwdv+yvCMHcD8DL2lpJrHOMdinoB5vj0kve1rq
	 FJCMJfjYCKVlZ5/exrMW2RITnaE/jeeqWfvm/L1M=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
	via [213.182.55.206]
	Sat, 22 Oct 2022 21:30:28 +0200 (CEST)
X-EA-Auth: q56hZWDqs4iRisuzWFTQxUzkR7F6O3dEDdwhc1oJruUtjsotfYf2wsL9j+FGNIfmaGRgyagBhcnOJGsIix2u85/cZr7HhW7R
Date: Fri, 21 Oct 2022 22:04:22 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: remove commented debug printk messages
Message-ID: <Y1LKDv7vSmNrZDEI@debian-BULLSEYE-live-builder-AMD64>
References: <Y1H5tJXjMZqiB6rh@debian-BULLSEYE-live-builder-AMD64>
 <Y1OikehVJv/teZ9e@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1OikehVJv/teZ9e@kroah.com>

On Sat, Oct 22, 2022 at 09:58:09AM +0200, Greg KH wrote:
> On Fri, Oct 21, 2022 at 07:15:24AM +0530, Deepak R Varma wrote:
> > printk messages are added for program flow tracing and are left
> > commented. These commented log messages should be removed as they
> > are no more useful for program execution.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/wlan-ng/p80211netdev.c | 22 ----------------------
> >  1 file changed, 22 deletions(-)
>
> I recieved 3 different copies of this patch, and do not know which one
> to take at all.

Hello Greg,
My apologies for the spam. There have been some trouble with my email
transactions. I was unable to see my own email and hence ended up resending the
same patch 3 times.

>
> So please resend this as a v2 patch, only once, and I will be glad to
> review it.

Sure and thank you very much. Will send in v2 shortly.

./drv

>
> thanks,
>
> greg k-h


