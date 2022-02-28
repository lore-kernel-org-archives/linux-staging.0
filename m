Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85A14C9E
	for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 21:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=uTSgVBk5w89AJnv82I9bqMWvwbVIn7Apzl6uMNeIbWY=;
	t=1646082808; x=1647292408; b=PVabXjpHXtawKc/3N6KvH4R5ZfS//ZUVf34KX/SBbyhUadL
	XGa21U/xrnyXpWb2zD1AMch05GtC6IsG7khQFz0NmlikzxW2itOBSY47E3zQHHjRP5cJ1grrm44LG
	89FKdLuHiFsJ5b+vhGHga+i538lExY9BLOU43L7dXpFEOuLDXRo7rh5MUZEm6oP/iogzvll+YgzQ0
	ng4NMOeAwoDw6UznR8ciXkyffHQdUGodbyKxx2NrXw9WUEfJF56S/gJKb/63BUGgZHy4apWfpGqsq
	fo3APYqKP6cWCGntSPHnwLHd04nnlaIJu4PoyhKgQ/h84bFstBbAqMU94q13lmyw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	(envelope-from <johannes@sipsolutions.net>)
	id 1nOmc1-00716Q-Dh;
	Mon, 28 Feb 2022 21:27:17 +0100
Message-ID: <e3bb7d0632f8ef60f18c19976d57330e1ef00584.camel@sipsolutions.net>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop
 body as a ptr
From: Johannes Berg <johannes@sipsolutions.net>
To: Matthew Wilcox <willy@infradead.org>, Linus Torvalds
	 <torvalds@linux-foundation.org>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jakob
 Koschel <jakobkoschel@gmail.com>, alsa-devel@alsa-project.org,
 linux-aspeed@lists.ozlabs.org,  "Gustavo A. R. Silva"
 <gustavo@embeddedor.com>, linux-iio@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
  dri-devel <dri-devel@lists.freedesktop.org>, Cristiano Giuffrida
 <c.giuffrida@vu.nl>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 samba-technical@lists.samba.org,  linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>, CIFS
 <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>, linux-scsi
 <linux-scsi@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe
 <jgg@ziepe.ca>,  intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, 
 bcm-kernel-feedback-list@broadcom.com, Dan Carpenter
 <dan.carpenter@oracle.com>,  Linux Media Mailing List
 <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Arnd
 Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>,  Brian Johannesmeyer
 <bjohannesmeyer@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, v9fs-developer@lists.sourceforge.net, 
 linux-tegra <linux-tegra@vger.kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>,  linux-usb@vger.kernel.org, linux-wireless
 <linux-wireless@vger.kernel.org>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux F2FS Dev Mailing List
 <linux-f2fs-devel@lists.sourceforge.net>, 
 tipc-discussion@lists.sourceforge.net, Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>, dma <dmaengine@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, Andrew Morton
 <akpm@linux-foundation.org>,  linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>
Date: Mon, 28 Feb 2022 21:27:13 +0100
In-Reply-To: <Yh0tl3Lni4weIMkl@casper.infradead.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	 <20220228110822.491923-3-jakobkoschel@gmail.com>
	 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
	 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
	 <Yh0tl3Lni4weIMkl@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Mon, 2022-02-28 at 20:16 +0000, Matthew Wilcox wrote:
> On Mon, Feb 28, 2022 at 12:10:24PM -0800, Linus Torvalds wrote:
> > We can do
> > 
> >         typeof(pos) pos
> > 
> > in the 'for ()' loop, and never use __iter at all.
> > 
> > That means that inside the for-loop, we use a _different_ 'pos' than outside.
> 
> Then we can never use -Wshadow ;-(  I'd love to be able to turn it on;
> it catches real bugs.
> 

I was just going to say the same thing...

If we're willing to change the API for the macro, we could do

  list_for_each_entry(type, pos, head, member)

and then actually take advantage of -Wshadow?

johannes
