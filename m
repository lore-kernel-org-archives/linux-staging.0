Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E562CA4
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 14:40:02 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id o133so10947561pfg.7
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iGNob6sTb6S2amKiUvAi/+pjHea/cA815c+QZDOlSkk=;
        b=SRja/ig4qID04QNrtzOjXzHx68AuZ/JPjGRN0FSNg1iR2DONyR08nTjffkI0ZQf1Hj
         rBU5DvjoQpB33IAEWPyTY4RgcvR9UjXxEGjzBWRy9NjU/LA9reBg+agUxHM1hpAB1ePs
         q4m9XMDlTxtngfMuMCuzJDhe50MeEQfEjnXnkoSwWsYljVk3s/G9cunMS9KA71nOUIjU
         J+BNm9SygUzwaZKFALZ/OX+H/UBn9HEQg4qI6/G3fo4++lJNX2fv3vtSFZnxqKaWofza
         +fkGhq9nj/pGTRdlcoPaftB6Z3nexedio+kYnZEmzZzNljYNXrjs3sLtq3Vq/BKXcdWR
         XXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iGNob6sTb6S2amKiUvAi/+pjHea/cA815c+QZDOlSkk=;
        b=q98vWqAlA84fqLktxo4OK/vSNRtoeFFg8jdzufG1JstWNffGcmaz0BN4zTPbj80AXC
         XCPsEZ0kdqrFBg1MfnJiJJuW3YCdzLD80LLk4dm8aCOxIbXNs6VTQmqaMmwoDJJxJNnP
         Ori8Z90AcLhUiBa4NAvXzMU88qsA7oxnyhngi6CQ7evNhPndmqcMLf1M3HRMsy1dQ6Qa
         SCh3JySEUjcPmeDixCENBWnyd9d4LTy++Wb8G8gm4/ZVDDO8AXe4IiRJNcbfeAYoasdj
         7tEPWBWwLHbQkF0GpRkKZW5KX+KhRAXrXMoZvvOYwfNIXrdE2/lhcragy0lpz8jHjncV
         1DXg==
X-Gm-Message-State: AOAM533VDhazBUkgCijmK3P3T1ZmP4Uxf4JTJbMfSenfcV4XUSftEOkh
	CKMHgwmjYtW4Alw2d5hu9zg=
X-Google-Smtp-Source: ABdhPJyZqBQsSw8EwvP3aF9kmS1Y+v5FEtKrCTF7pKjlFvN1AKLq3DXTqBs8jU/U242PPj8qvF7EiA==
X-Received: by 2002:a63:e510:: with SMTP id r16mr13954005pgh.34.1635172801462;
        Mon, 25 Oct 2021 07:40:01 -0700 (PDT)
Received: from [192.168.1.4] ([59.95.95.35])
        by smtp.gmail.com with ESMTPSA id z12sm21357381pjh.51.2021.10.25.07.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 07:40:01 -0700 (PDT)
Message-ID: <79254f8c-1d11-320a-6fdb-3ca066a8862a@gmail.com>
Date: Mon, 25 Oct 2021 20:09:56 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] staging: r8188eu: avoid use of goto statement
Content-Language: en-GB
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 straube.linux@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
References: <YXY5jtR6neQ+ad+C@Sauravs-MacBook-Air.local>
 <YXZVV9j2DMA22MUS@kroah.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <YXZVV9j2DMA22MUS@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/10/21 12:27 pm, Greg KH wrote:
> On Mon, Oct 25, 2021 at 10:28:54AM +0530, Saurav Girepunje wrote:
>> Remove the goto statement from _rtw_init_cmd_priv(). In this function
>> goto statement can be replace by return statement. By replacing the
>> goto statement with return statement local variable "res" is also
>> not required.As on goto label exit, function only return it is not
> 
> You need a ' ' after the '.' here please.
> 
>> performing any cleanup.Avoiding goto will simplify the function.
> 
> Same here.
> 
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>  drivers/staging/r8188eu/core/rtw_cmd.c | 16 +++++-----------
>>  1 file changed, 5 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
>> index e17332677daa..22046bd5cf82 100644
>> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
>> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
>> @@ -19,7 +19,6 @@ No irqsave is necessary.
>>
>>  static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
>>  {
>> -	int res = _SUCCESS;
>>
> 
> Please also remove the extra blank line.
> 
> thanks,
> 
> greg k-h
> 

Thanks greg for review. I have updated the patch and sent v2.

Regards,
Saurav Girepunje 
