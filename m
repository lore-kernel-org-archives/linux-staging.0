Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BF572
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 16:00:02 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id y6so12060109lje.2
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=twGtmfDzBAHKvF2VlmhhZjcU0XdG5QkPmLUmZIfBd9M=;
        b=cg1Zl9vw6PAmX1heiKgpoamPuYY+GjEHjZiY9YEUJAARcXycY+FkSjeLqMrKvQ2i2d
         OeydYLRYbIJSGYZXYEsqKIuUkkaxRkoDOEbgfLFElQX45twLfS0Jqfkr0Ny2vkeyFZIg
         IhC9RZ4lJMdtdtEQEst/ovba4P2PCLK0u9WslyuC75sC9BS+rJPHNsMSV3KkwQ6TQK5O
         FZOHXhqrOK2M2+JdbpkfoAI41ChHJTaWQOoXF5JAQEuo5VguslxpVRxg6wLkJcvoAHzd
         VGzedP7SDV0fcjQ/tderm5PubQhljnAiYBQbfuyjYZVn+dtgAil1EUbV4MEJUS4B88oM
         xxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=twGtmfDzBAHKvF2VlmhhZjcU0XdG5QkPmLUmZIfBd9M=;
        b=V6d3r7S5CMrD2+ZEGKezPok4nm0sErmXPK3qM9jD00GKUP+M9js2eYI5VJCYuWZFZl
         SvElsCDBfA+cbdt+NUIsq6j6fyrm/NtYVDHa0mkyGmI/HQ6FtioqLD+jXNlo9QGxroV5
         vaOHUKqRWIYpkMe0tTvT6MFvce1J1CiIG5H4bA0UM/Usz2mvqFw8AoYlPh2OSpi3aicD
         ySPjqZ0sJsGBdmlBe8rna5eNvs6C2f56NANA8qUIJJukxYKMqEesYjc1oQ9TCiBUYhRF
         7xZgJFjSYZB3vR5Nfcy1dybna8QXvhglwVCDFSzXebN9//zQaQnd6BN6GrkIjm8rk7fn
         6CRQ==
X-Gm-Message-State: AOAM532NgyuGFhzdYa4rTEcUShfGocRYLED30p0mQm/mJTAIdbJjccAd
	mY+sfB50SCXV3CtnvQgXNQ0=
X-Google-Smtp-Source: ABdhPJx+6euSSK9xV5ERLg3qVdUOaGMMAUNxtfkUYSfuvogXZjwh2D4jgs+mt4WJM1P2Ueb930dlAg==
X-Received: by 2002:a2e:9455:: with SMTP id o21mr11054506ljh.103.1630944001118;
        Mon, 06 Sep 2021 09:00:01 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.70])
        by smtp.gmail.com with UTF8SMTPSA id z16sm771345lfd.21.2021.09.06.09.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 09:00:00 -0700 (PDT)
Message-ID: <0f13057d-f33a-9efa-4cae-937169abbcd8@gmail.com>
Date: Mon, 6 Sep 2021 18:59:57 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] staging: r8188eu: fix type mismacth
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210905205216.24831-1-paskripkin@gmail.com>
 <20210906065650.GD1957@kadam>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20210906065650.GD1957@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/21 09:56, Dan Carpenter wrote:
> On Sun, Sep 05, 2021 at 11:52:16PM +0300, Pavel Skripkin wrote:
>> smatch says:
>> rtw_cmd.c:1165 rtw_setassocsta_cmd() warn: struct type mismatch 'set_stakey_rsp vs set_assocsta_rsp'
>> 
>> Since psetassocsta_rsp has struct set_stakey_rsp * type, it looks like
>> copy-paste failure. This error didn't cause any bugs, because
>> sizeof(struct set_assocsta_parm) > sizeof(struct set_stakey_rsp), but
>> there is no reason for allocation extra unused memory
>> 
>> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
>> ---
>>  drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
>> index fee4208dacba..afe6c7fa594d 100644
>> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
>> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
>> @@ -1162,7 +1162,7 @@ u8 rtw_setassocsta_cmd(struct adapter  *padapter, u8 *mac_addr)
>>  		goto exit;
>>  	}
>>  
>> -	psetassocsta_rsp = kzalloc(sizeof(struct set_assocsta_rsp), GFP_ATOMIC);
>> +	psetassocsta_rsp = kzalloc(sizeof(struct set_stakey_rsp), GFP_ATOMIC);
>>  	if (!psetassocsta_rsp) {
>>  		kfree(ph2c);
>>  		kfree(psetassocsta_para);
> 
> I'm not sure this is correct.  Might be, might be not.  But we use
> sizeof(struct set_assocsta_rsp) later in the function so it likely leads
> to memory corruption.
> 
>          ph2c->rsp = (u8 *)psetassocsta_rsp;
>          ph2c->rspsz = sizeof(struct set_assocsta_rsp);
> 

Hi, Dan!


Unfortunately, this function is unused, so I will just remove it in v2 :)


With regards,
Pavel Skripkin
