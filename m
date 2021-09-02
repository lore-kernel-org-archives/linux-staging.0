Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E9A72
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 09:29:40 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id e21so2797814ejz.12
        for <linux-staging@lists.linux.dev>; Thu, 02 Sep 2021 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BCIadNtgJxMuBnbXRvKUyOdGpeELhFfMWSvYcSrngec=;
        b=aWLt2Lg2fnQiH9AQHWg5eETKa/61mTI9WRLFUX/nmylrMtEA+1eW6NAo/7dgaidPEB
         XzWVeCUPHO1tdutR3FXVtqSWgURsn0ft6X0LB/U6DDibpdYwcxsYy8NjcANkLkwYLG2/
         d1mmQ54p68ABhepC6FPrzxU9/DwKmZ9DPekp4g2v4Bxm9DDMpn7JS7a673aozwcQw9oE
         6M64grjhnoCQ3gkA7Iw1TNtIRcdQGqDPMiFdCdvjNDUhES9AjHhsXeciv0knKJhfhB7Z
         VvIqmvbIhTadr2mF6UbnuGTq9Ij4oOkVtXO8/xSOXJD/szPFIr8fKjptcsBTSWiUrkRF
         +0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=BCIadNtgJxMuBnbXRvKUyOdGpeELhFfMWSvYcSrngec=;
        b=t1S4nSbaWV2Ilp8nO9xbPc69exO6smGmgodpnxU72AuKCByJf+xbFTLmWQ8GWfQpE6
         an7r+VxRgRdfiqLI2xXfbXoGF1lYLA8oaBPHj0m9fJx+SCaUO/t/SIlF7RvCkv29NTBM
         BPBK6b5ufO/IzKw39qX2sgv/dxaqleeMC2OUgyZijXMF/w0XGaWvwiX3TC4lWaCAe93D
         Wt1K9V+vdmPTmH6h0qXDXkdITng5JV1ZS9TGtWJn2i6O6l8MFLH0+cXoLjVHQ0gzvuSM
         d+1COhINnjRN9tegLgpF2nQ0snXJsaltO0YUzCDHmSSVdweb3vS05Zv/n2CigHQwf/rf
         934A==
X-Gm-Message-State: AOAM532JSxfk0dgaDcBR8clgAtlF1JHJLV1SCtKGVYhYPrh/r+TeDa5T
	xep0jC+mm3d8zN69uHbQIY1pjaa5AL4=
X-Google-Smtp-Source: ABdhPJyULatZFvFoW3qSuW8cTMDFGP1r2V0iYpahlZ7Ujx81qTFPG/N28YCkofjrYYEKeElJsLpa2g==
X-Received: by 2002:a17:906:4892:: with SMTP id v18mr2716465ejq.541.1630574978589;
        Thu, 02 Sep 2021 02:29:38 -0700 (PDT)
Received: from agape.jhs ([5.171.72.108])
        by smtp.gmail.com with ESMTPSA id v10sm759876edt.25.2021.09.02.02.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 02:29:38 -0700 (PDT)
Date: Thu, 2 Sep 2021 11:29:35 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	Michael Straube <straube.linux@gmail.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove possible deadlock when
 disconnect
Message-ID: <20210902092934.GA1422@agape.jhs>
References: <20210830141645.3646-1-fabioaiuto83@gmail.com>
 <YTCWwLSX0I3Ica2e@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YTCWwLSX0I3Ica2e@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Greg,

On Thu, Sep 02, 2021 at 11:17:52AM +0200, Greg KH wrote:

<snip> 

> 
> With this patch applied, I get the following build warning:
> 
> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function ‘chk_bmc_sleepq_hdl’:
> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:5922:27: warning: unused variable ‘pxmitpriv’ [-Wunused-variable]
>  5922 |         struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
>       |                           ^~~~~~~~~
> 
> 
> Please fix up and resend it, we can not add build warnings to the tree
> at any time.

oops, sorry will fix soon

> 
> thanks,
> 
> greg k-h

thank you,

fabio
