Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9343D75
	for <linux-staging@lists.linux.dev>; Tue, 11 Oct 2022 19:51:05 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id u21so21619509edi.9
        for <linux-staging@lists.linux.dev>; Tue, 11 Oct 2022 12:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TS29to17MggO7McbTxW/LAIcMUXHWuk7ghRv6xBfm3g=;
        b=ZgpA4a44IhFwz8pZexcZWVkDd8Gf3MA5cIRk/kA7NWKwhEhiNqdti+BwVWQW38oLYI
         RQ8yTKhS92l3VBbpf+5rqExt0Ho1pSu9w8AX0/CkxhfmzoJ08HdlLCn1uzCcUCZVnzdT
         cUO5heCzGXIL0yL8E12fVx7sku+4b9oM4N83aJ6zwLLuaXzXWMjsfLsIzHIT7PD/ICqE
         Lf4zzf0E5+kXDJMTYwskuf0vqliLH8PlVe1s5mrUSyZdC1V8vMLRzhVruRCh592S1cJ4
         b5/qVdhlxtnqaME+dKtG45FsbEbx+KegG4f8el2Igv16BFlvv7YR5OMEoewDKbOAOa9X
         sJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TS29to17MggO7McbTxW/LAIcMUXHWuk7ghRv6xBfm3g=;
        b=vWGyQRfoV13Rm1f9eCrRScJC4TBTOnJKOIkS7dDTZcwRjXjR/fckYlIeULYDD5MSCG
         W5Z+RRRMWa90HhGqFtY6Z0HAXhQJ7d5rvVqlnoMn7aDg5MDgBk8Zk587NjLfxZ6tjSGr
         u9lBEtiekn/e1zoLcjPv3g8IH+JESLyVOwqBV411CC9Ne1RukfI10q1CnXP9BZPvVcW1
         8zLZF1h73BZAXYvtzlizTlGusVr45Ngql+LSXygNXi0/Nu70u4awFiQIjyWmuEdtU3ak
         9AB0+mi2LJoHUm60y4EFfTeovSlkKYibHAhzm29xOma4xAMihgO4bMwkKNTXgvHekZpp
         ykEw==
X-Gm-Message-State: ACrzQf0ioSBKgC45nGZ5GXKn0jVVW2qBX1bOwect29n2OsxjjYgivyuJ
	xnzKrz1/7M1MZl0ccPXVdkc=
X-Google-Smtp-Source: AMsMyM6OeNWq2gP5Z62EeRRQiAnGu5KJPVZmltsOtB1fF1tMNV2KZFzLV+liSag/t/SwIjUNhLrAhg==
X-Received: by 2002:a05:6402:2707:b0:45b:8470:9147 with SMTP id y7-20020a056402270700b0045b84709147mr17901352edd.215.1665517864668;
        Tue, 11 Oct 2022 12:51:04 -0700 (PDT)
Received: from [192.168.1.102] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id t22-20020a170906065600b00780982d77d1sm135279ejb.154.2022.10.11.12.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 12:51:04 -0700 (PDT)
Message-ID: <c86ba0d4-9c16-890f-6bb1-919a8be04dc3@gmail.com>
Date: Tue, 11 Oct 2022 21:51:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] staging: r8192e: Rename variables in rtl_dm.h
Content-Language: en-US
To: Dragan Cvetic <dragan.m.cvetic@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221010190457.13199-1-dragan.m.cvetic@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221010190457.13199-1-dragan.m.cvetic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/22 21:04, Dragan Cvetic wrote:
> Rename variables to avoid CamelCase which is not accepted by checkpatch.
> 
> No test performed on HW, just build.
> 
> Dragan Cvetic (3):
>    staging: rtl8192e: Rename CurSTAConnectState and PreSTAConnectState
>    staging: rtl8192e: Rename Enable, cck_Rx_path and disabledRF
>    staging: rtl8192e: Rename Op, Length and Value
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 48 +++++++++++-----------
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.h | 16 ++++----
>   2 files changed, 32 insertions(+), 32 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
