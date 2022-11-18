Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48E8F65
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 17:22:29 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id f18so14682374ejz.5
        for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 09:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tGlHMVAixSLQ2/vSJKtVJw1fS47SH8DBN8tgE+O+1Dw=;
        b=OjlT+FkV3ubQznoPIsACkVupwz5M/BwNXgn9nTXGpJQCMt858j95Bbt5uaocOT6zFt
         18FjSBC/7LGXjKqU37PeyaBP9NipzTpWgsr41BiQfe9ZyGXXRyBSHqgyYsSt1UU+7aWg
         HqR+3cay+O13G9V+9VbC+9DNlTn3vMb90kT+QHVobVy2PLUjD17zi5uyZdNGFMP48Y9B
         qMTqGh9BPsEmeWB3pG+MoVMwFq4wK7M6gTbpU7CKznn87Lnta2WnpAL4A0/8UdnZ+u2T
         ooxthkH0fMlCsUozhubGVi1WCF9tF6z6+T+sAZ572CXMThA0V70d2P7JerZNUPCHFf0T
         r0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGlHMVAixSLQ2/vSJKtVJw1fS47SH8DBN8tgE+O+1Dw=;
        b=aBatbRSHq6uOArNYWrV7olPlzBs3YryE66nn2hk9SkxY6748HEjB+pUkcE8UtVAM0Q
         exg8N++gETt6ozh4c6DCd9zPWfSCf4NoLxpWVKSSaJOAavQeNtece9clqw/m+yGJ95DJ
         vVepBw2UCFtmploPw19Vqkmr0s7SblN6mgGDGQ+xPlMRQD9fxRvo6dcytpU8IDlUSluF
         PtYT5ZWkqICowmfaBc5wkGIKrCzHV1JIPsAMICutB5AhwtASFj8eqjftuNSwqbhhBWOL
         ulN++8ibJ9QujN1ae/GAglrTrmRlmtr9IczHIw6QarjnRbLRlhSfzCEt/z8F1am9UBMv
         Ya0Q==
X-Gm-Message-State: ANoB5pllipAYD1cIIenzSW7qQlybDhPd0RgcHM9KO25I5b6SZ8rpQSjs
	VYhtRSUBfATCLzbT+wswiY2+7Lcwd+ZHl4ykMV/U8Q==
X-Google-Smtp-Source: AA0mqf5RTDYL95yJLINf+DHoUvPAbKBKfzSUkMLfE676P01sHCik4FCCjPl1FZtbx4cSowoLTeqPlB3L+yyX8On2pds=
X-Received: by 2002:a17:906:9246:b0:7af:da0:aebe with SMTP id
 c6-20020a170906924600b007af0da0aebemr6761187ejx.723.1668792147755; Fri, 18
 Nov 2022 09:22:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221118084244.199909-1-umang.jain@ideasonboard.com>
 <20221118084244.199909-3-umang.jain@ideasonboard.com> <166876741790.50677.17305359640652054680@Monstersaurus>
In-Reply-To: <166876741790.50677.17305359640652054680@Monstersaurus>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Nov 2022 17:22:12 +0000
Message-ID: <CAPY8ntDMM-0S_gz5A+4rWQ7M2gmUMeOYRW__cr8v=afo5fM_sA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] vc04_services: mmal-vchiq: Use bool for vchiq_mmal_component.in_use
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Dan Carpenter <error27@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Umang & Kieran

On Fri, 18 Nov 2022 at 10:30, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Umang Jain (2022-11-18 08:42:43)
> > In commit 7967656ffbfa ("coding-style: Clarify the expectations around
> > bool") the check to dis-allow bool structure members was removed from
> > checkpatch.pl. It promotes bool structure members to store boolean
> > values. This enhances code readability.
>
> This only talks about 7967656ffbfa as I can interpret it.  A sentence
> here describing what we're going to do about it in /this/ patch would be
> clearer as a second paragraph:
>
> """
> Convert the remaining bit-field storage for 'in-use' to a bool and use
> it accordingly.
> """
>
> But that's trivial and not worth a v3 specifically. (unless anyone
> applying this wants to add it).

Totally agree.

> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> >
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 6 +++---
> >  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > index 4abb6178cb9f..294b184d4a49 100644
> > --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > @@ -1648,7 +1648,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
> >         for (idx = 0; idx < VCHIQ_MMAL_MAX_COMPONENTS; idx++) {
> >                 if (!instance->component[idx].in_use) {
> >                         component = &instance->component[idx];
> > -                       component->in_use = 1;
> > +                       component->in_use = true;
> >                         break;
> >                 }
> >         }
> > @@ -1724,7 +1724,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
> >         destroy_component(instance, component);
> >  unlock:
> >         if (component)
> > -               component->in_use = 0;
> > +               component->in_use = false;
> >         mutex_unlock(&instance->vchiq_mutex);
> >
> >         return ret;
> > @@ -1747,7 +1747,7 @@ int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
> >
> >         ret = destroy_component(instance, component);
> >
> > -       component->in_use = 0;
> > +       component->in_use = false;
> >
> >         mutex_unlock(&instance->vchiq_mutex);
> >
> > diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> > index 6d984cf5a83a..09f030919d4e 100644
> > --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> > +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> > @@ -82,7 +82,7 @@ struct vchiq_mmal_port {
> >  };
> >
> >  struct vchiq_mmal_component {
> > -       u32 in_use:1;
> > +       bool in_use;
> >         bool enabled;
> >         u32 handle;  /* VideoCore handle for component */
> >         u32 inputs;  /* Number of input ports */
> > --
> > 2.38.1
> >
