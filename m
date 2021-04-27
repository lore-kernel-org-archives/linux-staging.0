Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BF92F82
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 12:43:01 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id n3-20020a05600c4f83b02901425630b2c2so987941wmq.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sQtkoa8nt/6X+kphKb37Kf/4r12w9grvZXTPGm25gY0=;
        b=GOuWS3W4d4Llb3YmmZ+x62c0Cszu7i5TSOpZas6ntQe3DIfQMGsa+eyzOtpl6sPHzj
         KJpoZoasVZhuqGST3LyyWSKG9jok9FrAQoCHKcpmIWwpVmlYK2wf5quJCxid7dmjIdC0
         PFqos0XJPhnpY5kpziLDRy5E1Uy8ryGdERORZQJ3VQDsKoxar242uMHeDM0iFKP4wv6k
         1qIAlDQi5Wq3PTpr7hmSmoPW1zZWHw0uPZgDxbAk9P41/t8mp070in6oirEHE9ZnN1SM
         k6Fvyid31YwhsamnjK/9x/U0GjVBYOQshY4VmnvrXvsegCqQZ2DobLIypwd/AkqLneHZ
         D4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sQtkoa8nt/6X+kphKb37Kf/4r12w9grvZXTPGm25gY0=;
        b=OYvMZSkRVJ8G97diVVtDddk7fWHOAOkW6pBHfHvdDdmifkee+pwO7rAtW+iIcE+WcN
         EvUIWztm3Zva2F3syt5uMl0PzdpaQbopL65x7hLPTc0pRnehKfsmnWh22cto+OStz1b4
         drjW/nSAOT54tqp/pW0gJz4vj1Vci0KqL/S8bKZ4eyj/UQfaE1ntCDyctVnItZ6gPDg0
         /u5TlE6Sz8lezh2NxkTmTBpT0cdqRfCWaEH7RjsgSGMl/ljLLLKEOz642TsVpkqf128L
         2QpK1E2I0SCVwOKMVbbllHwWFafajxaflcyMEJI/s8HE6wc9FPvHQ9sP24I902ZIoImB
         HUPg==
X-Gm-Message-State: AOAM5313HNB+bgANWzT/XxLbkdvR9/kqReJPPXCpbYDRkKGaeWFzgiPa
	kn3XUb3eBDcPJ228VKwUPetlh4fUrXFpHg==
X-Google-Smtp-Source: ABdhPJyBcGBVAC+T03DaBKMkroUTCDux2+Ph7KSA7cPWHpewt1h4cGHMxshP2AZvO/MhUhUpwxC8qg==
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr4057682wmh.174.1619527379642;
        Tue, 27 Apr 2021 05:42:59 -0700 (PDT)
Received: from agape.jhs ([5.171.81.92])
        by smtp.gmail.com with ESMTPSA id c15sm4009645wrr.3.2021.04.27.05.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 05:42:59 -0700 (PDT)
Date: Tue, 27 Apr 2021 14:42:56 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joe@perches.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/50] staging: rtl8723bs: remove all remaining debug
 macros in rtw_debug.h
Message-ID: <20210427124255.GB1399@agape.jhs>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
 <YIfwL3s5hdRTCNrm@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIfwL3s5hdRTCNrm@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 27, 2021 at 01:06:23PM +0200, Greg KH wrote:
> On Sat, Apr 24, 2021 at 11:01:43AM +0200, Fabio Aiuto wrote:
> > This patchset removes all remaining debug macros in rtw_debug.h
> > 
> > DBG_871X_SEL macro is replaced with netdev_dbg() for it does
> > a raw printk call which is not best recommended for a driver.
> > 
> > @@
> > expression sel;
> > expression list args;
> > identifier padapter;
> > identifier func;
> > @@
> > 
> > func(..., struct adapter *padapter, ...) {
> >         <...
> > -       DBG_871X_SEL(sel, args);
> > +       netdev_dbg(padapter->pnetdev, args);
> >         ...>
> > 
> > unused _DBG_871X_LEVEL macro declaration is removed.
> > 
> > Beautified register dump in core/rtw_debug.c 
> > 
> > Some code cleaning is done and all other private component tracing
> > macros are removed.
> 
> Nice work, thanks for doing all of this!  Now queued up for 5.14-rc1.
> 
> greg k-h

thank you all for helping me,

fabio
