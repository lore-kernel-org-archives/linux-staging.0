Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB0E1855;
	Fri,  1 Jul 2022 09:03:23 +0000 (UTC)
Received: from [IPV6:2a01:e0a:120:3210:2a18:eef7:517c:3467] (unknown [IPv6:2a01:e0a:120:3210:2a18:eef7:517c:3467])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 099BA66015B2;
	Fri,  1 Jul 2022 10:03:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656666201;
	bh=HeVABiQifDKZmsejKzWKuWsrRSudGKBJZ7pqrByEerQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nwQ+wI922KmSe3X33SneWndU3TbI/sjRvPQJ8Dr5Xx5e+O3qg5hog/1NfrfSZLLa+
	 uiofarX6QER7SRj2Socni4uPTSAQWRCqvBlpKKJW9qGo5lGcEk2o08vW2y1EogP2yf
	 Er5jCtdTUH1iSLSOQe/5IZo2K3fmdvkTD8DY16m2Bto4fPs3QeAcL2Otxzd/KusWTh
	 +5WhbyviowG4guFPNMai5QO1z1hlQI4fVdmiSKw2/rCJl+CsdHNDVuFp5LAVwrEHsh
	 QhTDO0SZt/zk+9K5tTKjKTU+cWKKVLKpaDNBmWwyxA41gdiPS+vybDFYccNgp4oEzr
	 H6JM/1lzE99Gw==
Message-ID: <37145626-1a7e-2aba-4f3c-4d0574729a41@collabora.com>
Date: Fri, 1 Jul 2022 11:03:18 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/7] media: hantro: HEVC: Fix chroma offset computation
Content-Language: en-US
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, ezequiel@vanguardiasur.com.ar,
 p.zabel@pengutronix.de, gregkh@linuxfoundation.org, mripard@kernel.org,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 nicolas.dufresne@collabora.com, andrzej.p@collabora.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@collabora.com
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-4-benjamin.gaignard@collabora.com>
 <Yr60jj4OOAM6plWC@aptenodytes>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <Yr60jj4OOAM6plWC@aptenodytes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 01/07/2022 à 10:47, Paul Kocialkowski a écrit :
> Hi Benjamin,
>
> On Fri 17 Jun 22, 13:57, Benjamin Gaignard wrote:
>> The chroma offset depends of the bitstream depth.
>> Make sure that ctx->bit_depth is used to compute it.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> index 9eac133bda68..8407ad45b7b7 100644
>> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>> @@ -12,7 +12,7 @@
>>   
>>   static size_t hantro_hevc_chroma_offset(struct hantro_ctx *ctx)
>>   {
>> -	return ctx->dst_fmt.width * ctx->dst_fmt.height;
>> +	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
> Is this a case for DIV_ROUND_UP or are you sure the rounded-down size is always
> sufficient?

No need of DIV_ROUND_UP here because it could affect the chroma offset when
using decoder tiled format and add extra bytes between luma and chroma planes.

Regards,
Benjamin

> Cheers,
>
> Paul
>
>>   }
>>   
>>   static size_t hantro_hevc_motion_vectors_offset(struct hantro_ctx *ctx)
>> -- 
>> 2.32.0
>>
