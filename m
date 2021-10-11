Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40842C81
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 17:32:13 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id oa4so13071114pjb.2
        for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 10:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+KsewVMapVnqjNR+FmWVZGUP3TdIM7SDkQ2+XhYe4P0=;
        b=UdH2GouGVsj4bLMhrkV4J4QokQTPkRsVIj19Ny4XVx5bodcgh8ZSUzu8c0KocL8s/z
         tEZLlcRNQgJj2t3GIV3zPoylE+xwzCXv3CdCXFotgBZY95lglheHFq+LZjY7/Kp7Sd8Y
         lR/oOSyxVNKCsPjZF5Wwh0q5B+lsGe7yargrOsx23cf1oEx2Zzzt6HYkIkwUOPTAzuJX
         veyXzCdD4YiJYpTpihXFKv3a4y9ScuPzfWfbwT2VP0NOb+pt9SJqqPLdaqJmicqP7aoc
         a7ytL28igF/w3rIaJ+WnXSGqZa8pXdQw4QtFDvjJyJ6Xgl9tnoGTz7tNUfBmYzWXcA8u
         qi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+KsewVMapVnqjNR+FmWVZGUP3TdIM7SDkQ2+XhYe4P0=;
        b=BtCODLAAuPKoQBp2EVa9arnMKapT79XCrYGljqNQxfOdT2WAifGZ3sYW9ZBz3Bk9Do
         6lkJLVnOyhnw589R+XHll01HQVPuXgYqPfs/vz0AkrZl6G9L0hFYPzqgXM3Dh/J+2fAH
         YlItsOpNn9HUHabaYW3YT942MWgv3CEioqK22lx/aVOKaovxcjQ+IXKcXRZyyATxl96v
         Jsg0K6noC59DaDUNrSqBDNgOfXzu3T+gT4LBr8M6e6vVOKHcEn2rPkYZly9GlXdfqg+5
         nJEScFpm1K4n0BGOZYirsV2RBZDg6mANfJv407IxQxj/B7EyLpl4RkmlQ9AGbSuRUZyE
         FFpw==
X-Gm-Message-State: AOAM531UbcyqHTzRd+DkD1VtUiskTjZPY38Z46LV9xhDMKRAxRjwculd
	SHeUHjvWhoBUhgqcfVcxvqI=
X-Google-Smtp-Source: ABdhPJzMR1EoMqDfqoj1liajzybAJpHD3VNqw4qjhDRh4KQFXVfPn/a24QObYlSqmZyCZvdjl6/JSA==
X-Received: by 2002:a17:902:760b:b0:13b:122:5ff0 with SMTP id k11-20020a170902760b00b0013b01225ff0mr25756599pll.22.1633973533266;
        Mon, 11 Oct 2021 10:32:13 -0700 (PDT)
Received: from [192.168.1.14] ([223.230.99.151])
        by smtp.gmail.com with ESMTPSA id e12sm9153728pgv.82.2021.10.11.10.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 10:32:12 -0700 (PDT)
Message-ID: <71f1c0bc-08d1-7b0f-8000-e23a9bd88ba9@gmail.com>
Date: Mon, 11 Oct 2021 23:02:08 +0530
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
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <2482197.HNbSr4JpUv@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/21 2:24 pm, Fabio M. De Francesco wrote:
> On Sunday, October 10, 2021 7:06:05 AM CEST Saurav Girepunje wrote:
>> Remove the unneeded and redundant check of variable on goto out.
>> Simplify the return using multiple goto label to avoid
>> unneeded check.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>
>> ChangeLog V2:
>> 	-Add goto out after the memcpy for no error case return with
>> 	 ret only. Free is not required on no error case.
> 
> Please write versions logs that reflect clearly and unequivocally what you 
> changed between revisions and why. Subjects, Commit messages (Changelogs), 
> and Versions logs are the "specifics" of your work. There must be no 
> inconsistencies between these and the code or the history of the changes of 
> the code.
> 
> You may think that I'm pedantic, but since I acked your patch, I don't want 
> to be misunderstood to be a promoter of approximate or clearly incorrect 
> messages> "Free is not required on no error case" conveys the message that you have 
> changed something that is not required but that is still potentially allowed.
> 
> This is not the case because the problem that you fix with v2 is _not_ 
> something that is merely not required and unnecessary. You have fixed a bug 
> that is introduced in v1. Introducing bugs is not allowed. If you do 
> something that is not allowed you cannot simply say that it is not required. 
> 
My intension was to mention changes done on V2 with respect to V1. 
I will try to be more clear on changelog messages. 
>>
>> ChangeLog V1:
>> 	-Remove the unneeded and redundant check of variable on
>> 	 goto out.
>> 	-Simplify the return using multiple goto label to avoid
>> 	 unneeded check.
>>
>>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 22 +++++++++----------
>>  1 file changed, 10 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/
> staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> index 0868f56e2979..ae9579dc0848 100644
>> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> @@ -2312,7 +2312,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter 
> *padapter, char *name, str
>>  	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
>>  	if (!mon_wdev) {
>>  		ret = -ENOMEM;
>> -		goto out;
>> +		goto err_zmalloc;
>>  	}
>>
>>  	mon_wdev->wiphy = padapter->rtw_wdev->wiphy;
>> @@ -2322,23 +2322,21 @@ static int rtw_cfg80211_add_monitor_if(struct 
> adapter *padapter, char *name, str
>>
>>  	ret = cfg80211_register_netdevice(mon_ndev);
>>  	if (ret) {
>> -		goto out;
>> +		goto err_register;
>>  	}
>>
>>  	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
>>  	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ+1);
>> +	goto out;
>>
>> -out:
>> -	if (ret && mon_wdev) {
>> -		kfree(mon_wdev);
>> -		mon_wdev = NULL;
>> -	}
>> -
>> -	if (ret && mon_ndev) {
>> -		free_netdev(mon_ndev);
>> -		*ndev = mon_ndev = NULL;
>> -	}
>> +err_register:
>> +	kfree(mon_wdev);
>> +	mon_wdev = NULL;
> 
> Probably you have already read a message by Greg Kroah-Hartman that confirms 
> what I wrote in another message: "There is no need to set a local variable 
> like this to NULL.".
> 
Yes, Agree this is another improvement possible on this function.
> So please submit a v3. With the two changes requested above, my "acked-by" 
> tag is confirmed again.
> 
> Thanks,
> 
> Fabio
>
I will submit a v3.
>>
>> +err_zmalloc:
>> +	free_netdev(mon_ndev);
>> +	*ndev = mon_ndev = NULL;
>> +out:
>>  	return ret;
>>  }
>>
>> --
>> 2.32.0
>>
>>
>>
> 
> 
> 
> 
