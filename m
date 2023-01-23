Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1569A2F49
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 13:54:40 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id m3-20020a17090a414300b00229ef93c5b0so10367349pjg.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 05:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sD/8hfxYVyYFbu48JvxARFwdM5FdtUNz3QAClSONFs8=;
        b=ppma43Q03TDBgXLjnuOWFQHxjBoTYuUORi1ipWmU7edjQPATRS5chMc1rzxUaZpUDJ
         B1yBRYFUaK3VN9QxFtr74fVkqnuhYgh400Mwl618f8FJkv4dv3TGJB7xzx4BTf9w8qb3
         GA9obxb5Uw/Bx64WFiZvElYw0wDJTAjN3Tv0xz1D2sfGW/17IcjbMB+J2SEsHqUI0rnd
         M2O2yb/EfonrWAlygsqB24yrcRw8Z1zn5rQmdg9nhGtCqKbY/vy+yAfPcj++r8rAspGI
         We6n1DMk71cPiSljfgpBLIVJeJ0SNV/LVZbppWi69HsNwsiO8DZpO5teZwLzzjY7TVN4
         wTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sD/8hfxYVyYFbu48JvxARFwdM5FdtUNz3QAClSONFs8=;
        b=N0Z9RnG2LbC30x2UxXHoI36sfcGftusLhZ/D2fI23cqRxNiTyylyrX6xS5cOZIeyy/
         GVPTEyp3mPcnrPHNMwkpkqsiiRvcFp2w3Jh5AjowL3TPCzfHc6yVWFsaT2EYmKhml9Ma
         RiohgscQ/3R/Irl8IPbLFdaI25nzXIKcbdmokET90iM2zcTw0U23bsF0POG1yuLMpe2T
         4OU9HraRClRWgnVt9nQLpe/64nAyeqo5uKKjULhLhqcY8jy9eJVcS3zwF5nO8Rp7F04z
         7jEPhxcYJprQXHyzVrMktjPKtPXaC8+h03K6d+cx45j0NuJFdhYhHa9yYujhv54szmqs
         lB0Q==
X-Gm-Message-State: AFqh2krQmD0Ma6c+rWZc/AW5jln3lkUERMHT6tJXjQOEsgMrmp0jdkf2
	LpvIRGITSMnnx8AioA8V+Ts=
X-Google-Smtp-Source: AMrXdXuq2/aZ5Rnr9hiDBKqlsrJezA90JdQ7bHWWsCWg5s5AVc46ldmrSfnz4jbdis3ot8pQXrRJLw==
X-Received: by 2002:a17:90a:5410:b0:226:de98:ee43 with SMTP id z16-20020a17090a541000b00226de98ee43mr25320247pjh.43.1674482079449;
        Mon, 23 Jan 2023 05:54:39 -0800 (PST)
Received: from [192.168.43.80] (subs09b-223-255-225-233.three.co.id. [223.255.225.233])
        by smtp.gmail.com with ESMTPSA id n6-20020a17090a670600b002191e769546sm6536326pjj.4.2023.01.23.05.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 05:54:39 -0800 (PST)
Message-ID: <cc4d80e2-2be8-046d-248a-caeddfaaafc0@gmail.com>
Date: Mon, 23 Jan 2023 20:54:35 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] staging: wlan-ng: Fix full name of the GPL
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Diederik de Haas <didi.debian@cknow.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230122191047.58769-1-didi.debian@cknow.org>
 <Y84wk+sw/gR7gNW4@kroah.com> <Y85Kkax5+U4AUedT@debian.me>
 <Y85Ux0uGYl0c//mz@kroah.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <Y85Ux0uGYl0c//mz@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/23/23 16:35, Greg Kroah-Hartman wrote:
>> Hi Greg,
>>
>> drivers/staging/wlan-ng/hfa384x.h (for example) has already SPDX identifier
>> that matches the verbose copyright notice below it. 
> 
> I have no context here at all, sorry.

Oh you mean context in the patch (surrounding text around
the actual diff).

-- 
An old man doll... just what I always wanted! - Clara

