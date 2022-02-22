Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3336929A4
	for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 13:36:55 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id m185so20099620iof.10
        for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 05:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FK7qt6xgpz95ThWUwGExdK4EPexQLIQmLfJrzAo+MW4=;
        b=VYdDylPcVfnkXLk+tjShAHfxjsxlFw2vPvgzDlNlXSfrOHtGTCEFpsZtPsweqqJeVn
         ctA6F01BcY5i1RliOhFhejbYeae4jlxKUlxUQ0vzVkyRMqhYzHye7eyvj1HAkJHSyoo0
         GJUlMw7Znmn3OGq4J+0xVvEYxo4WSwZzMtuuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FK7qt6xgpz95ThWUwGExdK4EPexQLIQmLfJrzAo+MW4=;
        b=V6X5aJFDyPJK8aPUZ7fqheyyYhr9LtJBEu84jG+b69PXXK5CQaSgU80wFkxlRDf8V0
         ExJhFCzMXFFIllR0X20WtlPlmGrSZXJeNE03gm/eCNDN52hWUEZq2U5Qn0KZTIGSKIkT
         2jNdJ42dK9ZVcN3bq2fffON2LO5n166oFnKttwLKWm0ZRrtoOYzbabuOZ0YeRljlu3c5
         cHCE79kCTVZxDrhWNsM5TT/Lg3ifbbbQNTfXu5eSfxewcEicbB3wSRQzlneqChfkJkqg
         ByjM8F8hgGKtwjfRz782uuZ3mmwbQmIPQgF3aI4IG/zCltb9YzYLZAs4kklZd+i4R77E
         ilyg==
X-Gm-Message-State: AOAM532sNNEKENxBj6qZ4ttPxIgsjwdBN0Z5/9vwTFRoKBaVB/5ZAGgF
	NNtg5TpYMiurjyDLpYMAybXenQ==
X-Google-Smtp-Source: ABdhPJxn55uoJgQ6VmlzDSxVVHifLMoM4/PKeoJQp5lq1lxBd336HTQfqPYuuXIX9avCcCrhnoqixw==
X-Received: by 2002:a05:6638:3283:b0:314:1d49:d553 with SMTP id f3-20020a056638328300b003141d49d553mr19882440jav.48.1645537014232;
        Tue, 22 Feb 2022 05:36:54 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id 2sm8450055ioz.48.2022.02.22.05.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 05:36:53 -0800 (PST)
Message-ID: <1f8fb11a-4f22-2301-45be-482141b1a18d@ieee.org>
Date: Tue, 22 Feb 2022 07:36:52 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] staging: greybus: introduce pwm_ops::apply
Content-Language: en-US
To: Song Chen <chensong_2000@189.cn>, Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
References: <1644580947-8529-1-git-send-email-chensong_2000@189.cn>
 <YhPGqg2BydlAFiM1@kroah.com> <ccbddd00-a2d6-c613-bc7b-e08d7fa2306b@189.cn>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ccbddd00-a2d6-c613-bc7b-e08d7fa2306b@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/22/22 12:19 AM, Song Chen wrote:
> Hi Greg,
> 
> 在 2022/2/22 01:06, Greg KH 写道:
>> On Fri, Feb 11, 2022 at 08:02:27PM +0800, Song Chen wrote:
>>> Introduce apply in pwm_ops to replace legacy operations,
>>> like enable, disable, config and set_polarity.
>>>
>>> Signed-off-by: Song Chen <chensong_2000@189.cn>

. . .

>>> diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
>>> index aeb8f9243545..81a6f16de098 100644
>>> --- a/include/linux/greybus/greybus_protocols.h
>>> +++ b/include/linux/greybus/greybus_protocols.h
>>> @@ -812,8 +812,8 @@ struct gb_pwm_deactivate_request {
>>>   struct gb_pwm_config_request {
>>>       __u8    which;
>>> -    __le32    duty;
>>> -    __le32    period;
>>> +    __u64    duty;
>>> +    __u64    period;
>>>   } __packed;
>>
>> Did you just change a greybus protocol message that is sent over the
>> wire?  Why?  And why drop the endian marking of it?
> 
> I discussed with Uwe about losing bit and found there is no perfect
> way to avoid, even in Uwe's patch[1], as a result, we decided to

The patch you reference [1] does not change the size of the
duty cycle and period, it only ensures the value passed is
no more than can be represented in an integer.

> widen duty and period in gb_pwm_config_request, the other side of the
> wire is supposed to change accordingly to support 64bit duty and

This is what Greg meant about changing the over-the-wire protocol
message format.  You can't do that, or rather, if you do that, it
is a *lot* more work than just changing it as you have done here.

If it is really required (and that's not clear, at least not at
this time), then you need to modify the protocol version, and
then make sure the versioning logic works correctly, both on
the AP side and on the module side for all existing modules.

I would suggest that it is *not* required though, because the
existing module code was built with the assumption that it would
be provided a 32-bit unsigned value for its duty cycle and period.
So as long as you make sure the AP side doesn't send anything
nonsensical, they will continue to work as desired.

The correct fix in this case (assuming you don't want to change
the protocol) is to ensure that whatever value is passed in to
the pwm_ops->config callback (which is gb_pwm_config()) is
adjusted to be within a range usable by the existing protocol.
Since it's actually an unsigned value, you could double the
range supported without changing the protocol if you wanted to
do that.

> period too(this will introduce compatibility problem and there is no
> variable like version to address it), similar with ktime_t in y2038,
> below is the detail [2]

And similar to addressing the Y2038 issue, it is not an easy thing to do.

> [1]:https://lore.kernel.org/all/20210312212119.1342666-1-u.kleine-koenig@pengutronix.de/
> [2]:https://lore.kernel.org/all/20220211071601.4rpfbkit6c6dre2o@pengutronix.de/
> 
> endian is a problem, i shouldn't drop it.

This is absolutely correct.  Did you attempt to compile this?

					-Alex

> BR
> 
> Song
> 
>>
>> Are you sure this is ok?
>>
>> thanks,
>>
>> greg k-h
>>

