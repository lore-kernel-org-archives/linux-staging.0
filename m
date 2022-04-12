Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ECA33C0;
	Tue, 12 Apr 2022 20:02:26 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id c199so12964136qkg.4;
        Tue, 12 Apr 2022 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mimD/qtnByUgFcn0cB8f/8cZYicL+2+zJ6czmpHJvo8=;
        b=dN9a2qERqiJodagN+p0JnNAnJvIgdnzwuskkMdZQEoyL0RKjcsg4pduh6bJ+vxWXmL
         4YYy4nxhiPsFu+iA6AY1DHtyaK2SDu/KflTieqjkOZhwPDORcpVizXPeN8YsEWWqiYSI
         6cgIfpbtNTNZ0yBZujSg+Jd3ErwoV1Y14JXtrLp5TG+AVp5+hyHfo/q29i6H6HiuTM6w
         4X0uQ24bc2K28beKap8u6Z17KguGMhvNMteYzpOgnoXWkAeptXGj/U7FM4AuihCb6VOL
         qNrKbE2H5DcecADJUweUumwm8RTD8CRLzxRycQgDKMrJa6EOOi2pGYLy1raVFOlu69PN
         Lizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mimD/qtnByUgFcn0cB8f/8cZYicL+2+zJ6czmpHJvo8=;
        b=HxSaO3DpG8ilRv8e/XX1PU1HQClkM7EWFn5oPjH2E5R7qU6RFx4b5C6W020uN0qYGr
         +CNSny33gYrfWx8XMbBnimF+Ub0ZlFHrlfZ3YBP1h92dK8+e55kqF1DXooGD51gzMNn+
         jRtwdswojBbf+4Oggl1K9ex6QtQv9wHyy1h51P/It8Kqf7ZM9Bo8PbjEEk6PhQnSTmNE
         0B4B6llgfUXcqaVoOzggZ+P93/7JGwMw+Nt/ZotBDWPUDfpdpyhRD8NErKM+ucVyRXqO
         kNudCGLq/9QZ22crpfYqOcZuzIgvE2VUwKzq9wIv64OGeUKM1N1ODYbU1r98LYeXIlOu
         Y8OA==
X-Gm-Message-State: AOAM532F1cDFAXi8O4wtsYcGgsIgw84Xm2gs8+qa3/RyLmbxpg9N2Y29
	JqfXk48aq99URslbDMkbMzbgDuZAKua4EXjO
X-Google-Smtp-Source: ABdhPJzTudbgBWQMI8u2i3+eIL6rcXdJ+Ov/vuzIQE0BpF8XVhH5HJ5VKEoxqgZy1WhUQnQKZiGE7Q==
X-Received: by 2002:a05:620a:4445:b0:67e:aaab:837e with SMTP id w5-20020a05620a444500b0067eaaab837emr4191436qkp.403.1649793745572;
        Tue, 12 Apr 2022 13:02:25 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id d5-20020a05620a166500b0069c02f6f056sm6253589qko.19.2022.04.12.13.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 13:02:24 -0700 (PDT)
Date: Tue, 12 Apr 2022 16:02:20 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH 2/2] staging: greybus: remove return in an empty void
 function
Message-ID: <20220412200220.GA2963810@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649712572.git.jhpark1013@gmail.com>
 <eaf51ac31d264179298cb24c91f05a14e3651bda.1649712572.git.jhpark1013@gmail.com>
 <alpine.DEB.2.22.394.2204120901380.3122@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204120901380.3122@hadrien>

On Tue, Apr 12, 2022 at 09:04:08AM +0200, Julia Lawall wrote:
> 
> 
> On Mon, 11 Apr 2022, Jaehee Park wrote:
> 
> > Issue found by checkpatch:
> > WARNING: void function return statements are not generally useful
> 
> Even for a simple change, it wouldbe better to follow the model that the
> subject line should concisely orient the reader (eg "remove unneeded
> return") and the log message should give a more complete description.
> Simply repeating what checkpatch tells you is rarely a good idea.  It says
> what the problem is in a general way, whereas you should be explaining the
> reasoning behind your fix in a specific case.  Here you could say that an
> empty function with void return type does not need an explicit return, and
> that the problem was detected with checkpatch.
> 
> julia
> 

Thank you for your edits. I've submitted version 2 of the patchset just
now.

> >
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > ---
> >  drivers/staging/greybus/audio_codec.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> > index 0f50d1e51e2c..3e3a16568def 100644
> > --- a/drivers/staging/greybus/audio_codec.c
> > +++ b/drivers/staging/greybus/audio_codec.c
> > @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
> >  static void gbcodec_remove(struct snd_soc_component *comp)
> >  {
> >  	/* Empty function for now */
> > -	return;
> >  }
> >
> >  static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
> > --
> > 2.25.1
> >
> >
> >
