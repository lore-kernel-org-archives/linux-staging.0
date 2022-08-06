Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A81C2D
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 18:18:36 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id kb8so10069234ejc.4
        for <linux-staging@lists.linux.dev>; Sat, 06 Aug 2022 11:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=t5qohv5RDM5IrZrS6+vN/4UZNFBJ+KbvGjNAvkYlMZM=;
        b=QqUhfCZiFq1pEUjhiiEQu10NBEvel+df4K9NXFIv4SvAb9aRLf+oheLkWCK1gcgiDx
         deZ+w7KPnF5esGravY1WQ3Mj9AQATgJIhSp9ZNAUjripJOHCqNruXuMUo+Z5L3aGwcTL
         K/Z2yGYEmMTxq+rcjIfTtCrRCgGowr3C2UpG7Ylr8k4nqHA1s0DT6qLkra2F65Qx/Ccx
         7iGkKG9dztXQmcTYNJ7Kcnt/8Sy1elYQB7C8jOVJ6RVVp/Zjh1QF8XhCHtsmyKcGn8r6
         SdaF0beT/wlvNbWHVcKHxWs3OZGdC5RWpje1PI6n2sk/5RGhrrZj6aJgDj+2BEc7cdMp
         0ssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=t5qohv5RDM5IrZrS6+vN/4UZNFBJ+KbvGjNAvkYlMZM=;
        b=uCWdFfslLZIUAFjFdpHCOpXz8s28t2L4l4J5qgz52QNN9KkVjyXmu+8eD7z7uKKI/Y
         n46T0dbBLWGANf77Ew1bwlOVj2Dia/VPLStfc0Aj8uBgM3woB1c8nXzWhK1zNZJEjc2H
         RWgJgoHGbLcOQD2fOYf0KygnM+dqq+ZLwwKnvi6cm4WZ3I66dC43OyUudN7yZxtnw651
         X41EzhZtKiLFGO/xpPjLqkxwt0IEN6UZzRCwzMCJ3J4Hjuh9F2Q1+cV8Bcs1W/qYpqzf
         9YnnpdLOWNpTokGqG8cNXTyz2xNPmAoqAlIBVyB+8m43wzZoCd7SxF/Dogdk/g66IZ9r
         q+HQ==
X-Gm-Message-State: ACgBeo3uumKHpc6iO/rwL8yR+19T3U2tRd1uZGh8TRg6EmrK1bj/pRxO
	nsu3DV/a4ein8MTc3u4AQkE=
X-Google-Smtp-Source: AA6agR6DG9Y9PndiMwSz2LwYF4lRS533IFujIRkczri4muyYnCSwS1I4DE9J+rcDIoi50tPASmFiVw==
X-Received: by 2002:a17:907:2e01:b0:730:9ecc:cd28 with SMTP id ig1-20020a1709072e0100b007309ecccd28mr8843994ejc.360.1659809914545;
        Sat, 06 Aug 2022 11:18:34 -0700 (PDT)
Received: from [192.168.1.103] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906200200b0073100dfa7b0sm1939376ejo.8.2022.08.06.11.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Aug 2022 11:18:34 -0700 (PDT)
Message-ID: <1a16a42e-4680-fc4f-8902-f15b1c39aba8@gmail.com>
Date: Sat, 6 Aug 2022 20:18:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] staging: r8188eu: clean up phy_CalculateBitShift()
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220806060929.11022-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220806060929.11022-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/22 08:09, Michael Straube wrote:
> This series simplifies the function phy_CalculateBitShift() and
> cleans up coding style issues in that function.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (3):
>    staging: r8188eu: use ffs() in phy_CalculateBitShift()
>    staging: r8188eu: avoid camel case in phy_CalculateBitShift()
>    staging: r8188eu: clean up comment for phy_calculate_bit_shift()
> 
>   drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 30 +++++--------------
>   1 file changed, 8 insertions(+), 22 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
