Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681E92FAF
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 11:46:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso1555624wme.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 04:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=SWXVwTQRJHBBCNW1cozXs7nMfXfaPPeM3zo56GxdwE0=;
        b=YAC/yGPyE2OF1VstCfmO5tA+s1p0v+YfIGzmKydEr8lVsQEGvRuyLp03dWVwWwJaAB
         qZ1BvsvlrFE6dHIzjEzE8cmP/2RIeZPdHcIKC1bJ1V/47kmLzyoMov6kLNJXJ9TTAUjw
         zd0syKBZIEPv4Tqn4M2ssPSkX+1SJTRFsIAAj7X7Mkyl/fwgtvcwg4iXCzBQjDgnE2qS
         JV/dm3jgA3TztxRITopEyHsnRHu0tH8HO9Bc9NxMwSDAliSg5nIQtnZcMwSiIR0TeOvG
         8xRBgeuDqNZIWjZ/w+39bMojdD5RorEwEX+pGaPael01QMiTdtbPpE8R5b2Ws0o2eF05
         Zr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=SWXVwTQRJHBBCNW1cozXs7nMfXfaPPeM3zo56GxdwE0=;
        b=ebr1+037kf5gIPutD5WJqdWsVtSOq5iqOiCynwOVFwuuhx3yVsrtKTnFNBBUoIxPCu
         ncOZkrDez20UAQhChxudwGZ+d7VGZY75IGTIBf9ZimXoIis9x5a019jNAmMvFRo6PfTU
         biXDYmVL3uC3hGIoUkqhtqVavIFkoPil384g6hCvsAhYP20tz65Qw6adPvJG7Jyg/D3H
         /UndJh7zplHOv4d77ef4HxQC0ao3lwgnhFcXLCxETkhKH5+Pp1YzCigAQBd2qDI37tgU
         fjgVvNaq/3zA7AN5QaLuQPoOcLUgR0nEC/Ds96pPKSNvHggtgJgyzeWkwNfgbghfDPzS
         E3WQ==
X-Gm-Message-State: AOAM531j3/kHD28mj/ESV7qr8A+RhnMGJ3jBceuV3paP0dFDrLkHxQ7D
	xe5xxnB4h8IFzUZxckcCe0g=
X-Google-Smtp-Source: ABdhPJx4yAZ6/VxBAeivP5vIdcJoKdZCE3kmZccldVQ3sYVTpLaEuWqfvmJEy9XdQAwhEF5jHN6PXw==
X-Received: by 2002:a1c:149:: with SMTP id 70mr9695860wmb.187.1632915973631;
        Wed, 29 Sep 2021 04:46:13 -0700 (PDT)
Received: from ?IPv6:2a02:8084:20c7:8d80:b92e:b532:3d37:f10b? ([2a02:8084:20c7:8d80:b92e:b532:3d37:f10b])
        by smtp.gmail.com with ESMTPSA id z12sm2117400wrv.31.2021.09.29.04.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 04:46:13 -0700 (PDT)
Subject: Re: Subject: [PATCH] staging: r8188eu: Fix misspelling in comment
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <5174112d-d0a5-e908-aee8-7d494914e89b@gmail.com>
 <YVP8CYJ6MpWCjRB0@kroah.com>
From: hallblazzar <hallblazzar@gmail.com>
Message-ID: <24ecdbbd-aa05-8d67-99af-f7bbb7cfcfed@gmail.com>
Date: Wed, 29 Sep 2021 12:46:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YVP8CYJ6MpWCjRB0@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 29/09/2021 06:39, Greg KH wrote:
> On Tue, Sep 28, 2021 at 06:49:48PM +0100, hallblazzar wrote:
>> As format check raised by scripts/checkpatch.pl, comment in the rtw_ap.c
>> looks misspelled by accident. Help fix it.
>>
>> The original error is as below shows:
>>
>> CHECK: 'followign' may be misspelled - perhaps 'following'?
>> +Set to 0 (HT pure) under the followign conditions
>>
>> Signed-off-by: Siou-Jhih, Guo <hallblazzar@gmail.com>
>> ---
>>  drivers/staging/r8188eu/core/rtw_ap.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Your subject line has "Subject:" in it twice for some reason :(
>
> Please fix up and send a v2.
>
> thanks,
>
> greg k-h

Hello Greg,

Thanks for point that out.
It should be my mail client issue. I've fixed it and re-sent
new v2 patch

    [PATCH v2] staging: r8188eu: Fix misspelling in comment

If anything should I additionally aware, I'd like to fix them.

Regards,
Bill G.

