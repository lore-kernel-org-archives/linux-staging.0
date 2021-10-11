Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E046B2C86
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 18:36:07 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id d13-20020a17090ad3cd00b0019e746f7bd4so129077pjw.0
        for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 11:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pxXTQM6RmhgcrnSppRCCyFTXq3C8AV2fRPD4SkoIa0s=;
        b=Wjj5H/vUjx6TL9+Yy2uMDRw89NjPLWwl53D+Irgq0+DwQM0lkZkzoz/vBSNsAknDLJ
         gNSDWo7KgGd0QO9yx1Dz5nnh2/fC3VjFxHPAzD0Fp8TnOcEfu6ONeaEMeQ/bc2uyIv5P
         YAJ/E5RePFfwtqTjTbTY2J9eq0ksGLDue8pKRYfS0GXvOvCMajFzHW4Our+R7eNNPwIH
         GYw5o61bhtPR3OT9ZyyO1ToKAQMT7il/hFDwR6cQilxv647tsI3eBt5oftRur9u71qpK
         aR+YohvEuIbhhoYR/V+2iqb3mQ/YZv6AOeU4ekxIpksco3AN8d1azJdUY0V0MCeoyI9O
         2wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pxXTQM6RmhgcrnSppRCCyFTXq3C8AV2fRPD4SkoIa0s=;
        b=yRA5b4YsPmUiCZm6acbzEYrFCxe63SUV2MQm7JcS9StTjTzag9fA4YSCSSRgrtwPYr
         0IyaydhTwhg68FMfLaqqrqUNOK2Pzd/mJEhAPEDaHaYs/Yj+0/8lqtN+4sUX2AIeamXm
         FEd7VXDAnB0UCacK16qGucGdPGjyvA8eenT3An/3dFLCZyfM5gs7msNEsRfdUPOkKEXk
         IV39J/tHI2hjea558MF/X2D/JWzLy0YpFVfr554umI/I/9RRyUJ12iPh8/5xhFgZFLt+
         0NYRfkr7sYfV5vehNSkQJmeAwfxTm4/H+PPyxoX5UzCvrCOeLMR6+DBfOOvz6KoPoin5
         susw==
X-Gm-Message-State: AOAM5300A0STr83gBZFgVXFjaJMw+frc25gqTQHNITFkQ2ELka+B9Iht
	GBqeX81F3g2azapSaPrBrZo=
X-Google-Smtp-Source: ABdhPJxdnp6pAhQX8JXoy40NovRqQ1x4lDqWH6jXll2OjEvH4sUX9wqC+LGadBAkS/5/+uBphLxPFw==
X-Received: by 2002:a17:90a:de0b:: with SMTP id m11mr718836pjv.90.1633977367251;
        Mon, 11 Oct 2021 11:36:07 -0700 (PDT)
Received: from [192.168.1.14] ([223.230.99.151])
        by smtp.gmail.com with ESMTPSA id j9sm8762349pgn.68.2021.10.11.11.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 11:36:06 -0700 (PDT)
Message-ID: <06a96ab3-9585-5d45-d316-8e6373cea705@gmail.com>
Date: Tue, 12 Oct 2021 00:06:02 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2] staging: rtl8723bs: os_dep: simplify the return
 statement.
Content-Language: en-GB
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 gregkh@linuxfoundation.org, fabioaiuto83@gmail.com, ross.schm.dev@gmail.com,
 marcocesati@gmail.com, insafonov@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YWJ0vSrgsiKK7suE@user> <2482197.HNbSr4JpUv@localhost.localdomain>
 <4541535.Yaozv5YaVW@localhost.localdomain>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <4541535.Yaozv5YaVW@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/21 6:03 pm, Fabio M. De Francesco wrote:
> On Monday, October 11, 2021 10:54:11 AM CEST Fabio M. De Francesco wrote:
>> On Sunday, October 10, 2021 7:06:05 AM CEST Saurav Girepunje wrote:
>>> Remove the unneeded and redundant check of variable on goto out.
>>> Simplify the return using multiple goto label to avoid
>>> unneeded check.
>>>
>>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>>> ---
>>>
>>> ChangeLog V2:
>>> 	-Add goto out after the memcpy for no error case return with
>>> 	 ret only. Free is not required on no error case.
>>
>> Please write versions logs that reflect clearly and unequivocally what you 
>> changed between revisions and why. Subjects, Commit messages (Changelogs), 
>> and Versions logs are the "specifics" of your work. There must be no 
>> inconsistencies between these and the code or the history of the changes of 
>> the code.
>>
>> You may think that I'm pedantic, but since I acked your patch, I don't want 
>> to be misunderstood to be a promoter of approximate or clearly incorrect 
>> messages.
>>
>> "Free is not required on no error case" conveys the message that you have 
>> changed something that is not required but that is still potentially 
> allowed.
>>
>> This is not the case because the problem that you fix with v2 is _not_ 
>> something that is merely not required and unnecessary. You have fixed a bug 
>> that is introduced in v1. Introducing bugs is not allowed. If you do 
>> something that is not allowed you cannot simply say that it is not 
> required. 
>>
>>>
>>> ChangeLog V1:
>>> 	-Remove the unneeded and redundant check of variable on
>>> 	 goto out.
>>> 	-Simplify the return using multiple goto label to avoid
>>> 	 unneeded check.
>>>
>>>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 22 +++++++++----------
>>>  1 file changed, 10 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/
>> staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>>> index 0868f56e2979..ae9579dc0848 100644
>>> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>>> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>>> @@ -2312,7 +2312,7 @@ static int rtw_cfg80211_add_monitor_if(struct 
> adapter 
>> *padapter, char *name, str
>>>  	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
>>>  	if (!mon_wdev) {
>>>  		ret = -ENOMEM;
>>> -		goto out;
>>> +		goto err_zmalloc;
>>>  	}
>>>
>>>  	mon_wdev->wiphy = padapter->rtw_wdev->wiphy;
>>> @@ -2322,23 +2322,21 @@ static int rtw_cfg80211_add_monitor_if(struct 
>> adapter *padapter, char *name, str
>>>
>>>  	ret = cfg80211_register_netdevice(mon_ndev);
>>>  	if (ret) {
>>> -		goto out;
>>> +		goto err_register;
>>>  	}
>>>
>>>  	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
>>>  	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ+1);
>>> +	goto out;
> 
> As Pavel noticed, probably you'd better return 'ret' here. The logic does not 
> change, but I guess that this is what Linux developers usually do.
> 
Yes, Logic does not change. However I was also not sure which one is more preferable 
therefore asked for input on v1 whether to use goto or simply return value from here.
It seems return from here is better choice for readability point of view. 
 
> From a review by Dan Carpenter of one of your other patches: "[] Do nothing
> labels only hurt readability and introduce "forgot to set the error code
> bugs.".
> 
> Thanks,
> 
> Fabio
> 
>>>
>>> -out:
>>> -	if (ret && mon_wdev) {
>>> -		kfree(mon_wdev);
>>> -		mon_wdev = NULL;
>>> -	}
>>> -
>>> -	if (ret && mon_ndev) {
>>> -		free_netdev(mon_ndev);
>>> -		*ndev = mon_ndev = NULL;
>>> -	}
>>> +err_register:
>>> +	kfree(mon_wdev);
>>> +	mon_wdev = NULL;
>>
>> Probably you have already read a message by Greg Kroah-Hartman that 
> confirms 
>> what I wrote in another message: "There is no need to set a local variable 
>> like this to NULL.".
>>
>> So please submit a v3. With the two changes requested above, my "acked-by" 
>> tag is confirmed again.
>>
>> Thanks,
>>
>> Fabio
>>
>>>
>>> +err_zmalloc:
>>> +	free_netdev(mon_ndev);
>>> +	*ndev = mon_ndev = NULL;
>>> +out:
>>>  	return ret;
>>>  }
>>>
>>> --
>>> 2.32.0
>>>
>>>
>>>
>>
>>
>>
>>
>>
> 
> 
> 
> 
Regards,
Saurav 
