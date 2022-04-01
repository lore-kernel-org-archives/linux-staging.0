Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3492D7C
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 20:25:52 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-dacc470e03so3934720fac.5
        for <linux-staging@lists.linux.dev>; Fri, 01 Apr 2022 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oqLr3CQkeovfFARJlOS29QpiBz7Mv54uvfNsfK21+RE=;
        b=coOUZSozgph8g3yWCWkQpoEyvEcw2gzPyFFMsn0aOu49d0AOZRLPlt6DB6qkqE/1aa
         oZP8LkZY7cBvT/pMb0haVysTmw7cesWJ/R2J5jXQ9Nn/cXmlrWyuxxUGPvFed5adi4sB
         SPk6XCvE/fEhadDXiP5NicXLmDj5B/ofrUB8jORzZGoN3lNh4K4saSCMKh78xTS2u8mf
         JE5bo/FKjygn/SdX5FALm8Q/QVEw+XLRkF+jsVrhIw0qFKfc7v5PdxM2Cl5M+7ECLwSx
         messGYWBZpMOrq9ZMDr+IyEvR6gozjPg65suApTedWWcCms1+jjJbxa1jcNun68/RR3G
         1YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oqLr3CQkeovfFARJlOS29QpiBz7Mv54uvfNsfK21+RE=;
        b=jo8Vx164d1D5gSqQKab6aALPL0IaKom2ou07r63VyibVdc3VeskSoq0UgWQFd7KPmx
         JB1qUMxDCvrP64dYhiem05Kw4c8VgFP44Llox+Nfo75kRpYVMQwLHJDwnd/JIvKg/WNU
         Y/e1Tr91BLrkBQRLvbRXja25ktd7BN4/ZsotUNMw2lq2ZL6QDmYuhndS23ZFG11mIjlC
         Tk2VSBYEBYsiaqGLeEJh864Xc5kNr5ND88cU2b9W9fEbSmr7zgJU+RE24NikmUESC1rG
         OhcehVJ56IMLi+1SLwUcgqrQLmMbaaijto31qEUHGX70cDVsOJi+bGb7QposLztHEwBV
         wMKg==
X-Gm-Message-State: AOAM531CY8zsOHRi8dpbM/LUt7yeUDiZ1ejiaCAZwofzTCCifaDNCkKg
	+4z7JfBPpkJFpUXtNDYtrrY=
X-Google-Smtp-Source: ABdhPJzkb0JznTQj7KBrDYpwHJJyzvXVyXaU1Rdk3Hk1yrEsFgwqtafPkNRZupXizjn7fIqrVHbepg==
X-Received: by 2002:a05:6870:e9a0:b0:e1:c609:74ac with SMTP id r32-20020a056870e9a000b000e1c60974acmr1419358oao.127.1648844751291;
        Fri, 01 Apr 2022 13:25:51 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::1004? (2603-8090-2005-39b3-0000-0000-0000-1004.res6.spectrum.com. [2603:8090:2005:39b3::1004])
        by smtp.gmail.com with ESMTPSA id h11-20020a9d6f8b000000b005b230ab0461sm1559019otq.64.2022.04.01.13.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 13:25:50 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <8e68501c-24fd-cfbc-60f2-ec3e277159ab@lwfinger.net>
Date: Fri, 1 Apr 2022 15:25:49 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: Fix PPPoE tag insertion on big endian
 systems
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220401151257.3414576-1-linux@roeck-us.net>
 <782f0115-e45f-1aff-a152-5d403c990b31@lwfinger.net>
 <dcba377b-1fce-92e6-680a-77c5567cd06c@roeck-us.net>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <dcba377b-1fce-92e6-680a-77c5567cd06c@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/22 14:25, Guenter Roeck wrote:
> The rest of the code uses htons/ntohs, so I prefer to follow that lead.

You just proved my point. It is hard to get be16_to_cpu() wrong. Sparse will 
flag the error when you use cpu_to_be16() instead. I expect that your 
htons/ntohs problem would also have shown up with Sparse.

Larry




