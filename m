Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA914AA7
	for <linux-staging@lists.linux.dev>; Tue, 29 Aug 2023 13:58:52 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b703a0453fso66021201fa.3
        for <linux-staging@lists.linux.dev>; Tue, 29 Aug 2023 06:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693317530; x=1693922330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PVOLZcx4AIsXRc/g2YpZsFOczjBN4OxBp91WfaIe2vg=;
        b=FvZDE4sgX8Gcc101vhoVpJMA3I12lrHibVAihaKMEKzpoe1xs4qHkG8kwDjcsVwVpp
         QbDuoaNsOIRTV/bF5QYgTdWGehJReCU3582y/652LyDNani64nCF5Ammtb6klL4ccClP
         XvzLMer33ouc6ebPeutHuv1C4wOOolNCpVr7QmEqjf06kAjPXGDG3Lfd5coE3HDI0dh2
         9Bz4L4uNPhtyW6E5mVF+I864ZeA6LbXc0/BTeaqu2TlozrJCZ1iuydfBq9I+Mw5u0ztb
         NiP1oD8khdLsvRPKumPhMuJoyVt4D9z0aKy3x+XpD0A8PBHwHCydp2IB4O/qOvhCakrs
         GXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693317530; x=1693922330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVOLZcx4AIsXRc/g2YpZsFOczjBN4OxBp91WfaIe2vg=;
        b=Z96Y0MrFyf00i2ii/tiJBVXZixIJr9cvvav4oEq237kxp/1+ig3IlKaS5d/3H73Xu1
         r0+GwPhlbYh6nm2dgREKq5wIEm0CUu8lsR6OrEgGsNvGki8zPDTBL00Po8mQu0J7yql5
         ZmFCxyyzoxyNgP53F/49/OfiRox6eBjgd892id9LBgVLlsuBt0ismynVyUx7z7MfKc3i
         c2dtk7skn7fe2xixsJGzGS51aO+HQNA5CAA8OqULkax1kYylmQ+XLbExhtgPHqloi7iN
         JIM7sOdDFTGmG+R/W8rKFuE67z33MHU/IvhW+WS/VwYwYNDv0VqKfkoW4OOJAsxSo8YN
         v1zw==
X-Gm-Message-State: AOJu0Yy0LnWKb9JhwuY554zfaZaGmHkCIXE2jLTb5x4QxD2eyewPxeUm
	2mAhB7apAO+cbcKSqtOeP/Hy8cNdsSY=
X-Google-Smtp-Source: AGHT+IEX3RcLp3mP5kiuUipDYPnAMBrkSNwpCXeQ4bDmFU6lxo4oRGOzcC7A8SJlFjkRBmRlQTN3XQ==
X-Received: by 2002:a2e:b0e5:0:b0:2bc:e954:4203 with SMTP id h5-20020a2eb0e5000000b002bce9544203mr10460992ljl.26.1693317530067;
        Tue, 29 Aug 2023 06:58:50 -0700 (PDT)
Received: from nam-dell ([131.155.246.6])
        by smtp.gmail.com with ESMTPSA id q4-20020a170906144400b00993860a6d37sm5967206ejc.40.2023.08.29.06.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 06:58:49 -0700 (PDT)
Date: Tue, 29 Aug 2023 15:58:48 +0200
From: Nam Cao <namcaov@gmail.com>
To: ozlinux@hotmail.com
Cc: gregkh@linuxfoundation.org, colin.i.king@gmail.com,
	sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/6] staging: octeon: clean up the octeon ethernet
 driver
Message-ID: <ZO35mJ/9p3TrZiWv@nam-dell>
References: <PH7PR11MB7643280D48E45D2B660F5B6CBCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>
 <ZOysbIihBA5ZMGc9@nam-dell>
 <PH7PR11MB7643DE405C5FBBE0B0E63313BCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB7643DE405C5FBBE0B0E63313BCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>

On Mon, Aug 28, 2023 at 10:44:42AM -0400, ozlinux@hotmail.com wrote:
> On Mon, Aug 28, 2023 at 04:17:16PM +0200, Nam Cao wrote:
> > On Mon, Aug 28, 2023 at 09:39:13AM -0400, Oliver Crumrine wrote:
> > > Make the octeon ethernet driver better conform to the linux kernel coding standards
> > > 
> > > Oliver Crumrine (6):
> > >   staging: octeon: clean up the octeon ethernet driver
> > >   staging: octeon: clean up the octeon ethernet driver
> > >   staging: octeon: clean up the octeon ethernet driver
> > >   staging: octeon: clean up the octeon ethernet driver
> > >   staging: octeon: clean up the octeon ethernet driver
> > >   staging: octeon: clean up the octeon ethernet driver
> > > 
> > >  drivers/staging/octeon/ethernet.c     |  6 ++--
> > >  drivers/staging/octeon/octeon-stubs.h | 50 +++++++++++++--------------
> > >  2 files changed, 28 insertions(+), 28 deletions(-)
> > > 
> > > -- 
> > > 2.39.3
> > >
> > 
> > The patches themselves should also be sent with this cover letter. Instead they
> > are sent in a different thread :(
> > 
> > Best regards,
> > Nam 
> 
> Looking at the what I sent, all the patches should be in reply to 
> <cover.1693229582.git.ozlinux@hotmail.com>, both according to the patch
> that was created by git format-patch, and Outlook. If in-reply-to and
> the thread are 2 different things, please let me know, and instruct me on 
> how I should put the patches in the same thread.

(keep in mind I know little of emails, I am just guessing here)

It seems that your email client or email provider changed your message ID. See:
https://lore.kernel.org/linux-staging/PH7PR11MB7643280D48E45D2B660F5B6CBCE0A@PH7PR11MB7643.namprd11.prod.outlook.com/raw
that "Message-ID" is not what git-format patch generates. Your original email
ID is instead in "X-Microsoft-Original-Message-ID". So your patches have
"In-Reply-To" that refers to an ID that has been removed, so the email thread
is broken.

So perhaps try to change your email settings to stop this from happening, or
change your email client / email provider.

If you figure out what is the problem, consider sending a patch to
Documentation/process/email-clients.rst documenting this.

Best regards,
Nam
