Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA6ED535
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 07:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cc5mUl6w"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso84762466b.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Nov 2023 23:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699514922; x=1700119722; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZGyCYYTcq3tfAOSXtV2/dw7L3jydVZ3P+lrWN5MQ7s=;
        b=cc5mUl6w62Mtwc0R7tVMq24cg7ebByXpydY91kVPVU9dXdqMXYh1+/c8nIA28jj3eC
         V0RJI/2bTIlVotvMrRT/22+h47yay0qaGwJ1Ukp6ZvKE+r8NNejrccAhC6oyD+19Wvjw
         TOQhBXQivS9NZNodwZoGFbZOLBd7eI36IMw2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699514922; x=1700119722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZGyCYYTcq3tfAOSXtV2/dw7L3jydVZ3P+lrWN5MQ7s=;
        b=Ds9dR5URkjctzbdIgNM7oa8RwmDOl1QHCYh9ZuXN2tmt1X305mYJqSld5Qr1jTAY98
         h9euuE11rMdxlXpQAWJRvQFymHYlkvXsZGUjX986anYkFDMtdLBqm7aiiRJH+39yK071
         nolLl+ohJiscyWTrRGgVN7Qcja1xQ9gpnfShHH5FUtQJUnNDNbnbneFmDNBEjQIqUWGR
         r6L1GULTQ7NwCx46jmko+XsZoYh6pxjQ7JHVjQldFGnJh7T/MbK0UBYXJmE/BCquSAQc
         VVQtfjo7UZYz9ImT7ZRlHYwt4Yargvobi9NxYzbmvBanmH460VC3cd56owVAw8X3t3n8
         ju4w==
X-Gm-Message-State: AOJu0Yz4T0m/H+3OG5xGS/Oa+SDcLFVQ1PC3ehg6PkVvI9NqWePx7BLm
	uXcanJiK2uiBTeKXSXDAtmF/zk3B6gQOAC15UoMSJJji
X-Google-Smtp-Source: AGHT+IFi5m4KY8jW5Zv/X4GxjpmeFZtiGk97hKfYzsz+9PaQUmsPq03fKU01rCtACMHuDw7qVvm1TQ==
X-Received: by 2002:a17:907:3e1c:b0:9b2:c583:cd71 with SMTP id hp28-20020a1709073e1c00b009b2c583cd71mr3740474ejc.50.1699514921748;
        Wed, 08 Nov 2023 23:28:41 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id k2-20020a1709061c0200b009dda94509casm2165338ejg.102.2023.11.08.23.28.40
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 23:28:41 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32d9effe314so306689f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Nov 2023 23:28:40 -0800 (PST)
X-Received: by 2002:adf:e311:0:b0:32c:ea14:89e5 with SMTP id
 b17-20020adfe311000000b0032cea1489e5mr3220105wrj.39.1699514920620; Wed, 08
 Nov 2023 23:28:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-53-benjamin.gaignard@collabora.com>
 <20231108104439.oxpbbd2yro7u57t4@chromium.org> <e9eeac63-b4d5-4710-bb85-b0997dce55cc@collabora.com>
In-Reply-To: <e9eeac63-b4d5-4710-bb85-b0997dce55cc@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 Nov 2023 16:28:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AH6x461-a2=2JmzUhW2pWacgwj1w3SZH1kfMBbsmaZ3A@mail.gmail.com>
Message-ID: <CAAFQd5AH6x461-a2=2JmzUhW2pWacgwj1w3SZH1kfMBbsmaZ3A@mail.gmail.com>
Subject: Re: [PATCH v14 52/56] media: core: Add bitmap manage bufs array entries
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, 
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2023 at 12:30=E2=80=AFAM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 08/11/2023 =C3=A0 11:44, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:31:00PM +0100, Benjamin Gaignard wrote:
[snip]
> >> @@ -1150,7 +1150,10 @@ static inline bool vb2_fileio_is_active(struct =
vb2_queue *q)
> >>    */
> >>   static inline unsigned int vb2_get_num_buffers(struct vb2_queue *q)
> >>   {
> >> -    return q->num_buffers;
> >> +    if (!q->bufs_bitmap)
> >> +            return 0;
> >> +
> >> +    return bitmap_weight(q->bufs_bitmap, q->max_num_buffers);
> > Hmm, could we just cache the number of buffers we have, so that we don'=
t
> > have to go over the entire bitmap every time? (Basically just keep the
> > code that we had for handling q->num_buffers before this patch.)
>
> I would prefer no duplicate how the number of buffers in a queue is compu=
ted
> and bitmap offer helpers for that. Why not use it ?
>

bitmap_weight() can become costly when the number of buffers grows.
Since it's easy to track how many buffers we add and remove, we could
just cache that number and then any code could call
vb2_get_num_buffers() whenever it needs the buffer count without
caring how costly it is.

> >
> >>   }
> >>
> >>   /**
> >> @@ -1253,13 +1256,13 @@ static inline void vb2_clear_last_buffer_deque=
ued(struct vb2_queue *q)
> >>   static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
> >>                                              unsigned int index)
> >>   {
> >> -    if (!q->bufs)
> >> +    if (!q->bufs_bitmap)
> >>              return NULL;
> >>
> >>      if (index >=3D q->max_num_buffers)
> >>              return NULL;
> >>
> >> -    if (index < q->num_buffers)
> >> +    if (test_bit(index, q->bufs_bitmap))
> > Aha, I see why we need the extra condition above now. Perhaps it should=
've
> > been added in this patch instead?
>
> For me it was more explicit do introduce it at the same time that
> max_num_buffers field.

Okay. I don't have a strong opinion, especially since it was just an
intermediate patch.

Best regards,
Tomasz
