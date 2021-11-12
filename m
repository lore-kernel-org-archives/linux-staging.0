Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279052C81
	for <linux-staging@lists.linux.dev>; Fri, 12 Nov 2021 09:08:22 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z10so8573134edc.11
        for <linux-staging@lists.linux.dev>; Fri, 12 Nov 2021 01:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BxpzdVv/JmbTcRqxjO49mI7k8UhxXyTuZr7RPBnx9t4=;
        b=SiLag2S5hzRYUHlpMmIZI+lJ8BngrTqYEIs36n/kz4NyDtgpjfuWfrmObd8lW8Qe3E
         GXHcij6GdIH6ns99sc7mZ6jUW+WUnO/p5aa4lxNHb3qMuciScKoYClaz+u2nKsRGCy+P
         HDkfFTj/Vvam4Cu7Lm2hdY57bUjK8c8q3/ViobZJmx+ObsHjLRDNn1GVAonD24vChyxH
         tzZhPEraB8Eq7G+k/FWMhedclFO4vkkMmydUchPlxontQtpIdVSmpqB+3rJO6MXDpYR+
         I/vnw3Nk2wBKamRmQUoKExKkAutKbgmzYrALABLrPq8EMeVCvE09GnRQOGsL7bUOWSQB
         TXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BxpzdVv/JmbTcRqxjO49mI7k8UhxXyTuZr7RPBnx9t4=;
        b=UQrkVaX8z9YrXR1mjD1myOwr4x5FRjePMe8nU4rhNwSvUoAwKNdAkelMFLNYi5Zfdj
         R5BOBNAjU7C4iJPQnr1MbI4Df4YED73S51lJra4sFE1h3gEi8a0wTtCw6ba8p2xEFvgU
         RJKuzqX1sBrlhCo2JulFSqxoQubGvt2QY4VeG1r4YWl73Jqp/7raWNviUfMGH1PdeQqK
         nN9E5EwVybAmP3yXjZ2tNaEv8I5Uy4O+XChyJFBZR/OgJgivLZu0cGuuknQkqxwHTCMf
         Vo/GHDT24DzheE6ZM4EAnR/TmGUmeBjUex04qnKOw7U8l1fRHEkRyyMYNziGqbdSwNxi
         GSKQ==
X-Gm-Message-State: AOAM532J0ZTphYcKIJVSrIZMj4PXu20gbczfkQa4R7HIEtBRQLxDcSTO
	0+VEEG0WKzxL0zXY1lciCN0=
X-Google-Smtp-Source: ABdhPJzZxaAwvcEKZjjYbHJsZBr63GhqyDPRvQ0Lj8zClCa2IJx8dpHdvwussAfZs5V2wE0f46oC4w==
X-Received: by 2002:a17:906:e115:: with SMTP id gj21mr17473492ejb.348.1636708100492;
        Fri, 12 Nov 2021 01:08:20 -0800 (PST)
Received: from localhost.localdomain (host-82-61-38-115.retail.telecomitalia.it. [82.61.38.115])
        by smtp.gmail.com with ESMTPSA id p3sm2386691ejy.94.2021.11.12.01.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 01:08:19 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH 4/7] staging: r8188eu: remove autoload check
Date: Fri, 12 Nov 2021 10:08:18 +0100
Message-ID: <136395394.ZtFrYW90el@localhost.localdomain>
In-Reply-To: <20211111212644.9011-4-martin@kaiser.cx>
References: <20211111212644.9011-1-martin@kaiser.cx> <20211111212644.9011-4-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, November 11, 2021 10:26:41 PM CET Martin Kaiser wrote:
> In Hal_InitPGData88E, the same code is run, regardless of
> bautoload_fail_flag.

Same comment I made for patch 1/7.

Greetings,

Fabio

> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)





