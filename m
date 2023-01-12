Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B11C79C9
	for <linux-staging@lists.linux.dev>; Thu, 12 Jan 2023 14:55:21 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id m6so28772721lfj.11
        for <linux-staging@lists.linux.dev>; Thu, 12 Jan 2023 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eVbemLweSFtIyStHy3sTEbPBu0/XrJNey3w3MbOOwEE=;
        b=ttXHb70rHqfCHVOXsf6Q5SH1fqRM+CaHYdV4Tqag+Er5QQiTg0y1+Wwg4Lq6Icz8gk
         07i9ZLd/4+zAk4eYIHRoIOn3cakEH9OrLhtM4IBNH+83PyySuj8LBD/SySlLt3ixgQaM
         HNv24AlUoYpaTKgZGYTqIGfYKQ7Xdvcpjthr21TzD2BxPttH9lZZxXs1+klT64JNwILS
         woxLHVoX26DOx1pxijJOZllJliT9/OwUkXzUBSArrCH5WrF2ppYUXt4ZJF1sLIO7HyOb
         wdG2WRVMc/aByObJ3YGG+mqAavghifEazNoGYj6xE35Z200zToR0Nl9VQIyx22iGsGoo
         tHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVbemLweSFtIyStHy3sTEbPBu0/XrJNey3w3MbOOwEE=;
        b=41dQ06Jto6s3OycZIQH5BPPImOW7zAKy9Nl72K+DV6CfzsQoipw/6wQuvkYP7Se72M
         RAOEmcVEGiLRIJ/Fi72EJu2nHx9zfS2f8cZc+rQOQuYYQe7q4c+yDajzxn+QA4UORm+i
         hx3CxBBc+eZtd8A+M0CX9eUW7i8y4tQMMnAiOGzlkYSfx9eKgIFFlKkv/Aj2xa4i23NO
         aZn8KVNawhjfLIZzlew+4F8Fos21JalGVOT3YmJ9wN+lbQi8OfUKd8GgDVB60ejWl1tn
         Hipj6Yh+NASWtuAtJ/cZgjM8SCWCjOjwuYVE+QAEe/m2VngfFFLxpAlscnbKbKa+7/1i
         7Stg==
X-Gm-Message-State: AFqh2kqt1gZ69zurGss46XF28MMZHaGESzBEmbwZUQHaV/7D5oTqr6iH
	R64vFLxGu5CyF+rhyjWUuz47ciG7fadpbinu6QKttw==
X-Google-Smtp-Source: AMrXdXt+v1FWLQNKkH6B+Roo5NSENxZFIjpoigv8VLgU4hO/6DIdLqekSCezf+AaI9MGINFaBKiRdOxPUMcZG4OlTuk=
X-Received: by 2002:a05:6512:388e:b0:4ca:f6a4:455a with SMTP id
 n14-20020a056512388e00b004caf6a4455amr6689684lft.321.1673535319553; Thu, 12
 Jan 2023 06:55:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230101-patch-series-v2-6-2-rc1-v2-0-fa1897efac14@collabora.com> <20230101-patch-series-v2-6-2-rc1-v2-4-fa1897efac14@collabora.com>
In-Reply-To: <20230101-patch-series-v2-6-2-rc1-v2-4-fa1897efac14@collabora.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 12 Jan 2023 11:55:07 -0300
Message-ID: <CAAEAJfBuA=gTpyeKs5mj0_1z+x5sZhse2OGPP5nmb5E6XNjBKw@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] staging: media: rkvdec: Block start streaming
 until both queues run
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	Jonas Karlman <jonas@kwiboo.se>, Alex Bee <knaerzche@gmail.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Collabora Kernel-domain <kernel@collabora.com>, Robert Beckett <bob.beckett@collabora.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sebastian,

On Thu, Jan 12, 2023 at 9:56 AM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
>
> Ensure that both the CAPTURE and the OUTPUT queue are running (e.g. busy
> -> have buffers allocated) before starting the actual streaming process.
>

Usually, you want to write the "why" in the commit description,
instead of the "what",
which is (hopefully) more or less clear by reading the commit change.

The commit description should have enough information to understand
what is the impact of merging the commit (or what is the bug without
the merging the commit).

If you are fixing a spec violation, adding a reference to the spec is important,
if you are fixing a v4l2-compliance, pasting the error, etc.

> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index c849f6c20279..e0e95d06e216 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -562,6 +562,13 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
>         if (V4L2_TYPE_IS_CAPTURE(q->type))
>                 return 0;
>
> +       /*
> +        * Make sure that both the output and the capture queue are running
> +        */
> +       if (rkvdec_queue_busy(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) == 0 ||
> +           rkvdec_queue_busy(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) == 0)
> +               return -EAGAIN;
> +

IIRC, this is already handled by Videobuf2 core, see the comment for
vb2_start_streaming,
in drivers/media/common/videobuf2/videobuf2-core.c. There's also a
!q->num_buffers check
in vb2_core_streamon.

In general, if you see some kind of bug in a generic logic like this,
it's a red flag that something is wrong at the core level.

Thanks!
Ezequiel

>         desc = ctx->coded_fmt_desc;
>         if (WARN_ON(!desc))
>                 return -EINVAL;
>
> --
> 2.25.1
