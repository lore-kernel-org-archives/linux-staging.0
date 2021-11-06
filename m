Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0587A68
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 08:32:37 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id bi35so23590824lfb.9
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 01:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rGY2yPBp3UpUadgFTJnj4puwjca9nGK47hNRROMLfcc=;
        b=gO/XloTWnto4jLfyE0oGRm5MWdJmUI/41z8GqunygHjlR+8r1nTrLftJkYX2s9E1V1
         DWnXZ4xvqVlokECfzEWu4GrNS3trjE1yPlZCLbfRl4xjVcas7UY0tGp7cxKbUmt5dJLb
         eqYNRR5F4pSjeCMQxk/y0uxceZFBZzsUz8umPsICl/N4ZXzcQ6VuUi6GRgW923eihduw
         fQOvoDozSlL+qK+6b4T28kLq1bhwGtZZY7Qnbsj/wPDNNZWAMFT9zzkXe0pxajAEeUOT
         lO8ZG/1/XJwizcz7HPgUDvoEZpB29rZc/KjOhZRRQ4VAqqGBMbe+QANeXnaIQM4PESqV
         6log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rGY2yPBp3UpUadgFTJnj4puwjca9nGK47hNRROMLfcc=;
        b=zZmHBjDF5tG3GUaXLKTCkByK5d+hYBOhvXFfkhGY5cMvbEBr3ve7y1cPJSf+L7w+u9
         dfru7oL4leO5W46VALP79ZPqhTl655Lzw7UpZ2oVn42U552aqaGiOYabLHBBCXqb/g//
         xBxVm8qfUtDeGef60xv1P450udq/Eqxa/cMBu+HYPi7TEa858KGdyWLNygiZD0cHScVk
         rzreJAuAEpI3RMAcjN0rv/r22LHOm1fiXd1sfsOQP1zMrZCBAT+Bcz5Rhgv4+9g44wgV
         ZGSIBOLs/XRH7dV87sl67hTCKVKZ6J2SMW/7ZwDDhlVmFKuzHCCA/bybYdcpuuX2e5h9
         EpoQ==
X-Gm-Message-State: AOAM531HxGzRNdqX6ku6l4TQJZAnbm8Inzw30VGuQlR9s01/bIzPVT5R
	tRpYuL5KRD+Mt5xWKVB80Ms=
X-Google-Smtp-Source: ABdhPJz31je593yVV2BkwmPqBUzdNykLGMLxeysKCK2Ef2DigJW55Ijds5gzgsGhWhRz9XMil08hQw==
X-Received: by 2002:a05:6512:21c7:: with SMTP id d7mr4019735lft.434.1636187556055;
        Sat, 06 Nov 2021 01:32:36 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.245.207])
        by smtp.gmail.com with ESMTPSA id t20sm980779lji.44.2021.11.06.01.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 01:32:35 -0700 (PDT)
Message-ID: <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com>
Date: Sat, 6 Nov 2021 11:32:34 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Content-Language: en-US
To: Zameer Manji <zmanji@gmail.com>
Cc: linux-staging@lists.linux.dev,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Larry Finger <Larry.Finger@lwfinger.net>, Martin Kaiser <martin@kaiser.cx>,
 Michael Straube <straube.linux@gmail.com>
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/21 00:03, Zameer Manji wrote:
> Hello Pavel,
> 
> I will attempt to bisect the issue.
> 
> So far I can confirm it occurs in 5.15-rc1.
> 
> I also forgot to mention that this issue occurs on an arm64 platform
> if it matters. Would you be able to test this issue out in an arm64
> VM?
> 
> 

Hi, Zameer!

I think, I can build aarch64 kernel and test it in vm.

Btw, did you try to enable debug logs? debug=9 module argument will turn 
on all debug logs and maybe there will be some additional information 
about what actually happened



With regards,
Pavel Skripkin
