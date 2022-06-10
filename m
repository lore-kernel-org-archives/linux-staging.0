Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0A67A
	for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 07:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CB8C34114;
	Fri, 10 Jun 2022 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654845015;
	bh=1jF8gOkC5M5t8KtZ2Se+Cle7+3XpHMvrmN0dAG10DtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kp1832CJeRB1cCRc9vhuUq7VMGWZNNoGoOnvd8/Ct5zebCAGy27nmtP2PSTuli1pD
	 MSZUuGHPwwARQdvFal0UMwx2LZtyNI3K54RAsnQ4c9EMqEpTujvLRuPpx2m/UU6tye
	 emtH+t1nftg8I2hJ4mpDgN6uEGNTd15OPn+8cfSM=
Date: Fri, 10 Jun 2022 09:10:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jerry Lin <wahahab11@gmail.com>, Helge Deller <deller@gmx.de>,
	Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: olpc_dcon: mark driver as broken
Message-ID: <YqLuVMVQc5qm5ld7@kroah.com>
References: <20220609223424.907174-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609223424.907174-1-javierm@redhat.com>

On Fri, Jun 10, 2022 at 12:34:24AM +0200, Javier Martinez Canillas wrote:
> The commit eecb3e4e5d9d ("staging: olpc_dcon: add OLPC display controller
> (DCON) support") added this driver in 2010, and has been in staging since
> then. It was marked as broken at some point because it didn't even build
> but that got removed once the build issues were addressed.
> 
> But it seems that the work to move this driver out of staging has stalled,
> the last non-trivial change to fix one of the items mentioned in its todo
> file was commit e40219d5e4b2 ("staging: olpc_dcon: allow simultaneous XO-1
> and XO-1.5 support") in 2019.
> 
> And even if work to destage the driver is resumed, the fbdev subsystem has
> been deprecated for a long time and instead it should be ported to DRM.
> 
> Now this driver is preventing to land a kernel wide change, that makes the
> num_registered_fb symbol to be private to the fbmem.c file.
> 
> So let's just mark the driver as broken. Someone can then work on making
> it not depend on the num_registered_fb symbol, allowing to drop the broken
> dependency again.

Thanks for doing this, will go queue it up now for 5.19-final.

greg k-h
