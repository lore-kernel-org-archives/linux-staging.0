Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7738B6FDE
	for <linux-staging@lists.linux.dev>; Mon,  5 Jun 2023 15:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A3BC433D2;
	Mon,  5 Jun 2023 15:03:52 +0000 (UTC)
Date: Mon, 5 Jun 2023 17:03:50 +0200
From: Greg KH <greg@kroah.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
	geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
	jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
Message-ID: <2023060542-daydream-dares-d494@gregkh>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-31-tzimmermann@suse.de>

On Mon, Jun 05, 2023 at 04:48:12PM +0200, Thomas Zimmermann wrote:
> Add Kconfig option CONFIG_FB_DEVICE and make the virtual fbdev
> device optional. If the new option has not been selected, fbdev
> does not create a files in devfs or sysfs.
> 
> Most modern Linux systems run a DRM-based graphics stack that uses
> the kernel's framebuffer console, but has otherwise deprecated fbdev
> support. Yet fbdev userspace interfaces are still present.
> 
> The option makes it possible to use the fbdev subsystem as console
> implementation without support for userspace. This closes potential
> entry points to manipulate kernel or I/O memory via framebuffers. It
> also prevents the execution of driver code via ioctl or sysfs, both
> of which might allow malicious software to exploit bugs in the fbdev
> code.
> 
> A small number of fbdev drivers require struct fbinfo.dev to be
> initialized, usually for the support of sysfs interface. Make these
> drivers depend on FB_DEVICE. They can later be fixed if necessary.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
