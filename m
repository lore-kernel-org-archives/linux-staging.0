Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B3629CA
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 14:45:13 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id bp20so41905439lfb.6
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 06:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=4gNUjzA8KlzMe1Lw4SKhbvOeuiCO4MLYSKvzBpEL6Sg=;
        b=L6fR2gBs9jHO/gefGZ/281PAeZYPb1Sgd+KmUxmfzRxaqtg8lrnPW57r+zWO96VwoI
         99gtepb4QRuHF6DhYIW1bNBImz+8Je/6kmKKaNsPL6YqaCL7N0Ar9Kbcn+RTH2ppJdcl
         3UiqkU/pxgYjYTniTJ3016w+Uf4tc8eSKkSURDnCEWDe8I9D5iKmKVII8uiARDxXyyMD
         qoo4gVRr8uXzC2XpOE+qzk5oUNJ8RoTjkZEst6hbJqJmk9nWBfp6+6JP6k8Jya8l9Y2b
         1s3pTS8hFrCH1HwD5OtKc9hE1myErrZq8r1eemPDXyUtyNuAst/ICGiKvSzOstnmzghP
         hbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4gNUjzA8KlzMe1Lw4SKhbvOeuiCO4MLYSKvzBpEL6Sg=;
        b=dWPEz8nz9vOb32DfKBQvi3YGgufON48HButxeNLiRDK6ChGD1b/zVfKBq6tB9KNnbv
         uW0aeq0A/FGBMQNoxK4fX66OyC9OxVse3dM76NaVrXMX/Re+X/O/Sr4ujPqw+JCjQXMH
         vbhiLu686Q9JkBPn0nk5CS05LR6Qn31IPRuI7DXyhqx0lSuUrGOl8/ZaDNGoXFryolxW
         PgsRy2muwSVTsO/ErTcii590JX0TW/E4/X3c/3fHxvVlfiFc0zXIcX0C36V4htu5kyI0
         njbSo3pN1XhEGNort+DlCCBXUfaVIEDmkVWoNqbp3J63L3iLK6+bSwmW9qfu6FsLyT4f
         df3A==
X-Gm-Message-State: AOAM531S3/o9GccJRtUB7smYHn3A8NMC8LcKBpLjIfkg73BTfI/5AUDd
	gQB+tT6NXmqCHtpacE7gLOOf6oDBz1w=
X-Google-Smtp-Source: ABdhPJzTIBFAWdxt7+I+ecuDAMewI/NEam/OCMIRzzwYrw/g6gJI92z5m2xCA/TiKVh+Gj9qVRo/Tg==
X-Received: by 2002:a05:6512:110a:: with SMTP id l10mr18760690lfg.527.1640702711569;
        Tue, 28 Dec 2021 06:45:11 -0800 (PST)
Received: from [192.168.1.11] ([94.103.235.97])
        by smtp.gmail.com with ESMTPSA id 1sm1865474ljq.102.2021.12.28.06.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Dec 2021 06:45:11 -0800 (PST)
Message-ID: <8e4cd620-282a-8a1f-27c7-94f05a7e0f4f@gmail.com>
Date: Tue, 28 Dec 2021 17:45:09 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] qlge: refactor qlge_change_rx_buffers() in qlge_main.c
Content-Language: en-US
To: Adam Kandur <sys.arch.adam@gmail.com>, linux-staging@lists.linux.dev
References: <20211228135756.7343-1-sys.arch.adam@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211228135756.7343-1-sys.arch.adam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Adam!

Looks like you have missed all maintainers in your CC list :) Please, 
use ./script/get_mainainer.pl to get list of people who are responsible 
for reviewing your code

On 12/28/21 16:57, Adam Kandur wrote:
> Greetings. As I understand, qlge_change_rx_buffers() waits 4 times for
> an outstanding reset to complete. And if it cannot, reports about
> timeout. I assume this can be written using for loop instead of while,
> wich looks nicer for me. Hope my guess was right.
> 

Commit message should only explain why you do this change. You can leave 
your unrelated thoughts/questions below ---, since this part won't be 
visible in gitlog

> Signed-off-by: Adam Kandur <sys.arch.adam@gmail.com>
> ---

<--- here

>   drivers/staging/qlge/qlge_main.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
> index 9873bb2a9ee4..f36e43a85038 100644
> --- a/drivers/staging/qlge/qlge_main.c
> +++ b/drivers/staging/qlge/qlge_main.c
> @@ -4012,19 +4012,16 @@ static int qlge_change_rx_buffers(struct qlge_adapter *qdev)
>   
>   	/* Wait for an outstanding reset to complete. */
>   	if (!test_bit(QL_ADAPTER_UP, &qdev->flags)) {

Aren't there 5 checks actually? It seems unlikely that this bit will be 
set after 3-4 instructions


> -		int i = 4;
> -
> -		while (--i && !test_bit(QL_ADAPTER_UP, &qdev->flags)) {
> +		for (int i = 4; !test_bit(QL_ADAPTER_UP, &qdev->flags); i--) {

Have you compiled this patch? Compiler should have warn you about mixed 
declaration and code.



With regards,
Pavel Skripkin
