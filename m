Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5C27A
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 08:02:20 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id r10so4295183eda.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 01:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1JgldMjDiu5zvK43QVM+MblMzFJyCLm6wag4GS38NI8=;
        b=ga3t17CYfB+KE5TsU35ymU7gxz3it957Oe4YUouw/nV0JQpApURccq9lNMFMZlgmex
         jCH1hxwg5j0DpUWw2a1DWbHQB4XgKTwrjQLTEiZi2wOOW6MxKBUVYR1hDcbLYo1rlNlA
         VVcEn6ELp11wq8wEBmvX58dV37HR66tsvubuyNwohvs0eIJr2lMksepdj7hQ45NQXcPh
         TkSJ1HyTe1fD15uHj35aLRr/2cKRM00z4bBP89rwISORGPjxUqwJSivRjVDrtgKQ+smB
         khIsYorPHxcGCaV0PH/16q+MJeOcAG+AcxMlNGiKD/8fnyBLsO1VkADj1b9Z0B3XcgGU
         +Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1JgldMjDiu5zvK43QVM+MblMzFJyCLm6wag4GS38NI8=;
        b=V6keF0msMG2E7dgfm5V0kCcIrb/i7z3wPaoY4vPIOisACa57ZXh2kNrSa7I0E6ZOr/
         0ZwvHu8eZBTCKPGO0sBrb7bnCVKGHyfjGmxT5j6g4RD5kphsGpIBXrgWV4LFnQQzAxM/
         7rKYwp8VSFBnoonMMedTJ7x21BmG/1eQ+vdsLvt8raMOJWUvspNK/VBq5cSaO9qzuchf
         9fuk/toARVJ/UGkY5Br0aRyK2nHUkADAagfgkbfIWR7gS8YEvoUmZZQNQBck4dS6Hp7C
         voG4sJFaz7lK68er/0llDDKp1k+VTpW6AhGWiPDe2rjopkPC9BPi9sKf3943zqHBbDC7
         yutg==
X-Gm-Message-State: AOAM533KBojCYWNyywQo24ES+/FPt+hwR5UF0WkWhxs967ZDbDE6gdCH
	46giHpyRsvxBdaIEuA/Ehe9cFQA5MRs=
X-Google-Smtp-Source: ABdhPJy3Lne0mEdt5P7baRApHpBKwehsF8BbTaFxGRB7bweJOspyVKwdLk40Ri78C0idhxVP+MClyA==
X-Received: by 2002:a05:6402:4247:b0:419:3990:3db6 with SMTP id g7-20020a056402424700b0041939903db6mr31362069edb.193.1649059338902;
        Mon, 04 Apr 2022 01:02:18 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id jt8-20020a170906ca0800b006df9b29eaf1sm4039632ejb.8.2022.04.04.01.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 01:02:18 -0700 (PDT)
Message-ID: <bdd168a8-b260-0653-f835-a7814a8fd4c8@gmail.com>
Date: Mon, 4 Apr 2022 10:02:17 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2] Fix unsafe memory access by memcmp
Content-Language: en-US
To: Charlie Sands <sandsch@northvilleschools.net>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 paskripkin@gmail.com
References: <YkpdVyuQguGzPSNE@sckzor-linux.localdomain>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YkpdVyuQguGzPSNE@sckzor-linux.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/22 04:52, Charlie Sands wrote:
> This patch fixes sparse warnings about the memcmp function unsafely
> accessing userspace memory without first copying it to kernel space.
> 
> Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
> ---
> 
> V2: Fixed checkpatch.pl warning and changed variable name as suggested
> by Greg K. H. and improved error checking on the "copy_from_user" function as
> suggested by Pavel Skripkin.
> 
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c | 21 ++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 

Hi Charlie,

thanks for your patch. Looks good to me, but you should include
staging: r8188eu: in the subject line.

"staging: r8188eu: Fix unsafe memory access by memcmp"

thanks,
Michael
