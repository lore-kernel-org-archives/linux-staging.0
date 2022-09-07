Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333355C81
	for <linux-staging@lists.linux.dev>; Wed,  7 Sep 2022 13:19:02 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id r17so2922303ejy.9
        for <linux-staging@lists.linux.dev>; Wed, 07 Sep 2022 06:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=hGL47AsvkQpFBjqI3QRxxpdbSPmI5cqc00bOybuXXDs=;
        b=GNDQ72+jqEwY24a76iS/Jxduk/Rn8WcAJOtWmIp90Ln3228OhP1TgkIyk+ZllXTtjr
         29ZE1xTzqjSoE9t+6OvlZG14WUc80Cdzr18eviAyEQBjV1nJ50kxwAJpb34jBpZmli3S
         xtot2k1Z0AA8VmvXWtr9Y+H2KgkrQp3xbjH1nGYTWBS44z4jV0BtG3rv79Me5e26WoGO
         NE3NzhD/JO/TftFbz7PTNOZm/eGPZN0aGynNLybKbDl0UUFGhEbx12bA+CSi3QpAbA3t
         ioBslgicQOA50hHFVUYwhpOjwk4r4PehcieuSErpW2s6ImVm17rSsByUvn3rkqId1igK
         rlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hGL47AsvkQpFBjqI3QRxxpdbSPmI5cqc00bOybuXXDs=;
        b=2Ruojs39Pm7saFKr5sRdY78UwZKFBHzOery0VWZBsiF5N2jU6uFibe+AuMzHxEx9IG
         DUqr7tDcb5QxPriE+Y4bPXkvqkyB1gH6s0sU0owGBfTOqBhSMYotGjflEAIV3rYeGgU+
         dGQSL0xd0+OeF9dQJUiUl/m4emMjr362Gw/1Xmuk9YYHLYhAtFfcqH1bfFaqzdVwtUcz
         QJiZU2OKlnkKdA8wPHt+6gqSYVXR60H3wYRYDeMfeg0SorSQJVzzRVY1iyH6Ksfoi1l1
         QKjhXX1+ysdjQn/+beXRieErJFe+mGqSF62oPxriYfGcF6AQEXUC37HpiRsU0dsJioDc
         KMjw==
X-Gm-Message-State: ACgBeo1DucKPlsmegXYe5rDqcGNx2QScpa6rlFIDJ6J3AwVCSwEMeKRp
	EhbQ6I0S6KIMg8/YSKXzUaM=
X-Google-Smtp-Source: AA6agR6DCxHqXrrs2IxLOCxmIcrzJ3hHng+cUNf24dl58oWWx5dfb8RHkwGISW6PekeQvD8ySZNb1g==
X-Received: by 2002:a17:907:2672:b0:734:a952:439a with SMTP id ci18-20020a170907267200b00734a952439amr2141716ejc.539.1662556740352;
        Wed, 07 Sep 2022 06:19:00 -0700 (PDT)
Received: from [192.168.2.202] (pd9ea37fb.dip0.t-ipconnect.de. [217.234.55.251])
        by smtp.gmail.com with ESMTPSA id q13-20020aa7d44d000000b0044eb5b922bdsm4605981edr.24.2022.09.07.06.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 06:18:59 -0700 (PDT)
Message-ID: <041a0915-3c7e-4768-29e1-02a46f347c04@gmail.com>
Date: Wed, 7 Sep 2022 15:18:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] media: staging/intel-ipu3: Finalize subdev initialization
 to allcoate active state
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220907123359.1275322-1-luzmaximilian@gmail.com>
 <a194a9c5-ac8e-cf86-34cd-4f3a3cb6f6ec@ideasonboard.com>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <a194a9c5-ac8e-cf86-34cd-4f3a3cb6f6ec@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/7/22 14:46, Tomi Valkeinen wrote:
> Hi Maximilian,
> 
> On 07/09/2022 15:33, Maximilian Luz wrote:
>> Commit f69952a4dc1e ("media: subdev: add active state to struct
>> v4l2_subdev") introduced the active_state member to struct v4l2_subdev.
>> This state needs to be allocated via v4l2_subdev_init_finalize(). The
>> intel-ipu3 driver unfortunately does not do that, due to which,
> 
> That is fine, a driver only needs to allocate the active state if it uses
> the active state.
> 
>> active_state is NULL and we run into an oops (NULL pointer dereference)
>> when that state is accessed.
>>
>> In particular, this happens subdev in IOCTLs as commit 3cc7a4bbc381
>> ("media: subdev: pass also the active state to subdevs from ioctls")
>> passes that state on to the subdev IOCTLs. An example scenario where
>> this happens is running libcamera's qcam or cam on a device with IPU3,
>> for example the Microsoft Surface Book 2. In this case, the oops is
>> reproducibly in v4l2_subdev_get_try_crop(), called via
>> imgu_subdev_set_selection().
>>
>> To fix this, allocate the active_state member via
>> v4l2_subdev_init_finalize().
> 
> This is not a correct fix. Sakari has sent (and maybe pushed?) this:
> 
> https://lore.kernel.org/all/20220825190351.3241444-1-sakari.ailus@linux.intel.com/

Thanks! Unfortunately that doesn't fix the issue completely: That patch
addresses imgu_subdev_get_selection() but imgu_subdev_set_selection()
still runs into the oops.

I assume a similar fix to the one you linked is needed? I'll give that a
try.

Regards,
Max
