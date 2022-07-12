Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE926AAC;
	Tue, 12 Jul 2022 21:25:15 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id w12so11009476edd.13;
        Tue, 12 Jul 2022 14:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tBChpcrNJ7uqMkrlYvpxSCbNo0rDEKF5+LZTTXtJt14=;
        b=Ywi86ClERDeLuKNgFXaQC9C0Am+AWfURZcVsReXCWgtWBy1GfoVl0R6WPPPTlHQErG
         jvoRgofZ0r3jKGOSWj0M8PBwVMxTkkaRoo9gXi9CDdA9GorEEpP7oqu+ssUCkREX1Ovs
         peY1IMAAGlLTZkp+oCV6xVzieZqlH9W3ODaeDlSQZn4/bx/A/Fv291MUyKaxtF+VIsMc
         K+SDlZDCHgMvG4FKXPZPY8CN2X7fsz+eS3QTTKj7DrL5OXrQ6HD0C08KH6DrA5HHQtgU
         53jzf3YbyqCBEx9/MbYCtQmxXiEr6k3msPTAUICZe6d/xtuVMXyaCKrho0FDfkPU2CAv
         DEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tBChpcrNJ7uqMkrlYvpxSCbNo0rDEKF5+LZTTXtJt14=;
        b=qE1xgE8ZrxMyu02ydYyQ5KJu2LY80X7i0UpIBjwjQ2TRQLuTuGwJ8UZnwrPxmmYqEt
         eC+4C7OGUqk6IvQG5ffXN1rUmF96+9BrFrUgaILenAh2DPcHo2kiNrz0rXdCKVhWh+sg
         kv0YkjfhiDiiT9JNIxla+KZEZNfFoobZUBMdDKFHy5Ssy1NI4UMCE/LnaJG8r9CDPqnC
         mgM/prI5yYZ66fCvwZzkRYJUgIz0GP3JLIXNRoTjzwH/S1r7XPpfKIZ1z+6ots/YuxtZ
         gitOHDhhb9vzwRrGFSjEfcvKowGAEMZfsdtLHmg9l3pWrtTM4oeifK0o1E252T5THiXM
         cb6Q==
X-Gm-Message-State: AJIora8lHNA4haWiWVo9bHzcGLzkGcyC7zkjVGMiTTkCejQtBy/fp7Pi
	SMgdFA5Gu1W+ok5w7fopUIY=
X-Google-Smtp-Source: AGRyM1s+hQS+QLnU/6lQQ0tzxXZ5MhaAO+TPHGDbqYL360sXVhmOZtETjA1glKjKTh/Rh8MDdn6VUQ==
X-Received: by 2002:a05:6402:4395:b0:43a:c694:907d with SMTP id o21-20020a056402439500b0043ac694907dmr161122edc.310.1657661113418;
        Tue, 12 Jul 2022 14:25:13 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id r17-20020a056402019100b0043a9144d8ecsm6650252edv.71.2022.07.12.14.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 14:25:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org, samuel@sholland.org, mchehab@kernel.org, gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 5/7] media: cedrus: h265: Add a couple of error checks
Date: Tue, 12 Jul 2022 23:25:00 +0200
Message-ID: <37675481.J2Yia2DhmK@kista>
In-Reply-To: <YsyWnzdTZ0bC733i@eze-laptop>
References: <20220620175517.648767-1-jernej.skrabec@gmail.com> <20220620175517.648767-6-jernej.skrabec@gmail.com> <YsyWnzdTZ0bC733i@eze-laptop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ezequiel.

Dne ponedeljek, 11. julij 2022 ob 23:31:11 CEST je Ezequiel Garcia napisal(a):
> On Mon, Jun 20, 2022 at 07:55:15PM +0200, Jernej Skrabec wrote:
> > Now that we have infrastructure for reporting errors, let's add two
> > checks, which will make sure slice can be actually decoded.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> > 
> >  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c index
> > cfde4ccf6011..99020b9f9ff8 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> 
> Now that you've allowed setup to fail, I would suggest
> to have some documentation/comments on struct cedrus_dec_ops,
> to set the expectation/rules for each ops, including the
> call paths for each operation, which of them are allowed to sleep,
> etc.

Documentation can be always added, but it should be separate patch.

> 
> > @@ -435,9 +435,17 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx,
> > struct cedrus_run *run)> 
> >  	 * instead of start of slice data. Padding is 8 bits at most (one 
bit
> >  	 set to 1 and * at most seven bits set to 0), so we have to 
inspect
> >  	 only one byte before slice data. */
> > 
> > +
> > +	if (slice_params->data_byte_offset == 0)
> > +		return -EOPNOTSUPP;
> > +
> 
> AFAICS, cedrus_h265_setup is called from .device_run.
> We've been discussing control validation before, and I think the
> ideal place to do that is v4l2_ctrl_ops.s_ctrl, if that's
> at all possible.

Yeah, this particular check can be moved to s_ctrl handler.

> 
> Driver's mem2mem device_run are executed in the context
> of a work_struct and the failure won't really get reported
> up the stack.

Well, at least there will be a notice in dmesg. Not ideal, I know.

> 
> >  	padding = (u8 *)vb2_plane_vaddr(&run->src->vb2_buf, 0) +
> >  	
> >  		slice_params->data_byte_offset - 1;
> > 
> > +	/* at least one bit must be set in that byte */
> > +	if (*padding == 0)
> > +		return -EINVAL;
> > +
> 
> Maybe this is something to check at cedrus_buf_prepare(),
> when the buffer is queued?

I don't think so. This check is HEVC specific, but cedrus_buf_prepare() is not 
and we need to have slice control ready, which I'm not sure is the case for 
cedrus_buf_prepare().

Best regards,
Jernej

> 
> Thanks,
> Ezequiel
> 
> >  	for (count = 0; count < 8; count++)
> >  	
> >  		if (*padding & (1 << count))
> >  		
> >  			break;
> > 
> > --
> > 2.36.1


