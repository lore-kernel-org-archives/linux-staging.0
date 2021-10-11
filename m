Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91122C81
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 18:26:15 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id om14so2005649pjb.5
        for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VmcSECGnOUaWoR76+4+A/fQOEUXFG/jxjXv7Pvp4BiA=;
        b=nVosvBiAkKPDcjo/BdERl5hIJzb/pFgIZroGL3upHmftU7cFF93U8CvKhC65sYwtXQ
         ZbhZtvoPLZYVgmB55D2uBFufCIxiT4S3SWjAe89FDTFHRItgNlJ8vqBbnpYAjM7ywPiW
         pGlY7z73P4KlK8eok1R3GvT0z9W6zy9ro18EOpQKoW/wHOf5YE+ElBai1mZkQ93vPIJv
         hRH/SVPJe419ObCmhQKukQsxiW0aPvMOH3cpgLlt9j8fN9DXFEZE3K6Un7Kp8lllECDX
         u91hB1bEJhFMOL/AEAEmlFwm/3V9UeK5QKNwXZqtYI+q4x0X0qm7NBGREWrgFtctUuVr
         Iy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VmcSECGnOUaWoR76+4+A/fQOEUXFG/jxjXv7Pvp4BiA=;
        b=UfZP8Bx7aUTAEAuUtxmTIagEm1Cn6dCBNu8y6BlS8hl94dMBXWMaLAHUyUUoMvx24C
         ofV9XgKPgG8jx901j6OxWRT8VNCjWLSTOlVnZqLokeDB9vGSUl1FswwAVt+Qt+voIW49
         WQMajcs4NeuYwXek+/cRVMwMGsi3hulu1INEtnmTySv5Yc8aSOsxIehC/2wALAX0gBt1
         ZEU+LvjlS0rMC67uAuh5lsfg2IHidFbVpJrcSj//UwCbHqbrADVvtvS81gIgu9UQGHN2
         dpCfDZMjf/j4eXG0FO3JTEhqaaISwvRz5pKOVrCYsIz+24m1SpqjOdP4YecfMrEBOz6V
         agRQ==
X-Gm-Message-State: AOAM532t/z645z7/2A2bcr7QD3kvv45u+rvd+pR2soOq8JVGW47Air+R
	11/X3xJRAqSTzwYUSxyImfg=
X-Google-Smtp-Source: ABdhPJzJw/xG9013yI7BdK9Wf3d+oC5YwBN8CMkzv2Jd6/Ln0iTIITBHmCYg+jKlGMmia6BJDFDOhw==
X-Received: by 2002:a17:90b:4b07:: with SMTP id lx7mr592046pjb.195.1633976775221;
        Mon, 11 Oct 2021 11:26:15 -0700 (PDT)
Received: from [192.168.1.14] ([223.230.99.151])
        by smtp.gmail.com with ESMTPSA id a30sm8189651pfr.64.2021.10.11.11.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 11:26:14 -0700 (PDT)
Message-ID: <05689c1a-546b-7d5d-0196-59f1a2caaba4@gmail.com>
Date: Mon, 11 Oct 2021 23:56:10 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] staging: rtl8723bs: os_dep: simplify the return
 statement.
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
 ross.schm.dev@gmail.com, marcocesati@gmail.com, insafonov@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 saurav.girepunje@hotmail.com
References: <YWG3oIchovDZnPl8@user> <20211011122631.GA8429@kadam>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <20211011122631.GA8429@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/21 5:56 pm, Dan Carpenter wrote:
> This introduces a use after free on the sucess path.  You need to be a
> lot more careful.
> 
> On Sat, Oct 09, 2021 at 09:09:12PM +0530, Saurav Girepunje wrote:
>> Remove the unneeded and redundant check of variable on goto out.
>> Simplify the return using multiple goto label to avoid
>> unneeded check.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 29 ++++++++++---------
>>  1 file changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> index 0868f56e2979..574fdb6adce7 100644
>> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
>> @@ -2282,18 +2282,18 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
>>
>>  	if (!name) {
>>  		ret = -EINVAL;
>> -		goto out;
>> +		goto err_out;
> 
> Just return directly.  "return -EINVAL;" but what does "goto err_out;"
> do?  No one knows without scrolling down to the very bottom of the
> function, then scrolling all the way up again.  At this point you have
> lost your place in the code and your train of thought is de-railed.
> 
> Plus it introduces "forgot to set the error code" bugs.
> 
>> @@ -2312,7 +2312,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
>>  	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
>>  	if (!mon_wdev) {
>>  		ret = -ENOMEM;
>> -		goto out;
>> +		goto err_zmalloc;
> 
> 
> This is a Come From style naming.  Imagine if instead of naming functions
> after what they do we instead named them after the first caller which
> was introduced.  kmalloc() would be named called_from_boot_510().  It's
> a usless naming scheme.  We have to scroll down to the bottom to see
> what it does.
>
I will send another patch to remove goto and simply return ret value.
>>  	}
>>
>>  	mon_wdev->wiphy = padapter->rtw_wdev->wiphy;
>> @@ -2322,22 +2322,23 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
>>
>>  	ret = cfg80211_register_netdevice(mon_ndev);
>>  	if (ret) {
>> -		goto out;
>> +		goto err_register;
>>  	}
>>
>>  	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
>>  	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ+1);
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
> 
> This is an on stack variable.  Think about what you are doing.  You're
> not writing carefully at all.
> 
I didn't removed local variable assignment to NULL on this patch. 
However I agree this is another improvement possible on this function and can be done along with other changes. 
Please let me know you opinion whether I should send one patch or multiple patch in a single series.
 
>> +
>> +err_zmalloc:
>> +
>> +	free_netdev(mon_ndev);
>> +	*ndev = mon_ndev = NULL;
> 
> mon_ndev is local too.
> 
> regards,
> dan carpenter
> 
> 
Regards,
Saurav
