Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26C063A8
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 19:11:17 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3232e96deaaso300485f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 12:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695669076; x=1696273876; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhJ34cUYsYlf3XC7vsPt+CX9AqV2ARPhgcXKTo4+p2g=;
        b=ggVSvUBX+63e38FtlwUsmUTpdw67EORwgqVvf2pKdL/byvGVoW7+G8pMzOH0Epy4iY
         OlXtQKENHh4f+MnjNwtSM/ec/HQQYLH7QYbMG8A9sotq1msnBLzngw5AMJnP2Qh5rq7O
         veC8+YZwc1xsAirIlaAI67NJeIMPiajyCwz47QpCQuKUWEgQTeylI84YhEY3otMd+qU3
         LCnQXsYeUrAsMJjD+Vc1yDi5E04jSIjGDQP//yPVMltC19mElK57FHTd9EKOw8YFHnau
         0diVc4fSM3BdrvP/GWzCcybUcdBfV1YiAtahEKT5OGdEFO+oFf11CZGhCKYBhqbLxTYS
         jAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695669076; x=1696273876;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhJ34cUYsYlf3XC7vsPt+CX9AqV2ARPhgcXKTo4+p2g=;
        b=cU3hpz3mZ1wDVXjnVRoBB2RTmze/zdyvzkGXbcP7Pr+v0Iy79ZpqIFZQExRNW4+GVM
         0dfjg3sViVD8tQaJuTxlJKYEFwUeOe531AlrwdqpLVnCKRi0XHqVvNtaOqkLXpy2QbIo
         CU5avbugKqDHZTFQsGp5dG4T8pBCAl36lzdCzILlS8ODNa67sE8R4fkM2yxdX1JCqIUV
         UpMm9C8abNzStJ/Rds551MuGX22PUnLIRF+1ykFq/y1Lv8SVLl6MelHCXmJiicUAzP85
         uc0M8pBuAdz3YapJtjZ9OL2pAIE9zwNBvppWNtLoYlyIOPCjmWpNkGoaCp1IQlWGjRIe
         AzTg==
X-Gm-Message-State: AOJu0YwyhsZIgrqS+SnSxN9cV+roJPAcuH4HsifW9xunskqP0ZL6S8QU
	rtSQjFu9NIZfYUAKlmo3BNA=
X-Google-Smtp-Source: AGHT+IF0cJgUXjIsYdHE+rY2bl8HxtFhHE4Z0Clq8pxBo0sE2Aj/9MtEkxye0rmKLJhF3oUMmFUc2Q==
X-Received: by 2002:a5d:4210:0:b0:320:8f0:b93d with SMTP id n16-20020a5d4210000000b0032008f0b93dmr6064271wrq.3.1695669075782;
        Mon, 25 Sep 2023 12:11:15 -0700 (PDT)
Received: from [192.168.0.102] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id r2-20020adfe682000000b0031ff89af0e4sm12562071wrm.99.2023.09.25.12.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 12:11:15 -0700 (PDT)
Message-ID: <9d96db4f-0b79-0940-ef95-d9bd70dc9a18@gmail.com>
Date: Mon, 25 Sep 2023 21:11:14 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] staging: rtl8192e: fix structure alignment
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Tree Davies <tdavies@darkphysics.net>,
 Yogesh Hegde <yogi.kernel@gmail.com>, Sumitra Sharma
 <sumitraartsy@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230925155413.471287-1-arnd@kernel.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230925155413.471287-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/23 17:54, Arnd Bergmann wrote:
> From: Arnd Bergmann<arnd@arndb.de>
> 
> A recent cleanup changed the rtl8192e from using the custom misaligned
> rtllib_hdr_3addr structure to the generic ieee80211_hdr_3addr definition
> that enforces 16-bit structure alignment in memory.
> 
> This causes a gcc warning about conflicting alignment requirements:
> 
> drivers/staging/rtl8192e/rtllib.h:645:1: error: alignment 1 of 'struct rtllib_authentication' is less than 2 [-Werror=packed-not-aligned]
>    645 | } __packed;
>        | ^
> rtllib.h:650:1: error: alignment 1 of 'struct rtllib_disauth' is less than 2 [-Werror=packed-not-aligned]
> rtllib.h:655:1: error: alignment 1 of 'struct rtllib_disassoc' is less than 2 [-Werror=packed-not-aligned]
> rtllib.h:661:1: error: alignment 1 of 'struct rtllib_probe_request' is less than 2 [-Werror=packed-not-aligned]
> rtllib.h:672:1: error: alignment 1 of 'struct rtllib_probe_response' is less than 2 [-Werror=packed-not-aligned]
> rtllib.h:683:1: error: alignment 1 of 'struct rtllib_assoc_request_frame' is less than 2 [-Werror=packed-not-aligned]
> rtllib.h:691:1: error: alignment 1 of 'struct rtllib_assoc_response_frame' is less than 2 [-Werror=packed-not-aligned]
> 
> Change all of the structure definitions that include this one to also
> use 16-bit alignment. This assumes that the objects are actually aligned
> in memory, but that is normally guaranteed by the slab allocator already.
> 
> All members of the structure definitions are already 16-bit aligned,
> so the layouts do not change. As an added benefit, 16-bit accesses are
> generally faster than 8-bit accesses, so architectures without unaligned
> load/store instructions can produce better code now by avoiding byte-wise
> accesses.
> 
> Fixes: 71ddc43ed7c71 ("staging: rtl8192e: Replace struct rtllib_hdr_3addr in structs of rtllib.h")
> Signed-off-by: Arnd Bergmann<arnd@arndb.de>

Hi,

thanks for your support.

your patches cannot be applied on top of the 24 patches which are in the 
queue. But may be Greg will not accept all of the patches send in.

Will see what happens when Greg sorts them out.

I tried your patches on hardware without the 24 patches send in. All OK

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>



I use the following command to compile. Why I am not seeing the issue above?
make "KCFLAGS=-pipe -Wpacked-not-aligned" -C . M=drivers/staging /rtl8192e

Thanks

Bye Philipp


