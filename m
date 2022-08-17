Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8873441E
	for <linux-staging@lists.linux.dev>; Wed, 17 Aug 2022 16:08:23 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id ay12so6904844wmb.1
        for <linux-staging@lists.linux.dev>; Wed, 17 Aug 2022 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=WiGuvulnIu6q735m2OE5CFO6qdW7g2pKktoUfCm8PWA=;
        b=TOQ5vqO0wDqWf37UGVPLHGHkfXrrwW+HdW3eqcSwlmZPV4p5M8zUyKbzxp7vDRAoor
         SMDAB0c8shPJofnZ5o/0dSywV6K6xkV2uPj/607HJk9T8SASGYCoEfROK31+D5fTFcXO
         TSHJdxymtdaTlOO+ba69uBDzZ8cAXkNX6jegsDJ/eGE5ao/jYVaogkl0hUDaKlzQVvM8
         WWVlvvLag2VqF20LgdBsuC3MSE2Daijxak/CxkemRR6/wCb8wSB+V3j0kAVrUARPfXHC
         3YybOqOopcFdkevbNg0RNDUVHEnE0Id54MkojgaEFMpivu7D+WIXrg0VJam2z716Z0V1
         0b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=WiGuvulnIu6q735m2OE5CFO6qdW7g2pKktoUfCm8PWA=;
        b=TFv44ssUyuroSjWm09K5u4Z5puFWFJL4ybo5Mx1FVtc7UHPdftyoG8Z2guW7WHZoBx
         5ywPoSx2TeneMG4sS4LeL92PJDsGIHpgVLsf5CoOpswjWN/kdM9fvmZvJRmR5xTmHjg8
         eySTw5SAhd2s1Hmb2aIaiPhWrlR678AvPD1w5CODCXglUebClYqlSjMUKO9bIm1xvAzi
         Z4ViNlsnWTzkgMbkrrM3a7qyMXfy1O6h+BwuqCEk6F4ZglpwGi+5JnFf3kCa+TsFDFZP
         Xcblrb44Ym1x6cKPToFgOVs7ivCt38/SgQ1gRVSHmYnhFmitvzDSsmskLJ+to7s7X8P/
         ZZHg==
X-Gm-Message-State: ACgBeo1I0xQD0yaLw00t4Z6H3ERXZYGG/MH/uzWMoO57duZ1UdkcRd/A
	t5YBYEZa/2M6cAmJQ1oWpbkD2w==
X-Google-Smtp-Source: AA6agR4cCi7/KGiDIDnEU/GOl9MT2kv2He1kXfd8OFijx9fVzGe19YSnXSsG7YViIvmZJ10Q3a0DHw==
X-Received: by 2002:a05:600c:1989:b0:3a3:461a:ad4f with SMTP id t9-20020a05600c198900b003a3461aad4fmr2681285wmq.110.1660752501711;
        Wed, 17 Aug 2022 09:08:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a5c:3576:8e69:3edc? ([2a01:e0a:982:cbb0:a5c:3576:8e69:3edc])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c0a0300b003a5c2abc412sm3263381wmp.44.2022.08.17.09.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 09:08:21 -0700 (PDT)
Message-ID: <04115bee-5ddb-701f-ad18-d2c846155816@baylibre.com>
Date: Wed, 17 Aug 2022 18:08:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] media: meson: vdec: Add MODULE_FIRMWARE macro
Content-Language: en-US
To: Juerg Haefliger <juerg.haefliger@canonical.com>, mchehab@kernel.org,
 gregkh@linuxfoundation.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20220817140539.150013-1-juerg.haefliger@canonical.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220817140539.150013-1-juerg.haefliger@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/08/2022 16:05, Juerg Haefliger wrote:
> The meson-vdec module loads firmware so add MODULE_FIRMWARE macros to
> provide that information via modinfo.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>   .../staging/media/meson/vdec/vdec_platform.c  | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
> index 88c9d72e1c83..c7750d4be848 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> @@ -280,3 +280,23 @@ const struct vdec_platform vdec_platform_sm1 = {
>   	.num_formats = ARRAY_SIZE(vdec_formats_sm1),
>   	.revision = VDEC_REVISION_SM1,
>   };
> +
> +MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");

Duplicate

> +MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
> +MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");

DDDDDDDuplicate

> +MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");

Duplicate

> +MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin");

With the duplicate entries removed, please add my:
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
