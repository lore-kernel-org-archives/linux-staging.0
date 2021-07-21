Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA676168
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 11:34:36 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id oz7so2763483ejc.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PwGcv3K9+/fZntIbMMSYVNFpVjwRYL0TiDMPAIGioqk=;
        b=dK85GgVIzBeoZpKaj6jnIjgvauVXwA83Dt9rpmb6PMdVLM4o6RuDepeW+HxDaLPOLU
         cmSc17JhSWrNiO7PvNbmJhM2+wg+3uHRymRhtVtch+KsSUbfTy07bis5ssbV3mviQWP/
         HRQKSvJxLDsgDSE1agijIJHN58G0H3mukJf+aHLpPbW2JUc8Rl6pVgP8i84sBUzj3xRp
         ShwTwWRdWwcA2XaqCXrdNsGlsw2xYUZTz1Cbal4PyDLGcn9xsRulj0ecJTT5s3jHAJEV
         sk0x1l3+rX2Q54+kyZXSV8BUnqYxtNYRqrG1TJmDxWNj+aD0HnEQamSlRUhsV0hjcLdo
         mocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PwGcv3K9+/fZntIbMMSYVNFpVjwRYL0TiDMPAIGioqk=;
        b=tCz4udv6D2K/o38LeIH5nTbwN/qKyOAppfAHCtt5weRE8G2EyHE2xFkAokXvhV/7Ux
         8fTEH69yWW2YE6wwI8vMBKbueA0EQlKCEPDtXUXJk7ZQspmI0DSk6C/StHPWZ3QzeoCV
         m9to1YgvIgY2207+JBAK0yjfEIbt7JWFgKYB5qQffr1n9UIrsJUE5UroSg+GeCx4v4En
         Gl6I6a3XpYBn8Qy+VRdTem+NAeDlZ3MB+6wm1pBURN8a7F0WVJ9Agg4KqSLEQL3EGRWz
         aTLGbNEGx3y7VyBeS0cKfRouCl2SIPSLXPZ9CXCnVMtTn2T+x/9hETWrKjugK+tcuQJU
         Ai3Q==
X-Gm-Message-State: AOAM530V6ZcD4Ro40K1rfWa5Gb9I2KsPNkeAUp5VOYnPgzepIXrqoE+l
	nePOhb2Xd6CjlN12fUSRxig=
X-Google-Smtp-Source: ABdhPJzdJ64/3yvm9dTSLwZ2K9adWnKQ3cLecGfacs3CIZF5EBdHO4FiLPzglFD5UlvIZQ2AQuISIQ==
X-Received: by 2002:a17:906:5e51:: with SMTP id b17mr38098962eju.270.1626867275390;
        Wed, 21 Jul 2021 04:34:35 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id n2sm10732686edi.32.2021.07.21.04.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 04:34:34 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8188eu: Remove an unused variable and some lines of code
Date: Wed, 21 Jul 2021 13:34:33 +0200
Message-ID: <22299777.3ztAgAtxqs@localhost.localdomain>
In-Reply-To: <YPfYlf25CtKckRQx@kroah.com>
References: <20210705134151.15143-1-fmdefrancesco@gmail.com> <YPfYlf25CtKckRQx@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, July 21, 2021 10:19:33 AM CEST Greg Kroah-Hartman wrote:
> On Mon, Jul 05, 2021 at 03:41:51PM +0200, Fabio M. De Francesco wrote:
> > Remove set but unused iw_operation_mode[]. This driver doesn't support
> > SIOCSIWRATE.  It just returns zero and does nothing.  Change it to
> > return -ENOTSUPP instead.  (This is an API change but we don't expect it
> > to break anything).
> > 
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> > v1->v2: Delete rtw_wx_set_rate() and its association with command
> > SIOCSIWRATE as suggested by Dan Carpenter <dan.carpenter@oracle.com>
> 
> Does not apply to my tree :(
>
Hi Greg,

It cannot apply to your tree because, while it was waiting for acceptance, 
someone else did a large part of the removal of the code related to the 
unsupported SIOCSIWRATE and you applied this other patch.

However, the no more necessary iw_operation_mode[] is still in your tree. So 
I'm about to send a patch that only removes the above-mentioned array.

Thanks,

Fabio



