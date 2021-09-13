Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473913FC4
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 14:24:54 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id f6so12357118iox.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y4Lq9CmvVcXXhPkYqU8poyyam6g50FxqVLy0oSkOGwo=;
        b=cr3Szu2PZkLNoOgq0/pNUQ7Fj5694Bo2qV8vrVedRjJCfzgGVXOzeEYVheg4ZPxGEv
         3aCVgAf9I5Kz+XUoyOocmaSYPYPnbuPvwm8fGpvMCuWC0o+1E+mXMACJtVgk0uIJUU9h
         t/yXY9ZSwWjKUjFKgM4E6NRaTZTBoBrpKixGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y4Lq9CmvVcXXhPkYqU8poyyam6g50FxqVLy0oSkOGwo=;
        b=GNc69Xzdmf+ViqcHJtU3WavEpwRG2QVNMRzJYVaAJgWfJg8SNj0xMGin44C7viZSNb
         r6m6v8/1m6vgzYy2H6S/E2Sw3Kan6e6BdJK7fykQ2vbVu9GwP8zJvprkrOwfG98yJBI/
         U9Wk3c2zkUIZWMRAiR45qL0JS+sP+DQGvbUlBVyNQvG0IT89EcJBpLwLU+Knm3FjAJna
         Nk+PyB9YsRdsu2807YGeHF+7/MvjwtPej7AX7u/mwsbqirTEKNGmmnNkBUD0KQds/XND
         9r4edWzFHAuioSHjrJRQOMzcVgqoIhE93YmrIUa4IEiqCK3aQMnwZsCnEBOjyg9KI/Bc
         9JJQ==
X-Gm-Message-State: AOAM532EhaOzzZKBzN8LoER/be9MWL2jHVkdReDdO5RdYHqcxc9n5G98
	1v2KSXI+MuBiRl8gygyk53wiPA==
X-Google-Smtp-Source: ABdhPJx/eqqIB4vBAz8lHgsBf/5IFCa6nkTSnkdfc1eI2EY+xn1/EEl30qUR5S0dnd5MPZmncifOqg==
X-Received: by 2002:a05:6638:1301:: with SMTP id r1mr10200622jad.32.1631543093348;
        Mon, 13 Sep 2021 07:24:53 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id w3sm4899283ilc.23.2021.09.13.07.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 07:24:52 -0700 (PDT)
Subject: Re: [PATCH] media: atomisp: fix control reaches end of non-void
 function error
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 gregkh@linuxfoundation.org, paskripkin@gmail.com,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20210910223700.32494-1-skhan@linuxfoundation.org>
 <20210913084102.GF7203@kadam>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7f1c09f9-49e1-718b-329c-aae9d2f69266@linuxfoundation.org>
Date: Mon, 13 Sep 2021 08:24:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210913084102.GF7203@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/13/21 2:41 AM, Dan Carpenter wrote:
> On Fri, Sep 10, 2021 at 04:37:00PM -0600, Shuah Khan wrote:
>> Fix the following build error with -Werror=return-type enabled. Fix
>> input_system_configure_channel_sensor() to return status when control
>> reaches the end.
>>
>> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o
>> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
>> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
>>   1649 | }
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Hi Shuah,
> 
> You're the third person to send this patch recently but it was fixed on
> Aug 2 in staging-next in commit 05344a1d2ea7 ("media: atomisp: restore
> missing 'return' statement").  What tree are you working against?  It
> seems like it needs to be backported somewhere.
> 

I am working on Linux 5.15 - should have checked staging next though before
sending the patch :)

thanks,
-- Shuah

