Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D63F29CA
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 09:46:25 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p19so8700396wmq.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gtSTu4ozECxUjEi0hKFQnozmLfj1cbDOGz3NG1Yhu3c=;
        b=UqZgo5srz7oGoMxxgJ10mhX7JsO0z0SVItepKoCMYAQZUhY27Yn5ezBBWj8D/9kbfQ
         pvcsWNLEKza4owVAznW0kVeLGbt2za/N45X1EZATFwCnqfnVXGqeZoPNsehU69enpEUt
         sVYVmZuVnXpIIITcdDAbVLp/I3HOAb+TLb6tkvkWV8XNmiYR/H750GZAQxmOFIurbU8i
         0pl2Oz5V8lUJWfDgpgzCY74GtxL3D3ctj1EcpXdlW0Hp97rVK/vpaweS2o6GUu+4y2TX
         JUVNrXppAA6W2BmA5FyIrS1hVPBVF1zKaZdjUGcp+Zgbsjsk8ReRByPTfxOvuabO5pe3
         vpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gtSTu4ozECxUjEi0hKFQnozmLfj1cbDOGz3NG1Yhu3c=;
        b=r/IjyL/K3ZwdbiUv5k8cztNTPGGKwdCPvFXvOH6ch4giKgalaycUenK06AZ74JZYR1
         1klcRTmxfd5+fG+XkNPMx+bHqzufHeu572xbozn/LOdUTNU9NaajlkKbkyW+Etk8OMYR
         33AduGS5Bjn3ZXGYf9rxQiVErQomYr6sol6B+AHU7IJ29j9BQ8DvRkpThtJlnHOnJHhP
         Z5FEpKORSP70yKGifxTDddp7J03ZLA2knQceqOUm/1ZxSu2uU5daHTJ3aLlQiF9Q/xuL
         p6+9XTnMR73mDCcKM9t0iBGf5uo0TRFqdecKChkyH8aj3i7YGp4QpIkeN1cMZdEJPyoh
         EYsg==
X-Gm-Message-State: AOAM533t/XieUVr6WO6xK75FxT3O6UqJtxtIAgDC86X6MkkjEM3u2sA3
	OMBYU5J7s39ZXwAgAIwS/HE=
X-Google-Smtp-Source: ABdhPJxa6CeE6bwXYczYWLQhg3liK3Wt8T5rNe9DbMzAKV+LoZqDY9T7pvhkRivjSiJAQhFe5QxmsA==
X-Received: by 2002:a1c:a3c1:: with SMTP id m184mr2302414wme.64.1617788784569;
        Wed, 07 Apr 2021 02:46:24 -0700 (PDT)
Received: from ?IPv6:2001:818:de85:7e00:ef5c:3f2a:a646:d6ec? ([2001:818:de85:7e00:ef5c:3f2a:a646:d6ec])
        by smtp.gmail.com with ESMTPSA id r5sm1719060wrx.87.2021.04.07.02.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 02:46:24 -0700 (PDT)
Subject: Re: [RESEND PATCH] staging: emxx_udc: Ending line with argument
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
References: <20210406193409.96428-1-martinsdecarvalhobeatriz@gmail.com>
 <YGy4LXHBrBb/r3dk@kroah.com> <4c7df741-4e73-2ac4-f0d8-c9513ae29c88@gmail.com>
 <YG1FI38zNbidjt9q@kroah.com> <4d7ebe9c-8ebc-2fc9-10ed-6756ab42d5d7@gmail.com>
 <YG1usolTNEOfDqXh@kroah.com>
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Message-ID: <e7a18709-0b26-751e-6ba4-b43dd89c203f@gmail.com>
Date: Wed, 7 Apr 2021 10:46:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YG1usolTNEOfDqXh@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Em 07/04/21 09:34, Greg KH escreveu:
> On Wed, Apr 07, 2021 at 09:16:44AM +0100, Beatriz Martins de Carvalho wrote:
>> Em 07/04/21 06:37, Greg KH escreveu:
>>> On Tue, Apr 06, 2021 at 09:00:07PM +0100, Beatriz Martins de Carvalho wrote:
>>>> Em 06/04/21 20:36, Greg KH escreveu:
>>>>> On Tue, Apr 06, 2021 at 08:34:09PM +0100, Beatriz Martins de Carvalho wrote:
>>>>>> Cleans up check of "Lines should not end with a '('"
>>>>>> with argument present in next line in file emxx_udc.c
>>>>>>
>>>>>> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
>>>>>> ---
>>>>>>     drivers/staging/emxx_udc/emxx_udc.c | 11 ++++-------
>>>>>>     1 file changed, 4 insertions(+), 7 deletions(-)
>>>>> Why is this a [RESEND] ?
>>>>>
>>>>> What happened to the first version?
>>>> Sorry, I didn't receive your review, and in kernelnewbies tutorial, they say
>>>> if not receive a response, may have missed the patch, so I resent it.
>>> Do you have a pointer to your previous patch in the lore.kernel.org
>>> archives anywhere?  I can't seem to find it.
>>
>> I found this, it's what is you need?
>>
>> https://lore.kernel.org/linux-staging/20210401195457.24512-1-martinsdecarvalhobeatriz@gmail.com/
> Ah, yes, I saw Julia's review and assumed you would fix up your patch
> based on her comments.  Please do not ignore review comments, it makes
> everyone's lives harder.
Sorry, I didn't fix up my patch based on her comments, because to do 
this was
to revert all my patch or will break a code line if I remaining within 80
characters. How the code line still stays between 85 or 90 I assumed 
that was
ok, so I was waiting for your review. Now I saw that I should send this 
answer
to her. What should I do with the patch?

Thank you for all reviews, I'm learning a lot about how to do a good
contribution and the importance of answer all reviews.
> thanks,
>
> greg k-h
Beatriz Carvalho
