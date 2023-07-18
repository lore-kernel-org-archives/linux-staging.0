Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CDB174C3
	for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 19:56:28 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-521a95078dbso323681a12.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 12:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689710186; x=1690314986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3CY7+PgSAsXutcSH1Yn+6ncOfnCiV685Lm0M61o0+6s=;
        b=Rlle29OTppJXuHRJzGoaprZRTTHtBAkQwbxVbI/Urz1Hb2u3yOfU17sl8CAuivGUCN
         d5akXLeaOeS5Wjh3kM0R7IX/8+2yCBIHON1oD4tYQaB1SshauYy0OFGOEXjy47Q9Dr1S
         9q9ekPUoUfXZWF6dSgi34/v92qtKN8Tkg/6NfGHTIvwXn4wRQb+jNzV0DEjKdeGLLjby
         c92gzJDAaMZOC0zou62fldpqWiQV5O6N0lRUKiwYXpxm0LhbcONcIYDVuUDDufuwRvvP
         arGhAkRMP3VjJTPGrZVmUZ8pUEW/Sze7er0XjYudmZPzhEg4DN/RPm/Kbtz2RjzW8HOG
         L2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689710186; x=1690314986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CY7+PgSAsXutcSH1Yn+6ncOfnCiV685Lm0M61o0+6s=;
        b=R+TuF9lveNkYv6QQCzTH6KmGl7zv+77pEuIHrUoGRkvtGPcR6g5Ns/uobtWu5LkEog
         jxQQQggP9GI3cJGoduKy7ZKcACl1SUEFAhMN3WMz5zQW2Qhqj/GEON9EQeim6aQyTvuq
         Lvt/gs3cqXnRgNzFWxqB+uzXnzOv34eLIih0P0/VnonREnO41SJjpV41uLeJivwGEZpH
         fR1ld5rOA45gKndyZLTAy0osuK1rgXkMBBgV/zxxvRQzHW5qpR+OQj93j68x1MAgyGEK
         5/nsy1HjaRLJuqV1No1aKCkYq1jI2/HU/XRYRc0+fb83lfgHiDbfzjQwIuP5mLYEQL6J
         6ycw==
X-Gm-Message-State: ABy/qLaEXLMtT+B7Lfc7CVkFh5/5VcIayqSIbBO/iP/oS6spwTGmBaOa
	DiCFoHc2PGxXxVmEmb+d7c0=
X-Google-Smtp-Source: APBJJlEiS7xGjuFFPbusmNeCkIK7mQdYKMlzpb6h0P6tICWSRq99VU2ojB5d7HphHULpHrZw/vTWUA==
X-Received: by 2002:a05:6402:5110:b0:51e:2de8:70fb with SMTP id m16-20020a056402511000b0051e2de870fbmr522422edd.0.1689710186311;
        Tue, 18 Jul 2023 12:56:26 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id t11-20020a056402020b00b0051dd1c10c13sm1634338edv.29.2023.07.18.12.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 12:56:25 -0700 (PDT)
Message-ID: <95e0287d-3211-3c0d-7a52-740acdb75f45@gmail.com>
Date: Tue, 18 Jul 2023 21:56:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] staging: rtl8192e: Rename variable bCurrentHTSupport
Content-Language: en-US
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZKYgH/BvkE9bdcPm@kimchi.darkphysics>
 <6dee04ae-4129-cd7c-0d31-70d29b86c8ff@gmail.com> <ZLL+Q0tcW5S8Xjmj@basil>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZLL+Q0tcW5S8Xjmj@basil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/23 22:14, Tree Davies wrote:
> Philipp,
> 
> I think I understand what I did wrong. Each of these original patches were
> created/based from the same commit hash. So it makes sense that only the
> first one applied would apply cleanly and the others would fail.
> 
> My apologies,
> Tree

Hi Tree,

you could work this way if you ensure that each patch does not modify 
code (and some lines above and below) a previous patch modified. But it 
is not a good way to do so. Existing tools assume that you create your 
commits onto each other and then make patches out of them.

Another issue right now is that approximately 18 patches send in and are 
possibly applied (for rtl8192e). Your patches need to fit onto those 
patches. Otherwise they cannot be applied and will be rejected.

Typically Greg applies all patches once a week. But it seems that he has 
a bunch of other more urgent tasks. So you need to focus on other kernel 
related task like educate yourself or prepare patches without sending 
them in.

Thanks for your support.

Bye Philipp




