Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0907D;
	Mon, 14 Feb 2022 10:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF7BC340E9;
	Mon, 14 Feb 2022 10:01:38 +0000 (UTC)
Message-ID: <713cee9b-c96c-119a-65be-3c289b361915@xs4all.nl>
Date: Mon, 14 Feb 2022 11:01:36 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RFC] media: uapi: Move HEVC stateless controls out of staging
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 mchehab@kernel.org, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, mripard@kernel.org,
 paul.kocialkowski@bootlin.com, wens@csie.org, jonas@kwiboo.se,
 nicolas@ndufresne.ca, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@collabora.com,
 Alex Bee <knaerzche@gmail.com>, jc@kynesim.co.uk
References: <20220201123439.353854-1-benjamin.gaignard@collabora.com>
 <8038233.T7Z3S40VBb@kista>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <8038233.T7Z3S40VBb@kista>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

On 2/13/22 12:33, Jernej Škrabec wrote:
> Hi Benjamin,
> 
> CC: Alex, John
> 
> Sorry for late response, but I've been very busy last week.
> 
> First of all, thank you for doing this! It's about time that HEVC moves 
> forward.
> 
> Dne torek, 01. februar 2022 ob 13:34:39 CET je Benjamin Gaignard napisal(a):
>> The HEVC stateless 'uAPI' was staging and marked explicitly in the
>> V4L2 specification that it will change and is unstable.
>>
>> Note that these control IDs were never exported as a public API,
>> they were only defined in kernel-local headers (hevc-ctrls.h).
>>
>> While moving the controls out of staging they are renamed and
>> control IDs get new numbers.
>> Drivers (Hantro, Cedrus) and Documentation are updated accordaly.
> 
> accordaly -> accordingly
> 
>>
>> Additional structures fields has been added for RKVDEC driver usage.
> 
> You should do separate patch for that, preceding this one. One patch should 
> only do one thing.
> 
> I also suggest that you add additional patch for removing bit_size field in 
> struct v4l2_ctrl_hevc_slice_params. Similar fields were already removed from 
> MPEG2 and H264 structures. Bit size can be deduced from output buffer size and 
> it doesn't hurt if bit size in Cedrus is set to bigger value than actual slice 
> bit size.
> 
>> Hantro dedicated control is moving to hantro-media.h
>> Since hevc-ctrls.h content has been dispatched in others file, remove it.
>>
>> fluster tests results on IMX8MQ is 77/147 for HEVC codec.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> 
> Note that Cedrus still needs additional information in order to decode some 
> HEVC videos. Missing info is num_entry_point_offsets and list of all 
> entry_point_offset_minus1 (obviously, num_entry_point_offsets in size).
> 
> I suggest that this is represented in a new control, which would use dynamic 
> array feature, written by Hans. While Cedrus supports max. 256 entries, it can 
> be much bigger in theory, but in reality, it's much smaller (like 4-8 
> entries).

I've rebased my dynarray tree, so it is up to date again:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=dynarray

Regards,

	Hans

> 
> Last but not least, data_bit_offset should be better defined. Currently it 
> points right after last header bit, just like Cedrus needs it. However, there 
> is padding after that, at least 1 bit and 8 bits at most, so slice data always 
> starts from byte aligned address. It probably make sense to rework that field 
> to be byte offset, not bit, just like in VA-API. Note that RPi HEVC driver also 
> uses byte aligned address directly. Cedrus would need some kind of workaround 
> and only one that works is this one:
> https://github.com/bootlin/libva-v4l2-request/blob/master/src/h265.c#L191-L209
> 
> Best regards,
> Jernej
> 
> 
