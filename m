Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48382FAF
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 01:56:09 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id d11so9213612eja.8
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 18:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hpN+seMId1R48ghtCTKV+9iaLm5LmXQaGNgNqrThWN8=;
        b=ZirmNlnoFyDaRJW/IgiEe1WWOU5kuNmt8Ayh4dUZjeSupbjfmZR8aS+MQYk23OTKqi
         Qf8pf80f+9zP1glKgRg/9On65qMn9u7WWcY/L/VenACALBCPI24tXhBP3PeGA2vPPY2f
         AFNbV3afViLMu5bdogbpyoLBYHy+w1V42GQaqD/gvw1Nf0pVmgmP31EOvxcpcNE1tZ/1
         DHPj7vwdvnrIDpEhMp0iFCGgUKpg9Ko5X7pxzOrVtXSebBZVcaTFIUhng860qyt5Y0ZO
         smfePlrkj7TlsfbQx+ynM3vVncildEwWQeXB1Ldl0/MmPByLu+AA1s/Sr0egcbt6c8eW
         X7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hpN+seMId1R48ghtCTKV+9iaLm5LmXQaGNgNqrThWN8=;
        b=HL07MwOL61PqCaYd8ofa5uHdD7UZ8NoEW8iax/7rfzu69xMtqdNoezLLU1qHTSji6w
         5fnnXuxacJLqfyTar3qTmXdt1/++OWmDPytb+0GEBaCIPxPEndAuROSVYWtzWviF7sbu
         tn5w2o+hrQ1khWfeqMCJq3yonDIyzK6RTgseQquiasHMIOZdu5Tur31Jeuf2LxnJ4RLy
         Wop/P+6XH2/KUhgXpArfl0GXIrl0SNfng4RDWDpYORtyMqlTIGttw6f+1etqHeYYu+kV
         gLMdKK818ytpWzjNcHGBhrq/vPmAFMGfKg8zaiKOlAwEjKZK4jtsa14ntUb9oJiwtu2v
         1d2g==
X-Gm-Message-State: AOAM531pMZCQaGGpY7Bp8QmEoM6V3DgE1Eh+C5SEN4g8WoHaau9aDfXr
	kXs+bu/ngIu/mx2yaO3+Pgw=
X-Google-Smtp-Source: ABdhPJzT8AUaQY0sG1OzCxvz9x77+muyQv0xPyREbtofc0+WY7AJchEmYqkU9NT/UvwhyeIGAn+/Mw==
X-Received: by 2002:a17:906:1ec9:: with SMTP id m9mr13319242ejj.115.1629338168041;
        Wed, 18 Aug 2021 18:56:08 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id j13sm923368edr.89.2021.08.18.18.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 18:56:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, martin@kaiser.cx, straube.linux@gmail.com, Larry.Finger@lwfinger.net
Subject: Re: [PATCH 3/6] staging: r8188eu: remove txrpt_ccx_sw_88e and txrpt_ccx_qtime_88e macros
Date: Thu, 19 Aug 2021 03:56:06 +0200
Message-ID: <3294226.eXTACl5KOM@localhost.localdomain>
In-Reply-To: <20210818234253.208271-4-phil@philpotter.co.uk>
References: <20210818234253.208271-1-phil@philpotter.co.uk> <20210818234253.208271-4-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 19, 2021 1:42:50 AM CEST Phillip Potter wrote:
> Remove txrpt_ccx_sw_88e and txrpt_ccx_qtime_88e macro definitions from
> include/rtl8188e_xmit.h, as these were only called from the now removed
> dump_txrpt_ccx_88e function, which was itself not called from anywhere
> anyway.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/r8188eu/include/rtl8188e_xmit.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
> index 20b55e3850ba..e7eb19c4ee9d 100644
> --- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
> +++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
> @@ -133,10 +133,6 @@ struct txrpt_ccx_88e {
>  	u8 sw0;
>  };
>  
> -#define txrpt_ccx_sw_88e(txrpt_ccx) ((txrpt_ccx)->sw0 + ((txrpt_ccx)->sw1<<8))
> -#define txrpt_ccx_qtime_88e(txrpt_ccx)			\
> -	((txrpt_ccx)->ccx_qtime0+((txrpt_ccx)->ccx_qtime1<<8))
> -
>  void rtl8188e_fill_fake_txdesc(struct adapter *padapter, u8 *pDesc,
>  			       u32 BufferLen, u8 IsPsPoll, u8 IsBTQosNull);
>  s32 rtl8188eu_init_xmit_priv(struct adapter *padapter);
> -- 
> 2.31.1
> 
At a quick look it looks good. 

Built with "make C=2 -j8 drivers/staging/r8188eu/ W=1"
on x86-64, it does not introduce any errors or warnings, so...

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio



