Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A75770
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 12:48:28 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w4so9063096wrt.5
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zzn8PLES8svA7U4ivqAg78EhvER0rJvp6i6dRwiQrRU=;
        b=0vF+qUbUyHuLYS0tOOZ2JC0sSS5+/Pg6RfJqDnCalNLMowGquE9SnNrWV3F9oMZPnx
         22l7O36faYtp0YsQI9AWg1Flud4AeAPR3J0guqRfUWqNCd6ReTkvp+qOUM+AuA+E2Lde
         +cWmxL+4hXGMApCJwp4EXBuNMaApciVcycVoG6qoBVB/NgWg6ln0klUfqTUaOHRpub3u
         Bg2JFXQYQYJ9NQJDce+Pq0OZgzgZoHnPjZLxf22VxnOnipYc99owUVbti+UkDOdEGxbX
         BdxGAPd2LKgh4T3n9BRQkKdM6/N2vV9F2lKWG4GIbN+D9wTdveLptyHcIv2kLceV3XKO
         HJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Zzn8PLES8svA7U4ivqAg78EhvER0rJvp6i6dRwiQrRU=;
        b=EvaijFVWJwzpkByHJngefjrqtyH+XwPSYa3x2FOB6xQmRbWL/6GTKWIcmsZrETHoNo
         vrDc3c+zKOvMhO7vGnoyo3WsWAPthDf7DwjYn9v9x3BHjnrcsCuQWR9kC2BsXoBXM7WS
         t8Yryxg8cECjDAb0ewIZCUganM2Cs03pXBQltrsfwyBv5qWbSM3QCk8fJ+2+9E/2VeL0
         hoeUar55sSZ8mgzGAzn00cf8RlpANQUVn6i4tCOg3oqHHlQkBHLGPmELyV7cYjWXBe6C
         jm9dAFoOGzqhYq/zFRR4fhmfcUXmOjRVly6531u4AmWg/DWEDnohxae7EQBuRlhsbt10
         yC8g==
X-Gm-Message-State: AOAM531+sd2hcUE0Hs9e/rTutJzbvp00j0+UNMZDuFFVKhL/7srtQM6A
	ZvB6G4l+uhYKkvDCqky1+0fXkw==
X-Google-Smtp-Source: ABdhPJyXby6kkuJjgYWXL1ZMazbjd2Zw/pmMGFu02jqpqnXMu6wbepEENYIPpUq6GqhgcJPIrhsVSw==
X-Received: by 2002:adf:f504:: with SMTP id q4mr15535673wro.304.1618231707158;
        Mon, 12 Apr 2021 05:48:27 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:4c21:b00e:ff79:bf20? ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
        by smtp.gmail.com with ESMTPSA id j30sm17868537wrj.62.2021.04.12.05.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 05:48:26 -0700 (PDT)
Subject: Re: [PATCH v2] staging: media: meson: vdec: declare u32 as const and
 static const
To: Mitali Borkar <mitaliborkar810@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org,
 gregkh@linuxfoundation.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
References: <YHIDufKhTEeuxyl5@kali>
 <88d04746-717d-5a7a-7ea7-67cf6c95aba9@xs4all.nl> <YHRA9i+BjveJOUvn@kali>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <6107204d-f1a3-0888-ef3b-88520d786fa1@baylibre.com>
Date: Mon, 12 Apr 2021 14:48:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YHRA9i+BjveJOUvn@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/04/2021 14:45, Mitali Borkar wrote:
> On Mon, Apr 12, 2021 at 11:17:22AM +0200, Hans Verkuil wrote:
>> On 10/04/2021 21:59, Mitali Borkar wrote:
>>> Declared 32 bit unsigned int as static constant inside a function and
>>> replaced u32[] {x,y} as canvas1, canvas2 in codec_mpeg12.c
>>> This indicates the value of canvas indexes will remain constant throughout execution.
>>> Replaced u32 reg_base and u32 reg_name with const u32 reg_base and const
>>> u32 reg_name as it will contain data/registry bases to write static
>>> const indexes declared above and will keep track of of contiguos
>>> registers after each reg_base.
>>> This makes code look better, neater. It improves readability.
>>>
>>> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
>>> ---
>>>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 5 +++--
>>
>> Also change drivers/staging/media/meson/vdec/codec_h264.c.
>>
>> It's a nice improvement, so let's do this for both callers of amvdec_set_canvases().
>>
> I have done chnages in codec_h264.c Now, should I send that as new
> patch?

Yes please,

Neil

> 
>> Regards,
>>
>> 	Hans
>>
>>>  drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
>>>  drivers/staging/media/meson/vdec/vdec_helpers.h | 2 +-
>>>  3 files changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
>>> index 21e93a13356c..861d8584f22f 100644
>>> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
>>> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
>>> @@ -65,6 +65,8 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
>>>  	struct amvdec_core *core = sess->core;
>>>  	struct codec_mpeg12 *mpeg12;
>>>  	int ret;
>>> +	static const u32 canvas1[] = { AV_SCRATCH_0, 0 };
>>> +	static const u32 canvas2[] = { 8, 0 }
>>>  
>>>  	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
>>>  	if (!mpeg12)
>>> @@ -80,8 +82,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
>>>  		goto free_mpeg12;
>>>  	}
>>>  
>>> -	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
>>> -				  (u32[]){ 8, 0 });
>>> +	ret = amvdec_set_canvases(sess, canvas1, canvas2);
>>>  	if (ret)
>>>  		goto free_workspace;
>>>  
>>> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
>>> index 7f07a9175815..df5c27266c44 100644
>>> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
>>> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
>>> @@ -177,7 +177,7 @@ static int set_canvas_nv12m(struct amvdec_session *sess,
>>>  }
>>>  
>>>  int amvdec_set_canvases(struct amvdec_session *sess,
>>> -			u32 reg_base[], u32 reg_num[])
>>> +			const u32 reg_base[], const u32 reg_num[])
>>>  {
>>>  	struct v4l2_m2m_buffer *buf;
>>>  	u32 pixfmt = sess->pixfmt_cap;
>>> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
>>> index cfaed52ab526..ace8897c34fe 100644
>>> --- a/drivers/staging/media/meson/vdec/vdec_helpers.h
>>> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
>>> @@ -17,7 +17,7 @@
>>>   * @reg_num: number of contiguous registers after each reg_base (including it)
>>>   */
>>>  int amvdec_set_canvases(struct amvdec_session *sess,
>>> -			u32 reg_base[], u32 reg_num[]);
>>> +			const u32 reg_base[], const u32 reg_num[]);
>>>  
>>>  /* Helpers to read/write to the various IPs (DOS, PARSER) */
>>>  u32 amvdec_read_dos(struct amvdec_core *core, u32 reg);
>>>
>>

