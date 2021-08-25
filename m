Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230123FC0
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 12:11:33 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id b7so36636414edu.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 05:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=78fuDtGdiJkSRp2noeoObedntOADJ5PLukyaDoEGYms=;
        b=fVAd9ZUYnHE7ghmyI04wX0XnRWSbVy1rZl96lrl6AqhKJDQNea3gdxCyGnetcCdHvB
         /xqZ2PSK4gRInyWAvDC82DqneRN6IxDiTQY0i1nrx3SFOqjBnXD2sG8zaw+B1JG2B/yf
         NdHzUbDk04whbfj2r6FG4+yBCa/3InQ47JMRx9BqWK7DSQqc1s/CZJ6rP7xwF3mo775C
         UxPdkNroJr48FE7Z3SZ2hVzY383Z68pvDnlZ5KUGWe6r18ZDH295xFL2Bz9UNaOhdoO5
         ECHQbRRIxFDOfypkgnTKLRNY2h/rjfWNedA2dN55rao2gWiJsEuVxgJa1NC1zzaFKRoz
         FGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=78fuDtGdiJkSRp2noeoObedntOADJ5PLukyaDoEGYms=;
        b=CRGpbfgCU+YkFaPE68b3DW4jkJx4VjtgrZpjljQ1Y2L5k18nkXNfzRNZWy+J/bFxxM
         74V6363UvrWez1zcWdj5LDzFvGE9fXHLViQRISXnNdfXxRK4BEHbAnIQ3cbOI9C82OXP
         YKx/4pEqJVQJ7fpguTVZLUrKXsiW/T60eEAVomKhkF2hsExt1E46RFShM96/NFrYw69m
         AjuDwC2uMT5x5xMxFyiZjGtY5/K4USRHyi9ogCnOlYNkXPP/50M56G6xi29WKkAsLXRN
         g1HeYUOTKjQ+E5j0gVN1/Cp62/TdaApHno/uDWFGgAiTav1XyCh6vtDLTRsYomEzAchW
         eZcg==
X-Gm-Message-State: AOAM532hkgBhWPb7fNROk5PTiwTLPRCGdok/OoFcK46gV0sfcAOdGrRy
	5c/6ZauGSzqtA6pLlLLuV8s=
X-Google-Smtp-Source: ABdhPJwtj0rB0CpGYG5QvGGgd3o7WMrJPtpJ04lLDb4itQRxG/vMdxZjJ+XvTVtu6Q9JYcHVizvEsg==
X-Received: by 2002:a05:6402:4303:: with SMTP id m3mr48991271edc.379.1629893491486;
        Wed, 25 Aug 2021 05:11:31 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id d23sm13607473edt.39.2021.08.25.05.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 05:11:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>, Larry.Finger@lwfinger.net, phil@philpotter.co.uk, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] staging: r8188eu: add error handling of rtw_read16
Date: Wed, 25 Aug 2021 14:11:29 +0200
Message-ID: <46570925.meDeiM9PHE@localhost.localdomain>
In-Reply-To: <20210825113122.GT7722@kadam>
References: <cover.1629789580.git.paskripkin@gmail.com> <3494498.825kMHXWDN@localhost.localdomain> <20210825113122.GT7722@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, August 25, 2021 1:31:22 PM CEST Dan Carpenter wrote:
> On Wed, Aug 25, 2021 at 01:06:40PM +0200, Fabio M. De Francesco wrote:
> > On Wednesday, August 25, 2021 12:38:02 PM CEST Dan Carpenter wrote:
> > > On Wed, Aug 25, 2021 at 01:13:54PM +0300, Pavel Skripkin wrote:
> > > > Both series are pending right now and made on top of staging-next branch.
> > > > Who needs to rebase? I think, applying these series as-is can broke the
> > > > driver, since error handling will be broken
> > > 
> > > That's a bug then.  The patch should be rejected.  You're not allowed to
> > > break the code.
> > 
> > Sorry Dan, I disagree. It's not a bug. No one intend to break the code. 
> > How could anyone know that someone else is working simultaneously on 
> > some code that is not compatible with the work of the other developer?
> 
> Okay, I haven't been following the discussion closely.  If these patches
> introduce a known bug, then I am going to be cross.
> 
> I'm really stressed out right now.  If you at all suspect that your
> patches are going to introduce bugs then just go back and say "Sorry,
> don't take this one, the way it conflicts with Pavel's ends up
> introducing a bug.  I'll resend after Pavel's patches are applied."
> 
> regards,
> dan carpenter
> 
Dear Dan,

Yours is a nice solution to this problem. 

I had thought that I should have waited for Greg to ask to take into account Pavel's 
series, change some lines of his code (because they are the only users of the new 
version of the helper function, that is my work - as suggested by Greg himself), 
rebase and resend, I really think that your idea is better.

I'll do as you suggest ASAP, within the end of the day (now I have to go).

Thanks very much.

Fabio


