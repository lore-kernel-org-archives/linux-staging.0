Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C48512B80
	for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 14:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95AFC433CA;
	Mon, 28 Aug 2023 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693234277;
	bh=jD4VlYUlY+oZHcnEYNohEuUlkOxYBChf3b8erligfko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NyWkjMRYwpD/+JQu9WW3eC/E7J3M0AloIwVcs0Ge4WsZ9l2Ug1xbq5Fmw/p1N5JBx
	 gEyZw8vuaaZGT6wjINFQGII45qSprCxb5CzPG1BqlTAUVxt/N7o0wgHuqVdrtKk1ax
	 HsYVFMrouLkdkv8GSbRhEEokYaA/A0jp8K08IntI=
Date: Mon, 28 Aug 2023 16:51:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org, javierm@redhat.com,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 8/8] staging/fbtft: Use fb_ops helpers for deferred I/O
Message-ID: <2023082805-gizmo-barrack-9467@gregkh>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-9-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828132131.29295-9-tzimmermann@suse.de>

On Mon, Aug 28, 2023 at 03:14:24PM +0200, Thomas Zimmermann wrote:
> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with an fbdev initializer macro.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
