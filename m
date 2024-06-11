Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E537A219E7
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718099949; cv=none; b=pEdG7W4Z6uZTq6SVDWGXpOCjCAkzaGFfUM7+uzy4Q8T+i9R+qfsugpBEwInQLnM2JLb49RrDT1F6P9g1EO2iRZA2HsiPpUCkrKdYqjjxo0vEVH8z8zxv4jcKjEAzjZbZrt3Mz5cta0VzSDwwtSUkhD7/SXuwoedLdSo2rND0YB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718099949; c=relaxed/simple;
	bh=ZeL9hjOwfSTP/u1wNJb2SMq6b9kcFv8XigR9cfdFAQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1IwyClxXEwLj2+NhWwyvJLlUO9aRnfKIk3YCEpYxqN0cuup3VXK9bFcykwu1VIAxOQsBklCmZWxbZqONZsdVuojGccgHhsN4wx+kRp4pu7jMzSBkdJPAWIGCd8qO5ok0l1CDIRu9s7seVF9A43eLRs6jpryISwvjUSgXyBdGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=GN2M5fCb; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="GN2M5fCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718099933; x=1718704733; i=wahrenst@gmx.net;
	bh=7Lo77F497GQgN3P/LniDsgMdISmvcqOgECttg3aOVek=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GN2M5fCbO+108dPp/QjTZc0oCRuJNv+oF2IIfK8pxuI0KDAVD948evSaYMcSoQRl
	 tSyNonzH8BrCW/JtHTJeV2El34A84Ce3wDgydK/Kg2pQHAudj05AoCMxMbbUiFzep
	 xoiYMbHWYLQGQ0N2vblnhQm79YT5QR7WhCYahATkES9Xf3sm5z+gHlp6vaMbOHQOW
	 9yJ/i/S9H1jJWhGfMyPR+XQfxdDUfPwn+tHi8Vmun0PE7jAD+QVITCuonU+ZOy8Ba
	 zZa9ZPKqv5yzcKxHk9UIKv5Ecf/qBr7EqrhC+zigu9XPHArY6zoPbZg/U/saAIfrJ
	 +za+z3SZ4z7RriaLTg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTAFb-1rqNus0EgB-00RgLc; Tue, 11
 Jun 2024 11:58:53 +0200
Message-ID: <2c13e81a-f5b4-4869-96d9-a9caa2096e24@gmx.net>
Date: Tue, 11 Jun 2024 11:58:52 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 07/10] staging: vchiq_arm: Reduce indentation of
 service_callback
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20240610210220.95524-1-wahrenst@gmx.net>
 <20240610210220.95524-8-wahrenst@gmx.net>
 <88eb1d33-9423-4a5a-b5b1-f858dd9169aa@moroto.mountain>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <88eb1d33-9423-4a5a-b5b1-f858dd9169aa@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:SJaQVvqPVCMTJmzgspHr4MRyO2prtUwtR7diq7RyYuUqu6bglSN
 vVQuuZ4f79mqEsa24nHfPW5hxgkm4zRL7BMLO8EWdWOMeJU58LAp2U6xx3pyNmf2bnsp105
 WI2ipzRDR8aYQZ65UmvM2F6O28KIRysGwK59sU2bgCv4nzwkAYLrc7RdHVmr1D4MGbxs+k4
 nGL3h5wS0FqIWmi7wrJNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4cYtoKac00o=;e4zi8BEgqwXezsphh4zKy69TeYT
 pkvdI3/lBHjd+Cpm8G3stIj3w7p6qb9T/tRRoz+pW+weDmAAo8rkBOAsCC5QP22GwKlhXqsWn
 UaP8S10xTuKNZZZ+s3TKnkwIRgNkQzFnw1wruN2h6lK9cwOLvzYwXDLyCrfTglgzPrfJBzwuH
 Mf7JA4P31ljhQP92KmpRDFAZA3MAS3ONdFMEUrr1uvYbDAP834WFLzu/1nPwUS/g/lGXH8Xky
 5olY2jc6SVij4U3OoOjFk6A+Jt7iBNxXoApK9wiBWqakrnycMv8wIIacCxGgnkXHZB4IvGX7+
 dwBrLA8nQR6pgMyzdj8CNWBsNMR4gz1kVVAXdOypihmB/RqHZLNzxnh4+J/lNbzbKG9euMqGt
 rmuvJbk1UB0EBqvhUQ7lm056lt8gjlW2ucoe22vw+MToc3YhAkvSlgF/1ja8VOfQ+QCt8cgbx
 O2y2A2Z7d0gJzaMVdfQ25Iq85XR2EK6GhogkiJoN8H5moAOy40/W/P1GnQy5wRlupbiYNiMQd
 Jpow8tGkbHIS6G5LtYzXKV+lIJR0OHk9SCjOk+Bn8mrhPZeC4UwdzgJtkFwk0bqWPXpHSJhre
 9GW57pCSWmjNu6ySCM1fVZO8FZArEmr1viWdieHALK6+zUTzhrPfrxsql4btlDZjP/Nyx3toY
 PKPf7xyTeQ51Y+vyP83rXKoP7qdkjlABXJy0GEMrYqd9SDtLRwZib1U0JXAcyyNsSfAlUycdm
 zLN3Zr2ur0BSxr4TBiMK8iSF2iN+WaT49d+1mLAnLhgyQ357RN1zNIKtHXmm9yBekI6ph36wq
 wcutZYSTXkJ6bjonv3SQk+FZY6vJFlD2iQLrhMvwXiTr4=

Hi Dan,

Am 11.06.24 um 08:01 schrieb Dan Carpenter:
> On Mon, Jun 10, 2024 at 11:02:17PM +0200, Stefan Wahren wrote:
>> The service_callback has 5 levels of indentation, which makes it
>> hard to read. Reduce this by splitting the code in a new function
>> service_single_message() as suggested by Laurent Pinchart.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   .../interface/vchiq_arm/vchiq_arm.c           | 68 +++++++++++--------
>>   1 file changed, 39 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index 0ba52c9d8bc3..706bfc7a0b90 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -1055,6 +1055,39 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
>>   	return 0;
>>   }
>>
>> +static int
>> +service_single_message(struct vchiq_instance *instance,
>> +		       enum vchiq_reason reason,
>> +		       struct vchiq_service *service, void *bulk_userdata)
>> +{
>> +	struct user_service *user_service;
>> +
>> +	user_service = (struct user_service *)service->base.userdata;
>> +
>> +	dev_dbg(service->state->dev, "arm: msg queue full\n");
>> +	/*
>> +	 * If there is no MESSAGE_AVAILABLE in the completion
>> +	 * queue, add one
>> +	 */
>> +	if ((user_service->message_available_pos -
>> +	     instance->completion_remove) < 0) {
>> +		dev_dbg(instance->state->dev,
>> +			"arm: Inserting extra MESSAGE_AVAILABLE\n");
>> +		return add_completion(instance, reason, NULL, user_service,
>> +				      bulk_userdata);
> In the original code we added a completion and
>
>> +	}
>> +
>> +	if (wait_for_completion_interruptible(&user_service->remove_event)) {
> then waited for it here...  Why did this change?
Oops, this wasn't intended. Thanks for catching this.
>
> regards,
> dan carpenter
>
>> +		dev_dbg(instance->state->dev, "arm: interrupted\n");
>> +		return -EAGAIN;
>> +	} else if (instance->closing) {
>> +		dev_dbg(instance->state->dev, "arm: closing\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   int
>>   service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
>>   		 struct vchiq_header *header, unsigned int handle, void *bulk_userdata)
>> @@ -1104,41 +1137,18 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
>>   		spin_lock(&service->state->msg_queue_spinlock);
>>   		while (user_service->msg_insert ==
>>   			(user_service->msg_remove + MSG_QUEUE_SIZE)) {
>> +			int ret;
>> +
>>   			spin_unlock(&service->state->msg_queue_spinlock);
>>   			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>>   			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
>> -			dev_dbg(service->state->dev, "arm: msg queue full\n");
>> -			/*
>> -			 * If there is no MESSAGE_AVAILABLE in the completion
>> -			 * queue, add one
>> -			 */
>> -			if ((user_service->message_available_pos -
>> -				instance->completion_remove) < 0) {
>> -				int ret;
>> -
>> -				dev_dbg(instance->state->dev,
>> -					"arm: Inserting extra MESSAGE_AVAILABLE\n");
>> -				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>> -				ret = add_completion(instance, reason, NULL, user_service,
>> -						     bulk_userdata);
>> -				if (ret) {
>> -					DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>> -					vchiq_service_put(service);
>> -					return ret;
>> -				}
>> -			}
>>
>> -			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>> -			if (wait_for_completion_interruptible(&user_service->remove_event)) {
>> -				dev_dbg(instance->state->dev, "arm: interrupted\n");
>> -				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>> -				vchiq_service_put(service);
>> -				return -EAGAIN;
>> -			} else if (instance->closing) {
>> -				dev_dbg(instance->state->dev, "arm: closing\n");
>> +			ret = service_single_message(instance, reason,
>> +						     service, bulk_userdata);
>> +			if (ret) {
>>   				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>>   				vchiq_service_put(service);
>> -				return -EINVAL;
>> +				return ret;
>>   			}
>>   			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>>   			spin_lock(&service->state->msg_queue_spinlock);
>> --
>> 2.34.1
>>

