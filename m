Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4C12F23;
	Wed, 13 Apr 2022 21:03:59 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id m8so3701478ljc.7;
        Wed, 13 Apr 2022 14:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uHKbCBmnIIIRLgpQ0EmAyBKmMcbrd4irGnlfoP/C+RI=;
        b=ZP17KYX4mcH6KpW1uhtlPKqUArldlkE90jZ+7dlzp20+ZqNJn1arSXOfIMzcjuq9nN
         4egETmP+sj3If9hxd+ZqG6gUmhaW/V7gpLfkRrBqbtlrJ82vX5KLnsnfFhkdDGtN5tKQ
         j0sgoh8rAtu7SkB4ZB6GXGKSQDKcPyWlVYt3zf+x/RLtQZU9BCJRMs3IesiHmyy7yCUh
         6tTMYJb+kdIoyE2op4+QE5CCLN7E4pexI9hjwkUxvofdBRS+UF6GA9HbtwRZmu0Q6zvq
         GA23a94Eof5rE8cfcT4y/kYQ4gcY5/Zuf6P9UhaXQDphXlH4N4OlVvXo2AW5K7Ur+prz
         W1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uHKbCBmnIIIRLgpQ0EmAyBKmMcbrd4irGnlfoP/C+RI=;
        b=St4F9yo4eGrTi8VFyLpE8wXRjn7HDbhskWnkpfhYWHjZ7RRDBIlOlhfk89EVaOl+T4
         /SFUQCinhJ6zdzfdPkBBEq3/pabx/J6i4xcNhGu/knQN+9N4D30WIi25Jpttrn2R2diT
         iEwFLy7UqRnX/elhGYG5ybcscW7YkL2ilv+5YYSNLzEH32qZ1n/10Ev0RVQglLBb0rVU
         YfNagvjswAm8S8+b7YpE1Z6pV4kQmJBnepVAi18QbLCNIlhwhlBGw7tXm+fKAh9iFoaT
         53kHZQy82P9nHa9IjlbF/aOzbmUGHFiSXx0C2ttTjdp/HeAfGME6a3W0XQI3Dh07G0Mz
         STDw==
X-Gm-Message-State: AOAM532sJJ+ncdx3ae277L7b6EZr3Wv27Wuu5Io78Rw8U1wYLRDzQe5q
	FNgTD9f8vxtuEYUndIIgnK0=
X-Google-Smtp-Source: ABdhPJwQnSfWZWGA34zlZV9A8IlUzMB8+GgkTdwZVb4zbXDZ6syiCOLwpkFz+BZLV9YU45+kOxf/oQ==
X-Received: by 2002:a2e:9e90:0:b0:24a:fb77:814 with SMTP id f16-20020a2e9e90000000b0024afb770814mr28798748ljk.186.1649883837393;
        Wed, 13 Apr 2022 14:03:57 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id s12-20020a19770c000000b0046b87800f71sm9846lfc.49.2022.04.13.14.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 14:03:56 -0700 (PDT)
Message-ID: <b7668e4f-d46e-8592-31f4-b192053de7ee@gmail.com>
Date: Thu, 14 Apr 2022 00:03:56 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] staging: vt6655f: rxtx: code style - Fix Lines should
 not end with a '('
Content-Language: en-US
To: Aliya Rahmani <aliyarahmani786@gmail.com>, forest@alittletooquiet.net
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 outreachy@lists.linux.dev
References: <20220413190021.36742-1-aliyarahmani786@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220413190021.36742-1-aliyarahmani786@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Aliya,

On 4/13/22 22:00, Aliya Rahmani wrote:
> Code style warnings reported by checkpatch.
> Improve the layout of a function header:
> *Put the first parameter immediately after the '(' and align the other
> parameters underneath it.
> 
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
> v1->v2 changes: Put static and void on a single line.
> 
> v2->v3 changes: Rework commit description.
> ---
>   drivers/staging/vt6655/rxtx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 01dc83b2f4bc..2853cb9efd30 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -568,7 +568,7 @@ s_uFillDataHead(
>   }
>   
>   static void
> -s_vFillRTSHead(struct vnt_private *pDevice,
> +s_vFillRTSHead( struct vnt_private *pDevice,

You have only added extra space. Why?




With regards,
Pavel Skripkin
