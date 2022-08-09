Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFBB4428
	for <linux-staging@lists.linux.dev>; Tue,  9 Aug 2022 15:46:06 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id r4so15610694edi.8
        for <linux-staging@lists.linux.dev>; Tue, 09 Aug 2022 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=QsRthhxHhHAdv2PflzqQQQgkqtvZfM0EySC93SJ2rao=;
        b=Qv5q6gM5oM4bPkMzLk7a3sIgubc0hkTs096hUEXF/fGufLEe2NdLQVSwJeH0rUSQfh
         1u8UEhV2XrSoVzsshteKecixW+lWWeV4DBOhni8ODVT2ZjlkKI1dMVKpdm3zWLLq1vUc
         6BIaWDZM6wa8y9uGzr/mA7nSya0JTy2hsLcnRUIcqXkMXi3iXTJeH7BJhCSraKPL4CSi
         PX2XWW+emCoX3Ozsao6etJM/vgQcYwhkXp5j8oMQIM8P0V49yo7WhlyHw05zfMEofI4Q
         5oq2+2BDxGIIvhjEo9cu0QuLEZKedsDjNKsP+QXJzhj8Sz1kd7qesHAXBarnxie1cy2R
         PdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=QsRthhxHhHAdv2PflzqQQQgkqtvZfM0EySC93SJ2rao=;
        b=BqLHCOKJ1cQCJ2egHC45rUglEAlWfAg4D0fsRLoyJkC+yWK6iVS4MSrENZomrI7lO4
         tg1jpLxaCpHEz3zaiEe+h1OA1ViTGpWYszWp78L06q3VD+Wje9pTyvlvrPQLCAHY9zSw
         cIkSkG9+NMfnUtADfHhCIBqvdOR7AsmOWSA+RGjTCh7ol0csTIdF4X/9nBCZle/+pl93
         5/s7HQ4J34idxCoKXVNjQDaXCxUchy5sFM7MT91LqOAnr2d/+m5XMfVqpywJNCeCUbeg
         ejcXL1CRmy774esM6NW3/NbGfg1OUzQ1PdICkjvcY78NsAt8ZOqWVBudalyZvvAtQfkd
         CEPA==
X-Gm-Message-State: ACgBeo0MrwTOcKXgYWx9MWzOSB2QIvuii8KdRO5+mbafixjC1UuSwYBM
	SnUGdFVzntbQEElf06FyX0s=
X-Google-Smtp-Source: AA6agR5f/v0epeBGU+rPBdpypZ4fkyy1hmxsP79gNIs3FXsoAJSQDwbs2hGUD64x/Vr70styftevUg==
X-Received: by 2002:a05:6402:2792:b0:43f:6873:7497 with SMTP id b18-20020a056402279200b0043f68737497mr20486515ede.175.1660059964666;
        Tue, 09 Aug 2022 08:46:04 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id y14-20020a170906448e00b00722e603c39asm1278128ejo.31.2022.08.09.08.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 08:46:04 -0700 (PDT)
Message-ID: <8c326964-ba0c-bdbd-d7d2-177662808e95@gmail.com>
Date: Tue, 9 Aug 2022 17:46:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/5] staging: r8188eu: remove os_dep/recv_linux.c
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220807181538.8499-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220807181538.8499-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/22 20:15, Michael Straube wrote:
> This series moves the functions and/or their functionality from
> os_dep/recv_linux.c to the relevant parts of the driver. In most
> cases it's just making the functions static. This allows us to
> remove os_dep/recv_linux.c.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (5):
>    staging: r8188eu: merge rtw_os_recvbuf_resource_free() into rtw_recv.c
>    staging: r8188eu: merge rtw_os_recvbuf_resource_alloc() into
>      rtw_recv.c
>    staging: r8188eu: make rtw_handle_tkip_mic_err() static
>    staging: r8188eu: make rtw_recv_indicatepkt() static
>    staging: r8188eu: make rtw_init_recv_timer() static
> 
>   drivers/staging/r8188eu/Makefile             |   1 -
>   drivers/staging/r8188eu/core/rtw_recv.c      | 125 +++++++++++++-
>   drivers/staging/r8188eu/core/rtw_sta_mgt.c   |  13 ++
>   drivers/staging/r8188eu/include/recv_osdep.h |   7 -
>   drivers/staging/r8188eu/os_dep/recv_linux.c  | 165 -------------------
>   5 files changed, 135 insertions(+), 176 deletions(-)
>   delete mode 100644 drivers/staging/r8188eu/os_dep/recv_linux.c
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
