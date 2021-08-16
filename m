Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85AF2FAE
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 13:03:07 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id gr13so2519347ejb.6
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 06:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0gDpDkzRxQRlixBQR7npyfgn3bTr4IPbX9H8aX4jeAU=;
        b=cYLKOxYJTIkkHGCkFBWHO+SRTXY28id2ocgWbr/IwlFhPzitX+KATmadUdZwZJZTRq
         TpImd3bVbCk6+RzEBDDAZoBMxfyTbQ70AMUMN8HPP7h05vyUEo1m1TrU1XiebDV8zTBq
         r7R7CdpsAZAtCPgRkfQwZVyLEY/h/HMAjrWLkQaK2pniDSGdkseXy6/5qYoSZ+qVZO3e
         d+hNbpBI7unYL5dU8aTq4ZDXJa1jIGi4qyHEU/s46b+H2w5rDZxf45vHTGht8cgjnWpU
         /ogmQme+grhiMxc+BIc9x9Z5drNmmynscswKFK4MwXy5lP9E/EWgz0HNnidTa4mT7Mox
         lf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0gDpDkzRxQRlixBQR7npyfgn3bTr4IPbX9H8aX4jeAU=;
        b=fLsnq5k2DaCjzxeiwfRmsvmjcl46FW8orGqTM7ShMjjjF9lBPCm8V9zFCFTILzAFy+
         lqboITYo86RX2e9tBCc5I9MpRyQkZz3x2fxUM2d0vbhXHKPZ5tMJzmdDh1sMlNTQht3d
         ItoQcmNAVNJINyiFcitAjvJnBXq229E3KV//OJppLRsWuf3vXEsg1ZSoFR3j0beRYPEl
         fsoxHzgE24IuOIRM1+/uR38ocBh4mmTgDNk6KNWhXO3EfBAVNBYA4sr7eJo8VFDkx8/A
         0qYwjjdLVkbTwe4v0R766sfmM5KeLnWguYi2AWd5lWJdmLWRGeieqDd0GSmIOd4XoOnD
         b2Uw==
X-Gm-Message-State: AOAM533HpuFEj3Lz7xB5ujZRup8ZY870mO/vskq3GCpyUdhRNmnjdcWx
	W4Wae6mp8b3GAa/DOnCt9Ro=
X-Google-Smtp-Source: ABdhPJxc9AiiP8G8g58vtTbvxXAu9cyszcx03ZgTMcXuNeuwayn5MbacXdkxTyxdP7eguqx8qlcITQ==
X-Received: by 2002:a17:906:5a98:: with SMTP id l24mr15441373ejq.540.1629118986053;
        Mon, 16 Aug 2021 06:03:06 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id c21sm3668108ejz.69.2021.08.16.06.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 06:03:05 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Michael Straube <straube.linux@gmail.com>, Joe Perches <joe@perches.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] staging: r8188eu: refactor rtw_is_cckratesonly_included()
Date: Mon, 16 Aug 2021 15:03:03 +0200
Message-ID: <5487901.nydP0h6v93@localhost.localdomain>
In-Reply-To: <20210816115430.28264-3-straube.linux@gmail.com>
References: <20210816115430.28264-1-straube.linux@gmail.com> <20210816115430.28264-3-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 16, 2021 1:54:29 PM CEST Michael Straube wrote:
> Refactor function rtw_is_cckratesonly_included(). Improves readability
> and slightly reduces object file size.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> v1 -> v2
> Refactored to more compact code as suggested by Joe Perches.
> 
>  drivers/staging/r8188eu/core/rtw_ieee80211.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio



