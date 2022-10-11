Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4F13D8E
	for <linux-staging@lists.linux.dev>; Tue, 11 Oct 2022 19:50:54 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id ot12so33768490ejb.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Oct 2022 12:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LqLX/cHLeCd3S+HbW8lS6SU+seQ/9WfCD+VYS7kKpIU=;
        b=NgAJYwcfalbJNnRuL7jrfkwsS5GJVYzJg/sYi24QMhEgWYfytdwKIUXJY22xBH5c6r
         tbTawDjoAd0he+vCAR/oEuAH5HF/mXpeuoDfYJNQ+jIpokQ80f+ubVH20jJL4JzB+gj7
         X0ATZA9uqdCRLalPuN7w8M+z5gHs55+XjCzoZw7PhcIutp1kFeBQRbJrOTrS/evOirqp
         j6CmwR5iYXF/e1NonaIIE2/OKK0qOstU6KbcExA4ZJrZj1PBBg0WA6/AmDmBPyKNskdl
         2uhg6myWZp+w2+Qd6NkcBjxQ/Oa0Sj2wu5J3/pJFyCAPMtnRyQWAnyi8yFKOv5+pZ/Mx
         XxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LqLX/cHLeCd3S+HbW8lS6SU+seQ/9WfCD+VYS7kKpIU=;
        b=pqN9Velkbx+24VHnE54NtZZVvFVjA67Yu5TQiTi9OyB3aAcwt9c+okaZbMTUkiTR+A
         tFYXelrDiRbXwJ59CMke2zWTFF8weU7fWh7ucboK4b49G9fBss9rzncT8GHiYMDS3F17
         KDkuyFR496q09K+g1pkPRgpBC2fOCfdIbbCkoYanDnBi6iS8tc/Q5tlG4P4p8e6MXWh4
         uZZ23TkumOGXDHllM33qwm1QUnlETg/s312vWgZKhYqgnRp0DAK9YCsUiXpnFnTjdvmm
         LYM0pE/bGYHcN9+S60nX7zp4wG35mWM9xnNftEb1q9+dsF2RzomElLP3Ia806FbhZlGh
         93CA==
X-Gm-Message-State: ACrzQf3yXPWwYqfhJtN/pvdi8Koi3hq2iBLG4XZBvpjq1o1NtTBu/mgP
	/cJ0kkHK3UOKWo9c1ID4hcZoiyF9D5o=
X-Google-Smtp-Source: AMsMyM6baT0521/j/DAYSV/7ZMytgY5v+QR2PAPG2ggq1Lu5BkPo9r8Q1WxpXKF7hto4bRV6qqYUOQ==
X-Received: by 2002:a17:906:8479:b0:78d:cf17:2d70 with SMTP id hx25-20020a170906847900b0078dcf172d70mr5338745ejc.319.1665517853171;
        Tue, 11 Oct 2022 12:50:53 -0700 (PDT)
Received: from [192.168.1.102] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id q20-20020a1709064c9400b007829fb46a0esm145779eju.142.2022.10.11.12.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 12:50:52 -0700 (PDT)
Message-ID: <a9ee121b-7494-db5b-a5d8-58a8ef8a7d31@gmail.com>
Date: Tue, 11 Oct 2022 21:50:52 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] staging: r8192e: Rename macro defined in rtl_dm.h
Content-Language: en-US
To: Dragan Cvetic <dragan.m.cvetic@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221010190439.13131-1-dragan.m.cvetic@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221010190439.13131-1-dragan.m.cvetic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/22 21:04, Dragan Cvetic wrote:
> Rename macro definitions to avoid CamelCase which is not accepted by
> checkpatch.
> 
> No test performed on HW, just build.
> 
> Dragan Cvetic (3):
>    staging: rtl8192e: Rename RateAdapt..., RxPath...TH_low, RxPath..._TH
>    staging: rtl8192e: Rename RateAdap...20M, RateAdap...40M, VeryLowRSSI
>    staging: rtl8192e: Rename WAIotTHVal, RegC38_TH
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 14 ++++++------
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 22 +++++++++----------
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.h    | 16 +++++++-------
>   3 files changed, 26 insertions(+), 26 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
