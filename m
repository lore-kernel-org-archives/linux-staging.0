Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9506F171A5
	for <linux-staging@lists.linux.dev>; Thu, 15 Jun 2023 14:09:13 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b51488ad67so6546675ad.3
        for <linux-staging@lists.linux.dev>; Thu, 15 Jun 2023 07:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686838153; x=1689430153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bpIQMkZ9eOZ0j/nszbK2fYznfBdaL0kTvlpcwAx2HD0=;
        b=PYBiCNZHCfD/qpe+6EpESPPuD8WD9zVvsblqOh1yQf3mCU+6R+zP+DcmgS7/LE5yzv
         okoypXDWpEwrjTg6NzmVRFmzwCelmcItXVYNHoZDs5m5EvCurScfbSaEowS0LHS25Q0O
         eoUBiVQ8UZG2aKewzbfwLhsdQZgaaew8k/8iCPttpvhUNTWn9v145gBemhLqc8Av1DAC
         HtCaRKRg5cxklfETYgkK/Epwr0i6Bz6eFjli02ZH5m/aMRCIpXE2Q9lfymH+A0+568p5
         pBKW1wIokVKNx5NL7Y5AVhoEfeeLRBtFd1cCd+I1nXVb62PSunivg9LVojhybELqm4uP
         dhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686838153; x=1689430153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpIQMkZ9eOZ0j/nszbK2fYznfBdaL0kTvlpcwAx2HD0=;
        b=c0JMr59vwOdk8yrdjJqI85f8TthKK/Zr25BC6SsP5Ft5rC4pKQHG1LWbY22EfXIMRN
         Qi+sK6wZ5kupXKXfsvB9gS5WbUKFCjWLdLES5M2Xe+YwFCo1HGOrsSpKLtin7rTh+jIw
         AwsCqFxm8L0Th6H3TAznygEjdpu5p5B8mGvHw1hJM6WtpzDPDgTNmweWDsyVEVEfq81M
         FLiGlliiRzg//k2+/41at80x6tZgRdVV0Mgxiz01C4ZlPr9CiMY/Vhtoz0Mjz/xx2CWi
         hM6KeyLL9KV7YKIB8ftT+BcsTJlgb4FIvMTJncZvzVDbuMo168nNXYzzC+f71JpyFxG0
         8L6Q==
X-Gm-Message-State: AC+VfDzvPdrrlM92jizsx2PoeM5CV+ctqoe+tm0PZR6I7BhzOWPw7/bb
	qWA/1FqpDpdQJbZLJ6mJDBE=
X-Google-Smtp-Source: ACHHUZ5G1/D5Ky4nNf/bSMsNCqyAI5BF4KhmlYSGEm0yB5rYFhvXv7+XIxbpLini0oZU5rO/pbChSQ==
X-Received: by 2002:a17:903:120b:b0:1b0:2658:daf7 with SMTP id l11-20020a170903120b00b001b02658daf7mr16769592plh.36.1686838152870;
        Thu, 15 Jun 2023 07:09:12 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id w8-20020a170902d70800b001ab1b7bae5asm3888613ply.184.2023.06.15.07.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:09:12 -0700 (PDT)
Date: Thu, 15 Jun 2023 19:39:08 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: [PATCH v2 0/5] Trivial code cleanup patches
Message-ID: <20230615140908.GB37552@yogi-Zephyrus>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
 <2023061532-fall-earthy-c429@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023061532-fall-earthy-c429@gregkh>

On Thu, Jun 15, 2023 at 12:36:45PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jun 07, 2023 at 08:31:19PM +0530, Yogesh Hegde wrote:
> > These patches remove variables in the struct rtllib_device that were 
> > set only once throughout the driver. Instead of using these variables, 
> > the patches modify the relevant code to directly call the corresponding 
> > functions, eliminating unnecessary indirection and removing CamelCase.
> > The patches are required to be applied in sequence.
> > 
> > Yogesh Hegde (5):
> >   staging: rtl8192e: Remove variable SetWirelessMode
> >   staging: rtl8192e: Remove variable SetBWModeHandler
> >   staging: rtl8192e: Remove variable LeisurePSLeave
> >   staging: rtl8192e: Remove variable InitialGainHandler
> >   staging: rtl8192e: Remove DRV_NAME definition in rtllib_debug.h
> > 
> >  drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  4 ++--
> >  drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  4 ----
> >  drivers/staging/rtl8192e/rtl819x_HTProc.c      |  8 ++++----
> >  drivers/staging/rtl8192e/rtllib.h              |  6 ------
> >  drivers/staging/rtl8192e/rtllib_debug.h        |  5 -----
> >  drivers/staging/rtl8192e/rtllib_rx.c           |  3 ++-
> >  drivers/staging/rtl8192e/rtllib_softmac.c      | 16 +++++++---------
> >  drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  9 +++++----
> >  8 files changed, 20 insertions(+), 35 deletions(-)
> > 
> > -- 
> > 2.25.1
> > 
> > 
> 
> These break the build, as reported by the test robot, please fix up.

Hi Greg,

These patches do not work because this driver is divided into two
modules.

The driver is loaded in 2 different modules:
sudo insmod drivers/staging/rtl8192e/rtllib.ko
sudo insmod drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko

So this line is required:
priv->rtllib->SetWirelessMode = rtl92e_set_wireless_mode;
as one name is used in one module and one in the other module.

So when I suggested these fixes
1.  Patchset to combine both the modules into one module.
2.  Or resending v1 of the patchset.

to Dan Carpenter <dan.carpenter@linaro.org> and
Philipp Hortmann <philipp.g.hortmann@gmail.com>, in their opinion both the
suggested fixes are incorrect, which I agree with.

Link to conversation -
https://lore.kernel.org/linux-staging/90813181-02a1-b54f-132b-c68e7b797bb6@gmail.com/

I have yet to find a correct way to solve this problem. Please let me
know if you have any suggestions. 

Regards
Yogesh
