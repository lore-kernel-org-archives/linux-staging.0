Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54822198A3F
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728643704; cv=none; b=Pex4bIqqoIFJmP9YE62L5Yn1o2yWfYbr6XA/XLx19X9gH56WcvwdhRO+jPa8AcwMFdgEdfWXNs/Mfr86ow98+rZ2XBqeaSptfyYgt/t4mLZ1qf8ah4uqiukyC2Es+nHjG8f4MF72oyE7VBWeJwKhDTZTVi4lbtvVMrvRT0oM+zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728643704; c=relaxed/simple;
	bh=0mIpcsnmmc7WlMwsdZ44vbuzOFQ4E6EE40hIStwDpHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iW3L9P4RIItLVp/eER9w7aE0n2MQYzkVU5ZWlP5lIA53txJ5ZC6c/JZi76TxsFWG4deLKHvS2OjM0ps4WbQzccax6tToa3vWIkCvh3B4Qjf/dTGBdwkH4u/e61V367LjGU1Pz9RaM5cjfkNO+YROraK+sQkw39VenttU6UxfESY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D/SJF3ZM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D/SJF3ZM"
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2605A220;
	Fri, 11 Oct 2024 12:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728643594;
	bh=0mIpcsnmmc7WlMwsdZ44vbuzOFQ4E6EE40hIStwDpHw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D/SJF3ZMiTpu2m8jbzWQ/rTZgSjKBvwNpJIv0/Beg2IjIwoYP6atdBpdjsOegxnTn
	 QO8I/BaHCb/ygwzCQa6ggZkcOBEZ8Lp+8J9E+gdYdBUhpevNLNda/VF2ESGhcte+/t
	 O0GLPlIPkw7oC+6wybnnIxvDxqwXyB05eLMjG/2M=
Message-ID: <9ed1ca9d-a17e-46b7-ae08-81c3d44a6063@ideasonboard.com>
Date: Fri, 11 Oct 2024 16:18:08 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] staging: vchiq_core: Properly log dev_err()
To: Stefan Wahren <wahrenst@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 kernel-list@raspberrypi.com
References: <20241011072210.494672-1-umang.jain@ideasonboard.com>
 <20241011072210.494672-3-umang.jain@ideasonboard.com>
 <b0074647-f730-4d94-a11c-ebec7f48b928@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <b0074647-f730-4d94-a11c-ebec7f48b928@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan

On 11/10/24 4:15 pm, Stefan Wahren wrote:
> Hi Umang,
>
> [add Raspberry Pi guys to the loop]
>
> Am 11.10.24 um 09:22 schrieb Umang Jain:
>> Properly log a dev_err() message when the msgid is not of
>> VCHIQ_MSG_PADDING type. Drop 'oldmsgid' scoped variable and improve
>> on the error string as well.
>>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   .../vc04_services/interface/vchiq_arm/vchiq_core.c    | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git 
>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c 
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> index e9b60dd8d419..1dca676186b6 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>> @@ -1188,13 +1188,10 @@ queue_message_sync(struct vchiq_state *state, 
>> struct vchiq_service *service,
>>       header = (struct vchiq_header *)SLOT_DATA_FROM_INDEX(state,
>>           local->slot_sync);
>>
>> -    {
>> -        int oldmsgid = header->msgid;
>> -
>> -        if (oldmsgid != VCHIQ_MSGID_PADDING)
>> -            dev_err(state->dev, "core: %d: qms - msgid %x, not 
>> PADDING\n",
>> -                state->id, oldmsgid);
>> -    }
>> +    if (header->msgid != VCHIQ_MSGID_PADDING)
>> +        dev_err(state->dev,
>> +            "core: %d: qms - msgid %x, is not a PADDING message\n",
>> +            state->id, header->msgid);
> I'm fine with this change, but the behavior looks strange to me.
>
> Either this is a real error, I would expect the function would return
> with something like EINVAL here or this should be a warning?
>
> Sorry, no idea what's correct here.

indeed, I'll check the code path and see how it is used.

However, I will propose the change (if any) on top of this series/patch. 
Since it would be functional change ... so need to document it 
appropriately.

>
> Best regards
>>
>>       dev_dbg(state->dev, "sync: %d: qms %s@%pK,%x (%d->%d)\n",
>>           state->id, msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
>

