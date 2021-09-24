Received: from smtp181.sjtu.edu.cn (smtp181.sjtu.edu.cn [202.120.2.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1033FC7
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 02:57:56 +0000 (UTC)
Received: from proxy02.sjtu.edu.cn (smtp188.sjtu.edu.cn [202.120.2.188])
	by smtp181.sjtu.edu.cn (Postfix) with ESMTPS id 6A7D01008CBCD;
	Fri, 24 Sep 2021 10:57:53 +0800 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by proxy02.sjtu.edu.cn (Postfix) with ESMTP id 4CB78200BC2D9;
	Fri, 24 Sep 2021 10:57:53 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy02.sjtu.edu.cn ([127.0.0.1])
	by localhost (proxy02.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mox-xDx8C2lv; Fri, 24 Sep 2021 10:57:53 +0800 (CST)
Received: from [192.168.10.98] (unknown [202.120.40.82])
	(Authenticated sender: qtxuning1999@sjtu.edu.cn)
	by proxy02.sjtu.edu.cn (Postfix) with ESMTPSA id 2FB9E200B5750;
	Fri, 24 Sep 2021 10:57:19 +0800 (CST)
Message-ID: <3159c45c-b417-c157-e108-c0e12af2e122@sjtu.edu.cn>
Date: Fri, 24 Sep 2021 10:57:18 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] staging: vchip_arm: Fix misuse of %x
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>, nsaenz@kernel.org,
 peterz@infradead.org, maz@kernel.org, bsegall@google.com,
 rdunlap@infradead.org, airlied@redhat.com, kan.liang@linux.intel.com,
 odin@uged.al, phil@raspberrypi.com
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210923035554.669434-1-qtxuning1999@sjtu.edu.cn>
 <YUwOZjr06RV2BUi6@kroah.com>
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
In-Reply-To: <YUwOZjr06RV2BUi6@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2021/9/23 13:19, Greg KH wrote:
> On Thu, Sep 23, 2021 at 11:55:54AM +0800, Guo Zhi wrote:
>> Pointers should be printed with %p or %px rather than
>> cast to (unsigned long) and printed with %lx.
>> Change %lx to %pK to print the pointers.
>>
>> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
>> ---
>>   .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index b5aac862a29..408e5fe710b 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -591,11 +591,11 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
>>   		return VCHIQ_SUCCESS;
>>   
>>   	vchiq_log_trace(vchiq_arm_log_level,
>> -		"%s - service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_userdata %lx",
>> -		__func__, (unsigned long)user_service,
>> +		"%s - service %pK(%d,%p), reason %d, header %pK, instance %pK, bulk_userdata %pK",
>> +		__func__, user_service,
>>   		service->localport, user_service->userdata,
>> -		reason, (unsigned long)header,
>> -		(unsigned long)instance, (unsigned long)bulk_userdata);
>> +		reason, header,
>> +		instance, bulk_userdata);
> Why print this out at all?  What uses this?  Can it just be deleted?
>
> thanks,
>
> greg k-h

This information is printed for debugging usage.

But malicious user process can also print it through debugfs at 
/sys/kernel/debug.

As it can be used for debugging, it's a little radical to just delete.

Therefore, I suggest replacing %lx with %pK to avoid kernel address leakage.

thanks,

Guo


