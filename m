Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A383FC3
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 21:56:21 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id h13so16176246wrp.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 14:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gX3npG6nSHEYtTzLcQI4FxI/LHa3i3+15RcFQa4MgFg=;
        b=cO0WcSGLTozp1BsFMn671wiXsyEX7v2JxYJoO6Mw5ebYv2T0Psd3sKSyTwCrpc31ps
         55F4P5moqxxXCPgnkomOFuPQNbXboplpXEAX2EOws4fXXcTyb6IanYN0xRtbhe6OZWh/
         7zPifIfNdEHW5tQI64g2OMZZzuxB122V8z/dPwo1kt6+SNZK6iAsMlgquP7JU18YcU7y
         /bBx1qpgq5Lb+wRV8Wjv1Mcwkvm9yn7jg4eQFesEcEV35s+je1O0+o5UJjA5/zVhKU3u
         M6bjT+Bjnl4leeThkse5EpBk1h7CBJ34DPIPs5P45vtdHgh+1j+zKXysTW95AyFLhroA
         f3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gX3npG6nSHEYtTzLcQI4FxI/LHa3i3+15RcFQa4MgFg=;
        b=fI+Lp/Jawj2yMOcOKNq5YUkxXLz3YS4dSkGv5Ag4ihsEmHItArUKVa347k2rRONnpt
         eKYUbw2bjTLFLO+QJDOJPfMuBdnGwShG5lUSZ8U9x9mXxD9YPdPyXlBJPNpslxDallEz
         k8kXcbd7CvBEfVIp1zs36M0Co9cjNWjqtkpEkDR2myQJ1xLl/YVXauO3csELJiD6imfE
         PFMKwrelwt3k7qRe/OHuo35sdZE0I7Do01dazjADWxHoJa1mRTSWRYkK8MWyeBecxcxh
         GlMudNPGmR4w8FgJMjWP2sX37TXA8XtJGsgXQC5mYAt1ILRjhEmTJHAkT8S9Cvh2EW9J
         WG0A==
X-Gm-Message-State: AOAM531jkeo7d/BZzUnpeFroV8FYtKclps2bBvqYSzz176gHuDrATfTC
	TI02z0QUQ1Sd6Y/Ol0yp1xG/xg==
X-Google-Smtp-Source: ABdhPJzR0XNKHULJiXsLYLmAHPPLIKJ3zDCAy+W7qq4yFQQUXyFFhCryaYT4I5zCzda4nbCl5u/img==
X-Received: by 2002:adf:dc0b:: with SMTP id t11mr859514wri.259.1629496579828;
        Fri, 20 Aug 2021 14:56:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:dfde:e1a0::2? (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id c8sm7091974wrx.53.2021.08.20.14.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 14:56:19 -0700 (PDT)
Message-ID: <b18430516495e2e52fe6b0b1e1461bac640be44d.camel@philpotter.co.uk>
Subject: Re: [PATCH 6/6] staging: r8188eu: remove free_xmit_priv field from
 struct hal_ops
From: Phillip Potter <phil@philpotter.co.uk>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 martin@kaiser.cx, straube.linux@gmail.com, Larry.Finger@lwfinger.net, Greg
 KH <gregkh@linuxfoundation.org>
Date: Fri, 20 Aug 2021 22:56:18 +0100
In-Reply-To: <3280989.scCUJ3VkD9@localhost.localdomain>
References: <20210818234253.208271-1-phil@philpotter.co.uk>
	 <20210818234253.208271-7-phil@philpotter.co.uk>
	 <3280989.scCUJ3VkD9@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2021-08-19 at 05:14 +0200, Fabio M. De Francesco wrote:
> On Thursday, August 19, 2021 1:42:53 AM CEST Phillip Potter wrote:
> > Remove free_xmit_priv function pointer field from struct hal_ops
> > definition
> > in include/hal_intf.h, as it is now no longer used anywhere in the
> > driver.
> > 
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > ---
> >  drivers/staging/r8188eu/include/hal_intf.h | 1 -
> >  1 file changed, 1 deletion(-)
> 
> This entry could have been removed in patch 4/6 or 5/6, but I guess 
> it's okay to do that here as well. Perhaps the three patches from 4/6
> to 6/6 could have been merged into one (because since 4/6 was 
> immediately clear that this operation has no use at all).
> 
> Aside from the above considerations, it looks good. So...
> 
> Acked by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> Thanks,
> 
> Fabio
> 
> 
> 
> 

Dear Fabio,

Thank you for your feedback and acknowledgements for this series, much
appreciated.

Regards,
Phil

