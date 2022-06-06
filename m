Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622257E
	for <linux-staging@lists.linux.dev>; Mon,  6 Jun 2022 18:57:37 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id a2so18637115lfg.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Jun 2022 11:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nIz93hX2PQ4fhuhp1jMpyp0wJt0SBYcIreMeL3lWdNY=;
        b=PRIGkpN6xE0WkLxBRa2NL7ikMvENhq0/W55wukWNbpiU5svpBNZQqC3XEupJcPPfWc
         8oppZyUKGVgquZiSnv7aXlI71ZyA1ATmq3KM6WsUkuXABCAhWKZgSHOmOsT4/8+npwnV
         dm1E6BMsMN8PeZlNbmP2wTeSsOYhopNqqKCjafSDXtQgKgvFDV8TnCLqvTVYHJQqCgiw
         UnfNTnPTzdEFtr9VD2VM3K1a/ylB90PlmfekQovRqINRFzVjmOJVDycsUy0URUX0P+Io
         MVdDg8BuazsCqpyUpeO3UtMWBfNuLkCaFmWyhwje5onPTPKLjkC67pyPAQYWfiQmYOdD
         rebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nIz93hX2PQ4fhuhp1jMpyp0wJt0SBYcIreMeL3lWdNY=;
        b=q7xsUrF7tPKDtNRGQoGMudeGJUZrlWlZjd45UhVee6hOPzQEdMG9fPVdq2/xQxvIk5
         WNArDw690QEwxSdatJxCx+Ng+vX4amJzvAKhBDJR9B1N1D5cg/085RMK3TL7Rp05jlh6
         wRovOSKPzj7CFgVvJomU0jusrNXHGhSHCJ9e0Ih0OTViAmg08MzlttH0CAqknB5XRdgG
         LR3AZzpxxoG3g8/EKhdM6z5UUF4vNuWvI8+Fi3j0IfO5iWU6Qu0zOggC2QngzGODo2H6
         ORxgY5t9bBMKjDhq4fowXTdccCqC6AbQpISmy0zGOnLJOuZymh0iN0jXMK5MCRiYi37P
         E2jA==
X-Gm-Message-State: AOAM533IVN4Ruv4b0U04z3ez9iYAmTZl1Emon5aZELI/mIlOIiwVEfWx
	PfMZAEzxLWcfQ61chv9icHE=
X-Google-Smtp-Source: ABdhPJzx4OHSkLUGA6dbuYoqvNRaBXgj04jBulDxf8sYwpXbDWn+W3PyS0m2Ljm3XH7+T+DHSX6jhw==
X-Received: by 2002:a05:6512:e90:b0:477:cc44:9813 with SMTP id bi16-20020a0565120e9000b00477cc449813mr16943484lfb.226.1654541855259;
        Mon, 06 Jun 2022 11:57:35 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.229.27])
        by smtp.gmail.com with ESMTPSA id w10-20020ac2442a000000b0047255d211b2sm2953285lfl.225.2022.06.06.11.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 11:57:34 -0700 (PDT)
Message-ID: <5d57d0f5-06bd-5e3a-2cb9-d8ae531e453e@gmail.com>
Date: Mon, 6 Jun 2022 21:57:32 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/4] staging: r8188eu: add error handling of rtw_read8
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 straube.linux@gmail.com, dan.carpenter@oracle.com, fmdefrancesco@gmail.com,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <cover.1652994483.git.paskripkin@gmail.com>
 <541ab3341093a8f6bff1cf8e8aa0c7e247ff4833.1652994483.git.paskripkin@gmail.com>
 <Yp2VMecmrET9Mu3P@kroah.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <Yp2VMecmrET9Mu3P@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

On 6/6/22 08:48, Greg KH wrote:
>> -	rtw_read8(padapter, REG_FMETHR);
>> +	/* FIXME: should this read be removed? */
>> +	res = rtw_read8(padapter, REG_FMETHR, &reg);
>> +	(void)res;
> 
> What is that?  We don't do "empty" lines like this in the kernel for no
> good reason.  If the return value must be checked, then that's fine, but
> don't do it this way.  Shouldn't the function itself return an error?
> 
> And reading a value is sometimes required by hardware in order to have
> the write call go through.  But that's for PCI devices, not normally USB
> devices, but we could be wrong.  I wouldn't put a FIXME in here unless
> you have some plan for how to eventually solve it, otherwise someone
> might just drop it without knowing why the FIXME was ever added.
> 
> 

Ok, I will just make this function return an error. Thanks

[snip]

>>  
>> diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
>> index b944c8071a3b..a5b7980dfcee 100644
>> --- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
>> +++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
>> @@ -463,6 +463,7 @@ void _PHY_SaveADDARegisters(struct adapter *adapt, u32 *ADDAReg, u32 *ADDABackup
>>  	}
>>  }
>>  
>> +/* FIXME: return an error to caller */
> 
> When are these FIXME going to be resolved?  I don't like adding them for
> no good reason.
> 

After this series will go in. I really don't want to make this series 
huge, since ideally read errors should be passed up to callers. This 
driver has a lot of very deep call-chains, so fixing them in one series 
is just unreal

I have a plan to address these FIXMEs, that's why I've planted them.


thanks for review,


With regards,
Pavel Skripkin
