Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96233FCC
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 09:41:01 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id y17so1439605pfl.13
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2CvcJSiEN9MNXuAzxJzwyEfnTU0mKkfe0+AjDJ9kifY=;
        b=PSAR8amj8SgeZssZ3i6aMhFnhx1d4yc7BYIy+eXaxcMCN1aRoV2VqqXOM2pmH1LvRh
         suidGUSlvYdrWD6WtmksppAQQejgzqMFdNY+FvjO2wKBY14MmY1LOB888gf890VzaV2I
         nTP5g2G8jyoBaDxBGJRLcDQ98Vvq67nwdzFCIbge+CWR77ynC61LFys+8KVF4qlIBI/U
         3osF4Ki1nBsfaUgPkJ7opkfRy4sw6+tt2mY5fFzIoT4i/ZCfU51LENFPBxUD7MkJG+C8
         W2A8sc/jgNGKU16m2bGUqCtY95b23dyuP4WZomR7tlXbXhUpd+fsXmuYtrmciKNqFgzN
         n1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2CvcJSiEN9MNXuAzxJzwyEfnTU0mKkfe0+AjDJ9kifY=;
        b=IKl6Pfo046bFEyfOP5NJS6WvlbXXp/LaY/eUahE5WEkXejguXcO0snoPqWXMPx0H4B
         b7FD2h3axI7tu4SPBixC8ljmdCPs5U7i0eIZyA9Owf5ktxMPtKejS3JLeBL4F6ynAD7c
         ArLFIX5bZ9fj6qB9+AUtwiVSUIOz4sYo6fH9xriePQ3mysN2+cr37ebday7laxypDJOZ
         sIiPnVNfZ37IbRQsqB2Q5o0pD/qtzyGSD9e4+x9lC8cAp8nCidm2t08TgMkFS+uM+Qxr
         Nd08cv1YCVeZ5UCGR3NzsicUaXu9ZPzVOR3EDdlhK0jV5z+xHjuv3kQAZio5IAlIlb/J
         +5jA==
X-Gm-Message-State: AOAM531Vw5IF/Xcq22hTWBT59snh20sPxPoYwzY3GX52Z9jnzTfpa7mi
	cTtJdgw+6uy0pBhTp+3Mq5g=
X-Google-Smtp-Source: ABdhPJxq2rms+uXKvb4icD3P3JOkrs3NOtHPFvW/WtVyj4BtTwAnf8MfiVqQ6s96O3u9y/XiLBUpcg==
X-Received: by 2002:a63:ef58:: with SMTP id c24mr2902397pgk.299.1630748461514;
        Sat, 04 Sep 2021 02:41:01 -0700 (PDT)
Received: from [192.168.1.6] ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id d15sm1797118pfh.34.2021.09.04.02.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 02:41:00 -0700 (PDT)
Cc: saurav.girepunje@hotmail.com, Larry Finger <Larry.Finger@lwfinger.net>,
 Greg KH <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: r8188eu: os_dep: use kmemdup instead of kzalloc
 and memcpy
To: Phillip Potter <phil@philpotter.co.uk>
References: <YTJhwQstKPUYRwN+@user>
 <CAA=Fs0mP7xqiS7+EX+J5MYH-AkEN_5SgtLrxAd669kXHG7Jk+A@mail.gmail.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
Message-ID: <52642929-cec1-d03b-03f1-130a54c0c289@gmail.com>
Date: Sat, 4 Sep 2021 15:10:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAA=Fs0mP7xqiS7+EX+J5MYH-AkEN_5SgtLrxAd669kXHG7Jk+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 04/09/21 12:23 am, Phillip Potter wrote:
> On Fri, 3 Sept 2021 at 18:56, Saurav Girepunje
> <saurav.girepunje@gmail.com> wrote:
>>
>> Fixes coccicheck warning:WARNING opportunity for kmemdup in ioctl_linux.c
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>   drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
>> index 81d4255d1785..495fadd2b8c8 100644
>> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
>> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
>> @@ -585,14 +585,12 @@ static int rtw_set_wpa_ie(struct adapter *padapter, char *pie, unsigned short ie
>>          }
>>
>>          if (ielen) {
>> -               buf = kzalloc(ielen, GFP_KERNEL);
>> +               buf = kmemdup(pie, ielen, GFP_KERNEL);
>>                  if (!buf) {
>>                          ret =  -ENOMEM;
>>                          goto exit;
>>                  }
>>
>> -               memcpy(buf, pie, ielen);
>> -
>>                  /* dump */
>>                  {
>>                          int i;
>> --
>> 2.32.0
>>
> 
> Dear Saurav,
> 
> Looks good, thanks:
> Acked-by: Phillip Potter <phil@philpotter.co.uk>
> 
> Regards,
> Phil
> 

Thanks for review Phil

Regards,
Saurav Girepunje
