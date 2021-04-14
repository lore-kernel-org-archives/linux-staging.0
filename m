Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7075971
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:55:47 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id h15so632980qvu.4
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OeVselHKPVLOZzCiq1K08wuQKbTOdMwo4rrb+WFfGok=;
        b=lFCnI3hp3u4Er12GAIRoPmvUADqyOluplFCmLhhcA1pMyCvN8uXDqqBRLRFOlidy7C
         CJZruXSU4BLU9OqaNUUpSFZurnqPU5hb/H695wM4wPWxe6MkllA7tlVmkz7gromzUMb/
         C728BhxLQdAD5I8vsVv+axhY1MfsjVfTftkTsXav+T7xzEUJQN6snq7WfjJRRMQbfXJD
         2FVfhEnrjQ04jyjJIWRYKKG3gACrKqjrxM3USPSAg3wU/8fYMnVJIeynLmhHqs8q+zO4
         Iev9h6wXtUPn+B2m5lnubTvZfyC5EoyqniLu2lldL0eMiy0PLD2W98+MxtI9nAc8LH9Z
         1x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OeVselHKPVLOZzCiq1K08wuQKbTOdMwo4rrb+WFfGok=;
        b=P72PzWTVL5KG4qKh2ys/e8aO0yn0XkI3pKi4NN7deNHKziTDQNp7CuMmI8ViOz5xE7
         7CIcVOMZ3MF5ai/Scsxankf21hsQ3jUcjqYKLEMH3sHiI8eixEU5oLgK//Z4c/kTaoW6
         NJFIgxvGq8zDvcQafVUF6ZZjElCXdplfFyfh9GmvHThCPg9TZnaTYDPkwTrSH6IjY6HY
         CuYH608n4TEgR8nQ80D/K3niM5sLEp0tqjaI2xtY3xxpstSfkz821HOkydMCYckGf5jg
         jZHSmq8UAGDVaDZJ4DV3hF7RIQYA3FkQFmKDvB7q7QJuAh6TsxKeNh61chZveKGqEx1s
         qREg==
X-Gm-Message-State: AOAM533TLcQVuCdU3kZ3D6jNQdy3cqhrxLlA+fG//PfBdnP3t/vEdjEP
	yNLwbztDPAbOb+yYtGygeYuu1h3MoTmpxf4X
X-Google-Smtp-Source: ABdhPJxPjdO48mAHhc0Yfeh7RAPvqjOKezklCtvAm9WAh/pkkNf2x4r2npZxG766uML6g4JZzR6N+A==
X-Received: by 2002:a05:6214:f27:: with SMTP id iw7mr40641329qvb.50.1618426546599;
        Wed, 14 Apr 2021 11:55:46 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:66e0:478a:8197:7396? ([2001:1284:f016:a037:66e0:478a:8197:7396])
        by smtp.gmail.com with ESMTPSA id x82sm259362qkb.0.2021.04.14.11.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:55:46 -0700 (PDT)
Message-ID: <fae832b2555f1d971b45fcdfe34952aa03a42e4d.camel@gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: pci: Format multi-line
 comments according to coding-style in file atomisp_cmd.c
From: ascordeiro <alinesantanacordeiro@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy-kernel@googlegroups.com
Date: Wed, 14 Apr 2021 15:55:42 -0300
In-Reply-To: <20210414183325.GD3@paasikivi.fi.intel.com>
References: <20210414182755.GA2799@focaruja>
	 <20210414183325.GD3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Em qua, 2021-04-14 às 21:33 +0300, Sakari Ailus escreveu:
> Hi Aline,
> 
> Thanks for the patch.
> 
> On Wed, Apr 14, 2021 at 03:27:55PM -0300, Aline Santana Cordeiro
> wrote:
> > Format multi-line comments according to the coding-style.
> > Issue detected by checkpatch.pl.
> > 
> > Signed-off-by: Aline Santana Cordeiro <
> > alinesantanacordeiro@gmail.com>
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 109
> > ++++++++++++++----------
> >  1 file changed, 65 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > index 592ea99..6113785 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > @@ -67,7 +67,8 @@
> >   * At 15fps this means 133ms. We set the timeout a bit longer.
> >   * Each flash driver is supposed to set its own timeout, but
> >   * just in case someone else changed the timeout, we set it
> > - * here to make sure we don't damage the flash hardware. */
> > + * here to make sure we don't damage the flash hardware.
> > + */
> >  #define FLASH_TIMEOUT 800 /* ms */
> >  
> >  union host {
> > @@ -562,7 +563,8 @@ irqreturn_t atomisp_isr(int irq, void *dev)
> >                          * and driver needs to keep old
> > sequence_temp value.
> >                          * NOTE: There is assumption here that ISP
> > will not
> >                          * start processing next frame from sensor
> > before old
> > -                        * one is completely done. */
> > +                        * one is completely done.
> > +                        */
> >                         if (atomic_read(&asd->sequence) ==
> > atomic_read(
> >                                 &asd->sequence_temp))
> >                                 atomic_set(&asd->sequence_temp,
> > @@ -1247,7 +1249,8 @@ void atomisp_buf_done(struct
> > atomisp_sub_device *asd, int error,
> >  
> >         if (IS_ISP2401) {
> >                 /* If there are no buffers queued then
> 
> This should begin with:
> 
>                 /*
>                  *
> 
> And the same for the rest. Apart from this the patch seems fine.
> 
Hi Sakari,

I'm going to send a v2 correcting all the multi-line comments that are
not beginning like this.

Besides, there are single line comments with different styles, a few
like this:

case 1:				/* comment */

and the other like this:
				/*
case2:				 * comment
 				 */

Should I standardize these ones to the first case?

Thank you for yout attention,
Aline

