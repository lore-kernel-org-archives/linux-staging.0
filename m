Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C7123AA
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 06:24:20 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id f27so27413228eje.1
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 22:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1sRwCA8KHUhxNcfYSilemI92Zg7l5g6gONZv/WfRaY=;
        b=g3h4mAUIxRoseTXzmO3t3ygPXXVDYF+I8+edFSVrLLFQ7iQe1hlKcHSwPEWxJza2ro
         mSyGvhSeDOfWD9RAgwTkR/HIkoaePVKuBjyjouEVbtxGpxqi7vXgP4fjwGwPycrWoPn/
         6BRFVUtMXzSj0npCXNjCzJ6rR2PsgUJFEYQquiPLBUE+WNgWsVGFqAcyi5cfVI2Lo/Cu
         y+vP4Jpe+Op9whnsyOAv+XpN2bDuUrsK33xdVkEsYGURFT5uzHfmbLS4m/qR/a242+HR
         AD26ZOMPHr4t9+AyRdu2B0LCtnJ4cB6wYLAzEORdB450lutp8HsWT4nbB+Zl37C+7htj
         aH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1sRwCA8KHUhxNcfYSilemI92Zg7l5g6gONZv/WfRaY=;
        b=EBjzEQMNuU48RGikeyqo8BGNwe44R2UcIFgyh3mV20cEg8tRQ8WnpWtTb+mWevaJTG
         7+X70Jzp9cFL/X0B3PS7dX7pwigufMSrKMHDk+Cpv/SRvVFCmNoh/gnm4WG4g5UdztB0
         A+ZUl1QzSLuk9J7UysndmpQQjWfTgGrRq8q5Rs19CRbGiUhCD7DCv3xzZ8eDBvMHIVgJ
         mw5BImcchJNxTQ7Htu7bHXJie9Q1l4xo+8jfmNw2DseSQ3D6soSGOGyafEPatn9Kowze
         z+QcV0G0+xgzBK3ghvF5B3t0BNBByuBd4rZ9MfVJjFnWC75Zf1wb8Ucw0rpO7Qm6OZYB
         iXfg==
X-Gm-Message-State: ACrzQf0n6ch1dSauUXHOuWzEM7/zHUfn92swrU3ljqLj49T5qaA1enSL
	BvZSCIqwCZ5vii04ZU3ApVM=
X-Google-Smtp-Source: AMsMyM5VkUYckAFnZXci2vZlVZisY5bq5bOgu5zyWo61Z7rd25U6wjfhbbXaKV4wZOSrMh+98OEnxw==
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id ww7-20020a170907084700b0077ff489cc25mr45610765ejb.80.1667802258910;
        Sun, 06 Nov 2022 22:24:18 -0800 (PST)
Received: from [192.168.1.100] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id gv57-20020a1709072bf900b007acd04fcedcsm2891085ejc.46.2022.11.06.22.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 22:24:18 -0800 (PST)
Message-ID: <8ae354fe-ca24-1c51-2cb9-230e5e8b74ee@gmail.com>
Date: Mon, 7 Nov 2022 07:24:17 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/2] staging: r8188eu: casting simplified
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1667755987.git.drv@mailo.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1667755987.git.drv@mailo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/22 18:54, Deepak R Varma wrote:
> Patch set proposes variable casting simplifications. Change improves code
> readability and appears more maintainable.
> 
> Changes in v2:
>     1. Patch set introduced.
>        Changes associated with pointer casting and variable casting are
>        split into separate patches. Hence the patch set.
>        Suggested by gregkh@linuxfoundation.org
> 
> 
> Deepak R Varma (2):
>    staging: r8188eu: simplify complex pointer casting
>    staging: r8188eu: remove unnecessary casting
> 
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> --
> 2.34.1
> 
> 
> 
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
