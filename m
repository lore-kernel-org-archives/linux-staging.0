Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773B83FC2
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 19:22:33 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id s3so13212138ljp.11
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qc9LqY40K8VPn4cy7lXDOl3TOv1El5e3Y/gxS7m5eME=;
        b=hC3osBVkhAHFY6ijA6tj/ZVEXj4mm8C8qiJBBDxHLLcT8QIpLtIjIOV0ap391G013K
         Pjvm6isGfE0IwRoha96eBGZuTwmRw4EOxaLITdwGu2CUqodUm/0fMoZX69Su6rXdoPSW
         KnDAT230jzPPA8v82CDwpuoPIo5oBWYWJzZkYFS/HL0nhlyxsH4zHNuNtoW7kXTbaXpx
         vmDG0d2QEfSeroRj3esvk6VhJ3en5OZG7TJpillXmaTV1uzg1fxdILl41+2vBhKeGvTN
         sI9RbhAEyZcsvBl3VGjBYKDs4Xn17+HgZ2dGbyF21vXJQjPXVuh1/A31kB/W87moKGGV
         /6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qc9LqY40K8VPn4cy7lXDOl3TOv1El5e3Y/gxS7m5eME=;
        b=OBFG+weq4PhoxYSP21q7Io1hzcVho/dSHVc+MGY9uGdQlVXUfpVhtedV8oyPUCNBdY
         d6NIy1z6MxzjeDg3N/MBIQT00Rcmm2dUFSqPR5oNu5n61jdBG7y1Yu4Ko7r84uObzsMZ
         cuD2oEE4GD6xt/3/7Kjo1tpOVIA/gSp/f8HfD5CVAM9c6FAfhy8+q6pBA218koKMTsr/
         rEvA9h0eOY4TNYBsDlPOE+lKXMA0McFa27vmsSwXkvfMhyN7tMcMUXZv/ULdhOqsmZA8
         tREKwZa4aHJIduwAWAeiD4eFSMVfg9FGhsifIiewqlEwUEzDyQXf/TkeTelZPKfcdmxW
         SpSw==
X-Gm-Message-State: AOAM530EUmV2BImxOLmlDDs5OMrsGNwgQH6YaYMktptx2bAvCU6EEfZ/
	+gK02sL8NOa5pPZp4/MEDuc=
X-Google-Smtp-Source: ABdhPJwGLyngUILRxgRSJY+hMei4hEmtobUYEQW7BIvBHy1De95gmZgtLzSC6rTVlej1TL9zNmWJCQ==
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr8404563ljo.464.1629400951459;
        Thu, 19 Aug 2021 12:22:31 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id y16sm435130lfl.50.2021.08.19.12.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 12:22:31 -0700 (PDT)
Subject: Re: [PATCH] media: atomisp: restore missing 'return' statement
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210802143820.1150099-1-arnd@kernel.org>
 <202108130937.7848F6B318@keescook>
 <CAHp75VdkAO+fiiCVs=dyc2C83mZuLCQCvqs9C+6PF6JnhKDxCA@mail.gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <49b53061-f04a-3ed8-e957-5d40a0413a63@gmail.com>
Date: Thu, 19 Aug 2021 22:22:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAHp75VdkAO+fiiCVs=dyc2C83mZuLCQCvqs9C+6PF6JnhKDxCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/19/21 8:24 PM, Andy Shevchenko wrote:
> On Fri, Aug 13, 2021 at 7:39 PM Kees Cook <keescook@chromium.org> wrote:
>>
>> On Mon, Aug 02, 2021 at 04:38:14PM +0200, Arnd Bergmann wrote:
>> > From: Arnd Bergmann <arnd@arndb.de>
>> >
>> > The input_system_configure_channel_sensor() function lost its final
>> > return code in a previous patch:
>> >
>> > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
>> > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
>> >
>> > Restore what was there originally.
>> >
>> > Fixes: 728a5c64ae5f ("media: atomisp: remove dublicate code")
>> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
>> I hit this too. Thanks!
>>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> Me too,
> Tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Pavel, how have you tested it?
> 

To he honest, I didn't test it at all. It was part of application 
processes to LFX mentoship. I really don't like style changes. Anyway, I 
have to do it to pass the task, so, yeah, I messed up with this one ;(

Also, I didn't notice when patch was applied, because I was like 2 month 
after v3 posted. I am so sorry for this situation. Nowadays I always 
test my patches.

I was young and foolish :)


With regards,
Pavel Skripkin
