Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DEB173
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 10:22:41 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id o12so12366452lfg.12
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 02:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hRl1Fq2Vxy4fjBAuIlD9uNWSG6ZecqZ5YWthVCbw0Dw=;
        b=S2aBlrVdb97oAQRU3uhK6QlDTJ+IK9ae4vCC7+k5/DgoIcKsb1c9XhFtOYuR+iRdQm
         Vhsw+PN9QDDCwCnNicG3S8OI5/RA4PmaIBPfyVkIGoc5MPWYqoj7yRsPjUA6CDZnEVhM
         vBnsClPT18yGrzstKAEyZP7UsiO+tPnFbJUg8GFLsacPJyeWBs/19nvo0UA8hheAWjPB
         zd4b8+nZ4RpXGLHDTs4iUV6GuuqesRpIcNGu1DBRMp8W7Pkmt1SN78em0JplT21vDGTm
         pixWKYmCOAXwjIUosJpQrhBeMDKAVXgOKJZ7VONMXEjx88Bn6RiUezhYdoSbwsiSvHpV
         816g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hRl1Fq2Vxy4fjBAuIlD9uNWSG6ZecqZ5YWthVCbw0Dw=;
        b=2vl+PLKvRuwPIyO2TDmrRjeCa0H2sCe9WtKoq+3+EDS8wHxpMhFJWXFaPJxjgnacRP
         tZG8xUsevOEJAX7JqfOC1167arL3SiCXGaA7FHxDwzw5SkKCZ6N/Ps6w8VCTjTTOxMj6
         e1wCYLYkkCDP+jYRyUFY09KJOLQ8XNWUK5bkvPSuYkMjWOgYd0ALAefwNnUCEqOGAHU7
         kqzUYlK6q+etvo3WvgVrk6dJbnyNM+qhmgbcLvsAPzV60DbeDNp/xk2jXFg+GMjQ2xP2
         1o/+mYQSDLBXCBj0Z9qs5cSuCh+coozolbazBxI4bVI/aoGnW/ndeB99d8FJVjf6lfaX
         igSQ==
X-Gm-Message-State: AOAM533PMojxMzMwUuSYW1meuNmOeYk0gfHl9XeAbBH1ZFAunm14HsQN
	uMdVwzqhVHR9k/odDvKOOOg=
X-Google-Smtp-Source: ABdhPJzJz2YOSM8ZJxjTf3spuPLFAExYMr/DbJrn7QEJQ8Zp43VV3Kb9yCmYv+V9HObSGfng3hv1cA==
X-Received: by 2002:a19:7606:: with SMTP id c6mr11783215lff.412.1643106159583;
        Tue, 25 Jan 2022 02:22:39 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.208])
        by smtp.gmail.com with ESMTPSA id 10sm852759ljq.17.2022.01.25.02.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 02:22:39 -0800 (PST)
Message-ID: <33d913fb-3cac-9ccc-82fb-17da1de239fe@gmail.com>
Date: Tue, 25 Jan 2022 13:22:38 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/18] staging: vchiq_core: simplify
 vchiq_add_service_internal
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 bcm-kernel-feedback-list@broadcom.com, Phil Elwell <phil@raspberrypi.com>,
 Gaston Gonzalez <gascoar@gmail.com>, linux-staging@lists.linux.dev
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
 <1642968143-19281-9-git-send-email-stefan.wahren@i2se.com>
 <74c587ca-4ce9-68e6-8eb1-f956ca05cef3@gmail.com>
 <20220125095940.GT1951@kadam>
 <99efd1a3-9605-ffe9-5d3c-51312ce7a4d6@gmail.com>
 <20220125102049.GU1951@kadam>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220125102049.GU1951@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

On 1/25/22 13:20, Dan Carpenter wrote:
> On Tue, Jan 25, 2022 at 01:06:14PM +0300, Pavel Skripkin wrote:
>> Hi Dan,
>> 
>> On 1/25/22 12:59, Dan Carpenter wrote:
>> [...]
>> 
>> > > > -	service->trace         = 0;
>> > > >   	atomic_set(&service->poll_flags, 0);
>> > > 
>> > > Nit: atomic_set(0) can be also removed
>> > > 
>> > 
>> > No, let's not write code that assumes it knows atomic_t internals.
>> > 
>> 
>> Isn't atomic_set() just (let's say) "magic" write to memory in all cases? Am
>> I missing some design issue here?
>> 
> 
> The point is atomic values should only be set using atomic_set/inc/dec()
> etc.  Anything else is wrong even if it works.
> 
> I think it might trigger a kcsan warning these days?  I don't know what
> that instrumentation does.  But even in olden times, the rule was you
> always had to use the accessor functions.
> 

Ok, got it, thanks for explanations!




With regards,
Pavel Skripkin
