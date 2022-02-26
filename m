Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219BA3D70
	for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 18:09:57 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id f11so11711203ljq.11
        for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 10:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=U5sOQ1jTzm9XSVpV/OKjAlxcVR0vJA4ED1l8Ev97KWM=;
        b=SFOJ7FTjxQTx+bYJHRKQPO6xOcVXk3wLR6oXIR+93hx7aj+tFMQK19xU5W+rFCVNli
         cETA2Q/ObnZN9v0fPf1Lh5/Bhyan67ON75vJXbYqdrItMNzgqTj9zxLVjnuHXBMfd6+v
         /fvLHZDWaybZN4rQZLPMDkZu4HGD+nO1kbARV3m0tsvswzwUC1dyUbEsn02rvJHOYh1E
         ez9dNs1zaBuU0iaVqx3eYKLJR26c0Qr9xLwmrtTmqew9MaB4xhwusWpjxBBJRLJml7EX
         7OCJefIB0ryJrWDN20WYZ8dJSCdbkijbyrJ15xoqmKT/5Acpgn9BFKvZkZvhij51n9VA
         e8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U5sOQ1jTzm9XSVpV/OKjAlxcVR0vJA4ED1l8Ev97KWM=;
        b=S2yNbyWw+evI+SDShjYQwb7oPYqeOS1tmPZqnH5N4PsvN710Y4jPIo68sM9w6bF73m
         IRJFxLyfcvAlC1HNzTpYEI/PXff7vax2OgWbHeVjdWmyRARMBVCJ33DDplBk0fwZA8Np
         9i4g5SNvMH1V20MEgLeIxVtbiRfeQLQ1hlkzyOgaXSjCt2mfq8in95eu69iE1nhB1dxG
         vpasX8HoIY0LBCCf3pWU/xRLnOxCs/QZgaIORAzmrF4wjYeqn2hXms4IJdlTxtBKdgb4
         /SiWCHXCTreeNcH3tBtuV7e3c/9U+uqonpZJnDwKA7W7DyLdTs/9ruOCRdiZtUfeJqqW
         o1uA==
X-Gm-Message-State: AOAM531Jj7ey5RMr7AwZ1tgoJDYFMTzgxxVbpqsTY1gIfvYfc5VKMkvz
	tyqbnW7dEJzDY/SY9crfGjo=
X-Google-Smtp-Source: ABdhPJzx0Ma7VXZgIULeaqVKBuajBNniwc+CQIUn5JeNf/1pL6MUTZnOiF65aXpOp/1ozu6Zc5Tmfw==
X-Received: by 2002:a05:651c:90b:b0:23a:c39a:16d1 with SMTP id e11-20020a05651c090b00b0023ac39a16d1mr8791694ljq.332.1645898995099;
        Sat, 26 Feb 2022 10:09:55 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.64])
        by smtp.gmail.com with ESMTPSA id a21-20020a2eb555000000b002464680f089sm635681ljn.80.2022.02.26.10.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Feb 2022 10:09:54 -0800 (PST)
Message-ID: <2dca7337-e657-02c7-87a7-6c94f31fb49e@gmail.com>
Date: Sat, 26 Feb 2022 21:09:53 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 3/6] staging: r8188eu: cnt is set but not used
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220226144843.1118951-1-martin@kaiser.cx>
 <20220226144843.1118951-4-martin@kaiser.cx>
 <1c44c931-5b90-03d8-94bd-5e68682c4787@gmail.com>
 <184f741c-60ed-fe32-5705-08f9769e926a@gmail.com>
 <20220226180706.wierfb2ancom32zn@viti.kaiser.cx>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220226180706.wierfb2ancom32zn@viti.kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 2/26/22 21:07, Martin Kaiser wrote:
> What exactly is this doing that's not allowed in a tasklet? Does it call
> anything that could potentially block?
> 

I mean infinity loop :)

> If I pull rtw_alloc_recvframe into the loop, that function uses spin_lock_bh +
> spin_unlock_bh, I guess this is ok. As for recv_func_posthandle, I don't
> see anything where we could be stuck...
> 

Yeah, I guess, it's how it meant to be (like in 
rtw_free_uc_swdec_pending_queue())




With regards,
Pavel Skripkin
