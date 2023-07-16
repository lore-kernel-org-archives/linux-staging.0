Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383D6187D
	for <linux-staging@lists.linux.dev>; Sun, 16 Jul 2023 05:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122FEC433C7;
	Sun, 16 Jul 2023 05:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689485998;
	bh=xzcG60dh739GetSZoGv/B7pts9l8fNioZtl7+wrSna8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOMJX9PqBMeLqwwRc0XBgozzSKaFYhws5b33GLPRkWefkeyT1O8mEP4gjFZ+C96ES
	 WCqfp286R5Fp/sL23oSajHdBGRRbH9Xm0Mh05zF+hSchMoCx6RjeYs26t7iG+4gszi
	 R55ORu7FrjK9XNLYni5UGyrUP+NDjGk7b+ESqleA=
Date: Sun, 16 Jul 2023 07:39:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org,
	dan.carpenter@linaro.org, linux-sh@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-geode@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Subject: Re: [PATCH v4 12/18] staging: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
Message-ID: <2023071644-celery-name-af50@gregkh>
References: <20230715185343.7193-1-tzimmermann@suse.de>
 <20230715185343.7193-13-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230715185343.7193-13-tzimmermann@suse.de>

On Sat, Jul 15, 2023 at 08:51:54PM +0200, Thomas Zimmermann wrote:
> The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
> fbinfo.flags has been allocated to zero by framebuffer_alloc(). So do
> not set it.
> 
> Flags should signal differences from the default values. After cleaning
> up all occurrences of FBINFO_DEFAULT, the token will be removed.
> 
> v2:
> 	* fix commit message (Miguel)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
