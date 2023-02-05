Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB6A33C1
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 17:09:29 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id k16so7154238wms.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Feb 2023 09:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4QiDXFr4mw240bfzl7O2fxCsJ5gItiHfX5GZV8KWs0=;
        b=MfGb2jnj85yUo0O5qUfMu5TFbaUgFTQ6R9c22GpHDRQ6kSBCFJm2ExS13SfoiFETDV
         2+l+SgRn+6fiHGC+SA6PGSDkfhFRqL8+LWhbuAY6L5Alnso2JC4z/S4o7LfePbuEKmcZ
         hpTE6XKHLj1hi3KGH9MEPlosm7/9a4cAjGSaJ8Uhdd5QFG/oqCoDHUUY358SrSrQw7a9
         jbBZBLGC1MxfeyYM3uYlSVfvgLz1jXlGm5zHD8BfxnUGGy+I9bzENsqeeEd7PZZ5YuGb
         Ji6ens8o2PIABPaYdrQX3rN5psMKwMSq25mgPbMV/yNTLAjecILZXAyl2hgx8C12YZHY
         NtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4QiDXFr4mw240bfzl7O2fxCsJ5gItiHfX5GZV8KWs0=;
        b=ni5bwGyQM3T5X41z3f3BraIveHZhepB5Lv6bAO2Or/rfsx5ve7TgkZE/es2OS+kPir
         du0e0HBUZMyLx5A/M75rCQQ+IwL+BPsQO5hM2IJIPNsEzDCIVp593a9Ry5PGNBkShDY3
         1zn+mwTu3FMUTB8kijvth3BN3KKPuoEr8Tz3lwZR4f993f8PPXm8Iok6/NNXsOxNj3lB
         tu/3xYnqOKDgOyAq/sugqcIThyeJ5m1i4BI+21QMFXm0BegqX86kK/pLDNQHPIm0Ycud
         byMqPctdX6DgQRm2T7G0M+CDeBRxHPfHhoODJMteaxftHoSIRkh6oGyvYriT5mlZmFUS
         8evw==
X-Gm-Message-State: AO0yUKXz+DU/ux1AY422Nj3uhwgdfbk7C2ygT8rilxiTAhsO+Db49ndF
	/Yx2qPk8Ma2g1/b4IqVvA14=
X-Google-Smtp-Source: AK7set9AaQcIhMbVdATIo7OI8LzRZGYzrEufzDnETwznpV2KfLtuXtAkmQV7lfP0nh7pLov8WaJLxQ==
X-Received: by 2002:a05:600c:1d9b:b0:3df:fc67:cfe4 with SMTP id p27-20020a05600c1d9b00b003dffc67cfe4mr1924532wms.3.1675616967388;
        Sun, 05 Feb 2023 09:09:27 -0800 (PST)
Received: from [192.168.1.102] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id p16-20020a5d4e10000000b002c3e4bec4dbsm2021392wrt.89.2023.02.05.09.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 09:09:26 -0800 (PST)
Message-ID: <cf5e714d-dd02-7e30-bfe7-7b32cd198c82@gmail.com>
Date: Sun, 5 Feb 2023 18:09:25 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/2] staging: r8188eu: correct error logic of two
 functions
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230205080559.8319-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230205080559.8319-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/23 09:05, Michael Straube wrote:
> This series converts two functions away from returning _SUCCESS and
> _FAIL. Another tiny step to get rid of _FAIL / _SUCCESS someday.
> 
> Tested on x86_64 with Inter-Tech DMG 02.
> 
> v2:
> Removed the initialization of the variable err in _rtw_init_recv_priv()
> since it's not needed.
> 
> Michael Straube (2):
>    staging: r8188eu: correct error logic of rtl8188eu_init_recv_priv()
>    staging: r8188eu: correct error logic of _rtw_init_recv_priv()
> 
>   drivers/staging/r8188eu/core/rtw_recv.c   | 30 +++++++++--------------
>   drivers/staging/r8188eu/os_dep/os_intfs.c |  2 +-
>   2 files changed, 12 insertions(+), 20 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
