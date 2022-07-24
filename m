Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2962F55
	for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 18:32:19 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id ez10so16713771ejc.13
        for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 11:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kHwnjAd0klMJ7kiJVlb73ix9dRQwry5Ws8qHCsAzQEA=;
        b=AJCcai+xAj8I+OdNokcMBzxTPjfTL5NUi0E2fpfQpDrzLwBp1Rm9baBuWZ67TboZjI
         sO+lq3VLI0Nnxg/5lt9EliJnSxdANZO+mu1UQFSnjgUz2Ck4T9pXZ6WBOTO994/ASQi9
         eldHV1Su1xg1GkM8pRr0za3TMiWaC6Ikg3f49urXnxqs+D0Pm+hmaO7OeLX+QftEwwVl
         ynYcmPNnKuCDfEArApN9fbhpzrzhp4YZ//2Xl7pGKQ0bkt64JV5Ez7fML9y4U5uCwQAl
         sxkOiFSuWFr5HY7NHMzcBsLoErxYePAUlxA2/Q216IkXFZBOHFcmmjQfqXbrtqvq7mw1
         LASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kHwnjAd0klMJ7kiJVlb73ix9dRQwry5Ws8qHCsAzQEA=;
        b=v1PZnqB0hPyB79c3CmX386R9JXOrsbRRgzmM9BLLr6iSZaFYz40I+XzVqhpVS9bCCZ
         yzVIzwH1/Pi9RsV+DNOKKZjtVKQ9ZDhmNtwtw3RgfiyulQq3V/6S9iLzzZIGSQp+RxCa
         8pkr1JeGYgo2pOAYqZtd74fZG0i3WunVKGL69Tq0QF4eH7f7Xyf+c+D9E3wdrJb/Jmss
         mAn4qCfk9DKCTFp/2UbBHI/Lt+ual6KQ3kOLhS9BkU+sl19cdp0H7F6Hbo6Njqakn3TB
         Oa+GUilxGP3eP1PyPYOHhEBgVrnhHPJgRFsUhhea4jAvEHG0kgsx8DUt0R3GEQVppkIE
         dCIA==
X-Gm-Message-State: AJIora8Ec+qZIo42odSUFxCjlqUISf+YhXRweSN9O43ifAnoANMnVEf8
	uPyavGMyfO7U+Xp7Vk/Cdff39XJkRLg=
X-Google-Smtp-Source: AGRyM1szw1eNn1oiMpE8989ROVwM/cDN8FXihbTs0Dxtdn6xg8Md1+CVEVCNfrCe2L1d2glx/up2Bw==
X-Received: by 2002:a17:906:cc11:b0:72b:458e:5d45 with SMTP id ml17-20020a170906cc1100b0072b458e5d45mr7210187ejb.589.1658687537956;
        Sun, 24 Jul 2022 11:32:17 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id lb5-20020a170907784500b0072f2e409575sm4400145ejc.98.2022.07.24.11.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jul 2022 11:32:17 -0700 (PDT)
Message-ID: <5972ceac-5f68-85af-bbe0-e640a6a64149@gmail.com>
Date: Sun, 24 Jul 2022 20:32:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/5] staging: r8188eu: use struct ieee80211_mgmt in
 OnAssocRsp
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220724153917.138848-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220724153917.138848-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/22 17:39, Martin Kaiser wrote:
> Use a struct ieee80211_mgmt in OnAssocRsp to read elements of the
> association response message.
> 
> Martin Kaiser (5):
>    staging: r8188eu: get da from ieee80211_mgmt
>    staging: r8188eu: read status_code from struct ieee80211_mgmt
>    staging: r8188eu: read capability info from struct ieee80211_mgmt
>    staging: r8188eu: read aid from struct ieee80211_mgmt
>    staging: r8188eu: use offsetof for ie start offset
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
