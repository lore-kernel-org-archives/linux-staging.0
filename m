Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653D67B;
	Tue,  1 Nov 2022 22:15:40 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id k2so40703760ejr.2;
        Tue, 01 Nov 2022 15:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Tj6LMlid1xqeP/OugEx6eshEoLxwhpJ2MaPH/4J8sc=;
        b=HTFJBL9J0F7Z1cd/8Hjsp3KSPVYnmAiSIdeEF+dtoljPVhoG5SMj9H8jzOvl/1ur2b
         INV80sxQYR6xrhtKoMgnQI8qr+moluapFVh0T1sGH+k+oTlVt7CzdEzhLmSpfMfCTEMz
         Mu/uX7n+gyVhBQASGIOpfy+OmRrgQHvseyi5eDbcLrqm5AoKI+hsZPfXIWOkgmJK4CPd
         LL9gCZS8ptzuhukIUo8s51ZwGvvmAfMT0Os816kLJYxWsjUCUUAVb+aIXgYClDB82h8J
         XRhihvbP1Mivm2jnjFuB+8KkIxrwluOUZs4YeisAirTZzli6odoGA5JrkhKAJf7ECoW8
         j/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Tj6LMlid1xqeP/OugEx6eshEoLxwhpJ2MaPH/4J8sc=;
        b=Vk2vA1TDOpVquaj7B2UztfZHNF8duAiwTe1bZDDOWl2A3CHZscDnn6saFgumkG+coX
         QGsU7phPu7cZBkl6x2fWb/CF+rkGnFXIkGwCGJF+igvQiAF7fgw7bpiCEIlJEH04ZClv
         0zWLikF9cHKEqr3kqSCo7Zs6WCu29FXBG02udCpF4Jhyt2TKY0+N/LESIONqs0O7MQEc
         2TdKLpYZDOsuSN2Vpm0AY1ACtaxwSp0KsIdm0sUu7cW2mnLVTvTaDNs71hHPUjvZYmSP
         KkgF8ycZMH4ZU9cScMyecQraOlCClrFM0XF2nZmGpZXDB5kjYrD3Zquc4wuYgVle7HAb
         0RHw==
X-Gm-Message-State: ACrzQf098Z5KoDgZXhLF9f68G+oxSsCWUkjHkuBOPlyPxds5fBkJybaB
	mV1oMiAvEnYWPFLkOY4acUU=
X-Google-Smtp-Source: AMsMyM61egOW8fwD1jxTVRXlrrlYoJderSJOPSy+elRTByUuddOZPISb2AArbAAKex/5lgo5BZLTrw==
X-Received: by 2002:a17:907:971f:b0:7ad:e232:f115 with SMTP id jg31-20020a170907971f00b007ade232f115mr8922207ejc.754.1667340938658;
        Tue, 01 Nov 2022 15:15:38 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:b885:c7c8:ee47:4872:331d? (p200300c78f2ab885c7c8ee474872331d.dip0.t-ipconnect.de. [2003:c7:8f2a:b885:c7c8:ee47:4872:331d])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7c1d9000000b00456c6b4b777sm4874818edp.69.2022.11.01.15.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 15:15:38 -0700 (PDT)
Message-ID: <f67a1a02-addf-3197-e423-7c66ab97f6df@gmail.com>
Date: Tue, 1 Nov 2022 23:15:37 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/2] staging: vt6655: some checkpatch fixes in the file
 rxtx.c
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <cover.1667326000.git.tanjubrunostar0@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1667326000.git.tanjubrunostar0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/22 19:17, Tanjuate Brunostar wrote:
> These fixes are focused on the function s_vFillRTSHead
> 
> v3: changed the function name from fill_rts_head to fill_rts_header as
> head is conventionally used in lists
> 
> v2: changed confusing changelog messages
> 
> Tanjuate Brunostar (2):
>    staging: vt6655: change the function name s_vFillRTSHead
>    staging: vt6655: Join some lines of code to avoid code lines ending in
>      (
> 
>   drivers/staging/vt6655/rxtx.c | 48 ++++++++++++++++-------------------
>   1 file changed, 22 insertions(+), 26 deletions(-)
> 

Patch failed at 0001 staging: vt6655: change the function name 
s_vFillRTSHead


WARNING: line length of 138 exceeds 100 columns
#58: FILE: drivers/staging/vt6655/rxtx.c:915:
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, 
bDisCRC, psEthHeader, wCurrentRate, byFBOption);

WARNING: line length of 138 exceeds 100 columns
#67: FILE: drivers/staging/vt6655/rxtx.c:934:
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, 
bDisCRC, psEthHeader, wCurrentRate, byFBOption);

WARNING: line length of 138 exceeds 100 columns
#76: FILE: drivers/staging/vt6655/rxtx.c:948:
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, 
bDisCRC, psEthHeader, wCurrentRate, byFBOption);

May be you need to consider to break this lines.

Bye Philipp
