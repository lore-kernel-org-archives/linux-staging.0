Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0CD2C81
	for <linux-staging@lists.linux.dev>; Sat,  9 Oct 2021 18:17:05 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id x8so8306665plv.8
        for <linux-staging@lists.linux.dev>; Sat, 09 Oct 2021 11:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:cc:subject:content-language
         :to:references:from:in-reply-to:content-transfer-encoding;
        bh=007I3r/K6V+qYxnE5VmcGCIC1RlYnIaC4Ivz6Ke0WkI=;
        b=QpKpSVYoRRYXZ6KuyGcVBossh3kIvBTZm92Bn98cYu5WxY7vQbPwRdlRte264B3F/C
         u/8+o/UucxDJEX5sSqgh+zDhiTv/fAdZgMdQVdcx2Q9NLf83MPhkVnicJ/qMgKyKXjq8
         FqMZVbD2s6jpMjiSfVnX0U+It/av/AhM7964eej7VjkGI8XLSzA+NkejMOBPNmRDU0us
         UAlPi5TwwT6JRmDjYnEt8jNqoIMlO5h5lAXkEQxa0mZe6bHzniVVu4wTH2MbejhIe4EY
         Hyh2vWB8lOSZJ7/IKGjkYV4qXG1CXprmtic62VJK7oCLUH4w8RuXt/sXoI23ldrf7eHZ
         7THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=007I3r/K6V+qYxnE5VmcGCIC1RlYnIaC4Ivz6Ke0WkI=;
        b=50Zg5cXtHQXeB6SLOt0uHp2cqSpcqA18gETV5JAAMDF0CRqDOchL2vDZZt6kP9T3wu
         ZM8uyMMoF2lQbOt6Kw3GFhjAEUrf4M3zwOZ2Z/eCZUHvk2zm3wLK3/dCMmNq93ulVc5Z
         V9OjCy32LnxszxQgdfGYba3G7mhOf5DIKX32bHt6/3hHZh801k4d6qQllk8LoWm2xXPA
         epxXIee7cqjOU6hHd7Cv4YWH5Y9viKxDIXNRSCU3gnnHIA3EWUi8YVbft9xbqszcpqMZ
         aqyAqb5Z9e129ZWXDCIyUPXPoQe/UigxxT3bn9qGuepxH0W/Frw/lymi32p2xedRZ2O0
         JuEg==
X-Gm-Message-State: AOAM5319xlctrrJvG7BcQg9UDS5zx8CD4bYH6dT/VL9Ial4I+up2hylk
	QNwDl/WYXRQxSoQbLBRoUfs=
X-Google-Smtp-Source: ABdhPJy3vrMGr2AAysKOKpCIABD9bWNf/h6ylAPSMt7LGOS/RGUqc9yxi8AqK90dRM/9guQ0Rlrmzw==
X-Received: by 2002:a17:90b:3850:: with SMTP id nl16mr19111548pjb.127.1633803424956;
        Sat, 09 Oct 2021 11:17:04 -0700 (PDT)
Received: from [192.168.1.6] ([223.230.43.197])
        by smtp.gmail.com with ESMTPSA id b16sm2838646pfm.58.2021.10.09.11.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Oct 2021 11:17:04 -0700 (PDT)
Message-ID: <50527d62-3c4e-3b61-5f17-225379c1d6c3@gmail.com>
Date: Sat, 9 Oct 2021 23:47:00 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Cc: saurav.girepunje@hotmail.com, fabioaiuto83@gmail.com,
 ross.schm.dev@gmail.com, marcocesati@gmail.com, insafonov@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: os_dep: simplify the return
 statement.
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
References: <YWG3oIchovDZnPl8@user> <1661874.ovfstkzlfj@localhost.localdomain>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <1661874.ovfstkzlfj@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/10/21 10:29 pm, Fabio M. De Francesco wrote:
> On Saturday, October 9, 2021 5:39:12 PM CEST Saurav Girepunje wrote:
>> Remove the unneeded and redundant check of variable on goto out.
>> Simplify the return using multiple goto label to avoid
>> unneeded check.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>   .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 29 ++++++++++---------
>>   1 file changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/
> staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> index 0868f56e2979..574fdb6adce7 100644
>> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> @@ -2282,18 +2282,18 @@ static int rtw_cfg80211_add_monitor_if(struct
> adapter *padapter, char *name, str
>>
>>   	if (!name) {
>>   		ret = -EINVAL;
>> -		goto out;
>> +		goto err_out;
>>   	}
>>
>>   	if (pwdev_priv->pmon_ndev) {
>>   		ret = -EBUSY;
>> -		goto out;
>> +		goto err_out;
>>   	}
>>
>>   	mon_ndev = alloc_etherdev(sizeof(struct
> rtw_netdev_priv_indicator));
>>   	if (!mon_ndev) {
>>   		ret = -ENOMEM;
>> -		goto out;
>> +		goto err_out;
>>   	}
>>
>>   	mon_ndev->type = ARPHRD_IEEE80211_RADIOTAP;
>> @@ -2312,7 +2312,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter
> *padapter, char *name, str
>>   	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
>>   	if (!mon_wdev) {
>>   		ret = -ENOMEM;
>> -		goto out;
>> +		goto err_zmalloc;
>>   	}
>>
>>   	mon_wdev->wiphy = padapter->rtw_wdev->wiphy;
>> @@ -2322,22 +2322,23 @@ static int rtw_cfg80211_add_monitor_if(struct
> adapter *padapter, char *name, str
>>
>>   	ret = cfg80211_register_netdevice(mon_ndev);
>>   	if (ret) {
>> -		goto out;
>> +		goto err_register;
>>   	}
>>
>>   	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
>>   	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ+1);
>>
>> -out:
>> -	if (ret && mon_wdev) {
>> -		kfree(mon_wdev);
>> -		mon_wdev = NULL;
>> -	}
>> +err_register:
>>
>> -	if (ret && mon_ndev) {
>> -		free_netdev(mon_ndev);
>> -		*ndev = mon_ndev = NULL;
>> -	}
>> +	kfree(mon_wdev);
>> +	mon_wdev = NULL;
>> +
>> +err_zmalloc:
>> +
>> +	free_netdev(mon_ndev);
>> +	*ndev = mon_ndev = NULL;
>> +
>> +err_out:
>>
>>   	return ret;
>>   }
>> --
>> 2.32.0
>>
> At a quick look it seems that now you unconditionally free memory and free a
> network device immediately after the last memcpy().
> 
> Why are you doing this even if no errors are returned from device and memory
> allocations (i.e., while "ret" is still equal to zero)?
> 
> Thanks,
> 
> Fabio
>   
> 
> 
> 

Thanks Fabio for review. Yes, That is missed.
I can do that in either one of the way.
Either I should check for ret before free or I should use goto out(may 
be I will rename err_out goto label to "out" only) just after the memcpy 
statement so that function will not free for no error case and return 
ret value only.

Please let me know you input on above.

Regards,
Saurav Girepunje
