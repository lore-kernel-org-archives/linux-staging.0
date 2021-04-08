Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16D570
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 08:52:12 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id ba6so1452422edb.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y+lmQ3hALiXCsKP1/n0DQLq9ue3zxpvU44J69w8dPHQ=;
        b=p5o/rilQ604m+8thfELohiipXeePoWLo5nBQfmpp4rI1LiULtovWi/QspuN0+DjAYt
         dPGEcLDOiWIC5JYU0H4oSBANRGEIQOlvH+EGnIUPZ9dq3GJxTJVvw4TmsI4VtZixE3dA
         Sr5mehOXU9MZy83U3gZUo1FbPUImu+rXDF4x0H5ht00WSKQOx3fAbqF+9/s9LUj5Zr59
         BrwQzQiXNVOairgFRhB3LHlWjKySfx6kt5OmYOJhe2iCRqhW8/DYFvzvfWQliRz0i8Vr
         nO+GZExjU4DzCWB4SluJZw8ZodYJpFSJgM1R2vxYdkw8O0FmNvajHT7mJ1a5FcHjXrYY
         yNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y+lmQ3hALiXCsKP1/n0DQLq9ue3zxpvU44J69w8dPHQ=;
        b=Vz7qCPUOrFcdPiYy18qsCgGXXtlECcxqEIAX9gDDRDQ5CFUAaTbTKnBiEYZirgUaiI
         RgmaAG0knLvJgzOWBn3Li52hk+a1Vjwxvb7TBYlOqBkk65GwwCC8j3L98BvjBvKivkpA
         uRLgWfGoST/xRGhbvR4yq43ScljTjg9L/QKNBBF09kTlpCSFKHWXY0jk6V4opmEglwPX
         0zMGmd17E1rHvhyZQqLn9ZqDArXmszM0eKvz/XXWFOmVN9H4B4ldRuSB5tdohNAU+DkT
         y7zDBjW5WH0SdrDfy7QQuHwChU8rHxaQRxETdUnPowuANWiwEqLJd/QkFJAlOZwGdcr2
         mEPA==
X-Gm-Message-State: AOAM532OfjSOHhKJG9skmCFWABhy9TNyUGrDXlWBr7II0ShgU8c6MPqr
	3QPBub03NKAJm3wfnGLDd5g=
X-Google-Smtp-Source: ABdhPJyCRKZUq36x7IWYzPHdbS0e0nPFE0T22NNVQk7qdiYdoaepOIl6CLYOMctqwMeH0Jl3R3+7wQ==
X-Received: by 2002:a05:6402:270e:: with SMTP id y14mr9901298edd.283.1617871931160;
        Thu, 08 Apr 2021 01:52:11 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id ly21sm6105983ejb.116.2021.04.08.01.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 01:52:10 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8723bs: Remove camelcase in several files
Date: Thu, 08 Apr 2021 10:52:09 +0200
Message-ID: <2284292.R3b5UFg5HO@localhost.localdomain>
In-Reply-To: <YG7AkJjSThRbb/f5@kroah.com>
References: <20210408080714.29481-1-fmdefrancesco@gmail.com> <YG7AkJjSThRbb/f5@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, April 8, 2021 10:36:32 AM CEST Greg KH wrote:
> On Thu, Apr 08, 2021 at 10:07:14AM +0200, Fabio M. De Francesco wrote:
> > Remove camelcase in a symbol that is used by several files.
> 
> What symbol?
> 

I'm not sure I understand what you are asking. You mean
that I have to specify the name of the variable that I changed?
Or you mean that I shouldn't use the term "symbol" but write
"variable", "function", "macro", and so on?

>
> > --- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
> > +++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
> > @@ -203,7 +203,7 @@ struct pwrctrl_priv {
> >  	u8 LpsIdleCount;
> >  	u8 power_mgnt;
> >  	u8 org_power_mgnt;
> > -	u8 bFwCurrentInPSMode;
> > +	u8 b_fw_current_in_ps_mode;
> 
> The "b" here means "byte" so you can drop the "b_" as that means
> nothing, we do not use this type of notation in the kernel as the
> compiler can check it for us.
>

OK, I didn't know what the 'b' meant in this context. I'll drop it.

Thanks,

Fabio
 
> thanks,
> 
> greg k-h
> 




