Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFACF2FAD
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 07:03:23 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id w5so36624337ejq.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 00:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+6L7SD5xcqr4nFDTKqSIKd3yb4ZJvrBCFNPVbuPjyXg=;
        b=gy3Z/U6QNI9EQqE5hJlwSl3J2SLOjBOfKOOGkVvYaFkNvKVPGgwPRSHAwMskDfnG1Z
         gufYNa7zwhBI+hQAXH5NQxUvcY43qLo9h/663tY940EHPU5DPJOmLZbg3vFM75wdnQqq
         aDh8Lh3pXUUYirMzJEG7VCDiVVd+oPr69YHoBXyZno6M2Y4sGA2gAMV1WUAiJBr62hUA
         D0dqw24fMdrtCL76inhL9zuWDFSmyC3WQSoU5Cl0OwGevqe5ha8GHGQ5gU8/hSnmtmhT
         Bd6UtD84dy3XCSvA25cKjApkY15kSFdhLb/V4X3PN6MuscTrQO4Jpz9nNr78SoywZUrF
         Gc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+6L7SD5xcqr4nFDTKqSIKd3yb4ZJvrBCFNPVbuPjyXg=;
        b=LRENtMFyPebmR5qA15zL+T7n7nPKAqlGgsFHXml4AuPh68j65uEz1EZ7vK0Wh4PbhO
         lPy0yIJyC3KVTLQu+PGDWO8kJP5Df+05dJBQ+Tk6zNC1WEJaHGkFs4rn27HOuDtdAj39
         pZja5Yrf7CM3ucrbMIJwMhAZxBrSzMkFRzrmnowftXXL0wZmBz9O1XXyprUtfVTE1ODk
         5vdxeLlAzWV9MqJxFXjawKMfJ/ao6stiz5LRfrkizwcHyDs+qVC8QYYYMhrmLmJhXUxS
         B9bIcGOnGaIyi7HwjY1uUTBIhuSiZz/JqdjxGBlUGcP1A7uA0FK9rZW9KpBcQFu46Tr8
         faFg==
X-Gm-Message-State: AOAM532bvqL3bQ+AOM+uHMZv80JO8zaAw/nxu7eSKfozsDE7bSL5ipbO
	hJe7t8q3miNTnQeSl7PNIgA=
X-Google-Smtp-Source: ABdhPJzIReZpu+4rT4ie4W6HboUY073CsOsJzAsJ7nLqVufwwAohziC5NgXJZiMMg5ZmyowEXd7N3Q==
X-Received: by 2002:a17:907:2989:: with SMTP id eu9mr2299070ejc.89.1629183802193;
        Tue, 17 Aug 2021 00:03:22 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::4058? ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id b11sm351955eja.104.2021.08.17.00.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 00:03:21 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] staging: r8188eu: remove unneeded DBG_88E call
 from rtl8188e_Add_RateATid
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, martin@kaiser.cx, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210816234459.132239-1-phil@philpotter.co.uk>
 <20210816234459.132239-3-phil@philpotter.co.uk>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <7853618d-565f-5c92-678c-e9384c5dc963@gmail.com>
Date: Tue, 17 Aug 2021 09:02:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210816234459.132239-3-phil@philpotter.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/17/21 1:44 AM, Phillip Potter wrote:
> Remove unneeded DBG_88E macro call from the rtl8188e_Add_RateATid
> function in hal/rtl8188e_cmd.c, as it is not particularly clear in my
> opinion, and we should strive towards use of existing kernel machinery
> for debugging purposes.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>   drivers/staging/r8188eu/hal/rtl8188e_cmd.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> index 4302054c6c83..77c057e276a5 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> @@ -173,9 +173,6 @@ void rtl8188e_Add_RateATid(struct adapter *pAdapter, u32 bitmap, u8 arg, u8 rssi
>   
>   	bitmap &= 0x0fffffff;
>   
> -	DBG_88E("%s=> mac_id:%d, raid:%d, ra_bitmap=0x%x, shortGIrate=0x%02x\n",
> -		__func__, macid, raid, bitmap, shortGIrate);
> -
>   	ODM_RA_UpdateRateInfo_8188E(&haldata->odmpriv, macid, raid, bitmap, shortGIrate);
>   }
>   
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
