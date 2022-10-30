Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F98633FD
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 10:40:08 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id f7so8083801edc.6
        for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fWh0jiw47wr5EpTblkOIk2Y0gZ5oFXjTyvGDtppfH6g=;
        b=RvdX4EeB4VauGLFSIqplc5pDhWhiZW2n2yUHMU9dsTSPAKV4OwnyOcHfzJkpYzk/nQ
         L6Zmdzi5HtlwmuQLHHZO8UnFuPMVaMEH38lYLXkky0MZO1Wg4Fy5Z6QI1X0Liubtb6ZC
         zOijB7Ogv8CM9UVlgkORYNbd/SqguGVSenqbTv4q8sbyRcDJzwqk8cGGhmj06UGHPVqE
         1n5BecfsKoYGmXWdlMa/3lRY0vaithZyjpDW56YNP4ZJklpLU2aA7ZlT+5x63jr0C2iL
         hdyn62Y21IYQVATUdV+zPmZSQ1ANsRtIFDi8/XC4DJ3gTFTnGAc+NzFb7SsIiyWBVDxg
         Gbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWh0jiw47wr5EpTblkOIk2Y0gZ5oFXjTyvGDtppfH6g=;
        b=S+A2aNUM8bcQ731rX/XtYXrzb1psGPPKlWnIGLAjhupXzR3FiFMXYLWClU9mFV+9tQ
         filwRP1Tdms74ud5gFrs019wtEJcU+JyuBm/D9J5zjBSrvvnPsOgB18m5GayjL2tbboO
         bRs4xj76xnSCI4fkWDu73JnO2S1UzFBOnFgGpW4blKwsEsLMOoUbikoeVbPa4VGsmGkI
         zGErL+l1xRGK3WEY45G6BWjqEsUwUDoBrrPGmBDqOHrFY/zmXMm80yb6BR2rNsyjRqVE
         7zwpiXz4dV/9ZLSReNGZweF8u1v15MY740knICpAcKQ0q1dy6s3AhkaG47nxxnnIsqpw
         pIng==
X-Gm-Message-State: ACrzQf3QFIC/Dz+HxMbL1iaXivI8NzZTaJUcz9D8C0VHqOTxv2p3b9qe
	VqyZcXMXjKHlpMJG93pY5qzirc1HFOo=
X-Google-Smtp-Source: AMsMyM5CE1OQ9M24HRS7BXtxwFnHLbCMv4ssc2A+JyI1WUaFYZmEQk9j9AdBivPLgiC5eSDIvEVgqQ==
X-Received: by 2002:a05:6402:2989:b0:44e:90d0:b9ff with SMTP id eq9-20020a056402298900b0044e90d0b9ffmr8049193edb.110.1667126406972;
        Sun, 30 Oct 2022 03:40:06 -0700 (PDT)
Received: from [192.168.1.102] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id i2-20020aa7c9c2000000b00458947539desm1906119edt.78.2022.10.30.03.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Oct 2022 03:40:06 -0700 (PDT)
Message-ID: <b589cbce-87a2-d58c-72e0-3f334a026ea7@gmail.com>
Date: Sun, 30 Oct 2022 11:40:05 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/13] staging: r8188eu: clean up action frame handlers
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221029172337.1574593-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221029172337.1574593-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/22 19:23, Martin Kaiser wrote:
> Clean up the handlers for action frames. Summarize common code, remove
> unnecessary return values.
> 
> Please apply this on top of the "remove the last get_da calls" series.
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
