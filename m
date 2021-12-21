Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD072C9D
	for <linux-staging@lists.linux.dev>; Tue, 21 Dec 2021 20:43:44 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id n15so347614qta.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Dec 2021 12:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QKiPZyIkoZhEjEDCqZ1DtyFgXU8NshvCITLb8EMLKaI=;
        b=CYFfDlLIU66KdQFysHb+R2290xq5I394wVK4oN+LvtUSA5Z28tPjPcdmiak3N9lX0r
         O2TKLX75rMy8ohumQRS6S3tRnIqzeAsVKNXfSYxbSJ1I8/MOOXOJ6lKmutSX4GXEDqvY
         4f+dqalG18NBriuneMdo+HwNPGcu2uoNivpfbiJJVbAooL/fFfPlSAXhgqAGH/mo/PFH
         mbspLQ9LjDFiarjVTkmEEEKvgNcFcsDGnNHlL5Y92rVa/y3TYV1/APeSqZT369sBmkiP
         Vh8ltOh/k+dAara+WkhVsdxNbmImSrukp7c4Sc4UccmwnFtrTXtkjkbfEDa3kj4CHybv
         W0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QKiPZyIkoZhEjEDCqZ1DtyFgXU8NshvCITLb8EMLKaI=;
        b=sCTvDFJqIzEbR3XXho6XYR56fh8vbqcnocXmIv315JelJ6xw7Ex/vPOgTF1PEWNMVG
         Jr0ojqgGfPR2o0sy+o/eVC7ChklS2gYaR1hdXrr8pTpmgksKbXq91OU9FVJ+JjltF7tD
         8+ypX8dmU0M1pFagJ4yOZxwH1SVh2sUoG4mSktHYGCvINUH7LqVIKqhdBlXhtHHlcCRz
         dxhHLzD+9uILAdG8lySqOLKCEM9zsQSYTsHS7V3CPCsKu5HHhAgu2T3LrnbnDjfYKvcu
         2R3ucJeM9vWV/itV3IgO2RPLXHOWeImUCDqcT1vpQjwNpE8LFQ87qfit0Pqpx+WTwKjA
         DQ8Q==
X-Gm-Message-State: AOAM531SsyTNinviKzL/dsQuWss0/HXk6Kq3bu2EBuJBhyJgSwXT/wTD
	ASpjZX/36I91QGVdPLYcFMs=
X-Google-Smtp-Source: ABdhPJzGvtMrKNtgAJPQ/tiMnVAROthZ8TxUxb1fUIMtfUksE/JZwFkkX3E0wt1YNg204OfGICLP/Q==
X-Received: by 2002:a05:622a:3cc:: with SMTP id k12mr3784308qtx.412.1640119423538;
        Tue, 21 Dec 2021 12:43:43 -0800 (PST)
Received: from debianG ([190.191.20.243])
        by smtp.gmail.com with ESMTPSA id y10sm37914qkp.128.2021.12.21.12.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 12:43:43 -0800 (PST)
Date: Tue, 21 Dec 2021 17:43:42 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, nsaenz@kernel.org, f.fainelli@gmail.com,
	rjui@broadcom.com, sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	juerg.haefliger@canonical.com, rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com, stefan.wahren@i2se.com,
	unixbhaskar@gmail.com, mitaliborkar810@gmail.com,
	phil@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: Re: [PATCH 3/4] staging: vc04_services: avoid the use of typedef for
 function pointers
Message-ID: <YcI8fiPib2VNSO2w@debianG>
References: <cover.1639858361.git.gascoar@gmail.com>
 <a218f1bd092d874ccd96e3a94c1174ad41fffebc.1639858361.git.gascoar@gmail.com>
 <YcFyjXOfGz9GwPAD@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcFyjXOfGz9GwPAD@kroah.com>

On Tue, Dec 21, 2021 at 07:22:05AM +0100, Greg KH wrote:
> On Mon, Dec 20, 2021 at 06:29:13PM -0300, Gaston Gonzalez wrote:
> > Replace the function pointer typedef vchiq_mmal_buffer_cb with
> > equivalent declaration to better align with the linux kernel coding
> > style.
> > 
> > While at it, realignments were done in some touched lines.
> > 
> > Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> > ---
> >  .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 24 +++++++++----------
> >  .../vc04_services/vchiq-mmal/mmal-vchiq.h     | 13 +++++-----
> >  2 files changed, 18 insertions(+), 19 deletions(-)
> 
> Same subject line as patch 1/4 :(
> 
> > 
> > diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > index 76d3f0399964..54e5ce245ae7 100644
> > --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > @@ -269,10 +269,10 @@ static void buffer_work_cb(struct work_struct *work)
> >  
> >  	atomic_dec(&msg_context->u.bulk.port->buffers_with_vpu);
> >  
> > -	msg_context->u.bulk.port->buffer_cb(msg_context->u.bulk.instance,
> > -					    msg_context->u.bulk.port,
> > -					    msg_context->u.bulk.status,
> > -					    msg_context->u.bulk.buffer);
> > +	msg_context->u.bulk.port->vchiq_mmal_buffer_cb(msg_context->u.bulk.instance,
> > +						       msg_context->u.bulk.port,
> > +						       msg_context->u.bulk.status,
> > +						       msg_context->u.bulk.buffer);
> >  }
> >  
> >  /* workqueue scheduled callback to handle receiving buffers
> > @@ -1327,13 +1327,12 @@ static int port_disable(struct vchiq_mmal_instance *instance,
> >  			mmalbuf = list_entry(buf_head, struct mmal_buffer,
> >  					     list);
> >  			list_del(buf_head);
> > -			if (port->buffer_cb) {
> > +			if (port->vchiq_mmal_buffer_cb) {
> >  				mmalbuf->length = 0;
> >  				mmalbuf->mmal_flags = 0;
> >  				mmalbuf->dts = MMAL_TIME_UNKNOWN;
> >  				mmalbuf->pts = MMAL_TIME_UNKNOWN;
> > -				port->buffer_cb(instance,
> > -						port, 0, mmalbuf);
> > +				port->vchiq_mmal_buffer_cb(instance, port, 0, mmalbuf);
> >  			}
> >  		}
> >  
> > @@ -1363,7 +1362,7 @@ static int port_enable(struct vchiq_mmal_instance *instance,
> >  
> >  	port->enabled = 1;
> >  
> > -	if (port->buffer_cb) {
> > +	if (port->vchiq_mmal_buffer_cb) {
> >  		/* send buffer headers to videocore */
> >  		hdr_count = 1;
> >  		list_for_each_safe(buf_head, q, &port->buffers) {
> > @@ -1454,9 +1453,10 @@ EXPORT_SYMBOL_GPL(vchiq_mmal_port_parameter_get);
> >   * enables a port and queues buffers for satisfying callbacks if we
> >   * provide a callback handler
> >   */
> > -int vchiq_mmal_port_enable(struct vchiq_mmal_instance *instance,
> > -			   struct vchiq_mmal_port *port,
> > -			   vchiq_mmal_buffer_cb buffer_cb)
> > +int vchiq_mmal_port_enable(struct vchiq_mmal_instance *instance, struct vchiq_mmal_port *port,
> > +			   void (*vchiq_mmal_buffer_cb)(struct vchiq_mmal_instance  *instance,
> > +							struct vchiq_mmal_port *port, int status,
> > +							struct mmal_buffer *buffer))
> >  {
> >  	int ret;
> >  
> > @@ -1469,7 +1469,7 @@ int vchiq_mmal_port_enable(struct vchiq_mmal_instance *instance,
> >  		goto unlock;
> >  	}
> >  
> > -	port->buffer_cb = buffer_cb;
> > +	port->vchiq_mmal_buffer_cb = vchiq_mmal_buffer_cb;
> >  
> >  	ret = port_enable(instance, port);
> >  
> > diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> > index 1dc81ecf9268..39615ce6584a 100644
> > --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> > +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> > @@ -42,11 +42,6 @@ struct vchiq_mmal_port_buffer {
> >  
> >  struct vchiq_mmal_port;
> >  
> > -typedef void (*vchiq_mmal_buffer_cb)(
> > -		struct vchiq_mmal_instance  *instance,
> > -		struct vchiq_mmal_port *port,
> > -		int status, struct mmal_buffer *buffer);
> > -
> >  struct vchiq_mmal_port {
> >  	u32 enabled:1;
> >  	u32 handle;
> > @@ -76,7 +71,9 @@ struct vchiq_mmal_port {
> >  	/* Count of buffers the VPU has yet to return */
> >  	atomic_t buffers_with_vpu;
> >  	/* callback on buffer completion */
> > -	vchiq_mmal_buffer_cb buffer_cb;
> > +	void (*vchiq_mmal_buffer_cb)(struct vchiq_mmal_instance  *instance,
> > +				     struct vchiq_mmal_port *port, int status,
> > +				     struct mmal_buffer *buffer);
> 
> There is no need to rename the function pointer at all.
> 
> >  	/* callback context */
> >  	void *cb_ctx;
> >  };
> > @@ -126,7 +123,9 @@ int vchiq_mmal_component_disable(
> >  int vchiq_mmal_port_enable(
> >  		struct vchiq_mmal_instance *instance,
> >  		struct vchiq_mmal_port *port,
> > -		vchiq_mmal_buffer_cb buffer_cb);
> > +		void (*vchiq_mmal_buffer_cb)(struct vchiq_mmal_instance  *instance,
> > +					     struct vchiq_mmal_port *port, int status,
> > +					     struct mmal_buffer *buffer));
> >  
> 
> Here is where using a typedef is ok.  Again, typedefs for function
> pointers is normal and keeps code smaller and easier to follow.
>

Ok, I had my doubts about this one just because that lines.

Will drop it.

thanks,

Gaston


> thanks,
> 
> greg k-h
