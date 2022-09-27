Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC8C7F4
	for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 11:39:16 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id a41so12800072edf.4
        for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=uRa4L6FmBGoQ/fuxMcQ0fTqu+OtJ5tEYafCVS3oKorQ=;
        b=a4xKEE+x4j+cTFBo21aXzrZsi8+dEKUl70dA0eKPOMKyICUQDGsN4uN5i9zBWIQffP
         sMvH3Dql9CvcEen+wLDCoo/RDc7dWyoz+hYVrKO5+SRRI0CYt+7E9IW4PvAa8Wb2VzBa
         2wSEpxzHa0zDZAInxCVBfzpPo7WnPsQoykDi/WjDeeU7qKZM/rZr7aG6OR8r98X+cjfJ
         nE8+tp6jYy7u8GqHIC5q/YI6RObkiMUqiL+dUQ9d9CG1e/cHIA7a58os8JgoLOdfkiQZ
         2ZZT2+7MpOII5FuOP1V9Y796hCCWZ/l/ieyePlZrncMIH3EEunAJTuc2t6agC7LZRes2
         pCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=uRa4L6FmBGoQ/fuxMcQ0fTqu+OtJ5tEYafCVS3oKorQ=;
        b=dATBm2jafHFanz410qwURwXpREM3aWWon5e6OHPD91tyROodCwyQc+9pdKmTIglw9t
         PYnp81uiJ7e7zXD8DdH/8xQgfFUnlOAfhRyXJWRuic3MbAJyCYCUwoBuIIUUPP3EOKAT
         jElBumankFCcoiFVXDDrzhR3OG2uMdUvYMk2zwWFPZPCPASwN+ILY6zCj1ARBxOyA45t
         m/9b5AGjby7BVT0fAvJLuiW6a0hmipt9cofcawhlnyJ6eB4KVL5sTFVDkWxB91/P4n29
         QszTJOHi5H05rZTPFZoEJ5faoBiNiMUBvNAv0nT+/eVdIiEUmpuP+xfB6ROHj6jpp+Ay
         8NLA==
X-Gm-Message-State: ACrzQf3gDRNf6dwwxbSAPMCMeeFyWU6VRF11hyP8c1xyEJ32I4FWL2Xn
	U13unJzBNscx0fJ6VjLZ/Uh4zacn0Uo=
X-Google-Smtp-Source: AMsMyM6Ailo1WcZmnPwYNhoFtQjNWQc7xJ+gf018zHGLr/5yc/3AOrxlGTXzMjGoqwHVE019lUr2gw==
X-Received: by 2002:a05:6402:1d54:b0:44e:a683:d041 with SMTP id dz20-20020a0564021d5400b0044ea683d041mr27301171edb.411.1664278755079;
        Tue, 27 Sep 2022 04:39:15 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-158.ip.prioritytelecom.net. [217.105.46.158])
        by smtp.gmail.com with ESMTPSA id o23-20020a170906769700b0073ddff7e432sm676787ejm.14.2022.09.27.04.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 04:39:14 -0700 (PDT)
Date: Tue, 27 Sep 2022 13:39:13 +0200
From: Nam Cao <namcaov@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: forest@alittletooquiet.net, gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC PATCH 3/5] staging: vt6655: split device_alloc_rx_buf
Message-ID: <20220927113913.GB10468@nam-dell>
References: <cover.1663273218.git.namcaov@gmail.com>
 <311eaa7dabe12d0baeb0af6f85c2b43b20b230a3.1663273218.git.namcaov@gmail.com>
 <Yyg4BTymed1fEzQx@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yyg4BTymed1fEzQx@kadam>

On Mon, Sep 19, 2022 at 12:36:05PM +0300, Dan Carpenter wrote:
> On Thu, Sep 15, 2022 at 10:29:34PM +0200, Nam Cao wrote:
> > The function device_alloc_rx_buf does 2 things: allocating rx buffer
> > and initializing the rx descriptor's values. Split this function into
> > two, with each does one job.
> > 
> > This split is preparation for implementing correct out-of-memory error
> > handling.
> > 
> > Signed-off-by: Nam Cao <namcaov@gmail.com>
> > ---
> >  drivers/staging/vt6655/device_main.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> > index 79325a693857..27fe28156257 100644
> > --- a/drivers/staging/vt6655/device_main.c
> > +++ b/drivers/staging/vt6655/device_main.c
> > @@ -133,6 +133,7 @@ static int device_init_td1_ring(struct vnt_private *priv);
> >  static int  device_rx_srv(struct vnt_private *priv, unsigned int idx);
> >  static int  device_tx_srv(struct vnt_private *priv, unsigned int idx);
> >  static bool device_alloc_rx_buf(struct vnt_private *, struct vnt_rx_desc *);
> > +static void device_init_rx_desc(struct vnt_private *priv, struct vnt_rx_desc *rd);
> >  static void device_free_rx_buf(struct vnt_private *priv,
> >  			       struct vnt_rx_desc *rd);
> >  static void device_init_registers(struct vnt_private *priv);
> > @@ -615,6 +616,8 @@ static int device_init_rd0_ring(struct vnt_private *priv)
> >  			dev_err(&priv->pcid->dev, "can not alloc rx bufs\n");
> >  			ret = -ENOMEM;
> >  			goto err_free_rd;
> > +		} else {
> > +			device_init_rx_desc(priv, desc);
> >  		}
> 
> None of these else statements make sense.  It should be:
> 
> 		ret = -ENOMEM;
> 		goto err_free_rd;
> 	}
> 
> 	device_init_rx_desc(priv, desc);
> 	desc->next = &priv->aRD0Ring[(i + 1) % priv->opts.rx_descs0];

That does look better, will be changed.

> I haven't reviewed the patch totally.  I don't understand why it's doing
> this here instead of at the end.  But then I don't understand why it
> needs to be in a separate function at all.
> 
> This patch does not make sense.  The commit description says that this
> is a "preparation" patch.  Maybe fold it in with patch 5?  The rule is
> "one thing per patch" not "half a thing per patch".

I thought splitting it like this would make it easier to review. But if
these preparation patches are not welcomed, I will squash them and
resend.

Thank you for spending time reviewing the patches.

Best regards,
Nam
