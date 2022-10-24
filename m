Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718B6441F
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 17:43:11 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id a13so32936313edj.0
        for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Arus5XmLATh0hrszBUYGKJKk3UkG2N7lr9RQnONL+hA=;
        b=CGGp2YNMdt8XsvQvysckO5V4zZaQvng0llkIgMcgjwM17om7FSIewR8exp9f4V+9Gf
         gZd6x/F+b6J4CtMD04rnw+Kai+UMy5Fb1dVwO6mwKy3pmG9wC8VWqTpafnFyvE0vIKqk
         uJ3038/greWpQ5SdE/1gHcToDnBjcJpXyNK9bBtqeekkGmIutAIIZkiLQMbPrIlixMOn
         nnUU1odS45fwWk6YLIMq7fiR03c3ow6+wENXEjnQo9RBXmdoCT5MjticWAkGJOj07rF3
         S5v/KvPW7zieUbuIiYL7fafH+cw0j/zcf4mjdGfKYfwJdOSLT6FIVA6AkIDJMU6JLOYD
         H2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Arus5XmLATh0hrszBUYGKJKk3UkG2N7lr9RQnONL+hA=;
        b=wGM+1/fPAjaSSJOgK5ncc8+GmJdDH2aDB9UUT4Noml8B2qQ2fHieAZB0SFLWitkGpP
         vlIzGMJJq6NROm0HcXQ3I6IVzLQY4jrEeBAGpFpSpG2mPOFqepZUQ9UdiGd7hxB6Vt8P
         3A6G9fGRw3BX9oflGQp5uKEH229ZdbjUQausmJhqAXAKgNer7dcUBNepvZKzpdTN8VZl
         RKAcF+ISNHE+7DMTj4YsB++vmoxtY4h8YLLdjU6n3FearAZ5oglbF/+hNxPlruv7vc9h
         P1zJYk9l1PILcNt/xOiC1UYHprCWz4HTHFDQ+0YDg3XSiBqVuFwBb6yFu1RL4V+7OS5X
         LxZA==
X-Gm-Message-State: ACrzQf2ScZ21oT4JzNerqtDAk9lg+o9TNmrBtD26N9k3DHFECdTcGuAy
	Z3Xqh72y9fuaR337sGxq2MY=
X-Google-Smtp-Source: AMsMyM5LcLhvlqgdoWsNB+Hcbxc1CZFnxBHYUwXqDUQLSs1dFYr6aPpyn4GbexRwJVvOjU68Ouq1Ow==
X-Received: by 2002:a05:6402:3512:b0:461:e146:d2e7 with SMTP id b18-20020a056402351200b00461e146d2e7mr3682600edd.39.1666633389656;
        Mon, 24 Oct 2022 10:43:09 -0700 (PDT)
Received: from [192.168.1.103] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906318d00b007317f017e64sm173889ejy.134.2022.10.24.10.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 10:43:09 -0700 (PDT)
Message-ID: <f4a70a29-4c27-c091-4332-dc476e258b74@gmail.com>
Date: Mon, 24 Oct 2022 19:43:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/17] staging: r8188eu: clean up mlme handlers
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221024081417.66441-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221024081417.66441-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/22 10:14, Martin Kaiser wrote:
> This series cleans up the mlme handlers that process incoming management
> frames.
> 
> We can reorder the handler functions and remove forward declarations. We
> can also remove unused return values and simplify the error handling.
> 
> This series should be applied after the "some more small cleanups" series.
> 
> As usual, this series was tested with EdimaxV2 on an arm32 system.
> 
> Martin Kaiser (17):
>    staging: r8188eu: restructure mlme subfunction handling
>    staging: r8188eu: make OnAssocReq static
>    staging: r8188eu: make OnAssocRsp static
>    staging: r8188eu: make OnProbeReq static
>    staging: r8188eu: make OnProbeRsp static
>    staging: r8188eu: make OnBeacon static
>    staging: r8188eu: make OnDisassoc static
>    staging: r8188eu: make OnAuthClient static
>    staging: r8188eu: make OnDeAuth static
>    staging: r8188eu: make OnAction static
>    staging: r8188eu: make OnAuth static
>    staging: r8188eu: change mlme handlers to void
>    staging: r8188eu: remove unnecessary label
>    staging: r8188eu: remove unnecessary else branch
>    staging: r8188eu: remove unnecessary return
>    staging: r8188eu: remove an else branch
>    staging: r8188eu: go2asoc is not needed
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 226 ++++++++----------
>   .../staging/r8188eu/include/rtw_mlme_ext.h    |  23 +-
>   2 files changed, 100 insertions(+), 149 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
