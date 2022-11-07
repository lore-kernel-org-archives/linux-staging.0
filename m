Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EFF23AA
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 06:23:46 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id v27so15935979eda.1
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 22:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YU1NqnDArxJp709VcJ7r/DP7G4tQ3jXGslvaPz+DMKo=;
        b=HJE9EWhjB0mZ6aBsFeh/m4SskQnF/pnXs+i7XSjawxpV1Odi48ASM99BRa8tIOROGU
         8u2wY6JzxyYG5b00CCwyb2crNDeno5EG1yw9L2EzsYRFpYuiPOyhz9xlyl8RbaMFqnFP
         OsvZHth71dLqWqcATbe04Pbwgi6lm/qJaZiHTb839bDa6TqaiUtDS9lbFlIeQtnYxxF8
         CX8swEnR+ccNFXWLw64a7CmIRFWDc5bVijQJAGzTGBNLwgfpG1Nd9AGLjWQnFcmu8rQu
         G6hWHdV30hAs92yxSB6JPaD4FEzvWp/ATKSC7fbZWbPo0Y8NDFELpXRLHzSlNv7yODj2
         b4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YU1NqnDArxJp709VcJ7r/DP7G4tQ3jXGslvaPz+DMKo=;
        b=0FHG+P4IHbApVB1c+yCQ+h/LQRRZrnv0GyO5ngYG6pGcUFBCCge5+nXUIHr2qWLEvF
         yWVcWyGXaRfU/u8R5CtccVWG0/wg6/YK38kWMnXiNnAJ/y/zdNu+Rh/ndidJnRUJBimM
         Yux1NX0k6354BsptmEXp+MbTyYf0dg2CJ4eIxsM4cG0vegS/ICXugK1zpYgE7vd88SFR
         SXFZ0fy6ERqdaWMbsYLXWzTUx2SRPCsKfvCcn3VQ4IoddzSi5Gx2Lj6KsY/d1LDeDmjx
         f+w16fi/dKcl13zvpunDb9THLjm4daNu0IyAeyKntx1o8lnLrgeNvKbrW5AizH39Mndg
         0tbA==
X-Gm-Message-State: ACrzQf0JM7z/m5u9mLYLY39nA/TKj3E3UsTs0EKd9Z/gtlU7zEgsQJKm
	0OA5iuqOM5dbhaAQcCJxanE=
X-Google-Smtp-Source: AMsMyM7z3vPPcU55MFoOxF+8JwvmJzZZWq+jXbZSgGwshsZcGMOiZXhsrfEFbn8L+NrvjQIFsW/qTg==
X-Received: by 2002:a05:6402:3896:b0:45c:93c3:3569 with SMTP id fd22-20020a056402389600b0045c93c33569mr18034380edb.37.1667802224909;
        Sun, 06 Nov 2022 22:23:44 -0800 (PST)
Received: from [192.168.1.100] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id u18-20020a509512000000b004611c230bd0sm3681366eda.37.2022.11.06.22.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 22:23:44 -0800 (PST)
Message-ID: <a70ad5a2-d8cc-da70-2b00-d6d545088b20@gmail.com>
Date: Mon, 7 Nov 2022 07:23:43 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] staging: r8188eu: another round of cleanups
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221106170455.743058-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221106170455.743058-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/22 18:04, Martin Kaiser wrote:
> Here's some more cleanups, mostly related to bSurpriseRemoved and
> bDriverStopped.
> 
> Please apply them after the first patchset I sent earlier today.
> 
> Martin Kaiser (3):
>    staging: r8188eu: use a qos_hdr in validate_recv_data_frame
>    staging: r8188eu: drop another removal/stop check
>    staging: r8188eu: drop removal/stop check in
>      dump_mgntframe_and_wait_ack
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 ------
>   drivers/staging/r8188eu/core/rtw_recv.c     | 9 +++++----
>   2 files changed, 5 insertions(+), 10 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
