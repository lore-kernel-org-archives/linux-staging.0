Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602D317C2
	for <linux-staging@lists.linux.dev>; Fri, 23 Jun 2023 07:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB32C433C8;
	Fri, 23 Jun 2023 07:02:28 +0000 (UTC)
Message-ID: <f21d6fce-155c-28f0-fdea-e9264ba1f7ba@xs4all.nl>
Date: Fri, 23 Jun 2023 09:02:26 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 03/11] media: videobuf2: Remove VB2_MAX_FRAME limit on
 buffer storage
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
 ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230622131349.144160-1-benjamin.gaignard@collabora.com>
 <20230622131349.144160-4-benjamin.gaignard@collabora.com>
 <bddd6cb7-cd72-4fb5-8d4a-d02cb9c46dce@kadam.mountain>
 <39aff680-316a-7382-c93b-d9ca61c389e9@collabora.com>
Content-Language: en-US
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <39aff680-316a-7382-c93b-d9ca61c389e9@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/06/2023 16:13, Benjamin Gaignard wrote:
> 
> Le 22/06/2023 à 16:11, Dan Carpenter a écrit :
>> On Thu, Jun 22, 2023 at 03:13:41PM +0200, Benjamin Gaignard wrote:
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>>> index f1ff7af34a9f..86e1e926fa45 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>> @@ -455,9 +455,9 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>>>       struct vb2_buffer *vb;
>>>       int ret;
>>>   -    /* Ensure that q->num_buffers+num_buffers is below VB2_MAX_FRAME */
>>> +    /* Ensure that q->num_buffers + num_buffers is UINT_MAX */
>>>       num_buffers = min_t(unsigned int, num_buffers,
>>> -                VB2_MAX_FRAME - q->num_buffers);
>>> +                UINT_MAX - q->num_buffers);
>>>         for (buffer = 0; buffer < num_buffers; ++buffer) {
>>>           /* Allocate vb2 buffer structures */
>> Ah...  Here's one of the integer overflow bugs I was talking about.  The
>> __vb2_queue_alloc() function returns an int so if num_buffers goes over
>> INT_MAX we are hosed.
> 
> I will limit it to:
> #define VB2_QUEUE_MAX_BUFFERS  (INT_MAX & PAGE_MASK)  /* The mask prevents 85% of integer overflows */
> as you have suggest it.

IMHO INT_MAX is way overkill. How about (1U << 20)? I would like some sort of
sanity check here. 1048576 buffers of 640x480 and 4 bytes per pixel is 1.2 TB.

Since a TB of memory is doable these days, I think this is a reasonable
value for MAX_BUFFERS without allowing just anything.

An alternative is to make this a kernel config.

Regards,

	Hans

> 
> That will be in version 4.
> 
> Thanks,
> Benjamin
> 
>>
>> regards,
>> dan carpenter
>>

