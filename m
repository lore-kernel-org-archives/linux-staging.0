Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B97173
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 12:19:59 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id l18so8031418wrv.5
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ird/DtT5j4H+vmbNk8aXdEZWAxnDnv0Dy+c9wLK6i18=;
        b=qX7RVl+vyN71S8YgZXYl+f65pqazr4/Uf4BNfRTsZ3w2adR0oE35rreg0+bND/YUED
         AzgVACvvgTeSkBzJSzOe+zH33b28NtGTCi+1IfN4ljKPlJJl+6ICJZZj4ipSQZQXyax9
         TavQYi8cS4cEkNzd0RFIMi+iYfkUv/vQ0+lg6vFVez6JCijusxfLWVVfgxXHIH7SBjB9
         36CBcb+CjpKFbrMVDwcPRhslIPALi5lYorKDL5nlmAOxIQhypeoC+EVXd7GAPPYCmDAm
         qRhxCbzvihxLFJKtG8ro7ZcjNsaiosFdtv8V/PMFz3sZwzjT2xiKy5pxsr76hDoJwBiP
         zJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ird/DtT5j4H+vmbNk8aXdEZWAxnDnv0Dy+c9wLK6i18=;
        b=T9ro9Uxtu+JQVlCHlJ4G8ShefYrirDckWLp6Q5BXyX6krrPo4jw1YqlklKuaKeLLtl
         Za+Pxz3aeRP3LQs0Fk7L5GzjA0ynl23zfJS6S4hs8UmN5XZiY9Bu3FL1vvQYkMPgsBCl
         XbHGknJ8Zhwot2J5JPqoLaSf2utDaokrAK4LTukXagHQvAvNIlxX95Lkn319Vqt2FR5I
         7l2nPLNfF8Vof3KYXYgQDANsVIyjP6+fD5HPFKHpIB5oy8Jr3BB9sg3lMF/sEmzntdFi
         PgdkQLgoX5qgCt3MHIgLB7AUnXKKutpBbVVzWBIDQgdoYQS271p95VXh/53HQKbdsnni
         Vz8Q==
X-Gm-Message-State: AOAM532uQsGKjkX1ObG+Wlt8o2cYsMBdYYMvURQo8+yAXBWnvfC3ji9k
	IAvBLdnO1REz2zcz5szzCSo=
X-Google-Smtp-Source: ABdhPJyCfB2XsM1E3ReM/1Ezb4pyV1C4YmG//olzt/ImVlpZZGG9J4tzZkcvCRV4QtM9uJ+ybg1+og==
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr3732507wro.207.1628770798047;
        Thu, 12 Aug 2021 05:19:58 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::2571? ([2a02:8108:96c0:3b88::2571])
        by smtp.gmail.com with ESMTPSA id t8sm2805398wmj.5.2021.08.12.05.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 05:19:57 -0700 (PDT)
Subject: Re: [PATCH] staging: r8188eu: remove rtw_ioctl function
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, arnd@arndb.de
References: <20210810074504.957-1-phil@philpotter.co.uk>
 <20210810080640.GV1931@kadam>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <3af28555-34b3-99c3-cd48-7e4f81804ec5@gmail.com>
Date: Thu, 12 Aug 2021 14:19:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210810080640.GV1931@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/10/21 10:06 AM, Dan Carpenter wrote:
> Phillip, Michael, and Martin,
> 
> You are all working on this this same driver.  Could you Ack each
> other's patches?
> 
> regards,
> dan carpenter
> 
> 

Sure, I will look at future patches from Phillip and Martin
if time permits.

Regards,
Michael
