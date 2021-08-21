Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3003FC0
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 03:17:09 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id s3so4487718edd.11
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 20:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J6aNbqcjBaOkaEzDaZcIjKX0J8PPqW1VZdnA1qoYZ9c=;
        b=CvsAh4Tjxw5cegoOAFt1jRtELr2hF3++2k44uvwDSISoO9zLdPL2wr94vEfsMhgpCy
         YxXxZbLLVdJsY8MWmcTizFelcKivz9VvMnmMW8WW/vkb1N1v+6nZOGJxaD7h87wPmTNj
         98G94A4AjhiA8jWg18hha9sLZDoUQhF9md9PwOa3/6EDrGXAV6fV5vqe2JWvz7yOieIv
         hYw9PBeL+SKmA+m6c1Iw1dni8Bf9f/cODr5I9lHpumpPWTaEfQCVLhLXXeuim79grnpG
         j3AkUaPRD3N6nFMM564wGpfQtkGoJuwnR5yHeFR3GnWLycmbtgPW9CBL6+8nyQM12qJ7
         +RaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J6aNbqcjBaOkaEzDaZcIjKX0J8PPqW1VZdnA1qoYZ9c=;
        b=s9hAH3jqJ1VW+vAyf9SqPFaFjh+OwdOX3iaBOszWYAR/IIdn08yRlROL3aqT2Tv8Dd
         Z1VBOxGCNaaod74lNSA//QJBr/a8a1YfzgDmfIUcA/PrHST+/y1xwqtW4+rL/pJDrhQA
         7Q2L74MoyJAycDAnnxnK/earBGVcrjf0onqdrMlU3cDpPXxe4kFWRotUOPzRvINUWJBj
         NS4G5S8iIby4EZSueT33O33/bttNKj0PqWH2xokUZcr7czBxID3JE8aozs+iWDBdWGCj
         SESj0ode2usbfzUQZuNOZ8aRWl/2vS4aW+FHyaeMoUuaCNQsRzit1Wf0Jia0GPwMVC9v
         z8yA==
X-Gm-Message-State: AOAM5333S07nFjduoQSYEa+OQgcUi0SgAId79pVpl4wixCtwK6dNhtb9
	4HKTCcPbwxDD6jwydtAcI2Y=
X-Google-Smtp-Source: ABdhPJxr4nLIZNsycWxdRZzc2pgtLQM1MFBdBIyL6aiGCJ4AkKpLeiLvmc3l6SLSRabCHCP+fcT64A==
X-Received: by 2002:aa7:c94c:: with SMTP id h12mr6878620edt.378.1629515828181;
        Fri, 20 Aug 2021 20:17:08 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id q6sm3596876ejm.106.2021.08.20.20.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 20:17:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, martin@kaiser.cx, straube.linux@gmail.com, Larry.Finger@lwfinger.net
Subject: Re: [PATCH] staging: r8188eu: remove forward declaration of Efuse_Read1ByteFromFakeContent
Date: Sat, 21 Aug 2021 05:17:06 +0200
Message-ID: <5110838.kRcMR4ARJC@localhost.localdomain>
In-Reply-To: <20210821000508.79422-1-phil@philpotter.co.uk>
References: <20210821000508.79422-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, August 21, 2021 2:05:08 AM CEST Phillip Potter wrote:
> Remove forward declaration of Efuse_Read1ByteFromFakeContent function
> from core/rtw_efuse.c, as the function is defined in full directly
> after this and therefore this forward declaration is redundant.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/r8188eu/core/rtw_efuse.c | 6 ------
>  1 file changed, 6 deletions(-)

Philip,

It's pretty clear that this function has only a translation unit visibility.
Why don't you make it clear by defining it with storage class "static"?

Thanks,

Fabio


