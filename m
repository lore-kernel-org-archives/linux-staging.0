Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F7E2C82
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 18:54:47 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id w19so51969241edd.2
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 11:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3LWHTjs02qVue1BD0sar168IOoQPslMqFnvyeq5J9m0=;
        b=kyijQi2zmPeabDpYhQ8d13bW04yV81cVc8XQYuTO12gUUTA3Oq/Aet2Lq37QUMDKFH
         husRdDt6KR42q0wR/qFW831UOyNOH10e2lVEcajkJF2UIOCAwXdz7Fbw+m5+qiIxesgz
         ictAau0x6PljMHyhrg+I36RBfmGQLHx0BNlgaqkfVJaBfojWbrewvj8uuU97374ALiq8
         77Ov/R1p7elt84okyNrhIaS5pimq07GGxlJBwf8KTvDImDTM3bdnESOAb4JzzKbkW2sQ
         4iM9w/1Oe7uM8oaStTzm44r/Hn6BXpFFMGUYeCInGjpi5RM+UNxVaLROqwEZforWaAPi
         UlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3LWHTjs02qVue1BD0sar168IOoQPslMqFnvyeq5J9m0=;
        b=aqlj0oWvbMBoiV1blUD9VWpnO3ERnDkoON6XC3PkOHVf7YSfh2dM4eCvU1/gGNJh6s
         RwBrdcrrHmygdka05f1LqLqZb/rC7gNq24l0H+z133jJPtWSmeFS7MPIQXEbvdo0Prsw
         DzCTZQY+3e1oc/DUFuz6+Y7slHOQn1J3qilc3Ae5gklYGTpeLp70c7F0/ANJTsvdWWAl
         lAEVCzhA1Wx0EFfj4f5G4vwLtKqioKbRDjZNs2gVymIwLbPiMQfAgwBK2i8jLNvOVVqD
         GMTeVJ4rTwua1g6B+Fr1f7DTPFlANV8Wg30KBtR4E6z/zfr8IxmlDNmf6AGm2x7OdiSP
         qmcg==
X-Gm-Message-State: AOAM53069SF9bkC+JcmJhEucxzhYn5xziB+kMTym7KysPQg16DUNvyjp
	Etge3JwqIYAgdtV3lZ6QXh0=
X-Google-Smtp-Source: ABdhPJyRcjkcAEZQyOXj0p3uMsLWVSD/OcJq04wc5X3mLT0WgA/Vzf8XPH/vBltxEyIT0g4kD6tqbA==
X-Received: by 2002:a17:906:e2d3:: with SMTP id gr19mr16517608ejb.483.1634410486097;
        Sat, 16 Oct 2021 11:54:46 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id s24sm7267824edy.38.2021.10.16.11.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 11:54:45 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH 1/3] staging: r8188eu: res_to_status is unused
Date: Sat, 16 Oct 2021 20:54:44 +0200
Message-ID: <1651786.cOo8FRdMVi@localhost.localdomain>
In-Reply-To: <20211016181343.3686-2-martin@kaiser.cx>
References: <20211016181343.3686-1-martin@kaiser.cx> <20211016181343.3686-2-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, October 16, 2021 8:13:41 PM CEST Martin Kaiser wrote:
> The function res_to_status is not used. Remove it.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/include/osdep_service.h | 5 -----
>  1 file changed, 5 deletions(-)

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Regards,

Fabio



