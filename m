Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8F17E
	for <linux-staging@lists.linux.dev>; Sat, 14 Oct 2023 05:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UW2JLZBC"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9ae65c0e46fso99211566b.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 22:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697263179; x=1697867979; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8DPDev0kS332XCiOzJt+NGx19fYKPQfBshqPGKN8DE=;
        b=UW2JLZBCS7ir5L3b4XaP31nJDz/w7HlgQ9kfUWZBX5dBihVdPVEi6Gm03BVbjxj0br
         enVWcN2YMAEqaYr/XpWSChIsnpW9ml27gcx+x6o8hlVQJi27z7Sc4ATPqU4XZF/ql/9H
         yh8vU0CgPf24qIZMG+/AWk1DMKIROkR0D+y1be2iEmuygJ3DEsMUaHUZ7ahlpFvVVpIk
         vFlifehk15w+oOF6cbz6dXJ7IUjuKGjXvA48U4aNcR+LG/mqHPmW+heFO6cGq2hFMa4D
         Cs9EyaTurJ7Km4lNIO4fBc8P7ZUpjn9jAtjjleREZ5uaFJ62Mh3LdPHDp3/tSj7KpAsG
         D2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697263179; x=1697867979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8DPDev0kS332XCiOzJt+NGx19fYKPQfBshqPGKN8DE=;
        b=MPinXVm7XCCkLgdAZkdDtneKIxlKwpxkOZhsER0c1RZSGTpq6JHUFVXiZ2VOmRWVll
         HZ2j2UEWHRUdYYiwCLdm1O7fZ9FTj5uzNFEAat9DG4yackPFIMEUNQEMmWwmiw/zKvbE
         xQlMyKIXCgtX068MH1FXDQxKl8mULYOM40Ei28be9lCxwzYiF2SRXikAwIPvzF7OuXbG
         RHtJf0VQRtLTIr92Pc3TVtzCkOTK/coqCU8GKYEVjbXcrocwoCYHaI/v3GRNC8Lovk+G
         vF/0R/XBLJquie32RRfW3D4ny/KFkwhfu/BSrSKjmCO4h2QhvYgS/CgtGcsZLtQDPBcL
         Pjeg==
X-Gm-Message-State: AOJu0YyYaPOCCyzhkfXWM1uX/mi7DtbcvNyNza0BGCLkHrMZ/81zpGKD
	1lZ7zmbdYgXup3/24/I1WKo=
X-Google-Smtp-Source: AGHT+IEd+pm1Q04YhNA9EuiWqa4E3l5p0ML/HSnn1zHwrRUcm0TlwqY573qk/Ule+PxdXZh2sVsG7A==
X-Received: by 2002:a17:906:7389:b0:9b2:71f2:bd11 with SMTP id f9-20020a170906738900b009b271f2bd11mr22974303ejl.4.1697263178482;
        Fri, 13 Oct 2023 22:59:38 -0700 (PDT)
Received: from [192.168.0.100] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id ac7-20020a170907344700b00997d76981e0sm484346ejc.208.2023.10.13.22.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 22:59:38 -0700 (PDT)
Message-ID: <643971eb-c0e5-481c-94e0-b5bb168c8d5b@gmail.com>
Date: Sat, 14 Oct 2023 07:59:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Staging: rtl8192e: Variable renames to fix checkpatch
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231014044435.11947-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231014044435.11947-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/23 06:44, Tree Davies wrote:
> This patch series renames 4 varialbes to fix checkpatch warning Avoid
> CamelCase.
> 
> Thank you in advance to all reviewers
> ~Tree
> 
> Tree Davies (4):
>    Staging: rtl8192e: Rename variable pBa
>    Staging: rtl8192e: Rename variable TSInfo
>    Staging: rtl8192e: Rename variable ReasonCode
>    Staging: rtl8192e: Rename variable pTS
> 
>   drivers/staging/rtl8192e/rtl819x_BAProc.c |  58 ++++++-------
>   drivers/staging/rtl8192e/rtl819x_Qos.h    |   2 +-
>   drivers/staging/rtl8192e/rtl819x_TSProc.c | 100 +++++++++++-----------
>   drivers/staging/rtl8192e/rtllib.h         |   2 +-
>   drivers/staging/rtl8192e/rtllib_tx.c      |   8 +-
>   5 files changed, 85 insertions(+), 85 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
