Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F77B
	for <linux-staging@lists.linux.dev>; Sun, 21 Aug 2022 19:57:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id v7-20020a1cac07000000b003a6062a4f81so6720854wme.1
        for <linux-staging@lists.linux.dev>; Sun, 21 Aug 2022 12:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gkjFCKyTkuRukYwtHgMXuk8JR0ia5jyY0iDvv7ppT2k=;
        b=Lrd3bl5GO81O/98rTOX7Fdvg+Fo2SPo2LMYSdk+6Ulm/htll9qEvFA5BlV2hNp1q0F
         d4ZA8ubw02R4i8qFG5FmDflORQrpR5PZbVHdZ8199VDSzPNT7tsy9c32RuA1stjb9aIH
         tUlb/v1InnUTv3vTWR9qu9XUwHZZJBujlpFZKEvo80r7V2Mr6gb/y3BAaNc1RPHHQ5MW
         WzYRtdCauA9QIHb/Gz1U8e5RY8BBkrx6hujxy5ORxVZmCm3mAPFhsbs3KsXK4Olc496z
         L9+OT+yXIikVR9GG/UWObC0LpW4X3fPyDz/htiw2oLLbXHCNBCFxHpN2v+z38NpQ0+6t
         CJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gkjFCKyTkuRukYwtHgMXuk8JR0ia5jyY0iDvv7ppT2k=;
        b=u/65oAwKT3nZqJJwsP4iwq8qeIRWhr7gNnQJrn6vBni2k1wJe5sJHxP1B8MJnMIc6K
         P9zZjXfXVsvKWXx0ScpF9tApAcRCCXLGzgE2ZmZhvpR8Xf+HentnPcQgoR02X9JLEu9Z
         viEbtkJHx9+nW/7SFx2HiosPeunbvz9BrJNF7tIek62gtk6sFPOoicljUaTvwsVDzyf+
         ng9uPqXdKUzfjYI+qTha/G/lc4HeMHH2Z8P6wq4hpB77e9nsIHvbtyibo98C+BM1mwc8
         moGV8VYVcA+dU4MA2o+ARllBIJDL4mxd2ghilfoMP4dgC/yfYu7T84uGPmHk357bjFry
         LDig==
X-Gm-Message-State: ACgBeo1RfXMMpG8nCixN4JWaAIYbDNoVozCYXNKYOhdkrwcsJEan+0X6
	6reXQ6jEyanDwlVN8GBNDvc=
X-Google-Smtp-Source: AA6agR5Sni/RTeXh4++17c1kikIcDZgdIHEsexxiCeL9nMoe/kjBxEvdT5c6u+5XurGW5Gohw2dGKA==
X-Received: by 2002:a05:600c:3516:b0:3a5:c28a:f01d with SMTP id h22-20020a05600c351600b003a5c28af01dmr14155439wmq.165.1661111858161;
        Sun, 21 Aug 2022 12:57:38 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6996:ca97:6252:1199:4a58? (p200300c78f2e6996ca97625211994a58.dip0.t-ipconnect.de. [2003:c7:8f2e:6996:ca97:6252:1199:4a58])
        by smtp.gmail.com with ESMTPSA id o3-20020a1c7503000000b003a3170a7af9sm11759597wmc.4.2022.08.21.12.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Aug 2022 12:57:37 -0700 (PDT)
Message-ID: <bdbe8b77-4847-196c-a2f9-ccc779ff8d5b@gmail.com>
Date: Sun, 21 Aug 2022 21:57:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/19] staging: r8188eu: make rtw_remainder_len() static
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220820181623.12497-1-straube.linux@gmail.com>
 <20220820181623.12497-2-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220820181623.12497-2-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/22 20:16, Michael Straube wrote:
> The function rtw_remainder_len() is only used in xmit_linux.c.
> Make it static.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/include/xmit_osdep.h | 1 -
>   drivers/staging/r8188eu/os_dep/xmit_linux.c  | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
> index 130dc06efe73..55347de455c8 100644
> --- a/drivers/staging/r8188eu/include/xmit_osdep.h
> +++ b/drivers/staging/r8188eu/include/xmit_osdep.h
> @@ -37,7 +37,6 @@ int rtw_os_xmit_resource_alloc(struct adapter *padapter,
>   void rtw_os_xmit_resource_free(struct adapter *padapter,
>   			       struct xmit_buf *pxmitbuf, u32 free_sz);
>   
> -uint rtw_remainder_len(struct pkt_file *pfile);
>   void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
>   uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
>   
> diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> index 85ef27735b88..33400a9b08e1 100644
> --- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> @@ -11,7 +11,7 @@
>   #include "../include/osdep_intf.h"
>   #include "../include/usb_osintf.h"
>   
> -uint rtw_remainder_len(struct pkt_file *pfile)
> +static uint rtw_remainder_len(struct pkt_file *pfile)
>   {
>   	return pfile->buf_len - ((size_t)(pfile->cur_addr) -
>   	       (size_t)(pfile->buf_start));

Hi Michael,

cannot apply your patch on top of the patch series(11),
[PATCH] staging: r8188eu: remove ODM_ConfigRFWithHeaderFile()

cat ~/Downloads/\[PATCH\ 01_19\]\ staging\ r8188eu\ make\ 
rtw_remainder_len\(\)\ static.eml | git am
Applying: staging: r8188eu: make rtw_remainder_len() static
error: patch failed: drivers/staging/r8188eu/include/xmit_osdep.h:37
error: drivers/staging/r8188eu/include/xmit_osdep.h: patch does not apply
Patch failed at 0001 staging: r8188eu: make rtw_remainder_len() static

It looks like it should fit but it does not. Have you changed something 
manual in the patch?

Thanks for your support.

Bye Philipp

