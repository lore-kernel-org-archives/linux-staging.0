Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DAFA4A
	for <linux-staging@lists.linux.dev>; Sat, 18 Feb 2023 19:11:06 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id d14so4601613eda.4
        for <linux-staging@lists.linux.dev>; Sat, 18 Feb 2023 11:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wGzk4u2LaXho6Aee+OsMi1UnXx5jEaEJVgW+Rl2vmw4=;
        b=Dt320SEZ8fQgLJL4IXIzora99cbuv9QlQdJnmpooVINwirf+jvE3zrfWpVucw3MK5j
         sC0219XnPgRKu8gisjn9a1vt8nObnT2HzOg8M6oVhODEdjxy1nAG9PP2VC8gvzWc2G6s
         +SnHP9AGfzhYkf5tBHBxc6+HANWMbP+KlSfcuLDW7Yit4CjPwrXUWLeHoKGjZoG6GOQP
         ilWXtVfUPqC7P+bN7+7IRKfqcIp5B1Keg+3at9kPP84fl6T8pIUAb3Qjh5EC3Ti6B2xq
         buh+OotRiEczU6d+sviHYVvAaWlRt2m8arOAidCBGEOst74BZfvA7nS4J++VsJwVTqCc
         bIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGzk4u2LaXho6Aee+OsMi1UnXx5jEaEJVgW+Rl2vmw4=;
        b=u4kMzQ9HWy23uegzBDH4XPnoHh2DJblojIu0KNB/qg+GK1FJHbfor8koMFmJruLGJV
         juFzrKlgjnhPFg95eLe604pPFMwD5D6jxOuMJy1vxAASFiqXtem912eoQ3vRstinoVYV
         VhtgVca71SSBFSLTsrrTJbQ7I3VgqAqyYcxCYlAVjb5M355aGRyO0nYKerNY5RVEoQu1
         XKlIDRYcpO6Sy1RD8aj4LFuhHy1lWBr3jQ7PMEPQc8Ol+qrivQE4vRROegKf3hmJy3IM
         aBKKmJYbP7DIkedMA4LMF+wT+zPNvX17uQjEpTS341G0DVecnAHC6yxtXzkb7+7ydMXO
         9zJw==
X-Gm-Message-State: AO0yUKWCy+Qvu247smXhpkHrvORsNRzFcgS04ZBN+ukBedb54Dw/dQx+
	Kt/bPkT60LwtrL+sAQQjCk4fEPf6oVw=
X-Google-Smtp-Source: AK7set+19pqr8/y9ubNSplyC7cf7XHx6hU2Vu2cNjGAXjaba5cU+//XkQwnFU53KyDoTDs9e/vKLzw==
X-Received: by 2002:a05:6402:34d5:b0:4ab:dde:dea7 with SMTP id w21-20020a05640234d500b004ab0ddedea7mr1028667edc.2.1676747464376;
        Sat, 18 Feb 2023 11:11:04 -0800 (PST)
Received: from [192.168.0.102] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id y102-20020a50bb6f000000b004acb3026af2sm3960958ede.59.2023.02.18.11.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 11:11:03 -0800 (PST)
Message-ID: <5de7b776-4fbe-f6f8-ffa9-fdef337c9c20@gmail.com>
Date: Sat, 18 Feb 2023 20:11:01 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Staging: r8188eu: Fixed block comment
Content-Language: en-US
To: Khadija Kamran <kamrankhadijadj@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
 gregkh@linuxfoundation.org
References: <Y+8p7Hyaf4LhO/Sw@khadija-virtual-machine>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y+8p7Hyaf4LhO/Sw@khadija-virtual-machine>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/23 08:17, Khadija Kamran wrote:
> Fixed block comment by adding '*' in each line. The Check message was
> shown by using checkpatch.pl script.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index a7c67014dde0..03025dc89533 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -36,15 +36,16 @@
>   #define WAIT_TIME_PPPOE	5	/*  waiting time for pppoe server in sec */
>   
>   /*-----------------------------------------------------------------
> -  How database records network address:
> -	   0    1    2    3    4    5    6    7    8    9   10
> -	|----|----|----|----|----|----|----|----|----|----|----|
> -  IPv4  |type|                             |      IP addr      |
> -  IPX   |type|      Net addr     |          Node addr          |
> -  IPX   |type|      Net addr     |Sckt addr|
> -  Apple |type| Network |node|
> -  PPPoE |type|   SID   |           AC MAC            |
> ------------------------------------------------------------------*/
> + * How database records network address:
> + *	    0    1    2    3    4    5    6    7    8    9   10
> + *	 |----|----|----|----|----|----|----|----|----|----|----|
> + * IPv4  |type|                             |      IP addr      |
> + * IPX   |type|      Net addr     |          Node addr          |
> + * IPX   |type|      Net addr     |Sckt addr|
> + * Apple |type| Network |node|
> + * PPPoE |type|   SID   |           AC MAC            |
> + * ----------------------------------------------------------------
> + */
>   
>   /* Find a tag in pppoe frame and return the pointer */
>   static unsigned char *__nat25_find_pppoe_tag(struct pppoe_hdr *ph, unsigned short type)

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
