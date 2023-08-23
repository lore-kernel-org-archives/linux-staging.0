Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645B3BE4D;
	Wed, 23 Aug 2023 13:32:45 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68a3f0a7092so3108055b3a.1;
        Wed, 23 Aug 2023 06:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692797565; x=1693402365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xv5eVKePCA5KFSpA2pd5w6RyWeOWdv6lLQse6vIRw0g=;
        b=d0rgYS8Y+6I1+6cozNjw+GCbqT2zjh8JbBLG+5cUq6a7l8pa16P7H7MhNGEeYzzkOm
         l4owq0Keli6qT4oZNQX5IDcU/SrmoNm85FbK+7kl2MSMZJczgQC0MOS6NOElJ4Vligka
         LQ5XQKtSN07khtSl7L+wx0+27mqT6nH0NCIiKh7OfyDFr7A+whwjzWmXU1QzfmrLIVL1
         tdvZdaamBtkdSXIMRjB4ubOddSASK1EU5lhzV9T6Ko0MhnWtaiEgwiKD5WcA6hDeOt47
         oC2jHxemd/cNAi+BqwrNVD8MNZp4CQtXwamK3h5qSyx8e8X1RFTiGjapTB/ACvAmoBLZ
         HEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692797565; x=1693402365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xv5eVKePCA5KFSpA2pd5w6RyWeOWdv6lLQse6vIRw0g=;
        b=HHlaIzvrH2YIpGWlbQdvpxuZmoiOoZySUOLeAJo5UAWQAdPK1dw/0/YM/XA23I+MRl
         oBt+tg4ummNWzQybBIubthK4e7HngQUpJPAsBjIJqqvbL56dMTh0ZBCgfj/L1scLrBtj
         Qp5eq3xV9MYRyUuz6RDg4My7Pvm0KOzhHWdY3U7l7gc/DkMOz0y/ISqNKNxpnb5XDP8c
         QH7u5i4BvSN+o7YI1QM0+DbMntxuDzFdl52dKnJVhBvjDBA2RjxnLXv1ivdZGBXF41HY
         nuDo1i592nKJbaa/I4H9htTY2vtfWLw9esLBWWaGZuoEEOwDn+WW/ZxjdjZ2yEtt8aQ8
         1AOg==
X-Gm-Message-State: AOJu0Yyr1hZPmD9p/wuZ3cRajZzuq4atbvZWwpK15lvhodhPBqnhZo94
	qEK1gzu4h5YPQRrSedLVp/Q=
X-Google-Smtp-Source: AGHT+IE81MW+dSvaXdO6AZ/Q5CDuianMLXm+d6NIWse2tOCvqLNqSdjiZ2QP2U/ORRuxCdQJXu3NOA==
X-Received: by 2002:a05:6a00:2d08:b0:688:45a0:eb22 with SMTP id fa8-20020a056a002d0800b0068845a0eb22mr13346538pfb.1.1692797565242;
        Wed, 23 Aug 2023 06:32:45 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.162.51.13])
        by smtp.gmail.com with ESMTPSA id a21-20020aa780d5000000b00689f10adef9sm9569926pfn.67.2023.08.23.06.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 06:32:44 -0700 (PDT)
Date: Wed, 23 Aug 2023 19:02:40 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: replace camel case by snake case
Message-ID: <ZOYKePdysbxp8lDy@ubuntu.myguest.virtualbox.org>
References: <ZOYBM9t0agzTKWwz@ubuntu.myguest.virtualbox.org>
 <alpine.DEB.2.22.394.2308231457310.3210@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2308231457310.3210@hadrien>

On Wed, Aug 23, 2023 at 02:58:38PM +0200, Julia Lawall wrote:
> 
> >  		}
> > -		if ((wDelay < W_MAX_TIMEOUT) &&
> > -		    (!(byWait & I2MCSR_NACK))) {
> > +		if ((delay < W_MAX_TIMEOUT) &&
> 
> Maybe the W_ should also be dropped?
even non staging driver have this
https://elixir.bootlin.com/linux/v6.5-rc7/source/drivers/net/ethernet/via/via-velocity.h#L959

> >   *  Out:
> > - *      pbyEepromRegs   - EEPROM content Buffer
> > + *      eepromregs   - EEPROM content Buffer
> 
> Here you could add some spaces to get the - EEPROM to line up with the
> rest.  Likewise later.
> 
> julia

ok 

> >   *
> >   * Return Value: none
> >   *
> >   */
> > -void SROMvReadAllContents(void __iomem *iobase, unsigned char *pbyEepromRegs)
> > +void SROMvReadAllContents(void __iomem *iobase, unsigned char *eepromregs)
> >  {
> >  	int     ii;
> >
> >  	/* ii = Rom Address */
> >  	for (ii = 0; ii < EEP_MAX_CONTEXT_SIZE; ii++) {
> > -		*pbyEepromRegs = SROMbyReadEmbedded(iobase,
> > +		*eepromregs = SROMbyReadEmbedded(iobase,
> >  						    (unsigned char)ii);
> > -		pbyEepromRegs++;
> > +		eepromregs++;
> >  	}
> >  }
> >
> > @@ -122,19 +122,19 @@ void SROMvReadAllContents(void __iomem *iobase, unsigned char *pbyEepromRegs)
> >   *  In:
> >   *      iobase          - I/O base address
> >   *  Out:
> > - *      pbyEtherAddress - Ethernet Address buffer
> > + *      etheraddress - Ethernet Address buffer
> >   *
> >   * Return Value: none
> >   *
> >   */
> >  	}
> >  }
> > --
> > 2.34.1
> >
> >
> >
