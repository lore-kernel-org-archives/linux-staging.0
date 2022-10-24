Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D837B
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 05:45:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v1so14401157wrt.11
        for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 22:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XsOVnHocupjow06h4aYGVD+YUccfa4nu40a5vDm5gb8=;
        b=Xllt/M3nsdNbj4L24wmJToogLeTeIdK7sExQTjqdz3RllhlOHP0ff+0id8g30093up
         FxVRTqYEYo74l8+JZD7J9YgN7AlRzcgT5RDAkAVtmJp7kbeBtK0a0XI9ucmP7HSh8ZJd
         KEv/5kR8s3Abuxbo2BrvRy/lpu8mhKt5jOgZJxcZr0Uim7yXC6flzlORbIGw+IOS0Y8i
         gGxcHhh9dyxHbN45fuZPc+lsgIReywD84JFM4llGyQNEP7adDWpOnADiLjZIEUNbOkUJ
         e/yGHEkVhlfZ3oZDmZxouAGlliOp8QeY56bE8MmF5vmiylCldGKQO3FctpGQLoiJFYma
         16+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsOVnHocupjow06h4aYGVD+YUccfa4nu40a5vDm5gb8=;
        b=ztC1diw93rm1gs7z/TkAfenXD6SQjqQRWte3JMccXXKuT4PI5AO4yqD9YMEmH8+LJa
         eFCKxES9vR/t9agztxvUZuCUSVDalca9DqJ8/46Mc+08g0cuP6ZIlSoUY3z8TFG6iBvP
         0Pi73dQBVaEB8PyymwPpoVc+iXD4fP3JOATx9h3JW58QYgl0tPLu6n/Rj6xaxcPVLQye
         Km6ZNM/ZfJsiY1fO78sUFE8qlP2mUIQZjN3VLiweB3tnNEGZwk07wlE5ZDRL6hsLGfjM
         xya9/nQ97hvmt2n99CpV55lgi8hy5mWfoM87mNhMzvUUNrq82QHQ28UorH4JY1lXJmzv
         iMpw==
X-Gm-Message-State: ACrzQf3b7qYL1H7VuLX0blLbGUeqzf+O6k2jrh/w1qZh0WZtpMtGRq6o
	vypc0aE+KqDzuxHi6jEG8t717hY46Fo=
X-Google-Smtp-Source: AMsMyM6axIKc+z5+wGkyXMZMMiUzQ/GVEkDxkSBT3QXb+PGfzjHjUhElQ5lE2vkfq2bCMwiAf90nmg==
X-Received: by 2002:adf:f609:0:b0:236:680b:8c65 with SMTP id t9-20020adff609000000b00236680b8c65mr4678943wrp.615.1666590358040;
        Sun, 23 Oct 2022 22:45:58 -0700 (PDT)
Received: from [192.168.1.101] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id s15-20020adfeb0f000000b0022cdeba3f83sm24811600wrn.84.2022.10.23.22.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 22:45:57 -0700 (PDT)
Message-ID: <e4dae7d6-9e12-247c-ac17-f35226a8c600@gmail.com>
Date: Mon, 24 Oct 2022 07:45:56 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/3] staging: rtl8192e: rtl819x_HTProc: code cleanup
 patches on the rtl8192x_HTProc.c file.
Content-Language: en-US
To: Aaron Lawrence <t4rmin@zohomail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1666502177.git.t4rmin@zohomail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1666502177.git.t4rmin@zohomail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/22 11:40, Aaron Lawrence wrote:
> Multiple patches regarding the cleanup of code in the rtl819x_HTProc.c
> file according to the checkpatch script aside from the CamelCase issues.
> 
> Fixed patchset email format in v2.
> 
> Aaron Lawrence (3):
>    Staging: rtl8192e: rtl819x_HTProc: fixed missing blank space
>    Staging: rtl8192e: rtl819x_HTProc: fixed alignment matching open
>      parenthesis
>    Staging: rtl8192e: rtl819x_HTProc: fixed unnecessary parentheses
> 
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 38 ++++++++++++-----------
>   1 file changed, 20 insertions(+), 18 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
