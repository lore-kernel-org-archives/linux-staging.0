Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54143FC3
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 12:09:18 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id l10so3025183ilh.8
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 05:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8cZI3JCuLp/VE4CkVId11EMKSems40tyrkIK1Be1ftw=;
        b=BckSNcvNMOcvSd7v/oDs69GDBnbITTcsGLEeGp8WOKnquld8s9ItFWSEGz5vLrfhcg
         yZT1kbJOOWEFIjzCNC9W2lGpzCSJvssMvpUXf8N+Axb0aahsxStSy8NofhulPdABX4F9
         PQEhQGx63KhfCLo0nqeg29DuVeFqdO7s5JEkA07Vd6pEzuXT2moy4Rt3GMOrs6Ngd9/C
         zbzWY+GPjk3eKj2oGR2aoDlVz1Vm2z7uv2FCN/5IlVFvAXkrHQmXAceheN+crJ+7FscF
         ee0K2dpeSoHlQCOFIfd1+wc2lpL7rGJqsH+uSHL4Lru7Ma5brXDQ+lHnloOjiQ7/jaE2
         QY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8cZI3JCuLp/VE4CkVId11EMKSems40tyrkIK1Be1ftw=;
        b=Oqa9qtRNJvuU7jpxJAeUpstkWd05O3bQpYeY45U4emdHKZwhha0ekAiWehhhg2Tj6C
         FC1TD59o30y2/bNhXn6aC1fjK/TWdpbWPaDYyd8rupWrP+WdugFkXJNrHasYxNN7uRp/
         jRkRHpnW448OjLkfxbdj2gYUMFrG4/AWt/S/hiZJguZCQH58Bg6GJi/Yp4t466eDz97p
         hX9dBY4EYJvfeIliWg03CsHjC1iUP2HLBOCWHnBciPWNQAlc37Nv4lKxVLqbAZnMQw+s
         AgE9+iS1qYvS2ET91s2xLvwjZoJ5BqCscQe/vIPf0NHQkJkGR3d+ta0IAPq8wmhEcu59
         sNRg==
X-Gm-Message-State: AOAM531JWLTlqvd8UtJWz9pLwaiiwMgy3LlxqIMzYffedzdtmTioHUDu
	i5SbiAhNeIC/rOSfip5mOsCYjQ==
X-Google-Smtp-Source: ABdhPJwbWbqjZ2YXu2DKUD2OmK1e0Bsf5zCBQX/yZA3LIScSzqxAeN61s6ns9w3+r13R/STby73GUg==
X-Received: by 2002:a05:6e02:1d9e:: with SMTP id h30mr24434965ila.195.1630498157795;
        Wed, 01 Sep 2021 05:09:17 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id z7sm12046546ilz.25.2021.09.01.05.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 05:09:17 -0700 (PDT)
Subject: Re: [greybus-dev] [PATCH v4] staging: greybus: Convert uart.c from
 IDR to XArray
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Johan Hovold <johan@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Alex Elder <elder@kernel.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <f7a25eb1-20f4-5031-a156-9e5dc019ad28@linaro.org>
 <YS3jSsGSs0yAw/Ba@hovoldconsulting.com>
 <6155058.TBsaUTXu4T@localhost.localdomain>
From: Alex Elder <elder@linaro.org>
Message-ID: <794b3ff8-0240-ff14-8721-cdf510f52be3@linaro.org>
Date: Wed, 1 Sep 2021 07:09:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6155058.TBsaUTXu4T@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/31/21 6:50 AM, Fabio M. De Francesco wrote:
> I was wrong in assuming that trivial patches to Greybus are welcome as they 
> are for other drivers.

This is not a correct statement.

But as Johan pointed out, even for a trivial patch if you
must understand the consequences of what the change does.
If testing is not possible, you must work extra hard to
ensure your patch is correct.

In the first (or an early) version of your patch I pointed
out a bug.  Later, I suggested
 the lock might not be necessary
and asked you to either confirm
 it was or explain why it was
not, but you didn't do that.


I agree that the change appeared trivial, and even sensible,
but even trivial patches must result in correct code.  And
all patches should have good and complete explanations.

					-Alex
