Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14E953B5
	for <linux-staging@lists.linux.dev>; Wed,  7 Sep 2022 13:09:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C12DADD;
	Wed,  7 Sep 2022 15:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1662556192;
	bh=TgDjbh1X5PWwjOUrKcdMzSbSbh7ByQ7P8DVTSSqcvhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0ZEiYkpfOdxlUi2625QZOk1BNbHkCzOlXhEZhssODDTrqiQEfw7Oha+QJ0whJkCd
	 qTrzYLNrWfxhQTGIXSbfdrr2IMN58MjWI9n1vcMXSnFliM5Dh2eg95gCwnAeyN1A3p
	 H8EVUN7QKwgZNSm4D/ZQSt0mcfhQdNQDlnaBVVtU=
Date: Wed, 7 Sep 2022 16:09:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/intel-ipu3: Finalize subdev
 initialization to allcoate active state
Message-ID: <YxiYD6PVYG19EJ5q@pendragon.ideasonboard.com>
References: <20220907123359.1275322-1-luzmaximilian@gmail.com>
 <a194a9c5-ac8e-cf86-34cd-4f3a3cb6f6ec@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a194a9c5-ac8e-cf86-34cd-4f3a3cb6f6ec@ideasonboard.com>

On Wed, Sep 07, 2022 at 03:46:26PM +0300, Tomi Valkeinen wrote:
> Hi Maximilian,
> 
> On 07/09/2022 15:33, Maximilian Luz wrote:
> > Commit f69952a4dc1e ("media: subdev: add active state to struct
> > v4l2_subdev") introduced the active_state member to struct v4l2_subdev.
> > This state needs to be allocated via v4l2_subdev_init_finalize(). The
> > intel-ipu3 driver unfortunately does not do that, due to which,
> 
> That is fine, a driver only needs to allocate the active state if it uses
> the active state.
> 
> > active_state is NULL and we run into an oops (NULL pointer dereference)
> > when that state is accessed.
> > 
> > In particular, this happens subdev in IOCTLs as commit 3cc7a4bbc381
> > ("media: subdev: pass also the active state to subdevs from ioctls")
> > passes that state on to the subdev IOCTLs. An example scenario where
> > this happens is running libcamera's qcam or cam on a device with IPU3,
> > for example the Microsoft Surface Book 2. In this case, the oops is
> > reproducibly in v4l2_subdev_get_try_crop(), called via
> > imgu_subdev_set_selection().
> > 
> > To fix this, allocate the active_state member via
> > v4l2_subdev_init_finalize().
> 
> This is not a correct fix. Sakari has sent (and maybe pushed?) this:
> 
> https://lore.kernel.org/all/20220825190351.3241444-1-sakari.ailus@linux.intel.com/

This being said, it would be nice to convert drivers to use the active
state, but that's not related to fixing this issue.

> > Link: https://github.com/linux-surface/linux-surface/issues/907
> > Fixes: 3cc7a4bbc381 ("media: subdev: pass also the active state to subdevs from ioctls")
> > Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> > ---
> >   drivers/staging/media/ipu3/ipu3-v4l2.c | 12 +++++++++++-
> >   1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> > index d1c539cefba8..84ab98ba9a2e 100644
> > --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> > +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> > @@ -1093,10 +1093,18 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
> >   			"failed to create subdev v4l2 ctrl with err %d", r);
> >   		goto fail_subdev;
> >   	}
> > +
> > +	r = v4l2_subdev_init_finalize(&imgu_sd->subdev);
> > +	if (r) {
> > +		dev_err(&imgu->pci_dev->dev,
> > +			"failed to initialize subdev (%d)\n", r);
> > +		goto fail_subdev;
> > +	}
> > +
> >   	r = v4l2_device_register_subdev(&imgu->v4l2_dev, &imgu_sd->subdev);
> >   	if (r) {
> >   		dev_err(&imgu->pci_dev->dev,
> > -			"failed initialize subdev (%d)\n", r);
> > +			"failed to register subdev (%d)\n", r);
> >   		goto fail_subdev;
> >   	}
> >   
> > @@ -1104,6 +1112,7 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
> >   	return 0;
> >   
> >   fail_subdev:
> > +	v4l2_subdev_cleanup(&imgu_sd->subdev);
> >   	v4l2_ctrl_handler_free(imgu_sd->subdev.ctrl_handler);
> >   	media_entity_cleanup(&imgu_sd->subdev.entity);
> >   
> > @@ -1275,6 +1284,7 @@ static void imgu_v4l2_subdev_cleanup(struct imgu_device *imgu, unsigned int i)
> >   	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[i];
> >   
> >   	v4l2_device_unregister_subdev(&imgu_pipe->imgu_sd.subdev);
> > +	v4l2_subdev_cleanup(&imgu_pipe->imgu_sd.subdev);
> >   	v4l2_ctrl_handler_free(imgu_pipe->imgu_sd.subdev.ctrl_handler);
> >   	media_entity_cleanup(&imgu_pipe->imgu_sd.subdev.entity);
> >   }
> 

-- 
Regards,

Laurent Pinchart
