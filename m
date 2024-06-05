Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C214BFAB
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717582530; cv=none; b=WHPrbwapKYlWDTFebfBw1MBRmQsW5/nUsInSAGcBZGI/kIpDsBHWQgvTXT6dx8DCsbvXj1gOYOKMaNu+EW5p7ZdoT2NKk1oUGIWnfDkzNUsXiYPY4zseClnruavBd4urKRGmPpMHhNSLQ2YF+3gzQjh4Ew+g+n7YMp0fADcSa/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717582530; c=relaxed/simple;
	bh=1diuSmjx5CRms6Dyg5zNHWICNEAlhsxdLfjModWsjDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVSEYe2azcdMhzGJ4RVMzMXIPDi5nWEUJgwJAvGK+sWj7/yad2ucmKvSYjTWPxkfySQ5m6wEsRN0w/+KIzAcWCL2SURW1GrSmJJv/UO2cqxiCICpOfDlKJm+mv5FFjHzNc4C7NEN7J/ryodgtF3NKUuHlOBJ4QeBfwOJbygINDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=F1d1yzp5; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="F1d1yzp5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717582519; x=1718187319; i=wahrenst@gmx.net;
	bh=L9tAtdzAAOR4WYSVVxggeK3TYNNw9NlV8niSdcqWbLE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=F1d1yzp5Q7zPa2QX4HzCKZDPyVW3B5gckGrq6CH09Rjzapmk0XaRe9I4y8YyB9L/
	 xnsRrwSyN6ruGzUuSzOt1cJRn5jK66/tkZOuPvdk6WxRFyH/lA6GrgbtUnh+JLs0G
	 knN5Pk162hGLc5gJVPlgnVag9p6ek7hfNDwGpz1sBA4dWBOYcZrzkC/fJKfzWRioG
	 gFW7X+8Qc3BVL/FOLLxNt3hqyY8etzoANo13oFL1LXVFIQsnso+Kk8+6dvEyPigIM
	 3CHFKe9OyAoPtGbT9a2bJCKYm71j61TLVWHuF5fSwammQzAq9S5QS7to3ddJrbsLA
	 LuzXzbBGEqcBT41L0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhQC-1skmtX33iO-00p0dm; Wed, 05
 Jun 2024 12:15:19 +0200
Message-ID: <ce87bd2a-885f-4252-ac57-2fb5b238430c@gmx.net>
Date: Wed, 5 Jun 2024 12:15:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] staging: vchiq: Move struct vchiq_config to vchiq.h
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-10-wahrenst@gmx.net>
 <20240605071619.GI879@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240605071619.GI879@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZkJLrMT9pGBAMTxSgHJqsppJR3UZ2a60u5qWcG6tJZ+0F1ePGZv
 EF1z5Zz+E2StBEWaEmip02+ds89VDXAyb0ttId2JXFbWPqNZhr9FY5Z6ATXJQwXxc6ekQRC
 HFpbbyYBS2ONnyc3xsCSR9nuFZJ4K0JAaaJq3vAa0Y17VY2pbgn3i02Jo+2KdFvkd4QyGGv
 sTqkS8TQHe8K7HDPpme4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8qSbNh4cUAM=;YaG1/m3Z7Qcn7xCcxfDfpALX3lf
 bRmWVcx3bBgvuyTJNiT3GvtQH690iXohM+1z016Q0byw4TmyyguLfMWwcRKi+ywhKe0C0KPZs
 OOK1UIDcgTwEF8ysXcjMjD9JVnrjfD3/XZpVE7W5a+yPJfKs7wFKqJTuAa4rmAbsrLVBF8+51
 dlcO91WkO97YJE7EYIYiBz8KhFI51ehaTppU85W2njHE8lJwCG1nY7rJajmQy1wkumbkB7gPg
 NO8JaWQpfNr5SNQrj5QKJl49hx9agNIGHujiVcY1xKEWindx/9zxHbcrZmDec9xXdBLM2dmEc
 MNIoGO4uKYPxpJ0OJvPf0qobr+IqLv89ipGZnx2nbcSBwEgZBzaF2uEZ42bkmIo+Idnt8B/7b
 7CcrklRq3iuwtvEDbE2R97tzuGZLcs/ICIk3voSWHUTTVYuvJZuDsc+WND8L/64rw6byXyFpv
 nBHhtGAJUL/VwnvauOuyuCP6k4jsopuTnapgA8dNGZpzTYuoEeu0FYZDWgh0LZpkHYwEmW56T
 XKJW8sArjI9qlnqLobt2zjHrof0xy+dEzTvxcM0t7T7xu6IX0OA/TcOVTXxGhgoQxLKir9vZh
 qZpHuIx4mR54cz8mfxM3N6CFXsKLWq5RzslFHRY5Hg6Eus/xL0N/BQLFYGaSs0J7aPAHoeZpn
 b0km1jAKkqksp+24y3MJjlod9NkUSfpUP9tAU1HnrteAWPw90rUkLmqme+bGMVv49D37iTJKS
 YwhglHna5AVV3WgfS2xSZT0o4h0+RbugxDflmwELCCTRArNymhO5nLmw2GXwhQE0UF0FE60p7
 TJnePlRam1exJBJm0HS3YGRAlPlZgZ+dcSwXZoQ0MrXA8=

Hi Laurent,

Am 05.06.24 um 09:16 schrieb Laurent Pinchart:
> Hi Stefan,
>
> Thank you for the patch.
>
> On Tue, Jun 04, 2024 at 07:29:02PM +0200, Stefan Wahren wrote:
>> This struct is part of the VCHIQ userspace API, which we
>> don't want to break. So move the struct definition to
>> vchiq.h, which contains the rest of the userspace API.
> Dies it ? vchiq.h contains lots of kernel API elements. Beside, we have
> headers such as vc04_services/interface/vchiq_arm/vchiq_ioctl.h that
> contain UAPI elements.
>
> Splitting the UAPI to separate headers is a good idea. Could you address
> that task as a whole, and create a
> drivers/staging/vc04_services/include/uapi/linux/raspberrypi/vchiq.h
> file for the whole UAPI ?
yes, but not in this series. So i will drop it.
>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   .../vc04_services/include/linux/raspberrypi/vchiq.h  | 12 ++++++++++++
>>   .../vc04_services/interface/vchiq_arm/vchiq_core.h   | 12 ------------
>>   2 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
>> index 6c40d8c1dde6..2e34c67966c6 100644
>> --- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
>> +++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
>> @@ -79,6 +79,18 @@ struct vchiq_service_params_kernel {
>>   	short version_min;   /* Update for incompatible changes */
>>   };
>>
>> +struct vchiq_config {
>> +	unsigned int max_msg_size;
>> +	unsigned int bulk_threshold;	/* The message size above which it
>> +					 * is better to use a bulk transfer
>> +					 * (<= max_msg_size)
>> +					 */
>> +	unsigned int max_outstanding_bulks;
>> +	unsigned int max_services;
>> +	short version;      /* The version of VCHIQ */
>> +	short version_min;  /* The minimum compatible version of VCHIQ */
>> +};
>> +
>>   extern int vchiq_initialise(struct vchiq_state *state,
>>   			    struct vchiq_instance **pinstance);
>>   extern int vchiq_shutdown(struct vchiq_instance *instance);
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
>> index 3abcd6910f25..a83f9a5d478f 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
>> @@ -423,18 +423,6 @@ struct bulk_waiter {
>>   	int actual;
>>   };
>>
>> -struct vchiq_config {
>> -	unsigned int max_msg_size;
>> -	unsigned int bulk_threshold;	/* The message size above which it
>> -					 * is better to use a bulk transfer
>> -					 * (<= max_msg_size)
>> -					 */
>> -	unsigned int max_outstanding_bulks;
>> -	unsigned int max_services;
>> -	short version;      /* The version of VCHIQ */
>> -	short version_min;  /* The minimum compatible version of VCHIQ */
>> -};
>> -
>>   extern spinlock_t bulk_waiter_spinlock;
>>
>>   extern const char *

