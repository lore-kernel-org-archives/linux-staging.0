Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537CA168
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 08:54:01 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v11so37012662wrw.10
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 00:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Pkvw6csXcwg8RmHKDtZs5IoBzTWTuHVHlsv8fcTdUlA=;
        b=Ct2mi1cHUa+RMp0BrDtn1d34DSv23tMc9y4kSBfmbDY3Z+fKHk9PPkBjW5sLZcpXds
         kEqJu2LGedZGXZy18oUfNTexbX4vWR0uzupmsbVEOtR3XU1GfUG4lx7ZxR2d7Co4Iiel
         H2I3jpLg7SYUQ8y6tcc707IrEzBMH+V1nmoTBfjUhoe17hAx1kDypbllgXNzTJHvcpGN
         fk2FoFTOiaBsg+0/RCR5zFhbeyipBPQeFw8OaYMsNt9iN413VfszbKO8VHVsaepA0QSG
         NGG9KccSP21OjrXA6WFPfdNdZwk7Vb7LiHO6oBf8xvgnxsrKmI8ORCfO4+05cI6NMG73
         PuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Pkvw6csXcwg8RmHKDtZs5IoBzTWTuHVHlsv8fcTdUlA=;
        b=FC3cjzhR+oMzjLLXBwf/g5HgCdj6eAOwG3ncETOur8dYqzvRsjcwadERyEmp/P/Anx
         f2I0KtETMX2NicicGEa2iwMMxNJP+E2A0QzajaxkX9f60RotG9SE7SicjeZM3+RJTOZl
         kMKys3+c6rzduRDY0PSDejLL1mdmOoeLW77npG/+cYD9p2xk72KEKbOgpo6fiI3BODKe
         dI0FSURj3E0NYvjEmyXDVMak74dZQXzEJ89PexvdexftM1iQrLfcNlKulnwiu3NpiyWV
         K6sgVdrEvNjHHFlMYFv/Wf8WBIuYlNmaJwO9LZjQyN1/AM7vW0TaA0uqgN0j3YAU3QMv
         ybvA==
X-Gm-Message-State: AOAM532aTnUFGVXga3JUVhxaVojGNh2KhVwrM6+dtp+bjRNezuqnlC78
	QK+tTERA9ZlPmHrNfbdO52c=
X-Google-Smtp-Source: ABdhPJzJwFqCDidmXrCsnTzWItkz/+RA3/ErHCgqLsOgssbSGD8r7NhVvYVFnC9k/aBcOYcSvtRRtQ==
X-Received: by 2002:a5d:6989:: with SMTP id g9mr15150714wru.12.1640681639686;
        Tue, 28 Dec 2021 00:53:59 -0800 (PST)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7e8? ([2a02:8108:96c0:3b88::d7e8])
        by smtp.gmail.com with ESMTPSA id b1sm19413505wrd.92.2021.12.28.00.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Dec 2021 00:53:59 -0800 (PST)
Message-ID: <48d870dc-7ab1-92e3-af13-30bb9e73db0b@gmail.com>
Date: Tue, 28 Dec 2021 09:53:58 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] staging: r8188eu: DM_PriCCA is set but never used
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211226162921.10227-1-straube.linux@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211226162921.10227-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/21 17:29, Michael Straube wrote:
> The field DM_PriCCA of struct odm_dm_struct is set but never used.
> Remove it and remove related dead code.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/hal/odm.c              |  1 -
>   drivers/staging/r8188eu/hal/odm_RTL8188E.c     | 15 ---------------
>   drivers/staging/r8188eu/include/odm.h          |  9 ---------
>   drivers/staging/r8188eu/include/odm_RTL8188E.h |  2 --
>   4 files changed, 27 deletions(-)
> 

This patch is outdated, please drop it.
I'll resend it as part of a series.

Thanks,
Michael
