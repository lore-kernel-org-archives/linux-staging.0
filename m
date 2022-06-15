Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76E7A
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 10:21:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id i81-20020a1c3b54000000b0039c76434147so868951wma.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=i5UHiKeBm7p+nXYe5pAMZC+vlVpYQlMsAgfmjLVZiVQ=;
        b=bxa5KHqnOYPQsukXDQj3MeZE/+9AyB5DX4Sy2MtGoMawQyrlHTw27PTM6tb0+HdOln
         7VudLzmfD5yC97dPRg7KayA7SAC7gdAUjjyrUg0GAJu6gxEH3eJOv1aB4KDkLZkbkD6e
         eHm+zaG7orV4gy43e4aNpYotHtEz5BoYyl+EKcpPcuSw7Ni3WvfTITKxcXZX/nhDF3Hh
         7EPgor77P5qmnN089ql2ZgQ/szwqbgp0NjcB/0K67g0/tp0bTmeR9xrGFlNlWpVQh7Ng
         fRggqB3KnXiaCquq5dR6tCG3CvIYrcT4faGgX+rlm5PSBSndy7N1Y121f2dQ68cTmJtJ
         XZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=i5UHiKeBm7p+nXYe5pAMZC+vlVpYQlMsAgfmjLVZiVQ=;
        b=XmJs+mzcSZTJeZ2ojyGG2wg+YyGQyZ32+lzDrc0fAd3+/9MOo2G+zjsddN4xmtgV9G
         bVkWDVd0p24Gkmj8CGdp6ay9McV7Zx7xMOujP3nVSyD/Tr1wXxwvK821/I0RRXy11m/0
         4QzRWd1cOFMlnxl0MxuxgMT3XkrUjCsjqLMwVQxUb1HJDwIqnxRACMCsbz43skXN5gZr
         AgCm4iQxc+AiJzEOGFixx4E+sokesXJPw5XkLzaloQfx35gIuOTM2AoriwNNSd/lQ5UT
         2xlWsEzS4TyLuCKW/EYjcuMoVQOw+RqkdBGGAd37j2q0L3EOqRiK9vKnhoab7cw4n0XX
         iE5g==
X-Gm-Message-State: AOAM531R73nSNERzjL/Ssc5DVKixQJbe0EY8/SqE9UxDMF8iKcxgyTde
	pBC2y5NDea8Cp4jpcJjGtu8Ncw==
X-Google-Smtp-Source: ABdhPJz28oVCMAvAIAHekUqJTvRgk5HwMHWrW8mDgbGHHyW5rLUX/EFJ7q5Lb5PwwZ0RvLS1a8ePIw==
X-Received: by 2002:a05:600c:2054:b0:39c:3f73:3552 with SMTP id p20-20020a05600c205400b0039c3f733552mr9177001wmg.15.1655288514767;
        Wed, 15 Jun 2022 03:21:54 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d44cc000000b00219e758ff4fsm14340359wrr.59.2022.06.15.03.21.53
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 15 Jun 2022 03:21:54 -0700 (PDT)
From: John Cox <jc@kynesim.co.uk>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, gregkh@linuxfoundation.org, mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org, nicolas.dufresne@collabora.com, andrzej.p@collabora.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, kernel@collabora.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v8 01/17] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Date: Wed, 15 Jun 2022 11:21:52 +0100
Message-ID: <e8cjah90hg1q07dtl29jbtqp92hgclququ@4ax.com>
References: <20220614083614.240641-1-benjamin.gaignard@collabora.com> <20220614083614.240641-2-benjamin.gaignard@collabora.com> <63052d74-d3c7-a9cc-cb18-a58f8937ec06@xs4all.nl>
In-Reply-To: <63052d74-d3c7-a9cc-cb18-a58f8937ec06@xs4all.nl>
User-Agent: ForteAgent/8.00.32.1272
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi

>Hi Benjamin,
>
>On 6/14/22 10:35, Benjamin Gaignard wrote:
>> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>=20
>> Add a new flag that indicates that this control is a dynamically sized
>> array. Also document this flag.
>>=20
>> Currently dynamically sized arrays are limited to one dimensional =
arrays,
>> but that might change in the future if there is a need for it.
>>=20
>> The initial use-case of dynamic arrays are stateless codecs. A frame
>> can be divided in many slices, so you want to provide an array =
containing
>> slice information for each slice. Typically the number of slices is =
small,
>> but the standard allow for hundreds or thousands of slices. Dynamic =
arrays
>> are a good solution since sizing the array for the worst case would =
waste
>> substantial amounts of memory.
>>=20
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../userspace-api/media/v4l/vidioc-queryctrl.rst          | 8 =
++++++++
>>  include/uapi/linux/videodev2.h                            | 1 +
>>  2 files changed, 9 insertions(+)
>>=20
>> diff --git =
a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst =
b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> index 88f630252d98..a20dfa2a933b 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> @@ -625,6 +625,14 @@ See also the examples in :ref:`control`.
>>  	``V4L2_CTRL_FLAG_GRABBED`` flag when buffers are allocated or
>>  	streaming is in progress since most drivers do not support changing
>>  	the format in that case.
>> +    * - ``V4L2_CTRL_FLAG_DYNAMIC_ARRAY``
>> +      - 0x0800
>> +      - This control is a dynamically sized 1-dimensional array. It
>> +        behaves the same as a regular array, except that the number
>> +	of elements as reported by the ``elems`` field is between 1 and
>> +	``dims[0]``. So setting the control with a differently sized
>> +	array will change the ``elems`` field when the control is
>> +	queried afterwards.
>
>I am proposing a change to the dynamic array implementation: initially
>dynamic array controls start off as empty arrays (0 elements). This also
>allows userspace to set a dynamic array control to an empty array.
>
>It probably would also make sense to add a min_dyn_elems to set the =
minimum
>allowed number of elements for a dynamic array. This would most likely =
be
>either 0 or 1.
>
>In the context of this HEVC series, does it help to allow empty dynamic =
arrays?

I'd assumed that the control simply wouldn't be set if empty, but yes I
think it makes sense to allow empty otherwise there would be no way of
clearing the control if it was ever set?

>For V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS in particular it looks =
like
>it would make sense since I think (correct me if I am wrong) there can =
be 0
>entry point offsets. So with empty arrays supported would the field
>num_entry_point_offsets still be needed?

Yes - assuming that the entry_point array is still 1D (I think that was
what was decided) then still you need it to work out which entry points
belong to which slice.

Regards

JC

>If you want to test, then let me know and I mail a very simple patch =
adding
>support for empty arrays (not yet min_dyn_elems, though).
>
>Regards,
>
>	Hans
>
>> =20
>>  Return Value
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> diff --git a/include/uapi/linux/videodev2.h =
b/include/uapi/linux/videodev2.h
>> index 5311ac4fde35..9018aa984db3 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1890,6 +1890,7 @@ struct v4l2_querymenu {
>>  #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
>>  #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
>>  #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
>> +#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
>> =20
>>  /*  Query flags, to be ORed with the control ID */
>>  #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
