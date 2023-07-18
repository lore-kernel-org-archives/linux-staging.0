Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4558B7E2
	for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 10:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90F4C433C7;
	Tue, 18 Jul 2023 10:33:09 +0000 (UTC)
Message-ID: <d252cbfe-98bb-2cd2-b251-81d29e99413d@xs4all.nl>
Date: Tue, 18 Jul 2023 12:33:08 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] media: imx: Unstage the imx8mq-mipi-csi2 driver
Content-Language: en-US
To: Martin Kepplinger <martin.kepplinger@puri.sm>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, shawnguo@kernel.org, festevam@gmail.com,
 slongerbeam@gmail.com, gregkh@linuxfoundation.org, rmfrfs@gmail.com,
 kernel@pengutronix.de, linux-imx@nxp.com, kernel@puri.sm,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230425090804.2664466-1-martin.kepplinger@puri.sm>
 <20230425094346.GA17841@pendragon.ideasonboard.com>
 <a4b3cf3be9f105adcbcad688f8745556eec4d9df.camel@puri.sm>
 <ae7865575edd11ab9e2bf81c54ee8826e0a2a766.camel@puri.sm>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ae7865575edd11ab9e2bf81c54ee8826e0a2a766.camel@puri.sm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2023 13:00, Martin Kepplinger wrote:
> Am Dienstag, dem 16.05.2023 um 09:42 +0200 schrieb Martin Kepplinger:
>> Am Dienstag, dem 25.04.2023 um 12:43 +0300 schrieb Laurent Pinchart:
>>> Hi Martin,
>>>
>>> Thank you for the patch.
>>>
>>> On Tue, Apr 25, 2023 at 11:08:04AM +0200, Martin Kepplinger wrote:
>>>> The imx8mq-mipi-csi2 MIPI CSI-2 receiver driver is used and
>>>> maintained.
>>>> There is no reason to keep it in staging. The accompanying CSI
>>>> bridge
>>>> driver that uses it is in drivers/media/platform/nxp as well.
>>>>
>>>> One TODO is to get rid of csi_state's "state" and "lock"
>>>> variables.
>>>> Especially make sure suspend/resume is working without them. That
>>>> can
>>>> very well be worked on from the new location.
>>>>
>>>> Also add a MAINTAINERS section for the imx8mq-mipi-csi2 mipi
>>>> receiver
>>>> driver.
>>>>
>>>> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Thanks for reviewing Laurent,
>>
>> Are there any second thoughts to this? If not: It still applies to
>> todays' next kernel. Who would be able to queue this up?
>>
>> (This enables Debian and other distributions to use cameras on
>> imx8mq.)
>>
>> thanks,
>>
>>                        martin
>>
> 
> This still applies cleanly and would be helpful. Does anyone want to
> queue this?

I'll queue this up, likely later this week.

Regards,

	Hans

> 
> thanks,
>                          martin
> 

