Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC0CBA52
	for <linux-staging@lists.linux.dev>; Tue,  7 Mar 2023 19:11:57 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id cy23so56465178edb.12
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 11:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678216316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cjGDHfradnreRo6UYfZKEzLKIIACc35OFmOSBsjm060=;
        b=FtJ1nYeuEz41S28/CR0DwKgcS398lgjovYepPHPKp9REZv4pwacwpzKBowOlb/zq8P
         adPOda1T8fLngDaP4vRSMC3nwRat4Lbh6K9btiJa5KKevsugQzv/GAalZ4by6wr6JLUC
         RM4mjj36zaN1ItOo6B+ecrIBKC1PnbsrGCTFG86YMIjaIcIA+Aqy2DezL2dw2lVAR+Y1
         VhLFEVdJO4FICq0q9bdSLa37Bwed/WqYWD+8TNDgQ4clG7NMUdsXQyXoUPINW2gy1pc2
         JCdhLUys7EmGtH+aUs52VeY3UkIv3/ql8Y8OiXiYVanLylXpzcR5Z+AGzAc9cBNPVtrl
         us0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678216316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cjGDHfradnreRo6UYfZKEzLKIIACc35OFmOSBsjm060=;
        b=Cad6wRwMT2E86wjDI2qrkIbLXi7on2ZUxDR3EfGDqCorlE4GSE1BMK6gdIDZCFvvov
         P7ntJ2xKogVIjiFIBZLrjB7UttIAY/x7+zdHhu3tXCbsh7GuZlo8bSvm9m1Wlb0msmbp
         T0O4ge6N8kjob6UXElaYHzGGtZNiMl/8sjKeXYzWZx8NYzgjWknRQ6aiVnMG9VukiW9P
         eTqbrdYt62POoKXMJxlC2HF/oxCNb9J80Bkpmn4Y1QSoxuONjaB8RmWzejVHRgxk1c+p
         2i6IXmXzWAuu2ssDa4FBKeL2716yHmACFgABT9cOmZpirzBqS+MTmM9bwLWJ+2mLN3Q6
         Fxlw==
X-Gm-Message-State: AO0yUKViFtmwHdSZY0w1m10Digw4u7j2VPZUiZCK4WfaipUOJuN75wwv
	tTkDR7rDMHBcL2pniJ18b04=
X-Google-Smtp-Source: AK7set9TV4xCaOp6dxMSitSrkqtkZx3mwXks/3BaV44OP6uLvLbewHjyan74xGKvfAIhn55BLzehrQ==
X-Received: by 2002:a05:6402:26d4:b0:4af:81f1:5af0 with SMTP id x20-20020a05640226d400b004af81f15af0mr17211932edd.2.1678216315642;
        Tue, 07 Mar 2023 11:11:55 -0800 (PST)
Received: from [192.168.0.103] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id mb3-20020a170906eb0300b008e772c97db6sm6433990ejb.128.2023.03.07.11.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 11:11:55 -0800 (PST)
Message-ID: <11dafbf3-9ee3-515e-c4ec-e33020501097@gmail.com>
Date: Tue, 7 Mar 2023 20:11:53 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/2] staging: r8188eu: two simple cleanups
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230307085003.5025-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230307085003.5025-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/7/23 09:50, Michael Straube wrote:
> This series contains two simple cleanups.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (2):
>    staging: r8188eu: busetkipkey is boolean
>    staging: r8188eu: bgrpkey_handshake is set but never used
> 
>   drivers/staging/r8188eu/core/rtw_mlme.c        | 1 -
>   drivers/staging/r8188eu/core/rtw_recv.c        | 2 +-
>   drivers/staging/r8188eu/core/rtw_xmit.c        | 2 +-
>   drivers/staging/r8188eu/include/rtw_security.h | 1 -
>   4 files changed, 2 insertions(+), 4 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
