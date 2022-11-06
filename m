Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351937F
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 08:21:27 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id a67so13207094edf.12
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gB8/kLjDzYvH1OFObBtjT/KXWPSjKGugDqtND1QBAz0=;
        b=O3LkO5IBuPqt+6AczW0OZXWujDV9hNZ7NFBCy7c8NinLp/R11uqctZlUSZrCOoXAwJ
         QtCG8cFD66JijqJXoT9axTUGgycibPQpsMSaz5cxvrpBHzUjR9Jo5T7b6F6NVRm360yk
         un9nY2bz6uFMsIN+xe23Jbi6e3IrWx5I8Z68WrJ87kTOrZ/JwLE+ZJ2YzydqMHkxuEHW
         xvRgIzr9lSYdEPWt13mJmTaQtIzchXAB0xwXYIgbwngPs37xrFcHbKuZ4lJy0Of+2D9m
         H5Tn1Lvd3SdvfyF+aPEkU3RoVrqkcGvU6b3k9T+ufTVSSn9lSE1+ccsT/0Fy4SYr551v
         /s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gB8/kLjDzYvH1OFObBtjT/KXWPSjKGugDqtND1QBAz0=;
        b=hiCKgF6ZMNcMlIhTOTyhPkBRJXsxmky5rliszhBJphyeZVeMluXsCvCs/LS6ggejs1
         Snz0fySGOCTuD692VMUDzZnr5l1e/R6kMHTXfbcExAXhGhePstLPeF5tpCS47BGSUv7M
         OhgPQbg2TWVZeKkk/T7pDD/8ZOsqueCNM8RZ7AX4Y5ELGQI9roYlASli7n5OIA/zaAKW
         rJ4LzAAdi61z6oAU7RyhvRYMshcXm6XWMgiRNnmqrzOkfEqVjTl5wykwQm6RfLqiC9jp
         9dA2kbXyZ40iq18391JSgkBYGvSIsEfzRsoxE9k+JF4wtMkKu6JfAxC6L/jA8khWGFWl
         5eKg==
X-Gm-Message-State: ACrzQf1uz0GZ6jPVxY5/3Pm+CiLNRb8lFUZCCVgZwjfJN8Rp8IbEqmoG
	xwYA907RVpg8xdlSxY06M18=
X-Google-Smtp-Source: AMsMyM4f83PyWr9r/xHVlXmWyxOt8rjE3HUgRTRQdHG9fg0pbKHw3vvqm7DoriR/buvZQXCIEPH29g==
X-Received: by 2002:a05:6402:b0e:b0:461:f7a8:3e3a with SMTP id bm14-20020a0564020b0e00b00461f7a83e3amr43999512edb.372.1667722885427;
        Sun, 06 Nov 2022 01:21:25 -0700 (PDT)
Received: from [192.168.1.101] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id vv2-20020a170907a68200b007417041fb2bsm1845820ejc.116.2022.11.06.01.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 01:21:25 -0700 (PDT)
Message-ID: <5eda8c39-016e-fb1d-c403-08ffd13c2a90@gmail.com>
Date: Sun, 6 Nov 2022 09:21:21 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] staging: rtl8192e: trivial code cleanup patches
Content-Language: en-US
To: Jacob Bai <jacob.bai.au@gmail.com>, joe@perches.com,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1667704057.git.jacob.bai.au@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1667704057.git.jacob.bai.au@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/22 04:13, Jacob Bai wrote:
> Rename few variables and source files to make it align with other
> rtlwifi drivers.
> The patches are required to be applied in sequence.
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

The v3 is missing in the subject.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Bye Philipp
