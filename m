Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333253A4
	for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 11:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577DAC340E7;
	Mon, 28 Feb 2022 11:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646047208;
	bh=TZYI8CoLqZwdjhCp4FIqkyAKtFSpIqtbXR7Aczi5lHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C57riiYnEjUdxOZhn04GGyA8PIVDUJ6DJKuCKjTYwuUmTfW6bVKDrs724kyxSBaKx
	 RgI2btjN0kChcFl20e7HpTgxlexOr2YrBREdqqTBvDVt/Whdw/5z0V77N814zObmo3
	 /EeMG4N6szzw6EaZ5Y2WBm3/aL7Ea4aeZYOpa8Fs=
Date: Mon, 28 Feb 2022 12:20:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Arnd Bergman <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>, Mike Rapoport <rppt@kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>,
	"Bos, H.J." <h.j.bos@vu.nl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sgx@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	bcm-kernel-feedback-list@broadcom.com, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kvm@vger.kernel.org,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	v9fs-developer@lists.sourceforge.net,
	tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <Yhyv42ONIxTj04mg@kroah.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228110822.491923-3-jakobkoschel@gmail.com>

On Mon, Feb 28, 2022 at 12:08:18PM +0100, Jakob Koschel wrote:
> If the list does not contain the expected element, the value of
> list_for_each_entry() iterator will not point to a valid structure.
> To avoid type confusion in such case, the list iterator
> scope will be limited to list_for_each_entry() loop.
> 
> In preparation to limiting scope of a list iterator to the list traversal
> loop, use a dedicated pointer to point to the found element.
> Determining if an element was found is then simply checking if
> the pointer is != NULL.
> 
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  arch/x86/kernel/cpu/sgx/encl.c       |  6 +++--
>  drivers/scsi/scsi_transport_sas.c    | 17 ++++++++-----
>  drivers/thermal/thermal_core.c       | 38 ++++++++++++++++++----------
>  drivers/usb/gadget/configfs.c        | 22 ++++++++++------
>  drivers/usb/gadget/udc/max3420_udc.c | 11 +++++---
>  drivers/usb/gadget/udc/tegra-xudc.c  | 11 +++++---
>  drivers/usb/mtu3/mtu3_gadget.c       | 11 +++++---
>  drivers/usb/musb/musb_gadget.c       | 11 +++++---
>  drivers/vfio/mdev/mdev_core.c        | 11 +++++---
>  9 files changed, 88 insertions(+), 50 deletions(-)

The drivers/usb/ portion of this patch should be in patch 1/X, right?

Also, you will have to split these up per-subsystem so that the
different subsystem maintainers can take these in their trees.

thanks,

greg k-h
