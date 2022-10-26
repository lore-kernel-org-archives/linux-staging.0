Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8108EBF;
	Wed, 26 Oct 2022 03:03:49 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id t25so12321734ejb.8;
        Tue, 25 Oct 2022 20:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9ynIFAF3DcHSRiFihWBoNbJID3cgAU90Hgr+Zp14k8=;
        b=YgAvV3fEXsz4gVdfGATDJcLEcI82bGyUBjf+c8tUEmHcN34J0NqyVcG0PbvSdLHn6p
         8PcisaQh2U0G1AmHb116VM9ejHomfY6UPZk7LeRAD0lY3IBIkRmjj3xSb7mxPaAT8WRk
         gWosfqjJdszBq2MLs4BVrQXVAMKVvZNFDCuMUD8I8+3V1F5A7OeBc9J914gOBfHAu4od
         LRzZqVSZmg09WK85zRqjHPnKDbK0RGYlSRflXT5H33Y4zUH3X6RsixPKTBdw+nRC75VD
         tUHd57CN0wlPZNmZVhBAilHDBFyjQ9+KJ9SIqVB6Z3oBn9OoDYiQ9sKX0qnQn8F52/xJ
         +h3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9ynIFAF3DcHSRiFihWBoNbJID3cgAU90Hgr+Zp14k8=;
        b=t3JQ0jfob0vb2lOowkvCeUATAG2oE6j/d6j5F8yCmsUmZwUgDEyYo5TdLZP7IvnZc7
         T//wjX8/DOwdEkvnKoTzRbhbjPP6xLW+maCHYarCbHZLGKb2VsQb8lIi+o/qN4ZQnbM+
         Eednf0IIzlAa89aMNeFh219yoovPcyfZ+AB0IS2XPioaOPR/VLeCraI9UEbhXktp/f97
         MMY2/1mY9LkvuMiXDkbWXfjSVMH+GzS1SJGhMHQSHzfMl/3v7BRIPEiiJgkl4uK+/tan
         JPZSK3hp6syIs/G4RSTqwD7yaZvSExlMdCXel6aZyWtxfMlHRHmDivMzEoj0T6u/iAp7
         +hwA==
X-Gm-Message-State: ACrzQf1V1iYjwbHpX0FwsGdVP8rJ7SWI8XpEhyDpAFW7C7IPgyqSAbOS
	YTJgkHYaq1T6cwkuytucB6k=
X-Google-Smtp-Source: AMsMyM5BjNzJUZ8X+tJjbIq6WESS15PXp1ShFWF6a2WYtEdZoabupSiwikX42EGIj8ToVEzs03XjNw==
X-Received: by 2002:a17:907:1c8a:b0:782:1a0d:3373 with SMTP id nb10-20020a1709071c8a00b007821a0d3373mr34125357ejc.135.1666753427946;
        Tue, 25 Oct 2022 20:03:47 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:b844:c952:3daa:e0a:40ba? (p200300c78f2ab844c9523daa0e0a40ba.dip0.t-ipconnect.de. [2003:c7:8f2a:b844:c952:3daa:e0a:40ba])
        by smtp.gmail.com with ESMTPSA id j17-20020a17090623f100b0073dd7e586f9sm2245751ejg.193.2022.10.25.20.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 20:03:47 -0700 (PDT)
Message-ID: <3c9bf2b6-1801-83eb-d4ce-418d34a31e07@gmail.com>
Date: Wed, 26 Oct 2022 05:03:46 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/17] staging: vt6655: changed variable name: pDevice
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <cover.1666740522.git.tanjubrunostar0@gmail.com>
 <1f09760c8f6972b0e2b272060424b60a11166a0d.1666740522.git.tanjubrunostar0@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <1f09760c8f6972b0e2b272060424b60a11166a0d.1666740522.git.tanjubrunostar0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/22 01:36, Tanjuate Brunostar wrote:
>      change variable names pDevice to meet the
>      linux coding standard, as it says to avoid using camelCase naming
>      style. Cought by checkpatch
> 
> Signed-off-by: Tanjuate Brunostar<tanjubrunostar0@gmail.com>
> ---
>   drivers/staging/vt6655/rxtx.c | 354 +++++++++++++++++-----------------
>   1 file changed, 177 insertions(+), 177 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 8bb06b142748..3565f5608790 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -85,7 +85,7 @@ static const unsigned short w_fb_opt_1[2][5] = {
>   #define DATADUR_A_F1    13


WARNING: line length of 104 exceeds 100 columns
#376: FILE: drivers/staging/vt6655/rxtx.c:496:
+									    p_device->byTopCCKBasicRate,
