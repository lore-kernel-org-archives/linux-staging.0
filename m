Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F20672
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:48:52 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id d11so33585177eja.8
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8PFRwZuGgLnjGYqNPj65Tp5wh86w1dIRSgEKxDTD6rM=;
        b=LjTNGM9ChdUAVR1dOVsde14mlfdDOP4zzcWKthEmGUHA0z9XLCxj8g7cacWm/AFaGs
         tB3dcRmS6m2pUB/RuNrGvCCCCvbXbkSNUhBUHQoWUcYm0441Nsc7caomMliAWPhFJHjS
         QSGQrhqgKCZbGaK2ff6Qv+v+OhynZTwoA3tcTB4JvgrbUpx6lVzFyEbVNsmHF/A0q0W0
         GanEE/FJADi1tvMSi9KYzGQ0F/n/adLaLXo0F436kTcodRfTz9yB6XgId2/xf/QyFj2S
         y56kjWEe3KA2jwy0+kETBsHIuF4djEn67FelGU7uFavhj+vmwVbSz3vDn1vvIhqM+iQM
         PiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8PFRwZuGgLnjGYqNPj65Tp5wh86w1dIRSgEKxDTD6rM=;
        b=rQTWBhZax4Qjm9KJ5X1J1lEwROHBad4ZhQNHmX5uxk7wgI99tpMkgJ+UTzA1cswwwB
         UcZy5sRcv6wBfCudDJ4ixqz0mx8Y484nz1zYpUsMaItBe5hUXg/jQxjS3qzI+BaFbBLw
         F7uBT3E5nU61ThQ7qi+z6s7Hs0VzEY37BL5RknEhJZCbxW5b6/8XhDsJQssFJkd1/XxS
         +ZmJ57vDpZluzvQfKS+HFagYKO1rkpyZnZM9J0JpK/QMhJMAsm8iAN4GezKg8UmX47Hd
         VNSkL5BJIj7UVGtMbcXLH1sB+HL599PlNb29OWM7quaWLH3POZ+AhcC44jkOP1Ay7vQr
         iuTA==
X-Gm-Message-State: AOAM530ltATDD8+maVYbNo6vGn1CLy8nHK8omyQwn841GzQ4g5Q5Sko9
	ze7naxikN55jH2+ssVW6T38=
X-Google-Smtp-Source: ABdhPJxgiGuvKpHKOc0fqqXI5GqMua4XTW7NclGOMr6etNYmeXmjNTF3z8tNfgkvHhC4pTLxbQ4lgg==
X-Received: by 2002:a17:906:3b89:: with SMTP id u9mr17353880ejf.299.1629139730740;
        Mon, 16 Aug 2021 11:48:50 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id dg24sm1529edb.6.2021.08.16.11.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 11:48:50 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Aakash Hemadri <aakashhemadri123@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bjorn@helgaas.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: rtl8732bs: Fix sparse warnings
Date: Mon, 16 Aug 2021 20:48:48 +0200
Message-ID: <22319634.U67b3Ei0OZ@localhost.localdomain>
In-Reply-To: <cover.1629135143.git.aakashhemadri123@gmail.com>
References: <cover.1629135143.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 16, 2021 7:35:05 PM CEST Aakash Hemadri wrote:
> This patchset fixes the below sparse warnings
> 
> rtw_security.c:72:50: warning: incorrect type in assignment (different base 
types)
> rtw_security.c:72:50:    expected restricted __le32 [usertype]
> rtw_security.c:72:50:    got unsigned int
>
> [...]
> 
> This can be applied cleanly on next-20210816, and is compile tested.

This warnings have been fixed time ago against staging-testing:
please see commit aef1c966a364.

Thanks,

Fabio

> Please ignore the duplicate of this patchset, I did not CC staging.
> Message ID: <cover.1629134725.git.aakashhemadri123@gmail.com>
> 
> Aakash Hemadri (2):
>   staging: rtl8732bs: incorrect type in assignment
>   staging: rtl8723bs: cast to restricted __le32
> 
>  drivers/staging/rtl8723bs/core/rtw_security.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)



