Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0FA6FA1
	for <linux-staging@lists.linux.dev>; Wed, 30 Nov 2022 18:20:22 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id s12so25189056edd.5
        for <linux-staging@lists.linux.dev>; Wed, 30 Nov 2022 10:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9xqRGz1xSslCtB0mvFK3dCdt0jFZSRD11Uuiv//RHo=;
        b=TLD/IceM5UcmZNQ1KZemZVo2iQVdc/1MDLhV7LoqCtcRZS8sC/pVSZRSshoHCn+ZWm
         Oo6fUQbyy2D6/fT9i8pQSi47O1wB8ZZsKsfN/GUceaBVRCes76FHL2W9FU/ABSgE1PAv
         +CQojOwtmAqwA2QJ20hTUsL7umC6zmvsRG8axjI9FNBfamhMHpA3vpoxASJTSL1h9JOy
         txi6lKp8UropEUUGRuyVzwmTUocI5ynwNFQVhf9DX4Bw6Q6JZeGrN2UD330Qz3Qwry3I
         B7+Iq45euH4iFnh/FuSF2sGiiNfU54ndk2yaTIiDSmZovkE4zGA58cwF0K1uV81x4MB7
         i8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9xqRGz1xSslCtB0mvFK3dCdt0jFZSRD11Uuiv//RHo=;
        b=Imu7yzKgrzFDa2Z5DnjuBX3PwxDnfxjNT1ZPZakcOnffqtbzkHvUgSRATHxhOAtrLM
         AnC3Sty3r63RgI6JfHp+hjkyVugp7E5lNqr791ofUeRx9MYSI+9LFKF/z4E7kMUqDMJA
         clQDsQjDyXaaRK/CVn8RV3bvbAt5tEEJdpzBIrr+uIJF/hLIJgtRM2GBRdlc+YY6CES/
         TtYD8+W99lExnxcHf1zAwQQKhvB0R6bXAk+FlEATyjO1QUFyrHE5CLamTFvdsl8nzx57
         3mHkxQZ10zIEh8ofY/vqeVWAADagQhpWa4cCx/Bz5aUp9kFrLOfzFz6U4Jzsngri7til
         ewUw==
X-Gm-Message-State: ANoB5pnECBqja2PNTKpYWdVELHGSJcYFccZbWLs6RpP+koBNQFbrD7d7
	0WjPIwYvG0FXvqUZK6oZcFJOz/yGuok=
X-Google-Smtp-Source: AA0mqf5neyWSsNdfRR7tR8TUGmuQLDl8sVDAGKKnK+PbwdhNqO4Lfr/sfsSthWGU48gQTGRpZ4bNnw==
X-Received: by 2002:a05:6402:530c:b0:462:df63:5ec5 with SMTP id eo12-20020a056402530c00b00462df635ec5mr56788105edb.147.1669832420465;
        Wed, 30 Nov 2022 10:20:20 -0800 (PST)
Received: from [192.168.1.100] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id ky16-20020a170907779000b007c08091ad7esm887001ejc.208.2022.11.30.10.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 10:20:19 -0800 (PST)
Message-ID: <a9f7f851-af2e-a0e1-adb9-d7cac6c0c57f@gmail.com>
Date: Wed, 30 Nov 2022 19:20:17 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/5] staging: r8188eu: clean up OnDisassoc
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221129205152.128172-1-martin@kaiser.cx>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221129205152.128172-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/22 21:51, Martin Kaiser wrote:
> Clean up the OnDisassoc function. Use a struct ieee80211_mgmt for parsing
> the incoming message and reduce the indentation levels.
> 
> Please apply this after the two series I sent some days ago
> 
> Martin Kaiser (5):
>    staging: r8188eu: use ieee80211_mgmt to parse addresses
>    staging: r8188eu: read reason code from ieee80211_mgmt
>    staging: r8188eu: move bBusyTraffic update
>    staging: r8188eu: handle the non-ap case first
>    staging: r8188eu: simplify err handling for unknown station
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c | 47 ++++++++++-----------
>   1 file changed, 22 insertions(+), 25 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
