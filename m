Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA8B6D00
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 20:00:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so1604951wmq.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Em3BrHYCkw2DM6lIWLuJHnJBfcbjTRbHrryEqft8SFU=;
        b=SMNqtcqTNXZ4MQaPnNebupFO3q7PjtlUqD3RleYi+OVVnk6LJ3T3HdTNtNteLc0CnO
         YUtPTtsbO6BRmwb0fCEe3bgJYVr+gF/eRmzbdOdpwMsyW/HV7dKsP2paaU6tWZHNl8hg
         /vqpxkqmZDCapI0KKliMnTkEnTjvsRssOx93gnH9SrY4GFmvH2mIv1lOTvdxIR519i2w
         O4qRnsIjJjez96QsSdrjPLXQNSzcTnFsPr6ywCxEP8BQq6MQuQrp/5uauWFmsvzmfOz9
         S2hoZJUWKTrsR6hMUDw2tvvGbL7rozACNZCyoRZ0sBnL8WqG55ZtBGDxXwfkPrihVM+v
         s5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Em3BrHYCkw2DM6lIWLuJHnJBfcbjTRbHrryEqft8SFU=;
        b=SwmHiMjY1btCNI0g0KY66j+wj5zZBYERPOWbPtgNibxka8bhyM3e7lMwqG+YRP5dDH
         yFp2CcQLYVluQrfaLRDB4foIsIRvVGBEz9hXK39vwKc/33W+v+WwQRJ/hcR8oblhB/Sm
         nHb+Ci0KAqOdIrMK2k4t3t6pwVaWVHEVPb6qg6sFcwoVP/IYb3zkN467uDfsVF1CHOeN
         fI2HP1BLkGFGBy7/+Gbks+v2i3nJZ0PqCmMX3+3Oc5CITi3E31ddgKaVxhmF7GUTCzZ3
         UhYGMRFwls0QOfLj8UiGi8xduXc3hHN9MU8bxjRkI0ih+hYHbznPdApTqTFbecsmmghC
         Kvkg==
X-Gm-Message-State: AOAM532bnszCbQGqpLDRAynwUZCq8Ah2V/pcOObdNg2F8pHm39JFcu1K
	lqdQnUVIwoteiL7XGuuhDaU=
X-Google-Smtp-Source: ABdhPJyqu2X+eKGoD247lTs4UX4BHvF5sob3AARwmQLGMqjzdeXheC/fpFe/3LmAkCYnyZzRxMSJqA==
X-Received: by 2002:a1c:2704:: with SMTP id n4mr5705317wmn.143.1617739208376;
        Tue, 06 Apr 2021 13:00:08 -0700 (PDT)
Received: from ?IPv6:2001:818:de85:7e00:ef5c:3f2a:a646:d6ec? ([2001:818:de85:7e00:ef5c:3f2a:a646:d6ec])
        by smtp.gmail.com with ESMTPSA id t20sm4129952wmi.15.2021.04.06.13.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 13:00:08 -0700 (PDT)
Subject: Re: [RESEND PATCH] staging: emxx_udc: Ending line with argument
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
References: <20210406193409.96428-1-martinsdecarvalhobeatriz@gmail.com>
 <YGy4LXHBrBb/r3dk@kroah.com>
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Message-ID: <4c7df741-4e73-2ac4-f0d8-c9513ae29c88@gmail.com>
Date: Tue, 6 Apr 2021 21:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YGy4LXHBrBb/r3dk@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Em 06/04/21 20:36, Greg KH escreveu:
> On Tue, Apr 06, 2021 at 08:34:09PM +0100, Beatriz Martins de Carvalho wrote:
>> Cleans up check of "Lines should not end with a '('"
>> with argument present in next line in file emxx_udc.c
>>
>> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
>> ---
>>   drivers/staging/emxx_udc/emxx_udc.c | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
> Why is this a [RESEND] ?
>
> What happened to the first version?
Sorry, I didn't receive your review, and in kernelnewbies tutorial, they 
say if not receive a response, may have missed the patch, so I resent it.
>
> Also, your subject is odd, please look at the documentation for how to
> write good subject lines for patches.

Yes, I know. It was my second patch, and I was learning, and when I 
resent it, I didn't know if I can change the subject.

>
> thanks,
Thanks for you review
>
> greg k-h
Beatriz Carvalho
