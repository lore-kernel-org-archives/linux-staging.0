Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8468379E1
	for <linux-staging@lists.linux.dev>; Thu,  4 May 2023 15:10:54 +0000 (UTC)
Received: from [192.168.1.5] ([183.94.69.234])
	(user=dzm91@hust.edu.cn mech=PLAIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 344F9wQT006378-344F9wQU006378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 4 May 2023 23:09:58 +0800
Message-ID: <e1feb1ba-4459-f160-25ad-328fbae90afe@hust.edu.cn>
Date: Thu, 4 May 2023 23:09:53 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] drivers: staging: greybus: fix GPF issue in
 gb_camera_capture
To: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacopo Mondi <jacopo.mondi@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@google.com>, greybus-dev@lists.linaro.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230504135841.1566958-1-dzm91@hust.edu.cn>
 <ZFPHHImqiVRRV5Cd@hovoldconsulting.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <ZFPHHImqiVRRV5Cd@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn


On 5/4/23 PM10:54, Johan Hovold wrote:
> On Thu, May 04, 2023 at 09:58:41PM +0800, Dongliang Mu wrote:
>> In gb_camera_capture(), it does not check the value of settings
>> before dereferencing it. And gb_camera_debugfs_capture calls
>> gb_camera_capture with the 6th parameter settings as NULL.
> Looks like you just broke gb_camera_debugfs_capture() which relies on
> passing NULL as settings.

Yes, just mentioned by Dan, this memcpy is intended with zero length and 
NULL src.

Please ignore this patch.

>> Fix this by checking the value of setting at the starting of
>> gb_camera_capture.
>>
>> Fixes: 3265edaf0d70 ("greybus: Add driver for the camera class protocol")
>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
>> ---
>>   drivers/staging/greybus/camera.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
>> index cdbb42cd413b..5a4b26e7f645 100644
>> --- a/drivers/staging/greybus/camera.c
>> +++ b/drivers/staging/greybus/camera.c
>> @@ -659,7 +659,7 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
>>   	size_t req_size;
>>   	int ret;
>>   
>> -	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE)
>> +	if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE || !settings)
>>   		return -EINVAL;
>>   
>>   	req_size = sizeof(*req) + settings_size;
> Johan
