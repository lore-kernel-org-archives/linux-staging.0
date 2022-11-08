Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8623612F
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 08:00:07 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id h9so19675747wrt.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Nov 2022 00:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fGYN+OrKT+Wc9wa2H+f4cBj9a1gnXGucm2/MFJDAUEc=;
        b=KPJ+SqQRh8tNjrsB5SkSC9KV2x2xGFHIyLgZfEOJpdw3Yxoo9TtC6O+xjN83h5XPO4
         ngNCAv2q7dq8xTKelxpfeeNVqwjNIyWc0LYFMi0RQV4BodG1UpieV07QKuLr9D+7u9MS
         TxZ4xxEWfwqoJRwkmNAeUW1QA98LsovE4aSGMV4iHKZqikZQsl2LcmZ36SToHcRwvr8Z
         epetrH3no1C2nkkZwdLIeICANve+uAXLdxAUf3cH1PgULUdLPH458ESTqagA7AFGuTq3
         6Y6ZJIVSlDzHAhjKg8IXR90sYx6ou7iGXiRj286uSJr0MbDlVMHmAv+KKx6RV5PyoN82
         ob+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGYN+OrKT+Wc9wa2H+f4cBj9a1gnXGucm2/MFJDAUEc=;
        b=o6nqUuAiNSqXRxHwmz6MHI/KGx3L3kmPEZS0ilJfGWJchPxoy8km/KI99fVJy/XhJy
         yd4dO3Of7f1T8O7LyfCY4dP37aNJu4Zex4wRjIiQ6CgIXd3kb3Bx2qDrgKGw+w5usXi3
         S8nS9ySFN0Uytv++DMjzegIpI3oVLwBirfWwQcZSnl9wt0jWziRr+sKc0KZtYjrU6rRJ
         U0D54M3XGMBVCeR3F/UhLxXbtzjtZ+JuDrOp+kq5+DcF7IlG328Dg0kltGKBTACJLw6w
         y6dfiFdrsJxbJbIRzXyO5UlgBW9SNTsjUqSKkumudgJyZopX1rnNRFNdx1VECuGg3UTX
         NIRg==
X-Gm-Message-State: ACrzQf3venIGSCuUyo6GmYvfTm6eLk9+fgcIWXPPamEd0LPb7A18d/SC
	y11goVajilaFcmNc99qdz1gMng==
X-Google-Smtp-Source: AMsMyM5rSN3xNF9uAe4ahnLY/NH+GZ4LiIgAn2zN32iu4O9cN0kCn8Gk1Tuj7s5Nxk6WIY9DJOxHNg==
X-Received: by 2002:a5d:4ac8:0:b0:236:781a:8d2d with SMTP id y8-20020a5d4ac8000000b00236781a8d2dmr35171464wrs.715.1667894405980;
        Tue, 08 Nov 2022 00:00:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:69c1:baa5:e978:60e9? ([2a01:e0a:982:cbb0:69c1:baa5:e978:60e9])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c314700b003a1980d55c4sm14468146wmo.47.2022.11.08.00.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 00:00:05 -0800 (PST)
Message-ID: <64cbcad7-0b71-3bbc-a6d2-08f1cefdfa5e@linaro.org>
Date: Tue, 8 Nov 2022 09:00:02 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] staging: media: meson: vdec: use min() for comparison and
 assignment
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <Y2lYWWKkDa73gcqm@qemulion>
Organization: Linaro Developer Services
In-Reply-To: <Y2lYWWKkDa73gcqm@qemulion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2022 20:11, Deepak R Varma wrote:
> Use of standard min() helper macro is preferred over using ternary
> operator for logical evaluation and value assignment. This issue is
> identified by coccicheck using the minmax.cocci file.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>   drivers/staging/media/meson/vdec/codec_vp9.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

