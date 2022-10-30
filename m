Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539498F53
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 18:17:30 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id k8so13168051wrh.1
        for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 11:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVxs7NYu64wxvANBqbozzmJQF6UupHoc/YO/3Sjp/e0=;
        b=jvVwJUfMjOQQY6otEGNtczrtai1xFfHxabQqMvu84R+lU9Atnt6YQQRaWUEAzk++qT
         AFOeNKT0SOw7sdqtBfsww8a1aOBocFk7tVhiY8/8rzq1R1sdRIMKDiNgvZ7WdkcXIW/L
         biy+HcZ48+CDEgjReA94S2N6nbA8VAU4NeAxj+LiM1yodA+aI2e0+Q1e0lOk+Px9yjvX
         8SJfyQwc96nutL8hMxbsHH5VpNs0ForRPqiSbXesky1FwLBGe0FVDhTgUpC0pF2meQvg
         OFqKn5IUgDOOMVhyUMwetV4OUxvOLtvcpvYOb8+58/1xx9dLRYu2VH8OnxPvOY+K4DcE
         2NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVxs7NYu64wxvANBqbozzmJQF6UupHoc/YO/3Sjp/e0=;
        b=hJ8uqyJzfROMw/a76865+o6/7zEUBep7TEbnmHHqFoLajV3lMahqIhYQI9Ii8/hbtR
         jtqiWyZpzLheH7IkPAoEBQhhsHonop0YgetM2gH8yipmTqvzGaMroey9h20IkRmc0co1
         YA3RAlSmH3PBRF6DZbUlDX9PGHEH6CIvdl6sDHV8QRH4UX5v2dkJ/swPAMW8P7G8clxa
         F0CEV9Y8Ct0G3RFutCY1aygZrAzFIGdrbRekp3KMAugaxw3IeGqV01fWcSNDHXMXQSvT
         sI0w1oQhkiq0uSJF8xYYkYDEeRuSMG70kd4q8G1laae6nayHh6iHH8A329egpU7UD7hf
         rOrQ==
X-Gm-Message-State: ACrzQf25VdQygVJcQ8eQiYuKJLQaYxS97uePyp+9e7oCfBS5iIxpXQ7y
	UzaVRB/fVFW2aBqxMyfGHdQ=
X-Google-Smtp-Source: AMsMyM5dGsh1uyYsouQd6C4scjcw6ToHpMymAQsMVMkmtFd3eeB0QWHT+zV8bCnSuZsOR4t1XvS43g==
X-Received: by 2002:a05:6000:1143:b0:236:5ede:cdad with SMTP id d3-20020a056000114300b002365edecdadmr5751278wrx.410.1667153848470;
        Sun, 30 Oct 2022 11:17:28 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:b825:7539:be75:5415:acef? (p200300c78f2ab8257539be755415acef.dip0.t-ipconnect.de. [2003:c7:8f2a:b825:7539:be75:5415:acef])
        by smtp.gmail.com with ESMTPSA id f18-20020a1cc912000000b003cf5ec79bf9sm4961175wmb.40.2022.10.30.11.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Oct 2022 11:17:28 -0700 (PDT)
Message-ID: <e032d410-60ed-9e0b-2818-bb849adebc78@gmail.com>
Date: Sun, 30 Oct 2022 19:17:26 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/13] staging: r8188eu: clean up action frame handlers
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221030173326.1588647-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221030173326.1588647-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/22 18:33, Martin Kaiser wrote:
> Clean up the handlers for action frames. Summarize common code, remove
> unnecessary return values.
> 
> Please apply this on top of the "remove the last get_da calls" series.
> 
> Changes in v2
> - remove on_action_public's ret variable in patch 3, not in patch 9
> 
> Martin Kaiser (13):
>    staging: r8188eu: replace a GetAddr1Ptr call
>    staging: r8188eu: remove duplicate category check
>    staging: r8188eu: make on_action_public static void
>    staging: r8188eu: make OnAction_back static void
>    staging: r8188eu: make OnAction_p2p static void
>    staging: r8188eu: remove category check in OnAction_p2p
>    staging: r8188eu: replace switch-case with if
>    staging: r8188eu: replace GetAddr1Ptr call in OnAction_p2p
>    staging: r8188eu: clean up on_action_public
>    staging: r8188eu: remove return value from on_action_public_vendor
>    staging: r8188eu: remove return value from on_action_public_default
>    staging: r8188eu: rtw_action_public_decache's token is a u8
>    staging: r8188eu: check destination address in OnAction
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 116 +++++-------------
>   .../staging/r8188eu/include/rtw_mlme_ext.h    |   7 --
>   2 files changed, 28 insertions(+), 95 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
