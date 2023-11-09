Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB6E6AA7
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 04:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZTnGdRwm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-544455a4b56so570292a12.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Nov 2023 20:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699504063; x=1700108863; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTb319PKi1K5hE3fGXAxhdTNxkLrwLwVOwF53ZkG1AY=;
        b=ZTnGdRwmb1Ip1JVEaeO3Fozv1T9XuqOgjLEi7KGKFeJRBzajydIOJ/014izPjnsF37
         WUg24tFLrRxoHQReY8MUr4zTYervfgF66BXELPUoKkYGy1UbPtE/BRVvbpUEBcvCEdQv
         SgMR3hGyAeC5maUqQa6p1RM3J6mGyw6Z+f5gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699504063; x=1700108863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTb319PKi1K5hE3fGXAxhdTNxkLrwLwVOwF53ZkG1AY=;
        b=dzHJ23gfFkFIuG3kyxA1bc03mTfO6kAyHBHZkw0Sy6rlS7Gl7zjKh6nc9bkxA6gA+w
         4ASOjXTjqghpSqGx38hpfz0w9N8uAEhuAmdzMz+O/5YYSkIiV9WyuPYinEdBFzO9KHgc
         1JpZPA91E57Dff9OXcWQ/4+80QlnSKRti20JUd+ZIS9OqFH6QqIUxsI2caMRZu4fiAqn
         1Fq7+3haYT6G9ajDnnp0UPBzX77xMnRIRmv2Jg3wyHRObQOkaVYWB/LUA0X2bW7N5e+p
         1p8ImDpNW/NUS05TBIFGVMvosqdhsLK85H4lFjViLsLfT8RfXR9wVq2e7umvjVfFKb/V
         Rnzw==
X-Gm-Message-State: AOJu0YxzJU69Fn5QMyj3L5OxEPe4wYog2bJofAOgdRhMjeR1zjIuqjog
	3aDUwW85QnsyaI+Bg7+QbLa0JjcFFLb8+gulCfAfQqWk
X-Google-Smtp-Source: AGHT+IExe02wo6JeTANfwWgc4swtQA3nIBmTBAmXYfnm6TY9bdHdaF+IynuVPS2KI0YKly8Tl5NP5A==
X-Received: by 2002:a17:907:318e:b0:9c7:4d3e:1e50 with SMTP id xe14-20020a170907318e00b009c74d3e1e50mr3188178ejb.76.1699504063622;
        Wed, 08 Nov 2023 20:27:43 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906d18a00b009a1a653770bsm1983639ejz.87.2023.11.08.20.27.42
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 20:27:43 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso2529625e9.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Nov 2023 20:27:42 -0800 (PST)
X-Received: by 2002:a05:600c:4ecd:b0:405:7400:1e3d with SMTP id
 g13-20020a05600c4ecd00b0040574001e3dmr3298654wmq.32.1699504062425; Wed, 08
 Nov 2023 20:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-6-benjamin.gaignard@collabora.com> <20231108085016.3kmhmdroh4qs53f5@chromium.org>
 <795ef94f-23d3-433e-b5a3-0a2e0ab7a18c@collabora.com>
In-Reply-To: <795ef94f-23d3-433e-b5a3-0a2e0ab7a18c@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 Nov 2023 13:27:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dd_w50ppjy1_wQ2yX+Qj0mOMWbhJKsJ7Cq6zYsQ+GwyQ@mail.gmail.com>
Message-ID: <CAAFQd5Dd_w50ppjy1_wQ2yX+Qj0mOMWbhJKsJ7Cq6zYsQ+GwyQ@mail.gmail.com>
Subject: Re: [PATCH v14 05/56] media: videobuf2: Access vb2_queue bufs array
 through helper functions
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

On Wed, Nov 8, 2023 at 7:24=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 08/11/2023 =C3=A0 09:50, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:30:13PM +0100, Benjamin Gaignard wrote:
> >> This patch adds 2 helpers functions to add and remove vb2 buffers
> >> from a queue. With these 2 and vb2_get_buffer(), bufs field of
> >> struct vb2_queue becomes like a private member of the structure.
> >>
> >> After each call to vb2_get_buffer() we need to be sure that we get
> >> a valid pointer in preparation for when buffers can be deleted.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++---=
--
> >>   .../media/common/videobuf2/videobuf2-v4l2.c   |  50 ++++--
> >>   2 files changed, 149 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers=
/media/common/videobuf2/videobuf2-core.c
> >> index 968b7c0e7934..b406a30a9b35 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> >> @@ -408,6 +408,31 @@ static void init_buffer_cache_hints(struct vb2_qu=
eue *q, struct vb2_buffer *vb)
> >>              vb->skip_cache_sync_on_finish =3D 1;
> >>   }
> >>
> >> +/**
> >> + * vb2_queue_add_buffer() - add a buffer to a queue
> >> + * @q:      pointer to &struct vb2_queue with videobuf2 queue.
> >> + * @vb:     pointer to &struct vb2_buffer to be added to the queue.
> >> + * @index: index where add vb2_buffer in the queue
> >> + */
> >> +static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buff=
er *vb, unsigned int index)
> >> +{
> >> +    WARN_ON(index >=3D VB2_MAX_FRAME || q->bufs[index]);
> > nit: Would it make sense to also ensure that vb->vb2_queue is NULL?
>
> Since vb->vb2_queue and q->bufs[index] are always set and clear in the sa=
me
> functions I don't think it is useful to test the both here.
>

Well, they are if the caller is not buggy. But I suppose the check is
to detect buggy callers?

For example, an m2m driver could accidentally call this on a buffer
that was already added to another queue.

Best regards,
Tomasz
