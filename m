Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6509D3D82
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 21:30:17 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 125so18381742pgc.11
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 14:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs-iitr-ac-in.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bKc2RsG7u0Dt9SRYrdepMbEzWeuJkK4ThHyJlKzG4oQ=;
        b=KvGviDahz+0YxI4Ikdgo2vKDTpdEKuUdKS0LYj1ul1SopRDHL2WTRg3B7lZb+G5BXQ
         LLz2+aXrSvqvyscboBTUiCg7RIFAhidq6am/3nwGtpp5axMP3ebS5boDlxfZzXH+aRhx
         qaLgBg9AvSkRfR1pX9sJbgmlEhK88ttwpgCX4dIrOdy3O5ZoIHCYxixh+IAfj1OucRJW
         eCeb3DHLKPyIOayoBJcK1HZT7L09K3TYhIR1BtzUdbbCWTTAotB5hSHUcWyS4Mwq/Ezj
         ebREbAEiDq+b/h1CDf8gxUMUHRiPQCbP9d0GYjxEqP3itNGatAptHDF87Wk/PS8suAVw
         +clQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bKc2RsG7u0Dt9SRYrdepMbEzWeuJkK4ThHyJlKzG4oQ=;
        b=JPmYLU+JAqArZEpy2N7lklt1FBpI4Kc2Q2TEScnPy9tGKRkwAgKRc41uJuf8NGyURY
         b6zYaVQeS1wzmRBNJgr4hS1850kPnP7e5wGqVfime9mHlB+pEvdVchcVDeuznfnAA+cU
         GbaAFlErSqEBSWnbZhgvSWVUvGWAOjAoEUokpUfwgQ1xqWz77RFyDLA6tpfUr7IM5ZpF
         CgNJLnUiMtidvg1D0W0ab7PfEJeKeno+mqUGvjgE3SMyp/XyQxwLDeTu6ofHi7zAQg2Y
         59mCqY4xTfXPCL/iYouqJ5IEdZuPwecP6UDSmrGT5AWyjmncoM9nuDsfdq8FSo+TncM/
         adIQ==
X-Gm-Message-State: AOAM532GH3Lw7ovdBsz1wkikdlzoWHALBNsALMzop2A2p8w4501ZBk7O
	7xM2Kqfb6HI+JJJADLNKBuSLhe5uXxSNBAIRegM+dQ==
X-Google-Smtp-Source: ABdhPJyyil8BZGNUAaxupefL2LwqP4c7rGgTZBi2Ndy2D3Tc3LXcIpd0IqCPcKte9vCXggWHFoPkUNDd64ZCAnDRD9E=
X-Received: by 2002:a65:638d:0:b0:39d:74ad:ce0b with SMTP id
 h13-20020a65638d000000b0039d74adce0bmr7400676pgv.103.1649799016617; Tue, 12
 Apr 2022 14:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220411205321.13109-1-mahak_g@cs.iitr.ac.in> <c5fc1685-b1cc-7cfa-1ddd-e2f93105c2a5@intel.com>
 <027acae3-29ee-ae35-4448-a56e66383849@lwfinger.net>
In-Reply-To: <027acae3-29ee-ae35-4448-a56e66383849@lwfinger.net>
From: MAHAK GUPTA <mahak_g@cs.iitr.ac.in>
Date: Wed, 13 Apr 2022 02:59:39 +0530
Message-ID: <CANnaPbBpWmp3PUgp=yRxhykzKjpP1HHh9Fk0aEBJ_+EGNUStvA@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: correct multiple misspellings in driver r8188eu
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Dave Jiang <dave.jiang@intel.com>, Phillip Potter <phil@philpotter.co.uk>, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 12, 2022 at 10:48 PM Larry Finger <Larry.Finger@lwfinger.net> wrote:
>
> On 4/11/22 16:28, Dave Jiang wrote:
> > Subject:
> >
> > staging: r8188eu: fix multiple spelling errors in driver source
> >
> > Given that it already annotated that it's the r8188eu driver, no need to add "in
> > driver r8188eu".
> >
> > Maybe the log can be something less terse:
> >
> > Fix multiple spelling errors reported by checkpatch.
> >
> >
> > Probably doesn't hurt to fix other issues on the same line while you are at it.
> > See below...
>
> Wrong on the first and last points. That subject is exactly what should be used
> - it describes what is being modified.
>
> A given patch should fix one, and only one, problem.
>
> Yes, the commit message could be less terse, but that is not a problem.
Ok so considering the last comment, I am sending version 2 of this
patch with an appropriate commit message.
>
> Larry
