Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D98C1A;
	Wed, 18 Oct 2023 07:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F33C433C8;
	Wed, 18 Oct 2023 07:12:16 +0000 (UTC)
Message-ID: <61617735-c196-43e1-a4c6-539f348978e0@xs4all.nl>
Date: Wed, 18 Oct 2023 09:12:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/8] Add StarFive Camera Subsystem driver
Content-Language: en-US, nl
To: Jack Zhu <jack.zhu@starfivetech.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, bryan.odonoghue@linaro.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 changhuang.liang@starfivetech.com
References: <20231008085154.6757-1-jack.zhu@starfivetech.com>
 <98297bfc-ab81-4bb5-acc3-619fdf879276@xs4all.nl>
 <c255e215-b1ed-7397-0534-8d6ebda86350@starfivetech.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <c255e215-b1ed-7397-0534-8d6ebda86350@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2023 05:11, Jack Zhu wrote:
> 
> 
> On 2023/10/16 19:40, Hans Verkuil wrote:
>> Hi Jack,
>>
>> On 08/10/2023 10:51, Jack Zhu wrote:
>>> Hi,
>>>
>>> This series is the v10 series that attempts to support the Camera Subsystem
>>> found on StarFive JH7110 SoC.
>>>
>>> This series is based on top of the master branch of media_stage repository,
>>> which is tested with a v4l2-compliance compiled from the git repo
>>> (git://linuxtv.org/v4l-utils.git).
>>
>> I get one smatch warning:
>>
>> drivers/staging/media/starfive/camss/stf-isp.c:122 isp_enum_mbus_code() warn: unsigned 'code->index' is never less than zero.
>>
> 
> Could you please tell me the code check command? This way I can use it to check
> my next commit.

See https://repo.or.cz/smatch.git/blob/HEAD:/Documentation/smatch.txt

FYI: you can use the same build scripts that I use to verify patches. It is
described here:

https://lore.kernel.org/linux-media/18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl/

See the README for detailed instructions.

Regards,

	Hans

> 
>> And I also notice that there is no TODO file: staging drivers should have a
>> TODO file explaining what needs to be done to get them out of staging.
>>
> 
> OK, I'll add it to my next commit. I previously misunderstood that it was submitted
> when moving out of staging.
> 
>> I'm curious to know that as well :-)
>>
>> It looks like there is a lot of additional development that can be done, since
>> most of the ISP parameters appear to be hardcoded.
>>
> 
> Part is the module initialization configuration. In the next stage, we will use
> incremental development to implement 3A functions.
> 

