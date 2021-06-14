Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661D772
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:02:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95CED436;
	Mon, 14 Jun 2021 19:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1623690154;
	bh=Y2DVDZtTbRamSMFSYh0UzDVohFWrw/fdG95ktNQMiWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oo/yQv8TDRPCI+oZkTQk+BQSq9oQhfeC4QhvFLUlrqE+yESjgrq9vjG1+/VmZTOCn
	 FZKElCoIptg0iUF66PFnb/4F/3hQbUrGU3E3w8cq7hrlgMwGLWQNbAWQSXQJOLHrbv
	 VSmTof8vz9eH9ILN+w+6IvSMmOj4vSzDCnPO+Lxs=
Date: Mon, 14 Jun 2021 20:02:14 +0300
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
Subject: Re: [PATCH v3 4/8] media: subdev: remove VIDIOC_DQEVENT_TIME32
 handling
Message-ID: <YMeLlvALJ5nJbQGg@pendragon.ideasonboard.com>
References: <20210614103409.3154127-1-arnd@kernel.org>
 <20210614103409.3154127-5-arnd@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614103409.3154127-5-arnd@kernel.org>

Hi Arnd,

Thank you for the patch.

On Mon, Jun 14, 2021 at 12:34:05PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Converting the VIDIOC_DQEVENT_TIME32/VIDIOC_DQEVENT32/
> VIDIOC_DQEVENT32_TIME32 arguments to the canonical form is done in common
> code, but for some reason I ended up adding another conversion helper to
> subdev_do_ioctl() as well. I must have concluded that this does not go
> through the common conversion, but it has done that since the ioctl
> handler was first added.
> 
> I assume this one is harmless as there should be no way to arrive here
> from user space, but since it is dead code, it should just get removed.

If I'm not mistaken, this could be reached when
!CONFIG_COMPAT_32BIT_TIME, can't it ? Still, there's no need for this
code in that case, so it seems fine to me.

> Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

With an updated commit message if the above is correct,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 24 ------------------------
>  1 file changed, 24 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 956dafab43d4..bf3aa9252458 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -428,30 +428,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
>  
> -	case VIDIOC_DQEVENT_TIME32: {
> -		struct v4l2_event_time32 *ev32 = arg;
> -		struct v4l2_event ev = { };
> -
> -		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> -			return -ENOIOCTLCMD;
> -
> -		rval = v4l2_event_dequeue(vfh, &ev, file->f_flags & O_NONBLOCK);
> -
> -		*ev32 = (struct v4l2_event_time32) {
> -			.type		= ev.type,
> -			.pending	= ev.pending,
> -			.sequence	= ev.sequence,
> -			.timestamp.tv_sec  = ev.timestamp.tv_sec,
> -			.timestamp.tv_nsec = ev.timestamp.tv_nsec,
> -			.id		= ev.id,
> -		};
> -
> -		memcpy(&ev32->u, &ev.u, sizeof(ev.u));
> -		memcpy(&ev32->reserved, &ev.reserved, sizeof(ev.reserved));
> -
> -		return rval;
> -	}
> -
>  	case VIDIOC_SUBSCRIBE_EVENT:
>  		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
>  

-- 
Regards,

Laurent Pinchart
