Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7BF7C
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 19:06:17 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id a9so12983892qvt.6
        for <linux-staging@lists.linux.dev>; Tue, 07 Jun 2022 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kEh88sbKY2YcFyazQQTZq8kRQuf4NWYNl5prd+A7y48=;
        b=gYX6KtqMiH3fY8cMln5DLy0EX4vHtjVqoAYzI6Vksz+6WrELrfbEFY0Bb7m9oBxg1T
         VRWjrY5E5cTjKdK5wJlCK3Jp7kECqZtMksp6HbJegpfMonchOSIiRekIWXQT+9L/Rv73
         8lRqQv5Y4Pg8c+L+mEYyQqRMEIAcerryv6QHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kEh88sbKY2YcFyazQQTZq8kRQuf4NWYNl5prd+A7y48=;
        b=HqxJI71ldx2ViWwCX5ta7tEmdVU7gMSH5w5IZk/mkwtSR9RTRamiPr++vGjqgPU9jv
         NJ/rR2jRUzBJKQmdcC/8ap89BZdRhn7oQHz4UnEEJShNINl+2zjnlipgr6v/JAfutyxt
         RJGxGSgP3vVtRq62FyoMR9oUPZGzSUxGVN/qGYM3SteHPYLJsXZWpErf7xXydoyiBuYj
         4Lt8LLM8J+hc6kJqHWVc+LM83Vw5/WuwjUj4Ktm1wtqANHPlgvUKRyM9ApF/A1sw0DUg
         Da6hvJWwMwi4h+XTVD71vIXDwswezOpyhUUBMFbn8HfYpSqpzPa2kDn7xljazXZAhGvc
         nqkw==
X-Gm-Message-State: AOAM530+wfdGFIq3xXPdZIReS36ekbdeNzGR9kDBZwOVjEEw8SazZWV1
	PCNBPPrGiMhI628pMAiGhkPxOg==
X-Google-Smtp-Source: ABdhPJwU3d8oEkz5X5lKa+Lm36JdssARY1Af5Ux3+KI/0zWJyOPBsWDSAAOCUA57rRSoxhn10Jn12g==
X-Received: by 2002:a05:6214:1110:b0:46b:a979:d63 with SMTP id e16-20020a056214111000b0046ba9790d63mr7180252qvs.100.1654628776157;
        Tue, 07 Jun 2022 12:06:16 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id i21-20020a05620a405500b006a6ac4e7ab4sm8577017qko.112.2022.06.07.12.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 12:06:15 -0700 (PDT)
Message-ID: <8012a613-91ea-466e-f77e-6fc5453724f5@ieee.org>
Date: Tue, 7 Jun 2022 14:06:14 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] staging: greybus: audio: fix loop cursor use after
 iteration
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Jared Kangas <kangas.jd@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220605231806.720085-1-kangas.jd@gmail.com>
 <20220606130626.GX2146@kadam> <Yp9/kqBUzpArfPdn@fedora>
 <20220607183921.GQ2168@kadam>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20220607183921.GQ2168@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/22 1:39 PM, Dan Carpenter wrote:
> On Tue, Jun 07, 2022 at 09:40:50AM -0700, Jared Kangas wrote:
>> Thanks for catching that! Is there anything I need to do to add the
>> 'Fixes:' tag to the patch? From my understanding, adding tags is done by
>> a maintainer later on, but I'm new to the patch submission process so I
>> want to make sure I'm not missing anything.
> 
> No, it's up to the person sending the patch to add the fixes tag.

And FYI, "git blame" can be your friend here.

     git blame drivers/staging/greybus/audio_helper.c

It looks like commit 510e340efe0cbd is a possible
candidate, but I'll leave it up to you to determine
that.

					-Alex

> regards,
> dan carpenter
> 

