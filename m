Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BAE3FC9
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 12:04:34 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id v123so1646724pfb.11
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 05:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OwQCsW8BxcYFS8G8wSIAFz/7up4NJG1Qwl4Oqjte5MU=;
        b=cgO9QkLqzUhfHxDUk2n45clRCI4alkLbbHjOyTDgBuyyrlbiODxfvWRUAoXFlMdxel
         91rwaKN+YvaclvV1HGffe4KSURvBdlIfLRn8xviFYQpj8ElmSCY7Alq8/fTYkvxWpz3e
         rpDUdlOHO04KlL5HMWOKz1KqgkAt8mqWJcfKeZf3IPlJi508AHTAecW0ESmfRO3FwMzm
         fS9gGlIDN1WEaBcF3lOn5ojtmkm88C85oHTPmox96Fu0CztRYQFMDtXSz9V4xc0PJRmx
         MgiMNN2xCdV1KATfrPn+ZpKNG4p7lFXdlyTWtVB/LeH6Ih3f7g2qhrlvBwzRA+c8OwQx
         HmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OwQCsW8BxcYFS8G8wSIAFz/7up4NJG1Qwl4Oqjte5MU=;
        b=Ra63s/CRvqKyOT2Tet4snq1QyPVcBpOWVIwCFMjztBhRi8dB61SDvsw8qgg8wr+C0t
         zcA4gYp5kpD+jfmwwxeHXFzO8xXlqHzJv7vEk625TIPeXmMzHFQ7MG9M+kj5TMti9ctr
         CEYzDF9vHEGfyn/3AsF6D0lusKFFLBMnbhGTlk0X0FvVeLmGYfYomINUXpoXYSl8cTXS
         atw9vQBAzDldJKrKPH9iS0hNNAzLOJ+f3rCNo+JMN7W0dgrnUTOjG8ddNgjiNfn84QE3
         oCjBL0XF7E/KKvSAj0z5R2JRNDlw/0Nzo+KTbXnuk4kLNdjQlgikwR4B+wQbKEzAmaJM
         PL8A==
X-Gm-Message-State: AOAM533OSxFFvdtigCwyK3DmIIQq3rzs4e7HStY3HIcYqgJo6MAmnUb7
	72popC39MhyUaPSTpxdBjAs=
X-Google-Smtp-Source: ABdhPJzBNvCk9uCcn1mBC39Noah7rFWVL8l2W4fuYxCPI2xqgLX6HuI76mPSmwbJd3iO46GV6JMs3Q==
X-Received: by 2002:a65:6288:: with SMTP id f8mr3361579pgv.81.1630757073949;
        Sat, 04 Sep 2021 05:04:33 -0700 (PDT)
Received: from [192.168.1.6] ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id p3sm2145073pfw.71.2021.09.04.05.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 05:04:33 -0700 (PDT)
Cc: saurav.girepunje@hotmail.com, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, straube.linux@gmail.com, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: os_dep: simplifiy the rtw_resume
 function
To: Greg KH <greg@kroah.com>
References: <YTM+wayCk2n2CrVP@user> <YTNFHd6o0f9rAMO2@kroah.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
Message-ID: <30ae6751-3b44-7779-4eae-14d0ed7a75c6@gmail.com>
Date: Sat, 4 Sep 2021 17:34:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YTNFHd6o0f9rAMO2@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 04/09/21 3:36 pm, Greg KH wrote:
> On Sat, Sep 04, 2021 at 03:09:13PM +0530, Saurav Girepunje wrote:
>> Remove unused variable ret and pwrpriv.
>> Remove the condition with no effect (if == else) in usb_intf.c
>> file.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>   drivers/staging/r8188eu/os_dep/usb_intf.c | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
>> index bb85ab77fd26..673cd3001183 100644
>> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
>> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
>> @@ -493,14 +493,8 @@ static int rtw_resume(struct usb_interface *pusb_intf)
>>   {
>>   	struct dvobj_priv *dvobj = usb_get_intfdata(pusb_intf);
>>   	struct adapter *padapter = dvobj->if1;
>> -	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
>> -	int ret = 0;
>>
>> -	if (pwrpriv->bInternalAutoSuspend)
>> -		ret = rtw_resume_process(padapter);
>> -	else
>> -		ret = rtw_resume_process(padapter);
>> -	return ret;
>> +	return rtw_resume_process(padapter);
>>   }
>>
>>   int rtw_resume_process(struct adapter *padapter)
> 
> Why not just delete the rtw_resume_process() declaration line and make
> the rtw_resume() function be the whole thing, as rtw_resume_process() is
> never called anywhere else.  That would be even more lines of code
> removed and simplified here.
> 
> thanks,
> 
> greg k-h
> 

Yes, rtw_resume_process function can be removed .
Thanks for review greg.

Regards,
Saurav Girepunje
