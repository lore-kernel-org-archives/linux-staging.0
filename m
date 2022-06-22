Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A01410FF
	for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 05:16:30 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id sb34so2689585ejc.11
        for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 22:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=b4dosciSu8bAt8+kFeOOHNaC1wBkKYaxBY54lYEpn64=;
        b=GLt+S+BZl+1x3G0rdEK7SlcAFTpY9Jw23Qwlw2P8w10Ov3r8iJ39+asfwIwCvq4oVD
         6qAbqxiDPrvR3iIIlouIvQMWYxUukerihzVUmKgKJ+xMMmWyeA3ECRy7H7f4KbueFjoW
         WnRLQ+W2UJeXxWimv4H7i2XnSG656/fho+gt9vm2ynHCUjRzlGQv3qZ1TLpGXDbBRITt
         8xVTyb+UNNW5Ekx0rAbyZ8xEEmZQJLhT/T7RKHETIEVw82j8u+uy+aUGJkHlhwAwNm/u
         7GlxsemU1jmZBtZVQy1R7+s0CxmKIS7Jqn6dHEW+JW2J2DQcZnmR9LKT1fvvPuv3lNzA
         JfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=b4dosciSu8bAt8+kFeOOHNaC1wBkKYaxBY54lYEpn64=;
        b=kuf6waNjjGIi9QsIHN7/dNfRJtxXNtogV4QdbeA8FjeWuP0+l6EjurPYGD22c3+QLk
         RHZdouKQZ8eifLhPO2frO2BIXAUGizXaSXmIKzMWwzt6PLAgM/yS4xTTCwDgK+b0JusH
         II4A7hlInUsirr/e4tzmoRWffy7os7W0RvPDh9sX+E12UyrCyPlSl7tUBe3hOMdW4tuc
         5DimbuNocgWxk3jikSTA1PUxm8uv26qlvw7LsYYit8wb4q7vVvo6FLgZ3SbTFPf9wgI8
         XDZJf2zM2QEEDrGVNuK6dkj8Me7BhTevUFdlkRbi6YTmn+SioVqaGmtIuD86v8QhsL3Y
         bqCA==
X-Gm-Message-State: AJIora9iykBUToS8sDmZIxoxTdRDOJnEv2nZyzsfqLXsNJG8cy+MRvyz
	ZZFVoibq3BuF5fM4M1c4emg=
X-Google-Smtp-Source: AGRyM1tjtPe6DO5tbCQAaZsTIeOqHxvFhL+KnY/lNKE7q8CVWvpBfk6QaFP+oHd4pKHCAeWZ9ku8tQ==
X-Received: by 2002:a17:907:6e0a:b0:718:effb:58b7 with SMTP id sd10-20020a1709076e0a00b00718effb58b7mr1392011ejc.363.1655874988693;
        Tue, 21 Jun 2022 22:16:28 -0700 (PDT)
Received: from [192.168.1.101] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id f23-20020a056402329700b004357cec7e48sm7475824eda.13.2022.06.21.22.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 22:16:28 -0700 (PDT)
Message-ID: <e16221e9-c739-ea68-b5a7-7b48b7766113@gmail.com>
Date: Wed, 22 Jun 2022 07:16:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/5] staging: r8188eu: Fixed some coding style issues
Content-Language: en-US
To: Chang Yu <marcus.yu.56@gmail.com>, Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1655872968.git.marcus.yu.56@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1655872968.git.marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/22/22 06:52, Chang Yu wrote:
> Fixed a few coding style issues as per checkpatch.pl and kernel coding
> style guidelines.
> 
> Chang Yu (5):
>    staging: r8188eu: Fixed a function declaration coding style issue
>    staging: r8188eu: Fixed two brace coding style issues
>    staging: r8188eu: Fixed two whitespace coding style issues
>    staging: r8188eu: Fixed comment style
>    staging: r8188eu: Fixed some blank line coding style issues
> 
>   drivers/staging/r8188eu/core/rtw_recv.c | 38 +++++++++++++++----------
>   1 file changed, 23 insertions(+), 15 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150 
Adapter

