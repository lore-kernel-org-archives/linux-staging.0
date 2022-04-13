Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC8B291E;
	Wed, 13 Apr 2022 18:57:25 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id b15so3559994edn.4;
        Wed, 13 Apr 2022 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zgDffCHIICFS/vlMeDY9PypByW5XOhUKrfTcWIujgT8=;
        b=U36yADLDfK7lUmGVx7MuhB6znhwRXeWMDPzQIqEJJ5+wxQ+k+1EiIjVp5y4DCsqmoO
         YdopaseqV/Nb8OkcXE2hADgPXoYwLJOGQBOz/8SO5HepLfGGCFAVX/70uXa7p8HmRCcI
         y1wgZljMgcUtQ7fP7n2VMgnHSNrIrXLP/46QIYrgE2UrJDA1gPx2H/f3V+TyUYkgAE58
         VOuu/CtgPYK6QeFAcDfAtMew88mFUTG8CNWU2rtoh/I6dP8i23o5QDo0mkbZsSdxS7z0
         5fZ27Nemqd0nrBVVyVZ8yk/H0iJA8Axkbxtnb5JwkikW8mdnTMI2Ib3jN0o1Gf3O7CIP
         +mQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zgDffCHIICFS/vlMeDY9PypByW5XOhUKrfTcWIujgT8=;
        b=Aep8hEBhRaQD1VG6Lgtvyop2Tx5f3R72X8Kh3QdbW+RvHl1E2S50o3M/xlacAtGxc6
         1qo/dHbF7S9BGRrWi9uZZbMgQfljOKNh/c5+GgQ5x6dgKJMGmKInwFGRXZkeNlabIZcR
         Yrj5on7QCo9Cg3yF7RLxLlbE5bkx6ieJuLDotdv8eSQaz815anAZzTrdvrhvVq83YZkT
         O4ZB0Uv8yIMNhOVSXeh9WFPubuGHEe0FD/SxuBd/XlLe9fiXKpullRFFZOAq/IWoSg/W
         JL5aqUJzMJsDeu0v31k29DtwG5nLscHM6h7vyH8DTYF2jJzftZVEW3Y6fyXpLJDh0Oxm
         hdeQ==
X-Gm-Message-State: AOAM531aPZwK1G7uKS8+oQr+B47BLesVGXMe0neu/V1SBiTGFPIH8gTi
	N/GNE1sn2qNojj0xNFV+6SM=
X-Google-Smtp-Source: ABdhPJytfHGwfHZd5ZLjCnzP1anHIVvPnfbzPu8B4NFZJkcBSNepfVcEnsyl8eeve0dvFfUIwO/5Gw==
X-Received: by 2002:a05:6402:50c7:b0:419:534f:bbd7 with SMTP id h7-20020a05640250c700b00419534fbbd7mr43770922edb.209.1649876243311;
        Wed, 13 Apr 2022 11:57:23 -0700 (PDT)
Received: from leap.localnet (host-79-43-11-75.retail.telecomitalia.it. [79.43.11.75])
        by smtp.gmail.com with ESMTPSA id h8-20020a1709066d8800b006e09a49a713sm252533ejt.159.2022.04.13.11.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 11:57:22 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: Remove the drivers for the Unisys s-Par
Date: Wed, 13 Apr 2022 20:57:20 +0200
Message-ID: <7390243.EvYhyI6sBW@leap>
In-Reply-To: <20220413153824.GA1241369@alison-desk>
References: <20220412215901.31046-1-fmdefrancesco@gmail.com> <3988824.6PsWsQAL7t@leap> <20220413153824.GA1241369@alison-desk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On mercoled? 13 aprile 2022 17:38:24 CEST Alison Schofield wrote:
> On Wed, Apr 13, 2022 at 09:35:53AM +0200, Fabio M. De Francesco wrote:
> > On mercoled? 13 aprile 2022 08:52:47 CEST Greg Kroah-Hartman wrote:
> > > On Tue, Apr 12, 2022 at 11:59:01PM +0200, Fabio M. De Francesco 
wrote:
> > > > The Unisys sub-tree contains three drivers for the "Unisys Secure 
> > Partition"
> > > > (s-Par(R)): visorhba, visorinput, visornic.
> > > > 
> > > > They have no maintainers, in fact the only one that is listed in 
> > MAINTAINERS
> > > > has an unreacheable email address. During 2021 and 2022 several 
patches 
> > have
> > > > been submitted to these drivers but nobody at Unisys cared of 
reviewing 
> > the
> > > > changes. Probably, also the "sparmaintainer" internal list of 
> > unisys.com is
> > > > not anymore read by interested Unisys' engineers.
> > > > 
> > > > Therefore, remove the ./unisys subdirectory of staging and delete 
the 
> > related
> > > > entries in the MAINTAINERS, Kconfig, Makefile files.
> > > > 
> > > > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > ---
> > > >  MAINTAINERS                                   |    8 -
> > > 
> > > You forgot to at least cc: the people/list on the MAINTAINERS entry 
that
> > > you are removing here, to give them a hint that this is happening in
> > > case they want to speak up here (and to give us the ability to point 
to
> > > that years later when they complain they were never notified...)
> > 
> > Yes, this is a good idea. I'll submit a v2 and add two "Cc:" lines, one 
to 
> > David Kershner and the other to the "sparmaintainer" list at 
unisys.com.
> 
> There is another contact in the TODO file (last updated 2015 though ;))
> Ken Cox <jkc@redhat.com>

Hi Alison, Greg,

Thank you very much for noticing that other contact :) 

In the last 12 months I have sent several patches for Unisys s-Par drivers 
but I never noticed that other contact simply because I only ever use 
scripts / get_maintainer.pl to find out who and to which lists to send my 
works.

@Greg: 

Do you think that we should care of a contact that is no more active since 
2015 and resubmit a v3 with one more "Cc:" line? I have no problems to 
resubmit, I just want to be sure that this is the right thing to do.

Thanks,

Fabio M. De Francesco
 


