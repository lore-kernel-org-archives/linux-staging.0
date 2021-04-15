Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D116D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 08:31:38 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id l4so35550561ejc.10
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 01:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=o4Zea2wZG0jsu5G4k3ezpPKmStFjRBdkRPNkdtX1oDw=;
        b=s9K8XEuceZ5R1z9qNS5SQi1MT87F79SgDGa62gWJ7QjVHk+u3VvCeNh1thLKc+5NCy
         ku1l5flgVEbncxwZtj9rafq5SuiSqAGEMH4duYsTqBYYlBx8hGE6HIntXU5CVdoDWu4D
         uOSKUucL+BxsrmS/Mi2iRwrL/1MX3SxvyqumCiMFWxHWgx35Ar6GeQweKxVdMBIzQRlq
         /xwqI39SgMkk9AD+ogtmx2Uvrs/GOBhdDPkEHHlT7jRSnCOcV4mAoVy1TKaqD8VwYKUG
         Mgh7VkJS8uHW338xAeVywx3w019jDOcZY2v5g0cxFqgZlRYxV9dT+DZKiae9yAOPFR4m
         2hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=o4Zea2wZG0jsu5G4k3ezpPKmStFjRBdkRPNkdtX1oDw=;
        b=G2BeryMRRCSPkxPJjhi11FhcqPVT2xNxe0S5qttKCs39tg0MiUM2jFgRJDBkNY2+Cx
         CQodUd1QffBomtRYfiIV/qjdd5/zGg4GqOGhy0SW49n5Li/UGu9JuoVeQVzuw8BhF3jL
         uSFcqQaE4TpdI1h+aKoU4Z0PGmcrwykCx+rPUvHK8HmGvwJ1Yo70izTVXCb2YeOsAjwI
         zw9gSo3Sup9NUpSoZjPaikjHA1smuIFbZZVHxjvrG2kM4S0TGPM3eUNNssD2aMS1FccE
         zaR4+ygD7qYNAA1AZFZpSJdSB4ng1IUzKQGLwgGOz7SM4k/tR+sFey3+QGuV27sOyLOq
         pfKg==
X-Gm-Message-State: AOAM532/yTqouhNlPb6i0uJLV+t/r5NlarTLkWUiqZrHrNPInq9T88GF
	s7+WqYrGsHV6d4GfsKkpzkAyvQ==
X-Google-Smtp-Source: ABdhPJx4EvV1oS5tj/RnxbrOBT69mWMFa9GhvAHb+keKtV3i1VU7aqlMhMwlaGlO2SJTqq3s6sjG4w==
X-Received: by 2002:a17:906:bd2:: with SMTP id y18mr2254929ejg.482.1618475496804;
        Thu, 15 Apr 2021 01:31:36 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id g26sm1376062ejz.70.2021.04.15.01.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 01:31:36 -0700 (PDT)
Date: Thu, 15 Apr 2021 09:31:34 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 15/57] staging: rtl8723bs: core: rtw_security: Demote
 non-conformant kernel-doc header
Message-ID: <20210415083134.GT4869@dell>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
 <20210414181129.1628598-16-lee.jones@linaro.org>
 <20210415080928.GA1431@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415080928.GA1431@agape.jhs>

On Thu, 15 Apr 2021, Fabio Aiuto wrote:

> On Wed, Apr 14, 2021 at 07:10:47PM +0100, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  from drivers/staging/rtl8188eu/core/rtw_security.c:10:
> >  drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'p1k' not described in 'phase1'
> >  drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'tk' not described in 'phase1'
> >  drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'ta' not described in 'phase1'
> >  drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'rc4key' not described in 'phase2'
> >  drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'tk' not described in 'phase2'
> >  drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'p1k' not described in 'phase2'
> >  drivers/staging/rtl8723bs/core/rtw_security.c:1937: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: linux-staging@lists.linux.dev
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> > index 9587d89a6b24e..60b724729900e 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> > @@ -1921,7 +1921,7 @@ const u8 rcons[] = {
> >  	/* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
> >  };
> >  
> > -/**
> > +/*
> >   * Expand the cipher key into the encryption key schedule.
> >   *
> >   * @return	the number of rounds for the given cipher key size.
> 
> Hi,
> 
> did you mean 'demote' in subject line?

I did.  Did I spell it incorrectly?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
