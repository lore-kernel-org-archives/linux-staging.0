Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319113FC8
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 17:22:54 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id j14so1178209plx.4
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 10:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6babHy+b4BwGbNSFMykruhsxsT6H8Mxu4ETZghrYvkY=;
        b=cSTtO2h+7FNhdz1XrStuIFt89EQjCjP9BySawI99Na3gXZCNJxuWat8RU1l7kxWZ47
         rouiu8VrXDLhMALCW0JGnmTiU0QHvVB/CqbPDlC2vdSTB6b9hMI4cv51kMuAQaeSFX9q
         6G3WDXmG8i8d+it3CExGOhLtYdRLWHUufnSzQgU665HyE8HU2R+B3W2S9yeq48eqNtSO
         6V0WxaJOCu5Hs65ltkuFOHx6bCkPCujbaMGbYRQ+HjdGaka6cOfOKrP0faqRf+hgb+NI
         7ri/48CTg3pmR9mCdSzsdy5xHUolmPJQMUhUO2hcojYrXVJlzDMwFihwkPSQPknAdIGY
         QrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6babHy+b4BwGbNSFMykruhsxsT6H8Mxu4ETZghrYvkY=;
        b=WACIWjMZwDK/pVShWFtOPQL7tw4Bo8Qi7OZtqq84u9fLvwmgB0aHK4ZKnogudW5tlX
         E62TuX0Y8iuDlYSX4jp6aKQlaRFjJbXsWeQYV5oOGjVWdzjOIMv/q3DkBfEU97ovAVzv
         sJic1LASr8TfX+7jrc9Nhs/tw8d0q03ZQ4gRgswiObxDdV7OkKs6vSPsqBdGCwhyzKcH
         eVG+NhVXGC+LR01a9BlFozY3rgy17ei+gna047SXEgoFi2uHjECuqPhIpALRGsNY+TVu
         VSHYiG1p2hWVKVZl5fNCVi1E0qtr7BMAaK/92J17tCyI+rInBPOlAuyNhAjUvKRpgdev
         kuEA==
X-Gm-Message-State: AOAM533p1mcmK7+2HrbaksfsvkWoFOTRDQwAmFA3jrwbTSsOww/0aE8S
	IvvCow+HFrvWAkbU/v+8TrA=
X-Google-Smtp-Source: ABdhPJxP/UqD44WL8Ns2o3Towek7WupWws3FWrE60+DczWiPoV4OAZl8YB+AGVOAqX7hNm3TgCno6A==
X-Received: by 2002:a17:90b:3904:: with SMTP id ob4mr16650763pjb.148.1631985773609;
        Sat, 18 Sep 2021 10:22:53 -0700 (PDT)
Received: from [192.168.1.6] ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id 26sm11914447pgx.72.2021.09.18.10.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 10:22:53 -0700 (PDT)
Cc: saurav.girepunje@hotmail.com, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: core: remove the function
 power_saving_wk_hdl
To: Greg KH <gregkh@linuxfoundation.org>
References: <YTub30ZRG3oLbxQW@user> <YT951VyaUEX8uFpz@kroah.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
Message-ID: <45c4de06-f618-4352-91ea-885edecdf8bb@gmail.com>
Date: Sat, 18 Sep 2021 22:52:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YT951VyaUEX8uFpz@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 13/09/21 9:48 pm, Greg KH wrote:
> On Fri, Sep 10, 2021 at 11:24:39PM +0530, Saurav Girepunje wrote:
>> Remove the function power_saving_wk_hdl() as it just calling
>> the rtw_ps_processor().Instead of power_saving_wk_hdl() call directly
>> rtw_ps_processor().
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>   drivers/staging/r8188eu/core/rtw_cmd.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
>> index ce73ac7cf973..35e6a943c556 100644
>> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
>> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
>> @@ -1669,11 +1669,6 @@ u8 rtw_antenna_select_cmd(struct adapter *padapter, u8 antenna, u8 enqueue)
>>   	return res;
>>   }
>>
>> -static void power_saving_wk_hdl(struct adapter *padapter, u8 *pbuf, int sz)
>> -{
>> -	 rtw_ps_processor(padapter);
>> -}
>> -
>>   #ifdef CONFIG_88EU_P2P
>>   u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType)
>>   {
>> @@ -1941,7 +1936,7 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
>>   		dynamic_chk_wk_hdl(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->type_size);
>>   		break;
>>   	case POWER_SAVING_CTRL_WK_CID:
>> -		power_saving_wk_hdl(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->type_size);
>> +		rtw_ps_processor(padapter);
>>   		break;
>>   	case LPS_CTRL_WK_CID:
>>   		lps_ctrl_wk_hdl(padapter, (u8)pdrvextra_cmd->type_size);
>> --
>> 2.32.0
>>
>>
> 
> Also does not apply to my tree.  Please rebase against my staging-next
> branch and resend.
> 
> thanks,
> 
> greg k-h
> 

Hi Greg,

I always do rebase against your staging-testing branch. Can you help me 
to understand.When we need to rebase on staging-next. Do we always need 
to rebase against staging-next..!


Regards,
Saurav Girepunje
