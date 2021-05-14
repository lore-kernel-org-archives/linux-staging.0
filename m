Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6090372
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 18:53:52 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id u11so422086oiv.1
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 11:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zsP1swaVnZ3gwBOAETZF0+VFFNM9mdYu1hhenz1zH4s=;
        b=OV757hLdujN1DrMhcQyCyIj0ZmeeEM/DjB7zk4Y6BZrIqpU4CVlxZPtxiiCPrWc1wE
         aWinxqtrz6DInbTiZZk9DUlCRx6pU+u3wN61HAOo18IXdwONJPku5lOcr3sjR4F+1Ml7
         vl58qj4DF5qaIHK+3+33YxR3Z0k7woY833uvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zsP1swaVnZ3gwBOAETZF0+VFFNM9mdYu1hhenz1zH4s=;
        b=edYtsXEgCI98eGZNDtvEOfqvyVvhk9/RXWU6iFqPLESQBy+53xXf16Zyoz371CZFn1
         zDwcAM2miXsF/JKUDafFG4vgO8mKetxIV6bVERj/LR9mm5Zm1Ncvf5uukTXazGV7UVpT
         XaGCychdcNjELHSUlql+17W83cI4Pi6RcyO6Wrk94zaiWT2MWSHkDoryj5n6kfApJATK
         UDehxwWtS/JF0/b/TD/UaZw+fHWE0Lnlwyz5+7w1qKV4E8lcemR8CFSlXqNX8A4RgURs
         yGmApi67OuL6FelHrbHif3iNGhBdRnimXHUEO1ucIdA5Tw5tBSsseuRRxE4G0H0WmzXP
         wkag==
X-Gm-Message-State: AOAM530ZadbJuIWI01yIutRcysASy0MEAUhnUDhJXC4d+6MYqUdR4TV2
	LtT2Mz259mIhrMS6H1C3w/uoOw==
X-Google-Smtp-Source: ABdhPJxXwDgEx6dnvY9yAIXs2Ip7D6t8VuB40mpwPFTWYXao2Rit5bd8FM9lO4YDUNOD37/qNk3eVw==
X-Received: by 2002:aca:f206:: with SMTP id q6mr7829094oih.80.1621018431452;
        Fri, 14 May 2021 11:53:51 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id c17sm1536944otn.45.2021.05.14.11.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 11:53:50 -0700 (PDT)
Subject: Re: [PATCH] staging: greybus: fix gb_loopback_stats_attrs definition
To: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>,
 Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
 <YJ582f3O9K9YD3QA@kroah.com> <YJ5/tqFfcjxOLsF0@fedora>
 <YJ6DrLiMsdkG5loA@kroah.com> <YJ6H/WsojYcN/bLO@fedora>
 <YJ6Jf+Z1ReVgDt64@kroah.com> <YJ6TUAowTI75h/sl@fedora>
 <YJ6XpUMliWQOS8MB@kroah.com>
 <bccbec1a0ffbf6c31b5e6a78cedd78cd64f2b8fe.camel@perches.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <88d7da63-d03c-7fa3-a881-aff8e7b4a618@ieee.org>
Date: Fri, 14 May 2021 13:53:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <bccbec1a0ffbf6c31b5e6a78cedd78cd64f2b8fe.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/14/21 10:56 AM, Joe Perches wrote:
> On Fri, 2021-05-14 at 17:30 +0200, Greg KH wrote:
>> On Fri, May 14, 2021 at 08:42:16PM +0530, Shreyansh Chouhan wrote:
> []
>>> I didn't look at how/where was the macro called and missed a very
>>> obvious error. Now that I have looked at it, the only way I can think of
>>> fixing this is changing the macro to a (inline?) function. Will
>>> that be a desirable change?
>>
>> No, it can't be a function, the code is fine as-is, checkpatch is just a
>> perl script and does not always know what needs to be done.
> 
> true.
> 
> perhaps better though to rename these declaring macros to start with declare_

I don't disagree with your suggestion, but it's not clear it
would have prevented submission of the erroneous initial patch
(nor future ones from people who blindly follow checkpatch.pl
suggestions).

					-Alex

PS  Lots of negatives in that sentence.

> Something like this:
> (with miscellaneous realigning of the macros line ending continuations \)
> ---
>   drivers/staging/greybus/loopback.c | 72 +++++++++++++++++++-------------------
>   1 file changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 2471448ba42a..dc399792f35f 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -119,18 +119,18 @@ module_param(kfifo_depth, uint, 0444);
>   #define GB_LOOPBACK_US_WAIT_MAX				1000000
>   
>   /* interface sysfs attributes */
> -#define gb_loopback_ro_attr(field)				\
> -static ssize_t field##_show(struct device *dev,			\
> +#define declare_gb_loopback_ro_attr(field)				\
> +static ssize_t field##_show(struct device *dev,				\
>   			    struct device_attribute *attr,		\
>   			    char *buf)					\
>   {									\
>   	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%u\n", gb->field);			\
> +	return sprintf(buf, "%u\n", gb->field);				\
>   }									\
>   static DEVICE_ATTR_RO(field)
>   
> -#define gb_loopback_ro_stats_attr(name, field, type)		\
> -static ssize_t name##_##field##_show(struct device *dev,	\
> +#define declare_gb_loopback_ro_stats_attr(name, field, type)		\
> +static ssize_t name##_##field##_show(struct device *dev,		\
>   			    struct device_attribute *attr,		\
>   			    char *buf)					\
>   {									\
> @@ -142,8 +142,8 @@ static ssize_t name##_##field##_show(struct device *dev,	\
>   }									\
>   static DEVICE_ATTR_RO(name##_##field)
>   
> -#define gb_loopback_ro_avg_attr(name)			\
> -static ssize_t name##_avg_show(struct device *dev,		\
> +#define declare_gb_loopback_ro_avg_attr(name)				\
> +static ssize_t name##_avg_show(struct device *dev,			\
>   			    struct device_attribute *attr,		\
>   			    char *buf)					\
>   {									\
> @@ -151,8 +151,8 @@ static ssize_t name##_avg_show(struct device *dev,		\
>   	struct gb_loopback *gb;						\
>   	u64 avg, rem;							\
>   	u32 count;							\
> -	gb = dev_get_drvdata(dev);			\
> -	stats = &gb->name;					\
> +	gb = dev_get_drvdata(dev);					\
> +	stats = &gb->name;						\
>   	count = stats->count ? stats->count : 1;			\
>   	avg = stats->sum + count / 2000000; /* round closest */		\
>   	rem = do_div(avg, count);					\
> @@ -162,12 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
>   }									\
>   static DEVICE_ATTR_RO(name##_avg)
>   
> -#define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +#define declare_gb_loopback_stats_attrs(field)				\
> +	declare_gb_loopback_ro_stats_attr(field, min, u);		\
> +	declare_gb_loopback_ro_stats_attr(field, max, u);		\
> +	declare_gb_loopback_ro_avg_attr(field)
>   
> -#define gb_loopback_attr(field, type)					\
> +#define declare_gb_loopback_attr(field, type)				\
>   static ssize_t field##_show(struct device *dev,				\
>   			    struct device_attribute *attr,		\
>   			    char *buf)					\
> @@ -193,8 +193,8 @@ static ssize_t field##_store(struct device *dev,			\
>   }									\
>   static DEVICE_ATTR_RW(field)
>   
> -#define gb_dev_loopback_ro_attr(field, conn)				\
> -static ssize_t field##_show(struct device *dev,		\
> +#define declare_gb_dev_loopback_ro_attr(field, conn)			\
> +static ssize_t field##_show(struct device *dev,				\
>   			    struct device_attribute *attr,		\
>   			    char *buf)					\
>   {									\
> @@ -203,7 +203,7 @@ static ssize_t field##_show(struct device *dev,		\
>   }									\
>   static DEVICE_ATTR_RO(field)
>   
> -#define gb_dev_loopback_rw_attr(field, type)				\
> +#define declare_gb_dev_loopback_rw_attr(field, type)			\
>   static ssize_t field##_show(struct device *dev,				\
>   			    struct device_attribute *attr,		\
>   			    char *buf)					\
> @@ -223,7 +223,7 @@ static ssize_t field##_store(struct device *dev,			\
>   	if (ret != 1)							\
>   		len = -EINVAL;						\
>   	else								\
> -		gb_loopback_check_attr(gb);		\
> +		gb_loopback_check_attr(gb);				\
>   	mutex_unlock(&gb->mutex);					\
>   	return len;							\
>   }									\
> @@ -268,26 +268,26 @@ static void gb_loopback_check_attr(struct gb_loopback *gb)
>   }
>   
>   /* Time to send and receive one message */
> -gb_loopback_stats_attrs(latency);
> +declare_gb_loopback_stats_attrs(latency);
>   /* Number of requests sent per second on this cport */
> -gb_loopback_stats_attrs(requests_per_second);
> +declare_gb_loopback_stats_attrs(requests_per_second);
>   /* Quantity of data sent and received on this cport */
> -gb_loopback_stats_attrs(throughput);
> +declare_gb_loopback_stats_attrs(throughput);
>   /* Latency across the UniPro link from APBridge's perspective */
> -gb_loopback_stats_attrs(apbridge_unipro_latency);
> +declare_gb_loopback_stats_attrs(apbridge_unipro_latency);
>   /* Firmware induced overhead in the GPBridge */
> -gb_loopback_stats_attrs(gbphy_firmware_latency);
> +declare_gb_loopback_stats_attrs(gbphy_firmware_latency);
>   
>   /* Number of errors encountered during loop */
> -gb_loopback_ro_attr(error);
> +declare_gb_loopback_ro_attr(error);
>   /* Number of requests successfully completed async */
> -gb_loopback_ro_attr(requests_completed);
> +declare_gb_loopback_ro_attr(requests_completed);
>   /* Number of requests timed out async */
> -gb_loopback_ro_attr(requests_timedout);
> +declare_gb_loopback_ro_attr(requests_timedout);
>   /* Timeout minimum in useconds */
> -gb_loopback_ro_attr(timeout_min);
> +declare_gb_loopback_ro_attr(timeout_min);
>   /* Timeout minimum in useconds */
> -gb_loopback_ro_attr(timeout_max);
> +declare_gb_loopback_ro_attr(timeout_max);
>   
>   /*
>    * Type of loopback message to send based on protocol type definitions
> @@ -297,21 +297,21 @@ gb_loopback_ro_attr(timeout_max);
>    *					   payload returned in response)
>    * 4 => Send a sink message (message with payload, no payload in response)
>    */
> -gb_dev_loopback_rw_attr(type, d);
> +declare_gb_dev_loopback_rw_attr(type, d);
>   /* Size of transfer message payload: 0-4096 bytes */
> -gb_dev_loopback_rw_attr(size, u);
> +declare_gb_dev_loopback_rw_attr(size, u);
>   /* Time to wait between two messages: 0-1000 ms */
> -gb_dev_loopback_rw_attr(us_wait, d);
> +declare_gb_dev_loopback_rw_attr(us_wait, d);
>   /* Maximum iterations for a given operation: 1-(2^32-1), 0 implies infinite */
> -gb_dev_loopback_rw_attr(iteration_max, u);
> +declare_gb_dev_loopback_rw_attr(iteration_max, u);
>   /* The current index of the for (i = 0; i < iteration_max; i++) loop */
> -gb_dev_loopback_ro_attr(iteration_count, false);
> +declare_gb_dev_loopback_ro_attr(iteration_count, false);
>   /* A flag to indicate synchronous or asynchronous operations */
> -gb_dev_loopback_rw_attr(async, u);
> +declare_gb_dev_loopback_rw_attr(async, u);
>   /* Timeout of an individual asynchronous request */
> -gb_dev_loopback_rw_attr(timeout, u);
> +declare_gb_dev_loopback_rw_attr(timeout, u);
>   /* Maximum number of in-flight operations before back-off */
> -gb_dev_loopback_rw_attr(outstanding_operations_max, u);
> +declare_gb_dev_loopback_rw_attr(outstanding_operations_max, u);
>   
>   static struct attribute *loopback_attrs[] = {
>   	&dev_attr_latency_min.attr,
> 

