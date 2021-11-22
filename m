Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CE468
	for <linux-staging@lists.linux.dev>; Mon, 22 Nov 2021 21:22:20 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id b16so1464126ljf.12
        for <linux-staging@lists.linux.dev>; Mon, 22 Nov 2021 13:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/ZRtTj11U+Uq/wLppGJLQ+QkgmE9jsfIiGfPFTvZiZY=;
        b=EVXGel7oSRQ3sSAFS7cnQXO7lKiHuAIAMC6i7yhANnR4k59rpm1wgkxfVCVw3XJkq0
         PZEkP9RC92PbnPp85ZH8Qh63aYaurBCk2a/x1Ggf7mi8Am6C7puc96n0YcaFUkwf785h
         le5GTyogKnNYCW+Xeak/TLu3zC3zHj6JGpTLliTbMGmO/VJa0BxPb7Gxk7Gq7JTBVLTI
         L9rw2MX/qNaCoTJq7ZY7ZI7P7dlmaMIny3zBqSqt5an42dBN7k23+/lf9ZJQ1NXfFN1Z
         HKSxr/u4xgBWebIacIFvUSFLJI6SnAabmxin8V8m1QoUSZZM/bXwoMtmkzXZS4Sr40G9
         ogrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/ZRtTj11U+Uq/wLppGJLQ+QkgmE9jsfIiGfPFTvZiZY=;
        b=MFv6LDP9NHuMylIU8aFZL3bmM2UhcR5bgXy8oAfiuLaeFVggR1aH4PL+SqyQ6M7MwZ
         /jcm3vdYGpiZB2DDRaRUspOmh5mAZQfV82zTbUQWZ9GPHHUnd2jTJN2dXduhPax/6sEN
         xxmoZDMlKr754XlprEU7KfzF+UmnEcoBSOmDBZzD3uQ04G5k8Vw1UrqgKXzQC0pK/6wB
         KPRe/xbC7y15GjoVfynUHDgeyetk6cHyzhZOv1TZxAy/vK3DYJdUnM+bqJkvR4OVxKOL
         CBqVnbZiMr2p3kWbupcsz7IfTN/+gq0cnISsGVwnxmsIoO5Im9u0aV5MPE4cJilyumeD
         XdUg==
X-Gm-Message-State: AOAM532xwtH8iNeYjB3Jj9ej1oeiBvkqyQWI/WNSDUvgIgYWHiHlNHJZ
	kjwefpt7FMTnruCVxwGVBUY=
X-Google-Smtp-Source: ABdhPJz6LAXCZ7T5M/iuEDj/nU2hfyccB9Qe7UtNPsa3ey6RiDDFg6Q4v/xq7N8Q3tP6mHOuP2R35g==
X-Received: by 2002:a2e:9d05:: with SMTP id t5mr90018lji.433.1637616138825;
        Mon, 22 Nov 2021 13:22:18 -0800 (PST)
Received: from [192.168.1.11] ([217.117.245.63])
        by smtp.gmail.com with ESMTPSA id j1sm1079438lfg.154.2021.11.22.13.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 13:22:18 -0800 (PST)
Message-ID: <52ad7e4f-7164-e868-ca49-2f0fecda3395@gmail.com>
Date: Tue, 23 Nov 2021 00:22:13 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] staging: r8188eu: remove unnecessary NULL check
Content-Language: en-US
To: Vihas Mak <makvihas@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211122195350.GA166134@makvihas>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211122195350.GA166134@makvihas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/21 22:53, Vihas Mak wrote:
> remove unnecessary NULL check surrounding rtw_free_netdev(), as the check
> is already performed inside rtw_free_netdev() in
> drivers/staging/r8188eu/os_dep/osdep_service.c.
> 
> Signed-off-by: Vihas Mak <makvihas@gmail.com>

Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>

BTW, same can be done in rtw_usb_if1_init().



With regards,
Pavel Skripkin
