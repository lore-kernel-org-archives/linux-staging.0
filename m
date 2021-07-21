Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F672
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 14:10:42 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id t3so2565900edc.7
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 07:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LkKzspu7F6CS3dCb1K0Az4IgLqzq0l3D+G45WRUBflg=;
        b=AVH4+u+rQJmO7aee31RnSvhGlALx94OdzukB9Upg5x4m9YjoSRzBRiEzXBMl/5TYFk
         yZOAjwuR6gDMkfFUlp4dc0/05FWUtVPNk1OlgFAuvxqU1mqtPWIphsB+kxlnac27Yqe4
         Q1cNWELBNiFcwJUNo/g3vR5KHjFbmzzs2SJPOY2IQCiWy89EQFlNo3q01NdJ8Sh3+CB1
         VHyslwhXAEYOhPEY4RIZdXUy0kLiWcwfiOsfot7ZHYzJSdaXuFi9PROKxELW+jO45d+c
         TNve0U0OokhiN1XAwtNmCiLRVN4RphZ1MQQZfvK++YqOqMYrtQYKX3tDfD+eEyuy1H2O
         hzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LkKzspu7F6CS3dCb1K0Az4IgLqzq0l3D+G45WRUBflg=;
        b=DVchyvaQVCoPzit0RZV/yvdNPD1wroeVTz8i7IRcPRyYoXDsyN4ofJBWdTJH7w0mSB
         Ptz2P6g4exFN1OtpnbNrEuxnrm61j6ibbv6j6VntzTP9Gdr+KeNcRxbc6i+avWdADOnq
         1J2tznU/YljfMRKTP8Cy27cS4sJ+m7buAkL7rNXlS6Xvhxwl//UPrYC2MbRAG6ODIo0r
         9kLM8hyhU2ePtdS7qgregU1HlVJcC2M98EJL+Do05r2PBqCrdSPRBPrP5hPLzyHG7McS
         TQxVM/YvLuKJN+anQTYtcyFqBjXwxbGiRlvMmk89eRtOfihPeFAAopeQNNtPNWeUgcyW
         NLPA==
X-Gm-Message-State: AOAM533TD4kioVuLK3FAFD5lufIqEeQM2c0Qj/bEwgIG71BmLLPmDWJX
	S5MLwMZZR8p/fCrFNTb4MKM=
X-Google-Smtp-Source: ABdhPJw+BbYQj9tOEhRdYgCS6I4TOt3U19j4nbzdNEau7YJkFarqVIeIleVo96KJvPGHOeWiHrNj5g==
X-Received: by 2002:a50:fa94:: with SMTP id w20mr48424009edr.275.1626876641132;
        Wed, 21 Jul 2021 07:10:41 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id q26sm4134833ejs.115.2021.07.21.07.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 07:10:40 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, fabioaiuto83@gmail.com
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8188eu: Remove no more used functions and variables
Date: Wed, 21 Jul 2021 16:10:39 +0200
Message-ID: <14670471.ktFsiGcboa@localhost.localdomain>
In-Reply-To: <YPfZq8tIiIEI7uIb@kroah.com>
References: <20210713190358.11864-1-fmdefrancesco@gmail.com> <YPfZq8tIiIEI7uIb@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, July 21, 2021 10:24:11 AM CEST Greg Kroah-Hartman wrote:
> On Tue, Jul 13, 2021 at 09:03:58PM +0200, Fabio M. De Francesco wrote:
> > Remove the functions and variables from rtw_security.c that are no more
> > necessary since the patch that replaces getcrc32() with crc32_le():
> > https://lore.kernel.org/lkml/20210713184629.7358-1-fmdefrancesco@gmail.com/
> 
> Can you send this as a patch series?
>
Sure. I've just sent a v3 series with two patches.

Thanks,

Fabio      
> 
> confused,
> 
> greg k-h




