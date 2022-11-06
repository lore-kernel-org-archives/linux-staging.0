Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC023A9
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 08:42:00 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id kt23so23015202ejc.7
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 01:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IedN9hGTjUJRM2QkZwLtvVtdrbrOyzLZkXMJyjsl+hA=;
        b=g+obRviENN53QePdR7rWfD4VqexqHxi++mvPGoZHbL+JzhjrpwZB+cfV9C7azOCYch
         oCdxuPHJ36o+qQAieEMvvx6LImmFSdXdOkisTvvVLsmZ0LxwwWKnmkZ7R60AxX5Dc8/k
         4BNFTXIJzG9513WV19xwuAyYwocdazDT8KhrFo94JK0fvwrA+Y3u/p7k1N7mytFts1Ze
         5B91MphoyrQ+k8ha3pM5qSnDLNf+tQSUpby6CmJb74nskXo4tNHrUmBoBWFQdzpGigRf
         ei3GYKirviw/dZe9q4KYQkmEiOJla3fPe+hJdnY5BLl0NugVEkiWrdHJE1C/NxeqCBwe
         VS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IedN9hGTjUJRM2QkZwLtvVtdrbrOyzLZkXMJyjsl+hA=;
        b=3VsjAOwebQ+QinQ2tsVlZotpVCgClskqsTbp7zoFy0fPnBBg6Muk0fVnv65GPEorDC
         i+nyvJY1xQVaok3qkwvPfnMSgVa0QRbqcPFNsdQY2fWEKnfAtYQ9fMKEprwDzRBl+bEW
         +QU08eJ/SafPytEkkBkREdOVb5xfINEooXSMt8O7ZaKHdYELBhC5TpzLE9tPxSGhZtep
         X7D8CwaonNI49icszLILCv4BrliCb64gvgf6SRkHVkOkHDadULeSU7kqfe6ThI+t7/wf
         68YSov3W6Lc963VyiNEZui8d+Xr11cmTG6YUAVD4srpukxeDJqVbc9zKeXAD3QF18XmG
         8bkw==
X-Gm-Message-State: ACrzQf3h4pw1F5qrXQ5ZH3HFu778lvZpnqUbzXJy5GI7ZTi3gPoZg/t/
	FaYP83DIEXPye/2XhIQ/QJM=
X-Google-Smtp-Source: AMsMyM7u07RjQ3ASogJmMcT0hLRCJpmj2isSmn2b/XDouMeBcnXp38LkRVSuoOJ9amhzori9kW5QvA==
X-Received: by 2002:a17:907:1ddd:b0:7ad:8371:b59c with SMTP id og29-20020a1709071ddd00b007ad8371b59cmr41935954ejc.429.1667724119358;
        Sun, 06 Nov 2022 01:41:59 -0700 (PDT)
Received: from [192.168.1.101] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id ku15-20020a170907788f00b007ae1ab8f887sm1918549ejc.14.2022.11.06.01.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 01:41:59 -0700 (PDT)
Message-ID: <d564a877-c2f1-20f7-90eb-d4ccfcb70277@gmail.com>
Date: Sun, 6 Nov 2022 09:41:58 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 0/3] staging: rtl8192e: trivial code cleanup patches
Content-Language: en-US
To: Jacob Bai <jacob.bai.au@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1667723306.git.jacob.bai.au@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1667723306.git.jacob.bai.au@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/22 09:31, Jacob Bai wrote:
> Rename few variables and source files to make it align with other
> rtlwifi drivers.
> The patches are required to be applied in sequence.
> 
> Changes in v4:
> 	1. missing vision number in the v3
> 
> Changes in v3:
> 	1.Patch 3: use ARRAY_SIZE() to replace macros, feedback from
> joe@perches.com
> 
> Changes in v2:
> 	1. Patch 2: modify r8192E_firmware.c to include table.h instead of
> r8192E_hwimg.h.
> 
> Jacob Bai (3):
>    staging: rtl8192e: rename tables in r8192e_hwimg.c
>    staging: rtl8192e: rename r8192E_hwimg.c/h to table.c/h
>    staging: rtl8192e: replace macro defines with ARRAY_SIZE
> 
>   drivers/staging/rtl8192e/rtl8192e/Makefile    |  2 +-
>   .../rtl8192e/rtl8192e/r8192E_firmware.c       |  2 +-
>   .../staging/rtl8192e/rtl8192e/r8192E_hwimg.h  | 33 ------------
>   .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 54 +++++++++----------
>   .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 20 -------
>   .../rtl8192e/{r8192E_hwimg.c => table.c}      | 34 +++++++-----
>   drivers/staging/rtl8192e/rtl8192e/table.h     | 33 ++++++++++++
>   7 files changed, 84 insertions(+), 94 deletions(-)
>   delete mode 100644 drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
>   rename drivers/staging/rtl8192e/rtl8192e/{r8192E_hwimg.c => table.c} (91%)
>   create mode 100644 drivers/staging/rtl8192e/rtl8192e/table.h
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
