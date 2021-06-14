Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA5872
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:04:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A543F436;
	Mon, 14 Jun 2021 19:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1623690284;
	bh=Y6kZhAkHeLzvqk5DlBXOp7E5flMwNJLdlCS66qJQBw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBOMjvG/5Yu0Yyl3EVPMy0ekkQ/GZmYW7F7QDFeljkKttg8XUpr/Tce0p5XGaVwiB
	 xY6nNbyND4EGO+W0M6lIEpIGcyYPdZW32PgF9hox+pJBOGxPBaAU0+kinFdR4NhkIN
	 5VH3NSidSVJkM2Eao/JGyPNNLyv39mX+4BGhv6bk=
Date: Mon, 14 Jun 2021 20:04:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	Liu Shixin <liushixin2@huawei.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 5/8] media: v4l2-core: return -ENODEV from ioctl when
 not registered
Message-ID: <YMeMGbJqiRimgzxy@pendragon.ideasonboard.com>
References: <20210614103409.3154127-1-arnd@kernel.org>
 <20210614103409.3154127-6-arnd@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614103409.3154127-6-arnd@kernel.org>

Hi Arnd,

Thank you for the patch.

On Mon, Jun 14, 2021 at 12:34:06PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I spotted a minor difference is handling of unregistered devices
> between native and compat ioctls: the native handler never tries
> to call into the driver if a device is not marked as registered.
> 
> I did not check whether this can cause issues in the kernel, or
> just a different between return codes, but it clearly makes
> sense that both should behave the same way.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index 0ca75f6784c5..47aff3b19742 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -1244,6 +1244,9 @@ long v4l2_compat_ioctl32(struct file *file, unsigned int cmd, unsigned long arg)
>  	if (!file->f_op->unlocked_ioctl)
>  		return ret;
>  
> +	if (!video_is_registered(vdev))
> +		return -ENODEV;
> +
>  	if (_IOC_TYPE(cmd) == 'V' && _IOC_NR(cmd) < BASE_VIDIOC_PRIVATE)
>  		ret = file->f_op->unlocked_ioctl(file, cmd,
>  					(unsigned long)compat_ptr(arg));

-- 
Regards,

Laurent Pinchart
