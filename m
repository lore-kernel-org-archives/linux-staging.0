Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3713FD4
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 15:08:24 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id i21so10648080ejd.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=luLtgVsRYvhjNV2R6skXurVla6FjYBVfUo7wHBZR2Jc=;
        b=Ol506r990pF34gH1cyki1sCND0sCyZfV9xHf5t7mYTLdSR7vAQvvExRD7EhZCcsmGc
         oatBgvFeUc4fg+V6Zssvg47ufSRB/1zBbSj7ne8vGUf2yCRN9VWbPcEZyH4xudmbsVUP
         YOli0u6aNVoOPx63PAcvkKXOPS3QZSE6N1pJdES1323NBThWzif9HhJY2wXdLjNaJBRo
         g9hh8i9gAot2fUrx4xzdljTjVLpzWOUlCagtSN1CTNqaHiKlKS29NseJ/eHb0T6c3J7F
         VTMcPdKw0JkSNrEx8K+uzopYFgCXJf9v50ws9ckLVYfec6a5TtRJGzTm72EsnwAb10zi
         xNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=luLtgVsRYvhjNV2R6skXurVla6FjYBVfUo7wHBZR2Jc=;
        b=y0fcF/PKzXPLPCdZ1r3FPRJMzzW0dvMyvLUTG5ifALfBV0O6UwuL6ySs6lke/sPGyx
         2Fxx7UGZFTu7fWLVg7fRyIFRalGC7zmWFwc11f8QtQYQ803ECzF+hLffEGMb0gbwwAS/
         nixDw+5OuFmEIYFQme5jV8By8nAQInv9z5HEXAiLZJUcTrFopIMU0ex7tLnP4ca767sf
         lyVXPDSIlpIjNxt9xr6zqg5EMxq55sQxvh1eoORYN8FuD3LbIVoWkR/bw+BdcQRBVUQK
         wlpalXsotK5DXAYNwrHlpuiZmojWTi+rVcVrP4Z6j1i16iywssX6pSagMgR2XyL4UiB1
         +6OQ==
X-Gm-Message-State: AOAM531/Y3XxStW2jIlydV7HqNO8pFf31EHmciqtSqVU7joQxre4jkYO
	H3ELtEubN2xAWfxLKWR/xCQ=
X-Google-Smtp-Source: ABdhPJzcdyQrGjadBfMfKIIvdHGyri/f/+WFTtB1NWcii3TbqSW5IL+cpZjR2wIXoan6uB5LyRU0dA==
X-Received: by 2002:a17:906:9401:: with SMTP id q1mr3258675ejx.313.1631372903369;
        Sat, 11 Sep 2021 08:08:23 -0700 (PDT)
Received: from agape.jhs ([5.171.73.66])
        by smtp.gmail.com with ESMTPSA id q15sm884722ejx.3.2021.09.11.08.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 08:08:23 -0700 (PDT)
Date: Sat, 11 Sep 2021 17:08:19 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove possible deadlock when
 disconnect
Message-ID: <20210911150818.GC1367@agape.jhs>
References: <20210902093559.9779-1-fabioaiuto83@gmail.com>
 <c730848c-3c8d-1e49-fa74-b956400a5d3d@redhat.com>
 <20210911105307.GB1407@agape.jhs>
 <bc640665-2768-6add-d523-6ee80849eb98@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc640665-2768-6add-d523-6ee80849eb98@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hans,

On Sat, Sep 11, 2021 at 01:33:59PM +0200, Hans de Goede wrote:
> Hi All,

<snip>

> 
> Ah I missed that this was already merged. Since this is already merged
> the issue which I noticed should be fixed with a separate follow-up
> patch (with a Fixes: tag, thanks.

ok, I'll do that.

> 
> Regards,
> 
> Hans
> 

thank you,

fabio
