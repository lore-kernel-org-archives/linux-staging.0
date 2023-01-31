Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D448F4B
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 17:16:19 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1pMuEv-0000k5-9M; Tue, 31 Jan 2023 18:16:13 +0100
Date: Tue, 31 Jan 2023 18:16:13 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix NULL check for rcu pointer
Message-ID: <20230131171613.mubqpogkk5e6lnrk@viti.kaiser.cx>
References: <20230131090057.241779-1-martin@kaiser.cx>
 <Y9kvF0C1kiDctEUw@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9kvF0C1kiDctEUw@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hello Greg and all,

Thus wrote Greg Kroah-Hartman (gregkh@linuxfoundation.org):

> On Tue, Jan 31, 2023 at 10:00:57AM +0100, Martin Kaiser wrote:
> > Fix the NULL check for padapter->pnetdev->rx_handler_data.

> > The current code calls rcu_dereference while it holds the rcu read lock
> > and checks the pointer after releasing the lock. An rcu pointer may only be
> > used between calls to rcu_read_lock and rcu_read_unlock.

> > Replace the check with rcu_access_pointer. My understanding is that this
> > function returns the value of the pointer and needs no locking. We can
> > then check the pointer but we must not dereference it.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>

> What commit id does this fix?

the code that checks br_port has been around since the driver was
imported into staging.

If the patch is considered as a fix, it should have

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")

Best regards,

   Martin
