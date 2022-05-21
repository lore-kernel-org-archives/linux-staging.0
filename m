Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1D33CE
	for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 21:05:37 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id c19so6540946lfv.5
        for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EkmajMsiYUhXvdrsUvmOT04jWZKTsPHdMPmsBMpezRw=;
        b=HnpXN/wSHlv/VEmQGhFVZKncoGfope+/brDTF6S+FoYf38JOPI4PUWKS7X66g5CUpI
         e168lzIxSSQw7MwsAk9amI/I5INXpyDzGztfYnmKODOuR+0BLjwICH+BO6IF8SAcI4OP
         S+RXXC4uOK3C6sBqkhNrv0HBUpTpDcnQQunaFKthy7J8sUQbxBORbQNULb5XfaXYBIiY
         KpEXuemSs7JU2JBDYzNvcHFQbCnE/m//B+7P6nPCkUZzakVFlYpvX3d4fp1cXcEgxiLN
         i4IKuKgAmhDGHsmztaI1DmyDuNEHOuFPOIXMrRHXmg89gxpsBhyqPPJuqo8qulCjs8Fs
         FJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EkmajMsiYUhXvdrsUvmOT04jWZKTsPHdMPmsBMpezRw=;
        b=h9dcU9FJ3JUonLf1O+Ybg2OfUo3R/tzVhH++kj/15F2V5hkBDlZMWIAQuWUS56VIuB
         wkfpkgP+s+ClYBhQMuFSzyQjbwNper6fYDKiVnfztNQ/VqbOA3+014axJ50ll6Vux7b/
         84jFy4FDCxfIF1eFA4l4a52er8r/XA0sl9L4VB1nz1NDUFL/tEjABBqwUL1S7iAVpIB2
         CCXGeM9y/ieQ8YAWGXPYdULL2SbGN0TlvE95SXc6P/6rUH1l7fMNGycX2HaXI6ggOM7A
         yHWg7eZB7BHsJt7bVPZriybzLrvgzCIsvLgY3PIJC3qrxBrFRtgjw/8aAwV1vnK/rII9
         ee5A==
X-Gm-Message-State: AOAM530mOfoZXjYUhsKo2w1VkfLNn33PRDAKLDLb3RUXi1c7p4IAN771
	YmasH1LAfFt8uzMwW1Oxxng=
X-Google-Smtp-Source: ABdhPJymc3KO6kebafKYNGTa/JzoZ5/Pot2UgArE7micAEnyJ3ghlHSadFTf1pLFKRQjJ+s4ajxoQw==
X-Received: by 2002:a05:6512:4007:b0:474:2df9:573d with SMTP id br7-20020a056512400700b004742df9573dmr11524539lfb.166.1653167135821;
        Sat, 21 May 2022 14:05:35 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.4])
        by smtp.gmail.com with ESMTPSA id o27-20020a198c1b000000b00478509b44e6sm805221lfd.84.2022.05.21.14.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 14:05:35 -0700 (PDT)
Message-ID: <3e4761a4-5ee8-0ba0-d64c-fe8798f2f010@gmail.com>
Date: Sun, 22 May 2022 00:05:34 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] staging: r8188eu: add check for kzalloc
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Martin Kaiser <lists@kaiser.cx>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 dan.carpenter@oracle.com, Larry.Finger@lwfinger.net,
 gregkh@linuxfoundation.org, straube.linux@gmail.com,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220518075957.514603-1-jiasheng@iscas.ac.cn>
 <20220521155017.7jjz7prdnspm2276@viti.kaiser.cx>
 <8fb49b5b-106b-3346-a75d-d54e0a065587@gmail.com> <YolRut+PJ68J9mcM@KernelVM>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YolRut+PJ68J9mcM@KernelVM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phillip,

On 5/21/22 23:56, Phillip Potter wrote:
> Hi Pavel,
> 
> I agree with you totally - we should change these semantics to reflect
> how the rest of the kernel generally does things. That said, that is a
> bigger patch set and I noticed the driver was broken before I read this
> thread, so I've submitted a patch already just to fix the breakage for
> now.
> 
> Changing these semantics is a bigger patch/patchset and I wanted to get
> this out in the meantime - if you are looking at doing this conversion I
> will by all means leave that alone as no desire to tread on anyones
> toes :-)
> 

I think, redoing more then 500 place will take quite a long time, but 
driver should be fixed ASAP.

So let's apply your patch and then someone (maybe me) will cook a patch.




With regards,
Pavel Skripkin
