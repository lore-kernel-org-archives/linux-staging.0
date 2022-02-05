Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6377D2F25
	for <linux-staging@lists.linux.dev>; Sat,  5 Feb 2022 08:35:12 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 77so4184367pgc.0
        for <linux-staging@lists.linux.dev>; Sat, 05 Feb 2022 00:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fkTkvIP1ksf7uTo0WnrI6Zk5yqUnR9qRAK3kp+P4vDY=;
        b=fqqbL8yWOsB5S0NTjUYHVzDu7PhUUHegmjtvvDjiaYvMfTU3zZQr/614rjpSeXFbft
         AS+xTziB6ewRkCK+rBFa+gF+cWjcgddMKVhGA+n0pjFZnCDRlmzIDeM/wODugoOQu5LA
         opknqAI0tqtX1TmFVYs/uNhjxKhKUCHNAjGDnwpifTVWys4fy5Tq/yX8jMxRPmqpKESW
         w7NgShoRNevZUoeud2rcs6mfmGDm1wjO6vQfEMcZ5oWfzrTdgOycKZ8Cf50+NIy9b5AZ
         /lQeiij9jeCnbMZgHTJzPWVfc2XZ8IDfYmFs9PeZAud0Uaa9rkYwkLkJpMsbdioUsvtQ
         hPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fkTkvIP1ksf7uTo0WnrI6Zk5yqUnR9qRAK3kp+P4vDY=;
        b=FzUFqEc6e/blsVRD/Ka52ncF4p4kJC6dhqt/9WxDnTrm/tCHdPvynF2iYoBxfTPf/Q
         vZLZgjA7hRXafkr2dcJLEHguP62Kuu5bFVyX2/Jnwkq2wQFk+KOGfgYxNMS0N8tH292t
         LzGoWx/Oahdv+VhD7vY35etNdYjIoS1bP2rLJdEcz4waur/l2pliU57+QGEEuKyoHjpT
         jrOsuE/395keCTd4WHiycwDO1fWa09miGSspzAR0kf4kfofBnSZhy235p7+jqu6rf1U9
         Jb/o7CuuoCq8nA7bb2bQl3h91/R4Op8UoVUsD+uR6Bn/DNWvvUB2kkCKyfXK8meWWHa6
         iovg==
X-Gm-Message-State: AOAM530gh5VAiso3k1S34iAKT1fJXsqtCWTyJyRRf6Zio8OuZ01/dCU4
	Dd0k9roizWUTn3bw8M3nDbOSnmOkUIo=
X-Google-Smtp-Source: ABdhPJy4ozOluUsw3pYt4DEbQwtRPlGsYNOpKrCYISePCyXP9c62YLMDcZebemo/Y2YW0KO5JY2WWA==
X-Received: by 2002:a05:6a00:728:: with SMTP id 8mr6969207pfm.27.1644050111634;
        Sat, 05 Feb 2022 00:35:11 -0800 (PST)
Received: from [192.168.1.100] ([166.111.139.99])
        by smtp.gmail.com with ESMTPSA id x18sm4845251pfc.123.2022.02.05.00.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 00:35:10 -0800 (PST)
Subject: Re: [BUG] staging: wfx: possible deadlock in wfx_conf_tx() and
 wfx_add_interface()
To: Hillf Danton <hdanton@sina.com>
Cc: jerome.pouiller@silabs.com, Greg KH <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
References: <6f489bf2-bac0-8030-7ea5-6f5c12daa568@gmail.com>
 <20220201113303.3883-1-hdanton@sina.com>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <77de47d2-3dfb-e329-5a86-74a115de9fcd@gmail.com>
Date: Sat, 5 Feb 2022 16:34:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220201113303.3883-1-hdanton@sina.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2022/2/1 19:33, Hillf Danton wrote:
> On Tue, 1 Feb 2022 15:09:34 +0800 Jia-Ju Bai wrote:
>> Hello,
>>
>> My static analysis tool reports a possible deadlock in the wfx driver in
>> Linux 5.16:
>>
>> wfx_conf_tx()
>>     mutex_lock(&wdev->conf_mutex); --> Line 225 (Lock A)
>>     wfx_update_pm()
>>       wait_for_completion_timeout(&wvif->set_pm_mode_complete, ...); -->
>> Line 3019 (Wait X)
>>
>> wfx_add_interface()
>>     mutex_lock(&wdev->conf_mutex); --> Line 737 (Lock A)
>>     complete(&wvif->set_pm_mode_complete); --> Line 758 (Wake X)
>>
>> When wfx_conf_tx() is executed, "Wait X" is performed by holding "Lock
>> A". If wfx_add_interface() is executed at this time, "Wake X" cannot be
>> performed to wake up "Wait X" in wfx_conf_tx(), because "Lock A" has
>> been already hold by wfx_conf_tx(), causing a possible deadlock.
>> I find that "Wait X" is performed with a timeout, to relieve the
>> possible deadlock; but I think this timeout can cause inefficient execution.
>>
>> I am not quite sure whether this possible problem is real and how to fix
>> it if it is real.
>> Any feedback would be appreciated, thanks :)
>>
>>
>> Best wishes,
>> Jia-Ju Bai
> Hey Jia-Ju
>
> Thank you for reporting it.
>
> Given the init_completion() prior to complete() in wfx_add_interface(),
> no waiter is waken up by the complete(), so it has nothing to do with
> the waiter in the conf path.

Hi Hillf,

Thanks for your reply and detailed explanation :)

>
> BTW if the unusual wfx init is a real use case then we can add a new helper.
>
> Mind introducing your toy to LKML? How much time have you been put in it?
> Its current status and future works?

Do you mean my static analysis tool that generated the report?
In fact, I spent 3-4 months of my part time on implementing this tool, 
which can detect deadlocks caused by locking cycles and improper 
waiting/waking operations.
This tool still reports some false positives, due to missing some 
special patterns in the kernel code, such as "init_completion() prior to 
complete()" in this false bug.
Thus, I am improving the tool to reduce false positives now.
Any suggestion on deadlock detection or the tool would be appreciated, 
thanks :)


Best wishes,
Jia-Ju Bai
