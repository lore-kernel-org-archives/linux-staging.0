Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3CD7B;
	Thu, 27 Oct 2022 06:12:29 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id p141so596900iod.6;
        Wed, 26 Oct 2022 23:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2QZ9vtdnPCb5anjpxrp18BAjMTMzX01x/KMYy3kefQs=;
        b=VctcnEzDheqjAB6wY79o8KHV0GUSpIrsXU6nYArQZkweOusS/2EH44abmuydZyohYC
         r2eZqOigOSK4VjyMFZCVxvcceBmyyugO49AZ44fA8WxSzlUbS34wI4Yved+esoWPkW6A
         usEHLQd0WCHhDM5jVgrAwQW6907Vmn4bzKNerFMklahCrnZy+hZ1TkxhgFjjDU8QVxr7
         2DammHlGBsvtpEe7X/GYy5aoHE9JqYVft2pkRyZjUFYLhMj7/w72mm5xnEAyK1w0MCcY
         uk4FrUJYo+gOnXY+TuJkhE8uxbgetwIIKGAIFBdjpluJi4rCY0OSbB1M4ZQWZCVFbqhR
         GVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QZ9vtdnPCb5anjpxrp18BAjMTMzX01x/KMYy3kefQs=;
        b=Y14A7z4dVKHkynh19E4YCjwBi64NqvYb4OBaCVdAGcqSxCuJCmh/ubewVSxVlvMMq0
         3XJE+fap2QheDlz2QNpVstj099vp93ZIg0W2VaYsQSQOnZ2BSNx9R4kaOkWy1JwYZ2v5
         B7h+jXG3z23H396MOi0mfTOOq8bI0w+6tZGR32Mgph6dR1/VqkJ+YDQ+H4NRpaJY8yFr
         xhcb7SMk5RmarQGT+Nt5wefad10RRd8P5rq0JxppcNQdGM2o8SNeWhUXphZ2SENDZ4h1
         5nrhw/tgJA5IBK0Yq7kT/Pc+6XdelqUjvRYxFkQ9WUGni/VD4U+0o2ZhruVQUciE5PpX
         xg5w==
X-Gm-Message-State: ACrzQf00mBkaXqae6pyq68ZBDsRfBxsM6HusxleWwWQI2ls1MTxlcFOC
	yGgd1C83Y4vgVrF+rNAb3AaQHjwVg3q/2pzNIj7UhSZo1qIKNgLs
X-Google-Smtp-Source: AMsMyM4xXlENiaz9joPwyHRduYwc4xPqiMmIlzMPZqKw0mWLeKGMn1YIoZ7Ls6vROZk1Ojke6i+lloYvcBtLVJAILK4=
X-Received: by 2002:a05:622a:147:b0:39c:dc0d:7d0f with SMTP id
 v7-20020a05622a014700b0039cdc0d7d0fmr38493245qtw.281.1666851138604; Wed, 26
 Oct 2022 23:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1666740522.git.tanjubrunostar0@gmail.com>
 <47da976cd02d262cebe520b21a0bf2451de6731b.1666740522.git.tanjubrunostar0@gmail.com>
 <Y1k7cDP4Dpdr5EOe@kroah.com>
In-Reply-To: <Y1k7cDP4Dpdr5EOe@kroah.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Thu, 27 Oct 2022 07:12:06 +0100
Message-ID: <CAHJEyKW8ofQ0fNQ0L4TzqJTEUMDfAPMufGATbX2Ep7JJKcWHQg@mail.gmail.com>
Subject: Re: [PATCH 05/17] staging: vt6655: changed variable name: pvRTS
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 26, 2022 at 2:50 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 25, 2022 at 11:37:01PM +0000, Tanjuate Brunostar wrote:
>
> Philipp has pointed out most of this already, but I'll just be specific
> and say what isn't ok in all of these patches:
>
> >       change variable names pvRTS to meet the
>
> "name" not "name"
>
> >         linux coding standard, as it says to avoid using camelCase naming
>
> "Linux" not "linux"
>
> >         style. Cought by checkpatch
>
> Why is this all indented?
>
> Please do not do that, look at existing accepted changes in the git log
> and match up what they look like.
>
> But worst of all, you didn't really fix the variable name at all.  You
> just appeased a tool that was trying to say "don't use camelCase, use
> sane names".
>
> > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> > ---
> >  drivers/staging/vt6655/rxtx.c | 56 +++++++++++++++++------------------
> >  1 file changed, 28 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> > index 2cac8f3882df..e97cba014adf 100644
> > --- a/drivers/staging/vt6655/rxtx.c
> > +++ b/drivers/staging/vt6655/rxtx.c
> > @@ -87,7 +87,7 @@ static const unsigned short w_fb_opt_1[2][5] = {
> >  /*---------------------  Static Functions  --------------------------*/
> >  static void s_v_fill_rts_head(struct vnt_private *p_device,
> >                             unsigned char by_pkt_type,
> > -                           void *pvRTS,
> > +                           void *pv_rts,
>
> "pvRTS" is using Hungarian Notation.  Look it up on Wikipedia for what
> it means, and why people used to use it.
>
> For us, we don't need that at all as the type of the variable is obvious
> in the code and the compiler checks it.
>
> So "pvRTS" is trying to say "this is a pointer to void called "RTS".
>
> We don't care about the "describe the variable type in the name" thing,
> so it should just be called "RTS", or better yet, "rts", right?
>
> But then, step back.  Why is this a void pointer at all?  This is really
> a structure of type struct vnt_rts_g_fb.  So why isn't that being passed
> here instead?
>
> So try to work on both, fixing up the names to be sane, and then,
> getting rid of the void * stuff, to better reflect how data is flowing
> around and what type that data is in.
>
> thanks,
>
> greg k-h

I see. thank you for the pointers

Tanju
