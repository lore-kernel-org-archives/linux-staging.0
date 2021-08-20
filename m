Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7992B3FC2
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 11:40:29 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id y190so8358242pfg.7
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 04:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kv+uYOUebeBGrutf+Glgrn6wPl2zWoyRwYDrWhWzND0=;
        b=YvZKK0honxkmUypRJxXgIEA3vW9ooEUcvV5EhtLM+oPN6dh4hLxJru933RwDobP92S
         vOH/E10r276+8cK8Cl5cs6HpoPzc3uZ8G78lgQvwIBWGfAISgmGpDf1p4wns/T7CUlmY
         TEXxvAjj/6xEGunHqr5+aTvAyLoVCvP6ln2ynREwE+mOnRG6oyvtz1oPMimZvT3kEHX7
         hS8ip0DwkZjE5YHSvCt9x2/IipWsWvZ4hOLFhhKfOyxqBaNHgMCIR5KaHqJm6hnKMpLT
         7FdJ0Z60BLDIMYkM4dpA4456HjW1x08cz1gs8F3Sb6va4hMVVwa391g0Zdt6mVkfLw25
         PTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kv+uYOUebeBGrutf+Glgrn6wPl2zWoyRwYDrWhWzND0=;
        b=G9Zh1umhLzUnFcl8mMlymN3DeKrN8/MW2jXnnOXVXFx1LIlOBsn41E7LY2iQuY+k0r
         z8yBnMrv3Zia8ptjygeAud1Zw5f3IhcTmEEq8zXg5Yb0j0s2aWZT/vYOs5uqX68Vxb8M
         TxA5wnb/ZpSaQp90qGqAILJvyR36xtp2OSidvs48YYDLJvvGvc0HGrJ7TORzft08xv45
         Sr1x+Bdkncu0IYvi+0vqqk6UAnZNIT3q9cVfozyVazWhLlAtf6slYum9f018KCst2BTh
         8mp5ft1euXBqPn2u8+IUckYJ0FtbkWus0b4IjM9L0zdERyfOvCTpXv1HjfvgBO6aViVj
         oofg==
X-Gm-Message-State: AOAM531vijcT1Ic0ZV0V+1cw3kY5s62KdmSbO71M9QlAXuaAlPl+/KEB
	I0+VR5PWbuHB0bubYAPsYw4=
X-Google-Smtp-Source: ABdhPJw85YyKvZg9Cy8gpPMOeLunrJEWZnNbToai5pXkfo30LtxTC+0pM+a8Xqv1ZdFNz1MVWPdDBg==
X-Received: by 2002:a63:f749:: with SMTP id f9mr18479135pgk.77.1629459628772;
        Fri, 20 Aug 2021 04:40:28 -0700 (PDT)
Received: from localhost ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id c9sm7848008pgq.58.2021.08.20.04.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 04:40:28 -0700 (PDT)
Date: Fri, 20 Aug 2021 17:10:26 +0530
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] staging: r8188eu: cast to restricted __be32
Message-ID: <20210820114026.p7yurpf2zzp3tu34@xps.yggdrasil>
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
 <602aefc30b0d979dc6e402d52da2f096ea5c67cf.1629360917.git.aakashhemadri123@gmail.com>
 <YR6SlQFV0HRov/fC@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YR6SlQFV0HRov/fC@kroah.com>

On 21/08/19 07:19PM, Greg Kroah-Hartman wrote:
> On Thu, Aug 19, 2021 at 01:47:54PM +0530, Aakash Hemadri wrote:
> > Fix sparse warning:
> > > rtw_br_ext.c:836:54: warning: cast to restricted __be32
> > 
> > Unnecessary double cast, remove them.
> > 
> > Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > index 404fa8904e47..6a0462ce6230 100644
> > --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> > +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > @@ -671,7 +671,7 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
> >  				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
> >  					struct dhcpMessage *dhcph =
> >  						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
> > -					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
> > +					u32 cookie = dhcph->cookie;
> 
> Wait, what?  The cookie was in big endian format, and now you just
> ignore it?  Why is this ok?  This breaks the code, have you tested this?

Ah, I assumed clearing a sparse warning was enough to make sure my
change was correct. My understanding of endianness is incorrect.
Will redo this.

Thanks,
Aakash Hemadri
