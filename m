Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B9F2941B
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 14:17:40 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9b2d64c9307so38343266b.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 07:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696342659; x=1696947459; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HI34v6enrzXzY5NrqWLUUaWvQE0QecGPMbWgelnAX9Q=;
        b=Ilto94PxnOdc2PbA6SGK/Xo8nGQ9XkyteDXeP9Py+osO9oF026iBL4ltsnRZB+sAlk
         yF0q9+RtCLYVJ3pcSdH6WxNHujKYU4YA+DWr2E0lm3RUPz0sJMyxMLycDCN0/0rqp5l6
         x1pRGYKPMIEJpVcGKhbwmo7syVLrSs2cJy6M9Udu5uhwuEWM9szK83dn4YsrUfKhW6Nl
         R2CDt8u8nEeViAHsgsASeu4qgBlTTn8bf9Jwid/pPbBDIKgEaG2FGjLBRg9vhISCHryw
         YM/9PoVAQfLtnWT1mvCH3nB4tnswCnFeIZdaORcTOZZVxVY4Diie359XrzWwjiByjlYi
         aEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696342659; x=1696947459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HI34v6enrzXzY5NrqWLUUaWvQE0QecGPMbWgelnAX9Q=;
        b=FMfL2WorCJUNrFbQLS6CElHl92jU1sldu97AXa2gbSXsDdJ7OnmnA6Zbmiyg8S7+yJ
         TtZm5KXxV5ohL18RHQ1efI5JzficAZhgWsWrD0WT98KLPASBR7F5vP+FtwMyAYpIerUT
         JyFT6m2vEEEn2PRwJnuaCYo8Nmga34xOonEZoNJTbEBT3BFyIZe5J1XAPZnjOOlDqF5e
         syay9zHvjdOr9A9QdOkgOfs89g7MuH/IGgwaey2SPHH523SPF3rm8NSGbA6Lu3F/fqEG
         hSJ0y4+zg7aznVjFrYAHHbJ3B4kBJzXI9B/s2gpICS8F6z6f+lFVDFFTwxAwf2KEFYN3
         0EGA==
X-Gm-Message-State: AOJu0YzYHwe3pHmQ3YGsKnUPfpqhJdZxwYPWebxdLcypClB6uCkcFHv6
	VzsDYnkvqWT/5kvFNu4yK1RoB/GUsKc=
X-Google-Smtp-Source: AGHT+IEbKVCzw3Lfku0fwJ0ozzk3Sfk1w53bdcdkhYVx3IWl7AZ1y4xaY3AZZt0azRiyV+SzwLsjRA==
X-Received: by 2002:a17:906:28e:b0:9a1:be9b:c935 with SMTP id 14-20020a170906028e00b009a1be9bc935mr11939852ejf.0.1696342658605;
        Tue, 03 Oct 2023 07:17:38 -0700 (PDT)
Received: from [192.168.0.106] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id kj6-20020a170907764600b009ad88839665sm1147153ejc.70.2023.10.03.07.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 07:17:38 -0700 (PDT)
Message-ID: <f4a30e07-e967-a734-8892-068514c0ea0a@gmail.com>
Date: Tue, 3 Oct 2023 16:17:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/3] Staging: rtl8192e: Rename variables pBA,
 bCurrentHTSupport, and pTSInfo
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231003031849.176743-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231003031849.176743-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/23 05:18, Tree Davies wrote:
> This series renames 3 variables to fix checkpatch warning Avoid CamelCase
> Thank you in advance to the reviewers
> Tree
> 
> 
> Tree Davies (3):
>    Staging: rtl8192e: Rename variable pTSInfo
>    Staging: rtl8192e: Rename variable bCurrentHTSupport
>    Staging: rtl8192e: Rename variable pBA
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c |   2 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   |   2 +-
>   drivers/staging/rtl8192e/rtl819x_BAProc.c    | 112 +++++++++----------
>   drivers/staging/rtl8192e/rtl819x_HT.h        |   2 +-
>   drivers/staging/rtl8192e/rtl819x_HTProc.c    |  12 +-
>   drivers/staging/rtl8192e/rtl819x_TSProc.c    |  20 ++--
>   drivers/staging/rtl8192e/rtllib.h            |   2 +-
>   drivers/staging/rtl8192e/rtllib_softmac.c    |  15 ++-
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c |   2 +-
>   drivers/staging/rtl8192e/rtllib_tx.c         |   8 +-
>   10 files changed, 88 insertions(+), 89 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
