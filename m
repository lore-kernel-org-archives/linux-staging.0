Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6835387
	for <linux-staging@lists.linux.dev>; Thu,  4 Aug 2022 20:26:42 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id w19so1318637ejc.7
        for <linux-staging@lists.linux.dev>; Thu, 04 Aug 2022 13:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gcpgRFm5vs+rWDh+VychUN2x/2sAeZ2CGnsyB4UULJc=;
        b=U+0+6h8r128HlTmUDQKULCIe7qAmbEWPanQmIrXi5N5AgdgxB6E53mTzNW8+LiTNtK
         vqtsohxdorLfeMTsSQ1rt0Oj0/jtS/+ZbFc0kOazgBgl98+GPTXVP8JJW4OfQqDOzLWI
         fwpuRgM7WggNA6TnZLCWhFsHA6s3+5Gt3FcpviGfa5l2PUFtju4sH0eE0LCCjbKaQwS2
         bMvLN28ZcZa9/T12bAKWV+pGpPWVKgGYaanp+adVRtrJ1cXmsA7vkfnB4Ybnbczy7XYz
         5Dz+hRaUZ/D9jmy1kEYU+cAJTn5rOC3szgO+Kvg+hX1lPuxZ/nmT8tBceE2/GtG1cdBK
         8+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gcpgRFm5vs+rWDh+VychUN2x/2sAeZ2CGnsyB4UULJc=;
        b=FmfBGj8AZE8xZ6Ffdeyx6OBz52OheqYatKg1FPqCmbZCCl47PkMVNwJiyurrCMCf9L
         8VyNQ6/kneijik2MjQwb7bIz3cMKEbJokbRKJvsveMSNAXrdxxz4BfVHiAia9x0AQrlA
         xNNL2b7/ASIGT41zHWX/sD9zFClEgravuHWIEVzaFRsw/x6W2jWYR/o323RCilRrYIS4
         J/rAMbOIEpeS60nbDygwu19yPiHkpGP+T6U/sEEaPVXj4pARdxnpaIDImoL991Abe7ty
         jtY3NLVHiIW2twmGTj5YXdIvxn6iNIGN8PAQJcLmy8SgJ3nSeaZtYJX9D5oaq+Uj4bfJ
         z/zg==
X-Gm-Message-State: ACgBeo394oOGZojAsjfv/I7wkKBZ8bdHUpMFmUZSHG/d76HSwF9rKRek
	4U2BTUMGmhYEvdW9T73COrM8Sx2oqtU=
X-Google-Smtp-Source: AA6agR7c6h38sC+j142B8oImCPvDh7SJghL+4wS2cJ1aoK0xIA7Qb6Wu8Ut3ixQ1Xdmk4/bevqSRnQ==
X-Received: by 2002:a17:907:6d04:b0:72e:e204:a70b with SMTP id sa4-20020a1709076d0400b0072ee204a70bmr2657688ejc.432.1659644801394;
        Thu, 04 Aug 2022 13:26:41 -0700 (PDT)
Received: from [192.168.1.103] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id z7-20020a50cd07000000b0043bea0a48d0sm1122480edi.22.2022.08.04.13.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 13:26:41 -0700 (PDT)
Message-ID: <99ee7f1d-62fa-a873-403a-445d8d8b096a@gmail.com>
Date: Thu, 4 Aug 2022 22:26:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: convert rtw_p2p_enable to correct error
 code semantics
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, paskripkin@gmail.com, straube.linux@gmail.com,
 martin@kaiser.cx, abdun.nihaal@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220802234408.930-1-phil@philpotter.co.uk>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220802234408.930-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/3/22 01:44, Phillip Potter wrote:
> Convert the rtw_p2p_enable function to use correct error code semantics
> rather than _SUCCESS/_FAIL, and also make sure we allow these to be
> passed through properly in the one caller where we actually check the
> code, rtw_wext_p2p_enable.
> 
> This change moves these functions to a clearer 'return 0;' style at the
> end of the function, and in the case of errors now returns ret instead
> of jumping to the end of the function, so that these can still be passed
> through but without using a goto to jump to a single return statement at
> the end which is less clear.
> 
> This change moves the driver slowly closer to using standard error code
> semantics everywhere.
> 
> Signed-off-by: Phillip Potter<phil@philpotter.co.uk>
> ---
>   drivers/staging/r8188eu/core/rtw_p2p.c       | 19 ++++++++-----------
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c | 12 +++++-------
>   2 files changed, 13 insertions(+), 18 deletions(-)


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
