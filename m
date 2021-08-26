Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265763FC0
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 05:13:33 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id y34so4011451lfa.8
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 22:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Hkopqt0feIIS5JxkU+fHJyYMDvajUo970zD2BdvBfg0=;
        b=EfcxD7f/97/Bdau5hZbMRGsFrjNDNORSy+HkjbaJdyh7InP/nUFTfws39IlBskKiSp
         +mBUA8nlYV23maf/60P8OEGNi9vzp3lXZySpLXbfeqEk7l1GYodD7iv2837GBkt7z4jt
         O0q6c8dYE9WxPWAQiIVgj34G6X4KYhESb1GsMsqRJ5NffsbRwitTA68tC2JuBAOucDJK
         UNK5V6BpjPaPQ/dtV7j4y3NfdqEmAYoIYmVtxO0TJQ4IECWjkxNuKp8Kb/l0b7xHqXSC
         u2kzm4vREzh6lktO7fgOl0ALaUt5ahiiNoh/MShsODt5Kd+LaJe5aiRpj/0O0krF8rQi
         +juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hkopqt0feIIS5JxkU+fHJyYMDvajUo970zD2BdvBfg0=;
        b=oMiS9f2PvK/V5MLw9xBqAlZg35ocGMQCKHxEmT65eb+LiaCEOcIF4ojoD9f4E0aurG
         QGCzcHFkSpJc4fuLWKasPzo7r/e7vZDNptUYNmdyPDfpR+8whwB0XeclsiZPWOc+ct/g
         0LKq1q4eJMEYGQOQjc5aAv4RTko94G+pSvdosVYWoXg9dXTVW9RkX2h6CraDhJIKZwI/
         Z5n+4Jkv7raMP9gHbGc5uphuL2OBqR8Oy/Uy2KODStSqaTeq0FObsPgrNqdcAvsnoRmU
         C1QMpBZJUTpr0PAwoeGvFh7Cx1ewJuVelhLVqlEpC4mynU1FzLLWgYYzbMhLSPiTzqVC
         z8jQ==
X-Gm-Message-State: AOAM533qwRNyCL8tBxUUcoWiqyp+dA3WoY/qBfOf99kC4CA+XtY6Ng9L
	pOrN/fcBc1xN0Tfo4Tx6ULtRg2iBCWhlBg==
X-Google-Smtp-Source: ABdhPJz0yJDvcJEKF+w0SF6jLoiz2PztOaQBUgQZSiE59hAymPRneGMofqA07OxhM4zJKwQI0d+TJg==
X-Received: by 2002:a19:ad46:: with SMTP id s6mr1360414lfd.25.1629954811184;
        Wed, 25 Aug 2021 22:13:31 -0700 (PDT)
Received: from localhost.localdomain ([46.61.204.60])
        by smtp.gmail.com with ESMTPSA id z8sm204034lfs.177.2021.08.25.22.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 22:13:30 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] staging: r8188eu: add error handling of rtw_read8
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1629789580.git.paskripkin@gmail.com>
 <c59d5d850bf9aab208704182c83086609289cb9c.1629789580.git.paskripkin@gmail.com>
 <3591772.nrefL38gfN@localhost.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <1f9ef1b3-8581-3261-0cfe-d5e9a8cf8483@gmail.com>
Date: Thu, 26 Aug 2021 08:13:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3591772.nrefL38gfN@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/26/21 2:45 AM, Fabio M. De Francesco wrote:
> On Tuesday, August 24, 2021 9:27:27 AM CEST Pavel Skripkin wrote:
>> _rtw_read8 function can fail in case of usb transfer failure. But
>> previous function prototype wasn't designed to return an error to
>> caller. It can cause a lot uninit value bugs all across the driver code,
>> since rtw_read8() returns local stack variable to caller.
>> 
>> Fix it by changing the prototype of this function. Now it returns an
>> int: 0 on success, negative error value on failure and callers should pass
>> the pointer to storage location for register value.
>> 
>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> Dear Pavel,
> 
> I have to inform you that building patch v3 3/6 with gcc (version 11.1.1 20210721
> [revision 076930b9690ac3564638636f6b13bbb6bc608aea] (SUSE Linux)), gives
> the following warning:
> 
> drivers/staging/r8188eu/os_dep/ioctl_linux.c:2258:13: warning: variable ‘error’ set but not used [-Wunused-but-set-variable]
>   2258 |         int error;
>        |             ^~~~~
> 
> I'm sorry, but I guess that for some reason previously I had only built v2 of your patch
> which had no warnings at all.
> 
> Unfortunately, introducing warnings is not allowed.
> 
> While we are at this, I can also confirm that GCC 11.1.1 _does_ _not_ emit the warning
> that has been reported by the kernel test robot.
> 

Yep, I see, thank you. v4 is on the way... I had a plan to send v4 
yesterday, but I've finally received r8188eu device.

I tried to connect it and test and.... driver didn't work :) So, I will 
try to figure out the problem with driver (or device) and will send v4.

Again, thank you for report :) My default gcc is too polite...




With regards,
Pavel Skripkin
