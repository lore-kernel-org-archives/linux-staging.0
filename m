Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0BB8F5E
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 19:15:42 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id q9so24821361ejd.0
        for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 12:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WCt//reQCph6olqDoKtED7itGlrW7yrg5Li1Wffc30A=;
        b=W6b1rTaklPfa16uZMAp2Ndof1pbYMCMUcVa/FB6uMEujB2tSJISZhhS+Mk/7JHhxF3
         TeNgUOJpv99D+hS5I73n+w8e9qTh2OGSpOke+4fAHExS6Rzk6OKbTxgD+t0wIB2Sw803
         uroft+ddfcLuEjrNZ3rVgn1D/psr47583WyLAkVokqwVn7n1cspz2Qv5ESM6RNbOZIaA
         ypw+E8P/dox+CZAVXSHrCA5PXfVg/Osa3JHC8tMLY/wps/QS4i6dS8rkYVFxgk4igtEu
         H809QfVM5E2vOPei8Ckl2gmUVnUV1KZXnPdN2mQj0uGjxNrKyDiM8RvYuY1CcMuiAp0T
         ILmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCt//reQCph6olqDoKtED7itGlrW7yrg5Li1Wffc30A=;
        b=IECOX8yoBefwpklAi69ebjWt5ifwR+aR1tV4Vh191GTeSPc9P7v80KQovg3lNir59X
         c0/G2voKDTlm4apGD1QQCQ0Pxfs/KOXELjT93Q01iHkXRKPlXJNo8Qwxkm4FemWTG+Tq
         v7Fj4F0gBFK5fmMC0IYviqTLCzvgw8dhvSfb9veFVHcbKbNA20Lx6L3TBtv+OlD3/85Q
         lPnTz7gyFAn1sQOKWJdigEMbZduecBs36ioVmAMkOPhNAoRXlo9xUTXcaxarcSZY1wil
         Wj1bpm8/lVjbTOmDZ8cCLEoq/gOb1Hru00hx1k24c4i/HD9c4Sx5l05zgNYcvtMrNP8L
         chXw==
X-Gm-Message-State: ACrzQf34nqMmdfqwcemNH0QcALryIzaZxMpxHpsPLqEaInn0dGqHM/9t
	LGGWFaA84yQq6kFoaouzDl0=
X-Google-Smtp-Source: AMsMyM6v6VmlO+ju8JeVienNERY/Zhv62XiVmwS1oScww+yPkbn76f46Xgf3QkI7vg/n0cn6KKLMpg==
X-Received: by 2002:a17:906:9be3:b0:7ad:d3a4:9df3 with SMTP id de35-20020a1709069be300b007add3a49df3mr1023758ejc.682.1667157340784;
        Sun, 30 Oct 2022 12:15:40 -0700 (PDT)
Received: from [192.168.1.102] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id ss23-20020a170907039700b0077a201f6d1esm2099475ejb.87.2022.10.30.12.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Oct 2022 12:15:40 -0700 (PDT)
Message-ID: <3aa15459-6e0b-7101-178c-424a066b7dbc@gmail.com>
Date: Sun, 30 Oct 2022 20:15:38 +0100
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
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221030173326.1588647-1-martin@kaiser.cx>
 <e032d410-60ed-9e0b-2818-bb849adebc78@gmail.com>
 <20221030184840.2root56lrro57xo5@viti.kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221030184840.2root56lrro57xo5@viti.kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/22 19:48, Martin Kaiser wrote:
> Thus wrote Philipp Hortmann (philipp.g.hortmann@gmail.com):
> 
>> On 10/30/22 18:33, Martin Kaiser wrote:
>>> Clean up the handlers for action frames. Summarize common code, remove
>>> unnecessary return values.
> 
>>> Please apply this on top of the "remove the last get_da calls" series.
> 
>>> Changes in v2
>>> - remove on_action_public's ret variable in patch 3, not in patch 9
> 
>>> Martin Kaiser (13):
>>>     staging: r8188eu: replace a GetAddr1Ptr call
>>>     staging: r8188eu: remove duplicate category check
>>>     staging: r8188eu: make on_action_public static void
>>>     staging: r8188eu: make OnAction_back static void
>>>     staging: r8188eu: make OnAction_p2p static void
>>>     staging: r8188eu: remove category check in OnAction_p2p
>>>     staging: r8188eu: replace switch-case with if
>>>     staging: r8188eu: replace GetAddr1Ptr call in OnAction_p2p
>>>     staging: r8188eu: clean up on_action_public
>>>     staging: r8188eu: remove return value from on_action_public_vendor
>>>     staging: r8188eu: remove return value from on_action_public_default
>>>     staging: r8188eu: rtw_action_public_decache's token is a u8
>>>     staging: r8188eu: check destination address in OnAction
> 
>>>    drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 116 +++++-------------
>>>    .../staging/r8188eu/include/rtw_mlme_ext.h    |   7 --
>>>    2 files changed, 28 insertions(+), 95 deletions(-)
> 
> 
>> Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
> 
> Thanks, Philipp.
> 
> I just realized that I forgot to add your Tested-by from the previous
> version. The final code hasn't changed in v2, only the intermediate
> steps were fixed.
> 
> Martin

Hi Martin,

thanks for the offer but I prefer to test each new version by myself.

I do trust you a lot but mistakes can always happen.

Bye Philipp
