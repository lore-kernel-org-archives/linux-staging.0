Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726037A
	for <linux-staging@lists.linux.dev>; Sat, 16 Apr 2022 10:57:37 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id f5so4324436ljp.8
        for <linux-staging@lists.linux.dev>; Sat, 16 Apr 2022 03:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6jmuQhxjlZyaiauhW3ksOezxG0CdP/I9NiSXgA9JK6A=;
        b=p9igy0WaKtSgvuM+Vgjvowr4iI6JukewIbViqym/RUaHaxUjLNcApkK1uFMcKOYB+K
         zMhSO3mN62uEcOSXDNzz0T1385ojs0ofa/sbBx66yOUepc5GHMdOPCkmVE8vU7fCQTc8
         oXwEMaz9+PEhKLqr2+4PaRyDX2VOODXplZWMLp5AXIPEJl2/GzdEZ0HUoB7ets+eu9mU
         wdXn4/fU/EE5ML+U+Hcsor+qwOYHJ6f+32uWmYsIGzVmCRApvmCRou/nwAiVwohR9gvL
         RTTJoarhVenZx9XiB47cgm1wHEatLKcQRFh1j/SZsGJSZ9BXurXsFE8l5tBI8i5YM5E9
         DjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6jmuQhxjlZyaiauhW3ksOezxG0CdP/I9NiSXgA9JK6A=;
        b=nZ+vp9Pw4QjaLAniW5/JAkUtsvNYLvVCLPsto/ni3RB14BHyILwdnII/adJfK9iT0k
         ne6VzCq79+mw+ojAS1OWc1wYg8eJ9ROM9ho3oxOza6VrDxHl6D6YSxOmfmeiYhK1tl0v
         gIyrewN+GmptuwDjMWbgc8lG7x0rKZlcXveqPhPuUrq/7jYpyZP8GUk9XU810ZB6Oo4S
         c4T1ZP5KuEVsGv+fRn4cfPSLSxPdNrJHM6lKy8ZiaHqrIVsoP7wog1tqr+D0kgtdMd59
         74saUfRneiGm00qAxowIwcPqP+8hhp+WpVfdC7jQEx62qX/sxnahOS+v42o2VxTycJ6z
         YPWw==
X-Gm-Message-State: AOAM530eDrTV0UDrwVUHvz6/o8b2N1YcOe+9Q/lf10d7OpJ1I5OqTBLk
	fTbiZ9XyOXIM9cS2LnHjNbQ=
X-Google-Smtp-Source: ABdhPJzQyR4FP3VLblv2z4wiz/PPqJ2Ndjvb20TUlZYYDW6Pceo9/rpNrzinvXXid0O+WFh9VOyHeA==
X-Received: by 2002:a2e:9101:0:b0:24b:27c:c210 with SMTP id m1-20020a2e9101000000b0024b027cc210mr1858659ljg.134.1650106655322;
        Sat, 16 Apr 2022 03:57:35 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id r18-20020a19da12000000b0047022f82509sm239361lfg.238.2022.04.16.03.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Apr 2022 03:57:34 -0700 (PDT)
Message-ID: <5d9181be-0a02-0623-7741-1d4352d62610@gmail.com>
Date: Sat, 16 Apr 2022 13:57:33 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: rtl8712: fix uninit-value "data" and "mac"
Content-Language: en-US
To: Wang Cheng <wanngchenng@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220414141223.qwiznrwgjyywngfg@ppc.localdomain>
 <68484555-f763-bc42-eb4c-9cea2ee8dadb@gmail.com>
 <20220415095741.3zfuztivtgidvpqc@ppc.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220415095741.3zfuztivtgidvpqc@ppc.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wang,

On 4/15/22 12:57, Wang Cheng wrote:
> Hi Pavel, thx for your review.
> 
> Sorry, this patch is just confined to fixing uninit-values with
> modifying the original code as less as possible. It sounds good to
> refactor r8712_usbctrl_vendorreq() with better API.
> 

I understand your idea, but this will just hide the real problem until 
syzbot hit it in different place. So, I believe, it's better to fix the 
root case instead of hiding local cases.




With regards,
Pavel Skripkin
