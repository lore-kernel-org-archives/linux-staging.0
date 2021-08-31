Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318E82FAF
	for <linux-staging@lists.linux.dev>; Tue, 31 Aug 2021 19:19:24 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id b200so98078iof.13
        for <linux-staging@lists.linux.dev>; Tue, 31 Aug 2021 12:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BnfnduHx3i2X80cz742KibQtwDjAziOnxR1dEDNguNQ=;
        b=k8Uq/xSxlaLj3DJmwHqi3zi23+XTDI345vnvhN5QS8pnpgx8a0Q49xhD5D4KS8+DLC
         gtYdQDcKGi80NEfOReWj/tPYUGw6JOZLDane/KBJPXnNoHM9WB2/1f+riot8p/HOeB7G
         u8BARTX9hRBylvw5eZW2vgu6vn4Si0ptrSmEEckvMh4M/81RefCoqC1u5cM7rBtbBLNs
         z5Hpha8wYRq/8xulDm1+MfqK4W0ggyxAhzcul7WLDxCMRZq6YH10Lb4hjPT1rOlWa6Nc
         WC0yq2hPUZ3DtgBpKPenD7oBZyvF3EX39LxtgC0rOpCGm8b2Itupimky3nERNn1xhvv/
         A1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BnfnduHx3i2X80cz742KibQtwDjAziOnxR1dEDNguNQ=;
        b=E9N/BOEnQ/gt/u57oQ0AEecmn2QB+4sDaXP0fhQFHixjjVR1Tu1b1zVj8ZhnuJ/xW0
         khBMuM8e8kTHLYVkV57tpkq8+6z3Iqr4oqzTdqM6nO4ZKMkrVzX+b+qM51+Ai4UpI6Rl
         9ZEByQqPJUbIm+rnqID0CYkmUdiW4+YKvdjlgxW8FEMG5/P9xFtmsWNAtOoIvz47S0lo
         pCDT7Ldhsov+5QPuf3m+QXNPEwDQbMUsY+xGuON6L8lKgtFxkzYRF41L7VTJnqBYh+Uj
         I5V0jlBj5t8INQMzHJd0PoNvsqffYmrmIR+cdTyrAnnyMfr7V/B2b0AhtSdwId4Z5jL4
         395g==
X-Gm-Message-State: AOAM5336FiHOjEPvelfv4YyUqNLavVHek2WMhJlQKVLBR01CnP5K7WKQ
	6abvxKHlTzCU3n2ZMgRYPggGhA==
X-Google-Smtp-Source: ABdhPJzLpm8haUqn3kfzyuXtg4CiQZwskLDtRsRbptxnszVRu77+8NA0/wO490W6qNwD3GPt10CQDw==
X-Received: by 2002:a02:2348:: with SMTP id u69mr4216099jau.141.1630437562446;
        Tue, 31 Aug 2021 12:19:22 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id c23sm10143469ioi.31.2021.08.31.12.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 12:19:21 -0700 (PDT)
Message-ID: <1484b5ebb9c943c72d7d7a0481c1a2cd9899705b.camel@ndufresne.ca>
Subject: Re: [PATCH 0/2] media: HEVC: RPS clean up
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
  p.zabel@pengutronix.de, gregkh@linuxfoundation.org, mripard@kernel.org, 
 paul.kocialkowski@bootlin.com, wens@csie.org, jernej.skrabec@gmail.com, 
 hverkuil-cisco@xs4all.nl, jc@kynesim.co.uk, ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Date: Tue, 31 Aug 2021 15:19:19 -0400
In-Reply-To: <20210831094900.203283-1-benjamin.gaignard@collabora.com>
References: <20210831094900.203283-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per discussion with Ezequiel, I think this patch should perhaps be made an
RFC titled "media: uapi: clean and make HEVC uAPI public". Keep it RFC until we
have collected all the needed changes.

Opinion ?

Le mardi 31 août 2021 à 11:48 +0200, Benjamin Gaignard a écrit :
> This series aims to clean up Reference Picture Set usage and flags.
> 
> Long term flag was named with RPS prefix while it is not used for RPS
> but for mark long term references in DBP. Remane it and remove the two
> other useless RPS flags.
> 
> Clarify documentation about RPS lists content and make sure that Hantro
> driver use them correctly (i.e without look up in DBP).
> 
> Benjamin
> 
> Benjamin Gaignard (2):
>   media: hevc: Remove RPS named flags
>   media: hevc: Embedded indexes in RPS
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 12 ++++-----
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 27 +++++--------------
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  2 +-
>  include/media/hevc-ctrls.h                    |  4 +--
>  4 files changed, 14 insertions(+), 31 deletions(-)
> 


