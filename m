Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E812C85
	for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 14:00:46 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id v15so43646911ljc.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 06:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C3rx7aIxOopa1weR65EZGsL10NKUPtC5cPt3IjQotWc=;
        b=QewvMpAq1jOafYWSHcTCfOV4Zlk5rWO0KXJHzU1dL2VU9WC+7LcuIeFAHGnBqTXbzh
         OyXuzm/3yqyyGf8RFxceiTQjNNG8vkJb/lT1pixej27m7V3sQkqHu6W6OyheVg72Uxsd
         XY1nQNL8yjHdU99Y+UKwUkGDmmqKjZTyL0hFcBOhzBsxpf4j3gDhz05016AkXGpNzWKu
         yH7gCfnlbENX+BjY6FqjxroE1qu3qrr/ewwad+7RVoRKQbZdPjJlTmfc1Ls7pDtpHpyD
         +jQQHMp9r4niWK9+olNQe+8L+I46d+7CuLcpayOt2rW9m+jQZgl5JK/9z4BGKtWEhMj4
         rsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C3rx7aIxOopa1weR65EZGsL10NKUPtC5cPt3IjQotWc=;
        b=Q7XBZlWyF0dZO1qTzHMQYVPYwfA5O1hL8wwPSGbYqiwZ95cTqnhMObHrBniDICbZjA
         j2y9RAX2ujYrwH59xd/FGRuX75ja3zZPqEHt/TY7G5eMthF5Hce70DiPDn1XXKhiFJse
         8nVGUNJ0AnKU98970Ry5oThaheQNLMomkxn5Sq+/cmPa+y88PNbY3256P51B4AX4xirM
         YMeThj3dLQg3r4g3FmP7CRtbJeLqXXMF+we7uGoDzHZqHv2Mw55SdSe04EZJN7FGr6jM
         sGNrBgwEAX+jCESu2uvLA03VhNiZkMg9Y/vzrdGjsAUreqt85k6oGgZmM2zQOLhnxTEB
         /8Zw==
X-Gm-Message-State: AOAM530fvX9lfgM1RZmGKM3vFLiqYd7xEdKPDfRKUderx+FExssSr6PE
	ylOSWlssoj8mBVy1QW9ASpk=
X-Google-Smtp-Source: ABdhPJy19LDtswlhvycT4l9LKzrzfDVxOBXMjQF+zA2EGjxQhiWsFYCBhnOPeoGWdBJNeUqLsPpK/Q==
X-Received: by 2002:a05:651c:a0f:: with SMTP id k15mr7690105ljq.298.1637071244685;
        Tue, 16 Nov 2021 06:00:44 -0800 (PST)
Received: from [192.168.1.11] ([94.103.224.112])
        by smtp.gmail.com with ESMTPSA id p3sm1768230lfg.273.2021.11.16.06.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 06:00:44 -0800 (PST)
Message-ID: <22a48290-814e-bcae-81e5-c23e6310f8f6@gmail.com>
Date: Tue, 16 Nov 2021 17:00:41 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] staging: r8188eu: remove unused defines in wifi.h
Content-Language: en-US
To: Zameer Manji <zmanji@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211116011451.896714-1-zmanji@gmail.com>
 <6d2d9c4a-3f05-1d51-42dc-b1ebbb4aefe1@gmail.com>
 <CABtXzjSPNxe-n9QTujMB7=CmhqPFp8V2e86BXmoErWm+6c5coA@mail.gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CABtXzjSPNxe-n9QTujMB7=CmhqPFp8V2e86BXmoErWm+6c5coA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/21 16:48, Zameer Manji wrote:
> On Mon, Nov 15, 2021 at 11:56 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>>
>> On 11/16/21 04:14, Zameer Manji wrote:
>> > None of these defines in wifi.h are used so they
>> > can be safely removed.
>> >
>> > Signed-off-by: Zameer Manji <zmanji@gmail.com>
>> > ---
>> >   drivers/staging/r8188eu/include/wifi.h | 57 --------------------------
>> >   1 file changed, 57 deletions(-)
>> >
>> > diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
>> > index 193a557f0f47..7cbc7015e90f 100644
>> > --- a/drivers/staging/r8188eu/include/wifi.h
>> > +++ b/drivers/staging/r8188eu/include/wifi.h
>> > @@ -13,32 +13,9 @@
>> >   #define BIT(x)      (1 << (x))
>>
>> What about BIT() macro? It's already defined in include/vdso/bits.h and
>> can be included via include/bits.h.
>>
>> Most likely linux/ieee80211.h contains bits.h. Haven't checked yet, but
>> anyway redefining kernel macros is not good approach and BIT() can be
>> also removed.
> 
> This is a good observation, but the objective of my patch is to remove
> unused defines so it will be easier to do the work that you mention. wifi.h
> and ieee80211.h redefine a few kernel provided values, and I intend to
> follow up by addressing all of them in one go.
> 
> Would you be willing to ack this patch as is?
> 

I cannot ack, since I am not the maintainer (or even reviewer) of this 
driver :) I just saw this BIT() definition and decided to say, that it 
can be also removed

Just to be clear: I am not against this patch as is, since _any_ clean 
up for this driver is important


Thanks



With regards,
Pavel Skripkin
