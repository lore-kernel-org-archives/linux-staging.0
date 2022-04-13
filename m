Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9B823CA;
	Wed, 13 Apr 2022 04:43:39 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id i14so754306qvk.13;
        Tue, 12 Apr 2022 21:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gnkQTImgRI33ZK9OLchOQ7aSmw/PhVSRrhu3fSy1iZg=;
        b=ZbhMUPy/EyrDGrM+JVic57mbguSyqn8G8Rwc7zn8E61maWR3oiagoyf8rAjX/7Uozl
         Cd1EiMK4VDMIbXIUwW6x8t+LF8rsPa0TN5D7EfHBT/Tz//MiFlPESnttplGTxEP+ywUf
         7RzqyzMDpLCJ0Ljh+ygk7+RpUeYxt5FS7p+fxmP0cjRhdwcvN4o2eqL8LlwN/jg28Epc
         tI0xiSnl0uPkK5uJdeukoRYwdcleTChcRrpCFR2hMyLgKuc8S9rsnf51euicPsxb6GGQ
         Rqz6FuiNXgSz8/d2WXTpgKfqZ7syScZWjjopuL0Ddz+VsKc6FpWg1y2htQww0gPUurNE
         mvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gnkQTImgRI33ZK9OLchOQ7aSmw/PhVSRrhu3fSy1iZg=;
        b=rdcOaiW15wxI/xRdI4RxYTibkGPcR7mWkUHoncWvhJbukv9RAJ5TfVdER93qkWLyaW
         sZvklxUGljlY+CcE9Jg+NUrCrpZm+P9e3Zb6gHE7K9l7gsE+c9iRwXGUzhR5olXBx7LJ
         ojRICaLxULvLTqF+Um12h4iJnMFHxlQw/qLBSaQt5gLZlCe9P2NjozJ5BVbQ/1JoNw5K
         zEBSdMyMNeINxzO2SVjvHWpYGPaeE1W67jkzbrPpUru/ke31BF6LRWrJZfD/p6ItB4d4
         E2y/9/eUSzGcUWUAKlyK2MsU9TEurcp0LjqdZqQJyYNo9YQcb2nAe44VanG5KeTk3/gX
         XPBw==
X-Gm-Message-State: AOAM533Rp2I/t1x7T0eY3+YUq7JhlKP8sajGpy6oNFul3y4G354oy2wf
	KJsQJqNa1QqkymMTb1qB6yk=
X-Google-Smtp-Source: ABdhPJxs+8h3Jgf+36tQgod98PKxWlqrNNYr9BXOcfCTtP13Z6w5QMYbD22papvqA3pMx8K6v0z7Mg==
X-Received: by 2002:ad4:4ee3:0:b0:444:3496:67cb with SMTP id dv3-20020ad44ee3000000b00444349667cbmr15826834qvb.91.1649825018242;
        Tue, 12 Apr 2022 21:43:38 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50fb:900e:5e57:caff:f44b:33f4])
        by smtp.gmail.com with ESMTPSA id z8-20020ac87f88000000b002e1cecad0e4sm28423346qtj.33.2022.04.12.21.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 21:43:37 -0700 (PDT)
Date: Wed, 13 Apr 2022 00:43:34 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2 2/2] staging: greybus: remove unneeded return
Message-ID: <20220413044334.GA3357359@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649793138.git.jhpark1013@gmail.com>
 <d4d01ecdabc492e52a3decebf165d1f584f3b3bf.1649793138.git.jhpark1013@gmail.com>
 <a509099e-2b19-7a27-693c-b418bd2f7b28@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a509099e-2b19-7a27-693c-b418bd2f7b28@ieee.org>

On Tue, Apr 12, 2022 at 03:35:04PM -0500, Alex Elder wrote:
> On 4/12/22 2:59 PM, Jaehee Park wrote:
> > An empty function with void return type does not need an explicit
> > return. Issue found by checkpatch.
> > 
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> 
> Dan's suggestion here was to simply remove this function
> entirely.  It is only used as the ->remove callback
> for the soc_codec_dev_gbaudio structure.
> 
> You can see that soc_codec_dev_gbaudio is only used in the
> call to devm_snd_soc_register_component() near the end of
> "audio_codec.c".  When a sound component is registered
> that way, the ->remove callback is optional.  You can see
> that because the only place in "sound/soc/soc-component.c"
> that it is referenced is snd_soc_component_remove() (as
> Dan said), and it only calls the function if it the pointer
> is non-null.  Allowing null function pointers in places
> like this. to allow them to be optionally omitted is not
> an uncommon pattern you'll see in the kernel.
> 
> Anyway, please don't just add another small patch to remove
> the function.  Just replace *this* patch with one that
> removes the function, and omits the assignment if its
> address to soc_codec_dev_gbaudio->remove.
> 
> 					-Alex

Hi Alex, Thank you for explaining where the functions are called from!
It makes a lot more sense now. I've used your explanation for my patch
log. Please let me know if I'm misunderstanding things. I've sent patch 
v3 for your review. The first patch (typo patch) already has your 
"review-by" -- thank you for the advice.
 
Thanks,
Jaehee
> 
> > ---
> >   drivers/staging/greybus/audio_codec.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> > index 0f50d1e51e2c..3e3a16568def 100644
> > --- a/drivers/staging/greybus/audio_codec.c
> > +++ b/drivers/staging/greybus/audio_codec.c
> > @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
> >   static void gbcodec_remove(struct snd_soc_component *comp)
> >   {
> >   	/* Empty function for now */
> > -	return;
> >   }
> >   static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
> 
