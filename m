Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0277272
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 17:14:44 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id k26so4235187pfi.5
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7U9+zJYjAf+Rhfg180f5nzP1XSF1WIVuMlxaLJYkKQ8=;
        b=bah7/3Vqtn8tHlBNiyLef+utZeGdc1FiGtalUuj6q7FBZn7RqrtAaU6kNX3WSLlpff
         vRcNuNtlVbEb2Fctyy/2Elg1PuSIx5UQO6kvYTVN56VICGwa9h6RY822lGIoiYSjOLfU
         9tX38fOhDXweBN0MaF5USDTe3UiqkTlTw9mOTlU2ilsmruPggZIMuAE4WrV1b6jKLFnr
         lXakS0ZAHowe5/1+XpINF/4idUAQGJlc17LAw3l4+qJdMrptjw1p3fiyRT3lelqdKeRG
         R3R9BVujnqkjw924AfQpmS8v7eGfWuapfA+T+3pR/R651Px4vcQIxDznnH3z2Q+w1Qt8
         aKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7U9+zJYjAf+Rhfg180f5nzP1XSF1WIVuMlxaLJYkKQ8=;
        b=qE5ds3lcAdFOFhI7944qvyt1mbnwaNve4jjVTpK3pngbvuvThuUyNs64sbTRtMA3OF
         eoH1FwVoN1bkS8+P9HierydeUHxCMgZLiay6g+b153p3Rk4rla1/C7NHu7SsoIi8XXEb
         DDRqUw5oNNFKbB1eVZuGyvAYImz/z2ip578gqCB9xD6nNUtTooAqShi9mSD7i1u45MGb
         BvXod6rSfFF6/KpTtJTA4U9ZECop38n6pLhqZfX9nTJfqphTEmLtG4h1kGh+Adkc4jEH
         DM4oDOsC0VJCpE1sd7elz6TKkVd1WsQCzXmpApFkY1o+M3cYrGxYggY1XmYs1Bm4yHHs
         r6vw==
X-Gm-Message-State: AOAM533E0GCY/O+fw5vHzpgN5UZ2mlm2mkilQkqJ2LLVCdcvOGkGl8bi
	WYyVex7excVQTZt6cbG3qtI=
X-Google-Smtp-Source: ABdhPJxyIK92vOn4UulzUeIuCTEBsdHf2zZaD8KaezPhEwCpRxnkk0B202jvUC5p0h3wGv4u8ZqDDQ==
X-Received: by 2002:aa7:9250:0:b0:44c:27d1:7f0f with SMTP id 16-20020aa79250000000b0044c27d17f0fmr823778pfp.41.1634922884417;
        Fri, 22 Oct 2021 10:14:44 -0700 (PDT)
Received: from [192.168.1.4] ([59.95.89.188])
        by smtp.gmail.com with ESMTPSA id 21sm13095088pjg.57.2021.10.22.10.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 10:14:43 -0700 (PDT)
Message-ID: <1dfe5681-adf7-bb24-c68f-97c7d2748ba1@gmail.com>
Date: Fri, 22 Oct 2021 22:44:35 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: simplify the return
 statement
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
 ross.schm.dev@gmail.com, marcocesati@gmail.com, insafonov@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 saurav.girepunje@hotmail.com
References: <YWhBQF4yUH0/r53A@Sauravs-MacBook-Air.local>
 <20211014145726.GO8429@kadam>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <20211014145726.GO8429@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/10/21 8:27 pm, Dan Carpenter wrote:
> On Thu, Oct 14, 2021 at 08:10:00PM +0530, Saurav Girepunje wrote:
>>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 29 ++++++++-----------
>>  1 file changed, 12 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> index 0868f56e2979..217b86bfb722 100644
>> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> @@ -2281,19 +2281,16 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
>>  	struct rtw_wdev_priv *pwdev_priv = adapter_wdev_data(padapter);
>>
>>  	if (!name) {
>> -		ret = -EINVAL;
>> -		goto out;
>> +		return -EINVAL;
>>  	}
> 
> You need to delete the curly braces, otherwise your patch will introduce
> a checkpatch warning.  Same below as well.
> 
> regards,
> dan carpenter
> 

Ok, I will update patch for this and will send another version.
Thanks Dan for reviewing the patch.

Regards,
Saurav  
