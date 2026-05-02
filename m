Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AD72F290E
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777708597; cv=none; b=Fsp+RTNy51qLvvzhRvOv6a9XofBGDD0OVM2QxyqGeS+hZZuFid3t5DKmrnowdmIrif88CJzSyPEw+kQ5JUt+uncZkUM9zjVjVoRDdR03oClyIbyR4QGypapK/k1lQpjOlzJ4RrGHKnWQ7I1GyZMYldnPUgF4a1Tj6JudpZ2OgJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777708597; c=relaxed/simple;
	bh=dJhRFO0sNwBpX6Zfbh5W+9NU4SEl0aFCDsJ/1X8239Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMYoa2KnVIHIPx1dh77oLJdRjP9we8IgGNKM5CCSCy5dzuOjZ914S9fpU/Pgvkkm94OblTxNatCm25gKGnV55Zz+1nZNb9GbC2YxCrNFtSxKZuBbXGHJwpoPdNBFHOuMmKwZG+oXebpEuoUrJFI93euxtenCrZoFQcMTZMQtol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TAMGa83i; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TAMGa83i"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-677f7c29af6so4588152a12.2
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777708594; x=1778313394; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yYbYReA77LGHmC7qNGAH0FMT9lWcS8+NBZbc8XS+URY=;
        b=TAMGa83iRzGw30W0xAV64+uYv7ty4uIv4hguYDHTKA/dcURsJMwlLB6VJaDUrC9V9a
         IdTheQn4327sUSe1BM2gtI+q1DVl2wbVhXvncAMVTTh5gZ8ZCiMTBa0OzlOsLUvhc26y
         MgiwlsLf4brXnkJ/5KxQiWCNv0mDvYxyAy4eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777708594; x=1778313394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYbYReA77LGHmC7qNGAH0FMT9lWcS8+NBZbc8XS+URY=;
        b=HWX2x82xmPSRnuuQ7dfjhn7l5/8WjpAQ8EFKj3XEfCoNKlyn2T9F1kFTjSyJIWuceB
         AXxIW0mOzAO0I6mWO0RJUqzzH4UYlQj2dETGwzPsz9ij+0711v2pqFKGzqpMIcbAbEFe
         GhBTBwIMPVl6d7x7XR+bYXGanUHQ7s9cfpd43hiUKi0/tzVqg6ry48UTAfeo+p6MXUiY
         5PL8i/GIH6lfbajteqlUAQDTKlo4vfXr+FXDsSF4fgLMsrzhQ0wkl+uIvw0yjZzL1VS0
         XhDOrA2ohVxzwrnO1Bg8kkgPk7mgV+n6ErPYEx+PLcbnR97TDjXOQUdQjtzcHu+4UFhl
         zMVA==
X-Forwarded-Encrypted: i=1; AFNElJ8nfHw+uCwQw3gyCwne89nvtQUAhlWl95NX2gLUylCya7g3uIaotGlxgwXulJLg17/juRB/r3Sa0nU/xGYS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7cagVL7/sHqVYx/qPT5idYF98h4SBL6sW598zvEcaN3iCVZlt
	a4VjCchinvxzg7Y3CN358gwESfFFvpJmNhY3itabsRNoJtvoR+6uAThy2h1zYoeFMpUtNgtNNZP
	gpcemLA==
X-Gm-Gg: AeBDieu3rpeviUkLNzXhz7BgDHHuCdZPda6x6mcTDIq1p8JQFA+vjvH7Mchrzv1OFHy
	fC+eCnQgz/7WNJ6o5hTOKeJK4eKZZX8gIrI+3tJqRlnJJPvHW8EwYaEGkie0HRoXID1pXdgmQ2g
	j4YpXOYturkQ9gRi6av+QOuYZI3zSlj/4m3IrdM9b3APbFQ0gCqGqKnWfZfYoQsNUoZf9okk8v5
	Z56RaWM8YwOQLS4G1eTkPMvrdqcolBWYhLQipQ6zIBk3/MNd8smmuvp5y9pF3vlptY+RfYdftQS
	1x4ydQAP5GNvcEZ33+RqBZEYOsu6WrZUZw5zn7Zl+WRjhoLwJY3JeWxQ0RvJi5Lunsfiy8ul5Us
	xsgnMXM1yZypEalVHYUWII6lKHfnklHSRanZrisqjBWgWxTY6526kzt1QgujwxFCKLZY5NUhsay
	mBANjurovlIYpRm7HeoR7zmq+yuV7S03hpeo4s9EZ0x1ATgPVLBEcceC2T7n+YeXV5n+p0S9g=
X-Received: by 2002:a17:906:ef07:b0:ba9:2611:31e6 with SMTP id a640c23a62f3a-bbff941502amr113077466b.6.1777708594025;
        Sat, 02 May 2026 00:56:34 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d06e3b1sm182412366b.38.2026.05.02.00.56.32
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 00:56:32 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8f9568e074so391693166b.0
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 00:56:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/O7oCwo7/arWk+BEj+tNfYc4m3kwWgybfpq3RFEGZB3peo8xlguoZLIdu6mysZt9evjiBcR0lotvXTsJWG@lists.linux.dev
X-Received: by 2002:a17:906:9f87:b0:bac:39f1:220e with SMTP id
 a640c23a62f3a-bbffc57c1c1mr87403766b.37.1777708591185; Sat, 02 May 2026
 00:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
 <20260501-smatch-7-1-v2-2-a2fcfb2531ac@chromium.org> <20260501201906.GA488660@killaraus.ideasonboard.com>
In-Reply-To: <20260501201906.GA488660@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 2 May 2026 09:56:19 +0200
X-Gmail-Original-Message-ID: <CANiDSCtf9ThohCR8XT7LNQUsbYeTdB=gGkmnXKc1cPjxUsVHdA@mail.gmail.com>
X-Gm-Features: AVHnY4JUgNnRVAJTA9Gn-Ci274fEJRaLMJcO_S9jFpe5SlS-M9HCUtA97BJPkUE
Message-ID: <CANiDSCtf9ThohCR8XT7LNQUsbYeTdB=gGkmnXKc1cPjxUsVHdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 1 May 2026 at 22:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, May 01, 2026 at 11:32:47AM +0000, Ricardo Ribalda wrote:
> > The current code makes smatch a bit uncomfortable:
> > drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> >
> > Probably because smatch is not clever enough (yet). Do a simple rewrite
> > to make sure that smatch understands what we are doing here.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/mt9p031.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> > index ea5d43d925ff..5c9dff030b4d 100644
> > --- a/drivers/media/i2c/mt9p031.c
> > +++ b/drivers/media/i2c/mt9p031.c
> > @@ -795,7 +795,7 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
> >                       ctrl->val &= ~1;
> >                       data = (1 << 6) | (ctrl->val >> 1);
> >               } else {
> > -                     ctrl->val &= ~7;
> > +                     ctrl->val -= ctrl->val % 8;
> >                       data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
>
> I'd still like to keep the ~7 (and, while at it, making the register
> computation easier to read). I previously proposed
>
>                         ctrl->val &= ~7;
>                         data = (ctrl->val - 64) >> 3;
>                         data = (data << 8) | (1 << 6) | 32;
>
> which didn't quite appease smatch. We could use an explicit mask:
>
>                         ctrl->val &= ~7;
>                         data = ((ctrl->val - 64) >> 3) & 0xff;

Why 0xff and not 0x7f?

If I understand it correctly the max is 1024 and (1024-64) >> 3 is < 127.


Anyway... following the mask idea what about:

ctrl->val &= ~7;
data = (((ctrl->val - 64) & 0x3ff) << 5) | (3 << 5);

?


>                         data = (data << 8) | (1 << 6) | 32;
>
> >               }
> >
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
