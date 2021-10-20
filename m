Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB22C85
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 16:53:52 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id u6-20020a17090a3fc600b001a00250584aso938744pjm.4
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VV4gKjb5q3InvQuFZgN/2M6NLR7nDDUQM+TD7K15UaU=;
        b=PoBWa8vFnCFDDKBuS9w7pF1Z0Ik82845JKkhUa0cRh1sSNGcy9q9d8l5JheDt/EzgS
         w33brJalTFQYM3mnlwzZ2QvW/2UvVcisEBuGtrRxhs74k1xttaSAaFgudbXPTUUqRb/L
         KNcFNF74DCcF2shFELVjedIMzeTYJalytaS0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VV4gKjb5q3InvQuFZgN/2M6NLR7nDDUQM+TD7K15UaU=;
        b=f+Ah3ERtm+b+gcIBBke8UjHLorc6gMRlAFDNjuHafrRrGVAOLnwChWvMZNdYXQUmHq
         5NBT+QQG5U3NgDY39NZFGpA9sIgliydIKKjfJ1H6UiKx/4Eds0WiZMSz45zmKmp9Rr07
         7nqcXqCT60jm51riY5kvWoZbRNmR5zC2gkI9/han9s1Us+F5yASyURKjXxqqNE9E065b
         Yzxcg5O0WDt3MfP/duKbU/L/we4inYMmRrTlA2GgNDcXH+UrjdNi3iIEril459KQBeKv
         xaAV9YuFq9m0i06FzjmK6ioWJKYol9vmLu32rTemjyVTPwdBxIci/qeoHxuRJTzt3SB1
         KnVA==
X-Gm-Message-State: AOAM5321GPwCtlp1yOM4djdmqRezxWoGcu5xKKgClPuHmSM7kyvRd6i6
	DX7ci4PvgqAHVgMntFlh80gvzt4jRTYnpg==
X-Google-Smtp-Source: ABdhPJy2Tr3Ix6ysLcBpNlUFmI7xxn2/3s/Gqkbn4COgLy35uemPtJplobdvWOyP/3ACMtZat0ALJg==
X-Received: by 2002:a17:90b:1e01:: with SMTP id pg1mr112240pjb.81.1634748832371;
        Wed, 20 Oct 2021 09:53:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h22sm3054058pfc.116.2021.10.20.09.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 09:53:52 -0700 (PDT)
Date: Wed, 20 Oct 2021 09:53:51 -0700
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 8/8] staging: use eth_hw_addr_set() in orphan drivers
Message-ID: <202110200953.EC9629A0@keescook>
References: <20211019171243.1412240-1-kuba@kernel.org>
 <20211019171243.1412240-9-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019171243.1412240-9-kuba@kernel.org>

On Tue, Oct 19, 2021 at 10:12:43AM -0700, Jakub Kicinski wrote:
> Commit 406f42fa0d3c ("net-next: When a bond have a massive amount
> of VLANs...") introduced a rbtree for faster Ethernet address look
> up. To maintain netdev->dev_addr in this tree we need to make all
> the writes to it got through appropriate helpers.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
