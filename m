Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2811C98
	for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 14:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4895BC433C8;
	Mon, 28 Aug 2023 14:51:03 +0000 (UTC)
Date: Mon, 28 Aug 2023 16:51:01 +0200
From: Greg KH <greg@kroah.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org, javierm@redhat.com,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 7/8] staging/fbtft: Initialize fb_op struct as static
 const
Message-ID: <2023082854-appetite-unmindful-73f4@gregkh>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-8-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828132131.29295-8-tzimmermann@suse.de>

On Mon, Aug 28, 2023 at 03:14:23PM +0200, Thomas Zimmermann wrote:
> Replace dynamic allocation of the fb_ops instance with static
> allocation. Initialize the fields at module-load time. The owner
> field changes to THIS_MODULE, as in all other fbdev drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 30 +++++++++++++-----------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
