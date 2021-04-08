Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C073670
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 09:10:56 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id s21so1764828eju.8
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1cebnpBVTUp19RdwzFmR6GsyPKlfHDikB45ydVihbfs=;
        b=jvhOcjxhOgsQBBS5Km0GfSfMVbsV6jIYjlZ6C5yGROvR3tO8to08j1y84xEmcnk4MI
         7Q6MEHoqhNpc03e3cecctIRQLxUj3flh9oPoTZHW9iiEuqD4KZMgm61wgX740iEX+V+Q
         cdT1Dx86BAe0DoKs47BGfaffGkO7UtGCAWcksJQvgDQud/+5YbiM5AVYiT5SN7KJfJGW
         brVqQfCTJ1QYHxu/t3ZLfPlxZaB9gZP99g6NMsNTZ81HaU+C/JP44biQMe19tLQAvKR/
         vW4x3VKnyBUR1TE91zI1N6aXFuldV5gvqlxq2/6qHZ0mM8XeqoulDd4Ojeb3VzWXldLX
         rQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1cebnpBVTUp19RdwzFmR6GsyPKlfHDikB45ydVihbfs=;
        b=tNibqKBMfa2dJlyps5TV0WZFqnPGc0vTMzYCt+VA89upWDh8iGIKWrK25zw+ayVhMM
         +Gu55RPfYYNOlqcY2/1e/pxX8i1U61tsYTeZBGasrwe4Y1+341a5ott2jCWp1BXWctFA
         iEXcwHdq+3nFXNk+Vw9AF0FaTZpKG2ns6vGl82ZIdngnzzYl62E0Hcp5yqn5l0xzsvu4
         FBioXonR055PYTYepboIBplta7bu/XQnLvsRq/Dz1TDsTyNhMdsYfORAY1OcBSDWbGV5
         SxU+ZlyNdA/Vv3G4gUtHA8KrheHKAW6MmT0EtIY6z0FLjACsnq+JXHk0fNffvbNse4RE
         WKOA==
X-Gm-Message-State: AOAM533jXxsn09ZabP1AORhul/Xv/wV5ikqQXCwB7xqnxB9EojH7S3Z9
	LoWjyTBAVFDTRmtypYNzDuc=
X-Google-Smtp-Source: ABdhPJwHqQHnKNFTgZV41DrGxvAlj6PDZXkDg4PDdv9LE+rxVn5DqEFzTynEkSBUo7kEgwOZS0t9PQ==
X-Received: by 2002:a17:906:688e:: with SMTP id n14mr9011306ejr.439.1617873055302;
        Thu, 08 Apr 2021 02:10:55 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id o17sm5644526ejm.13.2021.04.08.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 02:10:54 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>, outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8723bs: Remove camelcase in several files
Date: Thu, 08 Apr 2021 11:10:53 +0200
Message-ID: <8385147.KfrnKTb6Rc@localhost.localdomain>
In-Reply-To: <alpine.DEB.2.22.394.2104081053200.5197@hadrien>
References: <20210408080714.29481-1-fmdefrancesco@gmail.com> <2284292.R3b5UFg5HO@localhost.localdomain> <alpine.DEB.2.22.394.2104081053200.5197@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

On Thursday, April 8, 2021 10:54:09 AM CEST Julia Lawall wrote:
> On Thu, 8 Apr 2021, Fabio M. De Francesco wrote:
> > On Thursday, April 8, 2021 10:36:32 AM CEST Greg KH wrote:
> > > On Thu, Apr 08, 2021 at 10:07:14AM +0200, Fabio M. De Francesco 
wrote:
> > > > Remove camelcase in a symbol that is used by several files.
> > > 
> > > What symbol?
> > 
> > I'm not sure I understand what you are asking. You mean
> > that I have to specify the name of the variable that I changed?
> > Or you mean that I shouldn't use the term "symbol" but write
> > "variable", "function", "macro", and so on?
> 
> He wants the name of the symbol.  Each changed line includes lots of
> symbols, so it is a significant effort to scan the patch to see what
> symbol is being changed.
> 
> julia
> 

Thank you for clarifying this topic,

Fabio

> > > > --- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
> > > > +++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
> > > > @@ -203,7 +203,7 @@ struct pwrctrl_priv {
> > > > 
> > > >  	u8 LpsIdleCount;
> > > >  	u8 power_mgnt;
> > > >  	u8 org_power_mgnt;
> > > > 
> > > > -	u8 bFwCurrentInPSMode;
> > > > +	u8 b_fw_current_in_ps_mode;
> > > 
> > > The "b" here means "byte" so you can drop the "b_" as that means
> > > nothing, we do not use this type of notation in the kernel as the
> > > compiler can check it for us.
> > 
> > OK, I didn't know what the 'b' meant in this context. I'll drop it.
> > 
> > Thanks,
> > 
> > Fabio
> > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > --
> > You received this message because you are subscribed to the Google
> > Groups "outreachy-kernel" group. To unsubscribe from this group and
> > stop receiving emails from it, send an email to
> > outreachy-kernel+unsubscribe@googlegroups.com. To view this discussion
> > on the web visit
> > https://groups.google.com/d/msgid/outreachy-kernel/2284292.R3b5UFg5HO%
> > 40localhost.localdomain.




