Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F076D13
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 10:05:41 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mEU4G-0002an-N0; Fri, 13 Aug 2021 12:05:36 +0200
Date: Fri, 13 Aug 2021 12:05:36 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] staging: r8188eu: (trivial) remove a duplicate debug
 print
Message-ID: <20210813100536.xkjzfq5pstbhdwru@viti.kaiser.cx>
References: <20210811201450.31366-1-martin@kaiser.cx>
 <20210811201450.31366-3-martin@kaiser.cx>
 <CAA=Fs0n0U62cZADeEGXD7HUYzCXpZuHXGZZruztNoTeShFw5aA@mail.gmail.com>
 <20210812061759.GW22532@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812061759.GW22532@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Dan and Phil,

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> Please think of the subject and the commit message as two different
> things.  Often it's people reviewing on email will only read one or the
> other.  In other words just restate the subject:

ok, I'll keep that in mind for further patches.

> > Dear Martin,

> > Just my personal opinion, but I'd be inclined to strip out all DBG_88E
> > calls totally. If there are necessary functions being called such as
> > device_may_wakeup() we can always just keep this part and remove the
> > macro call (not checked this function out myself yet). Thanks.

I'd agree with you, Phil. Most DBG_88E prints don't say anything useful.

This comment from Greg made me drop the DBG_88E removal for now

https://lore.kernel.org/linux-staging/20210803201511.29000-1-martin@kaiser.cx/T/#m05d82a0ca8ed36180ebdc987114b4d892445c52d

A compromise would be to remove only those DBG_88E prints which are
really not helpful.

Best regards,
Martin
