Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C69D7E
	for <linux-staging@lists.linux.dev>; Sat, 14 Oct 2023 06:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igmbBXNv"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9ae3d7eb7e0so103121866b.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 23:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697263922; x=1697868722; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vwhbn1hukRofnIjJhbz4lIcJRjmPcE71e0px0OJJDnA=;
        b=igmbBXNvzsMJlu/z3mY2ujE6Q/MdLa+darCdIjKwNEBhp0rXEHrUTxOyqhT5N1iO43
         388EtSTuqZsanOaBqYj7+SE6QFVhW/Y0fI6NDu0JEHr6B7QTe07jES1RAGmLYpmOlUTH
         /PYbU9JZgqz9ZcWbHmXAWDXZPk484vqL9nWSI4rRDWkmx9KEHuN5v7cCiM4Z+egmaGl9
         UK/4HERZKDy5AWIg7c8AnMbWY0iiJLcjLrmYRSvMdVHnXV0BHZbquBQNr14/F65XlT75
         VJVNrFpuaeyrMBR9NMizJ0d5+WzordopJlwGaxDnMF4QM+/OZx+OnwfBIIoVez4YUCXO
         QwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697263922; x=1697868722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwhbn1hukRofnIjJhbz4lIcJRjmPcE71e0px0OJJDnA=;
        b=E6E5dGk7o2pV4xviyuI+bAsnb6wPmaQQ4y1T3fNeI5ZiKNH4e1JetocVk6HEJ1uc14
         aZIT8bVp3zlpvSSXgv/qh5N5pUdzsnEq5wOK1X4Y+vlLpwl+vd07JqI6bLQyhZLedUF/
         IeyDiHys2JCP7uoYcYSIJWDp5SyUs9NommIsBluD5ww+UjpRUYxjiTjbNP/8oM+rsMG7
         wYlZzbEd05/FLlpVAi/kFEQHAsg+QstdWlT1/fynJ+GIkd8NAFfCEvdK9wvpsI+kmkU/
         gTnA5Tef+fLPavyJT+XozMDQBemOGoN96haytX7KbH8/1eIuKaYKiq6aZRNJEeuyervb
         MBsA==
X-Gm-Message-State: AOJu0Ywc0cu7d/uJBX/N+7W2YBzNgyz8pClDir2BUoz6t1buKwl72GQU
	Y0uGBHuAqqw+3Hdh9t+bMJd+BAmj1lU=
X-Google-Smtp-Source: AGHT+IHFjGetvQBHJfWxuQWM0DaEQ/iFOMbRiehWHPfpaOqU3OW3uDKJlGgX3iK39u02BT8gyMGEhQ==
X-Received: by 2002:a17:906:530b:b0:9a1:aea8:cb5a with SMTP id h11-20020a170906530b00b009a1aea8cb5amr23967931ejo.1.1697263921429;
        Fri, 13 Oct 2023 23:12:01 -0700 (PDT)
Received: from [192.168.0.101] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id pv21-20020a170907209500b0099bd1a78ef5sm504039ejb.74.2023.10.13.23.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 23:12:01 -0700 (PDT)
Message-ID: <bac0d5b5-9c6e-4892-b328-bc998add7f64@gmail.com>
Date: Sat, 14 Oct 2023 08:11:57 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Type encoding info dropped from arrary name
 "abyBBVGA" and variable names "byBBVGACurrent", "byBBVGANew"
To: Pavan Bobba <opensource206@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1696791459.git.opensource206@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1696791459.git.opensource206@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/23 21:01, Pavan Bobba wrote:
> This patchset series consist of fixes to issues found by checkpatch
> 
> Pavan Bobba (3):
>    staging: vt6655: Type encoding info dropped from array name "abyBBVGA"
>    staging: vt6655: Type encoding info dropped from variable name
>      "byBBVGACurrent"
>    staging: vt6655: Type encoding info dropped from variable name
>      "byBBVGANew"
> 
>   drivers/staging/vt6655/baseband.c    | 40 ++++++++++++++--------------
>   drivers/staging/vt6655/channel.c     |  6 ++---
>   drivers/staging/vt6655/device.h      |  6 ++---
>   drivers/staging/vt6655/device_main.c | 24 ++++++++---------
>   4 files changed, 38 insertions(+), 38 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
