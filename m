Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37332C81
	for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 13:40:50 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id bk7so2155826qkb.13
        for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=fOYbDlxyEHO5mkyCfKHOpCUjsLY9l97TCTcV9KNabAI=;
        b=XEMDZnEQl+Zq4wdmUGLLkjtYBSRaidWKvmxJuA15ySkjsui1JPqSa1ZWzleiUodnS4
         4kEGOVz0bH/AxD0L3s6/3RIDu4RfcqE2LLDhVlB6gfyzxNSPDLjn8nKwor3ZW4B2trQ4
         bqYp7O2eM/tWm58CSJcTcb+uzkk6SVgv7INyUW35WUFBcOYiq7WIEzKL+hjzXHiCejph
         QHpMYkfvIuDNhSItQqmJ+Vc1XYqrKQgGHazI8WnHTrCsouXpwYyiAYgiM2QEsVF5gHdz
         ZJLvnUp5Oc2Rp0xJOZhR7zuun0gEe51MGZSvFVnEu+r4qI4EqOf+bJ6xWqK0udAIUOEO
         2D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fOYbDlxyEHO5mkyCfKHOpCUjsLY9l97TCTcV9KNabAI=;
        b=zd+hjPrxWWwybg7K2EB0Ga0oEQHi+rw4J/XJ9nD/YYgcGZwY/rxyVEQjWiHUnVfCJ7
         F1TsXwr3gHbiqeSUzuiNndonWFjnqiTL8aji/BEXzYPfwqyhfCa9X1oD6++yeiVYoTtJ
         PCI0izA1uxe3kTglewDDuPtl+yLXdMc8MWVnVv22LkmU07/GIA6tnxgvGkxPyG2YXJvl
         RNE5zwKJHqG2thWZo0EmpWhxnyw2+2oHZKWqIYMlLDC5fV30iitwFuQU4cxyxg1JWLvq
         0A9qhy+FqAa5YV2azRhyLwOhs+CHvtWf954KVnQt/5HHDeEN2C0CLmVzwhP6FR8IwIJX
         wekA==
X-Gm-Message-State: AOAM530/vpbZGlOQq2B4L1HLRJzfjcQCbJRxR+EEzSr9LLX8h5gSMmkw
	vSsxeDQaRtXdkZ3L6phbZ/cU6A==
X-Google-Smtp-Source: ABdhPJzOTaRXeM7E9FNDf2aud4bzU/5ORGrb5nxt55vCz9M67pEiwG1gJqMRtM1pQtJ5njQL8zGp2w==
X-Received: by 2002:a37:a754:: with SMTP id q81mr18304335qke.303.1634132449920;
        Wed, 13 Oct 2021 06:40:49 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id p2sm4953006qtq.41.2021.10.13.06.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 06:40:49 -0700 (PDT)
Message-ID: <ff0769efee51e15451d48e23860f8b1710593cd7.camel@ndufresne.ca>
Subject: Re: [PATCH 0/2] media: rkvdec: Align decoder behavior with Hantro
 and Cedrus
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>,  "open list:ARM/Rockchip SoC..."
 <linux-rockchip@lists.infradead.org>, linux-staging@lists.linux.dev, LKML
 <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>
Date: Wed, 13 Oct 2021 09:40:48 -0400
In-Reply-To: <CAGXv+5FnFq1mN79sqUp-o6pHirYvp55gurnsUCgqYvEAX2=4oQ@mail.gmail.com>
References: <20211008100423.739462-1-wenst@chromium.org>
	 <f108f23dadc846222c63c88af826dae9c5082d83.camel@ndufresne.ca>
	 <CAGXv+5FnFq1mN79sqUp-o6pHirYvp55gurnsUCgqYvEAX2=4oQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mercredi 13 octobre 2021 à 15:05 +0800, Chen-Yu Tsai a écrit :
> Hi,
> 
> On Fri, Oct 8, 2021 at 11:42 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > 
> > Hi Chen-Yu,
> > 
> > thanks for looking into this.
> > 
> > Le vendredi 08 octobre 2021 à 18:04 +0800, Chen-Yu Tsai a écrit :
> > > Hi everyone,
> > > 
> > > While working on the rkvdec H.264 decoder for ChromeOS, I noticed some
> > > behavioral differences compared to Hantro and Cedrus:
> > > 
> > > 1. The driver always overrides the sizeimage setting given by userspace
> > >    for the output format. This results in insufficient buffer space when
> > >    running the ChromeOS video_decode_accelerator_tests test program,
> > >    likely due to a small initial resolution followed by dynamic
> > >    resolution change.
> > > 
> > > 2. Doesn't support dynamic resolution change.
> > > 
> > > This small series fixes both and aligns the behavior with the other two
> > > stateless decoder drivers. This was tested on the downstream ChromeOS
> > > 5.10 kernel with ChromeOS. Also compiled tested on mainline but I don't
> > > have any other RK3399 devices set up to test video stuff, so testing
> > > would be very much appreciated.
> > > 
> > > Also, I'm not sure if user applications are required to check the value
> > > of sizeimage upon S_FMT return. If the value is different or too small,
> > > what can the application do besides fail? AFAICT it can't split the
> > > data of one frame (or slice) between different buffers.
> > 
> > While most software out there just assumes that driver will do it right and
> > crash when it's not the case, application that do map the buffer to CPU must
> > read back the fmt structure as the drivers are all fail-safe and will modify
> > that structure to a set of valid value s for the context.
> 
> I believe what is happening in Chromium is that the decoder is opened with
> some default settings, including the smallest viable resolution for the
> output side, and the buffers allocated accordingly. When dynamic resolution
> change happens, the decoder does not check if the current buffers are
> sufficiently sized; it just assumes that they are. And when it starts
> pushing data into the buffers, it realizes they are too small and fails.
> 
> The spec also says:
> 
>     Clients are allowed to set the sizeimage field for variable length
>     compressed data flagged with V4L2_FMT_FLAG_COMPRESSED at ioctl
>     VIDIOC_ENUM_FMT, but the driver may ignore it and set the value itself,
>     or it may modify the provided value based on alignment requirements or
>     minimum/maximum size requirements.
> 
> The spec only guarantees that the buffers are of sufficient size for the
> resolution configured at the time they were allocated/requested.
> 
> So I think my first patch is a workaround for a somewhat broken userspace.
> But it seems the other stateless drivers are providing similar behavior,
> as I previously mentioned.

That's what I mean, this is not a driver bug strictly speaking (assuming it does
guaranty the buffer size is sufficient) but it is without your change
inconvenient, as userspace may be aware of the largest resolution it will
decode, and may want to allocate larger buffer upfront.

As per Chromium bug, this is being addressed already. Thanks for this driver
improvement.

> 
> > As for opposite direction (output vs capture) format being changed, this should
> > be documented in the spec, if you find it too unclear or missing for sateless
> > codec (I know it's there for stateful but can't remember, would have to re-read,
> > for stateless) let us know.
> 
> AFAICT the capture side is working OK and to spec.
> 
> 
> Regards
> ChenYu
> 
> > regards,
> > Nicolas
> > 
> > > 
> > > Andrzej, I believe the second patch would conflict with your VP9 series.
> > > 
> > > 
> > > Regards
> > > ChenYu
> > > 
> > > Chen-Yu Tsai (2):
> > >   media: rkvdec: Do not override sizeimage for output format
> > >   media: rkvdec: Support dynamic resolution changes
> > > 
> > >  drivers/staging/media/rkvdec/rkvdec-h264.c |  5 +--
> > >  drivers/staging/media/rkvdec/rkvdec.c      | 40 +++++++++++-----------
> > >  2 files changed, 23 insertions(+), 22 deletions(-)
> > > 
> > 
> > 


