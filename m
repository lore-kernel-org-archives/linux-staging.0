Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959396D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 08:38:39 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id c15so13504031wro.13
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 01:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=FNwALlxwzocopn/d194FfhrN/a/el0rTE18i45yvvJk=;
        b=SXEMRPO2kYZAuE1b0FmXDIzOJQ9EZCMKj8qpru1CIZkUMoiIK7d3mIFPyJ77CtJDEz
         /j/G0KSVwBw0qtbNcXvjBtSbX+6D3SR23dYtSAiZoxhQc+N4FW+eK9NDUvSflDv1i6Lp
         R1Cl5v2TGgsUCBO4cRETJwll7qhRBLuUgRaAu89CVLcuEnX2JzF8ohvj6UzO5wUCY+Kn
         wekV6ZxuTCnCHkjwZmNl82YHok2dlanIicGF9HH71w/ZuCNxCYMI42LFyP0ggvv0jmf6
         5Dp0/XdEY7z6gbjmuzYHDIOLBNymuF8zMpq0+ASxg7MGYn+THkFv8asa1xMAWNvAffba
         u+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=FNwALlxwzocopn/d194FfhrN/a/el0rTE18i45yvvJk=;
        b=mrluPAqNK9ic4P6VoY7+4E/tnynX+VVtvd/Wkh/Evn9V0QVpABz3GdJCeF2MwQ55FF
         biR3YqL6kkZwLotMandXQzEMC0aPmUc/LTvuRcmRb302x0u4rbynv7jJRSWlWzMSYvlm
         lGp/Ap6aN3jG28gC0Z2zy85xF1TLF6KhzCecQUhR6ckQFfrTE5N5h4mBjsBcXohjRv/w
         b5cbHaVkkPmBhqZOThhJDtx9J4YG0O2k0WLfCvIyRe/Jb2naNCGLpYxuscZdKfjEbZjL
         mEFr/0VhIiGV8OOl4vZPDJd33wTRadZ/JGxxiuy4DAqgVcTfRXHsqypX2fBlLTZAWHXJ
         YStg==
X-Gm-Message-State: AOAM533xYdbpKz/n7G2JthgjIL/XALSPaqMxRC/Nm68FSdN/hCflRZnd
	ahaIOnkwRPXVRl0nCQ3gr6WkiTziPys=
X-Google-Smtp-Source: ABdhPJw7HvS/3A53Z/DCPvk73sL2uNGOFXh3SnPCFUQ1tKHCN3cpZjWVze3HPyybtj9ndPYSIkDCXA==
X-Received: by 2002:a5d:66cf:: with SMTP id k15mr2259143wrw.404.1618475918186;
        Thu, 15 Apr 2021 01:38:38 -0700 (PDT)
Received: from agape.jhs ([5.171.72.223])
        by smtp.gmail.com with ESMTPSA id q20sm7465639wmq.2.2021.04.15.01.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 01:38:37 -0700 (PDT)
Date: Thu, 15 Apr 2021 10:38:35 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 15/57] staging: rtl8723bs: core: rtw_security: Demote
 non-conformant kernel-doc header
Message-ID: <20210415083834.GB1431@agape.jhs>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
 <20210414181129.1628598-16-lee.jones@linaro.org>
 <20210415080928.GA1431@agape.jhs>
 <20210415083134.GT4869@dell>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415083134.GT4869@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 15, 2021 at 09:31:34AM +0100, Lee Jones wrote:
> On Thu, 15 Apr 2021, Fabio Aiuto wrote:
> 
> > On Wed, Apr 14, 2021 at 07:10:47PM +0100, Lee Jones wrote:
> > > Fixes the following W=1 kernel build warning(s):
> > > 
> > >  from drivers/staging/rtl8188eu/core/rtw_security.c:10:
> > >  drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'p1k' not described in 'phase1'
> > >  drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'tk' not described in 'phase1'
> > >  drivers/staging/rtl8188eu/core/rtw_security.c:478: warning: Function parameter or member 'ta' not described in 'phase1'
> > >  drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'rc4key' not described in 'phase2'
> > >  drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'tk' not described in 'phase2'
> > >  drivers/staging/rtl8188eu/core/rtw_security.c:517: warning: Function parameter or member 'p1k' not described in 'phase2'
> > >  drivers/staging/rtl8723bs/core/rtw_security.c:1937: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> > > 
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: linux-staging@lists.linux.dev
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> > > index 9587d89a6b24e..60b724729900e 100644
> > > --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> > > +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> > > @@ -1921,7 +1921,7 @@ const u8 rcons[] = {
> > >  	/* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
> > >  };
> > >  
> > > -/**
> > > +/*
> > >   * Expand the cipher key into the encryption key schedule.
> > >   *
> > >   * @return	the number of rounds for the given cipher key size.
> > 
> > Hi,
> > 
> > did you mean 'demote' in subject line?
> 
> I did.  Did I spell it incorrectly?
> 
> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog

that's good, sorry for noise.

thank you,

fabio
