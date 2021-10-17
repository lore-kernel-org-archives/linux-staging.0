Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FAB2C81
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 14:47:08 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id w14so59749080edv.11
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 07:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dFqNJFVsy2D7h6GKfy8JazvFD2oIbLBEOiY/RubRa68=;
        b=j20NxjysulzWzOseqaVPO2JSbqzWx4oePP+UYSEMUaa2SxXOozUaRBcYAE9onpI52u
         sxMEV+hTUh8BxjZUJvOZHHzAP2HseLy92zraM6IN7IiXI70g7Aqawbv3Wi5ksrigKydR
         mDZGoJ/8rS7oaEBpt2Q9QcBOBv9tlek+inWcg6Iu3b6Uo5QaLtwiR5iDgtkYgL7l41jc
         pS+zMmjTY8LhPs2bscmAMMq5+2aEnbU9QmTh0rytU5+QQNAzmY9N5VEN5h65vbT9fij7
         Hlj6TJxXylA4XcPU2R2UpHOWLqoxt4Dv1iWyTZl3CcQHZAZV9rDqtXWHHpWtgqIRp0aI
         uA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dFqNJFVsy2D7h6GKfy8JazvFD2oIbLBEOiY/RubRa68=;
        b=rb2/Grak5ZQ28dcQo3o+JR4iJXRAVpn8kazVM797Q7pAIXTas6huvWFrZeqCIByFL5
         KihMlfpEvboKbQ9rKrUYhBPGKfNHnEql/0+cGwcDK5vc4vp2vJs0FIQQJ6xYLPZSo0P7
         hbGJQTSdpI/Y0CSy9sBA4l7rfTdMObWi76ekSoy4CIl9+ee0jY/FFSmvCThPS392VARz
         eKJv70xD9z595kcIajoOxLTkk9wHrUEPV+BWl5kNg2HfUyVeaIjahlunzOfEzzayV+j3
         iW/cNdxodC8yzsPkw2DfHhqCdI8i774hToo11ktD4ZNYyGku49RqFKSlEfpdF3Iqlg9A
         MHjw==
X-Gm-Message-State: AOAM531HK0mV3KmMZJzrnS9Wr6rI7zWMKyCDdkD36Z9+1TtxA4bK6vlh
	Mc+Z6UnfIn/Ogp+MsxtWE9M=
X-Google-Smtp-Source: ABdhPJzDPWYGnvUlTp5HotGSD2kgRMRr0wml8eHhl9LFxn9XXqtF/LVwSj/ORObo2dokPeGzjG90dA==
X-Received: by 2002:a17:906:4a09:: with SMTP id w9mr22411227eju.419.1634482027145;
        Sun, 17 Oct 2021 07:47:07 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id gt35sm839112ejc.105.2021.10.17.07.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 07:47:06 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH 3/3] staging: r8188eu: don't accept SIGTERM for cmd thread
Date: Sun, 17 Oct 2021 16:47:04 +0200
Message-ID: <1638491.UCx7rxsUkF@localhost.localdomain>
In-Reply-To: <20211016181343.3686-4-martin@kaiser.cx>
References: <20211016181343.3686-1-martin@kaiser.cx> <20211016181343.3686-4-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, October 16, 2021 8:13:43 PM CEST Martin Kaiser wrote:
> At the moment, our command thread can be killed by user space.
> 
> [root@host ]# kill `pidof RTW_CMD_THREAD`
> 
> The driver will then stop working until the module is unloaded
> and reloaded.
> 
> Don't process SIGTERM in the command thread. Other drivers that have a
> command thread don't process SIGTERM either.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c          | 2 --
>  drivers/staging/r8188eu/include/osdep_service.h | 5 -----
>  2 files changed, 7 deletions(-)

Dear Martin,

After thinking a little more about this topic, now I'm ready for...

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Regards,

Fabio


