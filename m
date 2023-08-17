Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA7AE55B;
	Thu, 17 Aug 2023 12:08:44 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6886d6895a9so2079848b3a.0;
        Thu, 17 Aug 2023 05:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692274124; x=1692878924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HqxtbcBfbYTw4bwKds0vVLnrXgHI7+miuCUNWaBWa7U=;
        b=BSgwA8FXepJGHNhfB9zJbVWBhnIrXJhVXSUfj4T0t1L4KxfRWLvdnF3uzzzq62kDXT
         BxgWWjNkFkbM+xhp8I833GFtzfUuY6fJLTiPdmR32nFDbiFaUtrGpq8838hxJtMXIBdm
         gkvNanDoQ8SdBc4j8h4t7bpE6MeZmN/cjc9L+/5U1rguB3Hl1Ap4CZs6LUOnaI8EqzT9
         qMLRvvNIpuG/8jQJIvLTDWVURSRlrACQyMTU22DMCR5Zp1Kk3McH83kZdmYUeZzqAGT+
         eNGE938Y9W5dXbSsUeIVmSXC0eEqSNXVphiWmynPp12fUtifvL1wkRtoPdP7oiBImD9m
         i4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692274124; x=1692878924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqxtbcBfbYTw4bwKds0vVLnrXgHI7+miuCUNWaBWa7U=;
        b=LERNbBKAYobyumz4TpnDJY8HRYlVTiWFQCg6nrQruZo0DE2Arm9vcJoX0sVHcaWxTf
         zawDx53oLTe17ffcvTe/mbkJe/WLtGh9wrzznbImLuk11Ub0Wsuny1FwtlfBQ/inWyo9
         KELFm0YvumuTeYP73TgfVfuj+nZshI3KHdCdkjwot/SKG/oVE0iBFGMXD04oE/JNqRZ5
         GG42JZM54ERTimqfupyd3+x0bIcYpUNkft+PUMJXmQWYVDi8QvaU4/6XuVwBGsyyfnQZ
         lyLHtvUNbNsVCD7PKuzWqJZyzKsrFJhcD2NkpJV3f6nVmOLI+weBQYF9CNYu8J1Lzh5W
         26Bw==
X-Gm-Message-State: AOJu0Yz317AisXdTHsNUStfBMliSTXWW1KaJkSCEZxl0gb9gRyUSr4ne
	IiARNf5VVQqJP1u2U17K2bU=
X-Google-Smtp-Source: AGHT+IEaXBIjxK7FY23yjT6hXgMXg2LTXvxMF1ggJVAz2jrS50SMzy16h8KpOxh3qWjqck/pag4OaA==
X-Received: by 2002:a05:6a21:4889:b0:140:b178:9b36 with SMTP id av9-20020a056a21488900b00140b1789b36mr5468021pzc.48.1692274123919;
        Thu, 17 Aug 2023 05:08:43 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.162.54.25])
        by smtp.gmail.com with ESMTPSA id y18-20020a62b512000000b006875df47743sm12724003pfe.156.2023.08.17.05.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 05:08:43 -0700 (PDT)
Date: Thu, 17 Aug 2023 17:38:39 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: replace camel case by snake case
Message-ID: <ZN4NxzozblvEX7IS@ubuntu.myguest.virtualbox.org>
References: <ZNOK2u1sJoRAxhIC@ubuntu.myguest.virtualbox.org>
 <2023081150-hamster-sulfide-4231@gregkh>
 <ZNfPiQAL3ixA7tjz@ubuntu.myguest.virtualbox.org>
 <alpine.DEB.2.22.394.2308122041160.3315@hadrien>
 <ZNolyVLwygowAzE2@ubuntu.myguest.virtualbox.org>
 <2023081442-cartridge-thaw-1656@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023081442-cartridge-thaw-1656@gregkh>

On Mon, Aug 14, 2023 at 05:20:40PM +0200, Greg KH wrote:
> On Mon, Aug 14, 2023 at 06:32:01PM +0530, Pavan Bobba wrote:
> > On Sat, Aug 12, 2023 at 08:41:51PM +0200, Julia Lawall wrote:
> > > 
> > > 
> > > On Sat, 12 Aug 2023, Pavan Bobba wrote:
> > > 
> > > > On Fri, Aug 11, 2023 at 11:27:10PM +0200, Greg KH wrote:
> > > > > On Wed, Aug 09, 2023 at 06:17:22PM +0530, Pavan Bobba wrote:
> > > > > > Replace array name of camel case by snake case. Issue found
> > > > > > by checkpatch
> > > > > >
> > > > > > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > > > > > ---
> > > > > >  v1 -> v2: 1. array name renamed from byVT3253B0_RFMD to by_vt3253b0_rfmd
> > > > > >            2. typo in the subject line "small case" corrected with the
> > > > > >               proper word "snake case"
> > > > > >
> > > > > > Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> > > > > > ---
> > > > > >  drivers/staging/vt6655/baseband.c | 6 +++---
> > > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
> > > > > > index 0e135af8316b..cc8793256661 100644
> > > > > > --- a/drivers/staging/vt6655/baseband.c
> > > > > > +++ b/drivers/staging/vt6655/baseband.c
> > > > > > @@ -499,7 +499,7 @@ static const unsigned char by_vt3253_init_tab_rfmd[CB_VT3253_INIT_FOR_RFMD][2] =
> > > > > >  };
> > > > > >
> > > > > >  #define CB_VT3253B0_INIT_FOR_RFMD 256
> > > > > > -static const unsigned char byVT3253B0_RFMD[CB_VT3253B0_INIT_FOR_RFMD][2] = {
> > > > > > +static const unsigned char by_vt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
> > > > >
> > > > > Again, the "by" needs to just be dropped.
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h
> > > >
> > > > hi greg...did'nt get your comment. can you please provide more elaborate
> > > > info?
> > > 
> > > Drop the letter "by_" at the beginning of the function name.  It is there
> > > ot indicate the type, which isn't done in the kernel.
> > > 
> > > julia
> > 
> > this is'nt a function name but an array name. is in't it fine?
> > 
> 
> Not at all.  The issue is the name, why are you just adding a "_" here?
> What does "by" mean?  (hint, this is a rhetorical question, I know, I
> need you to figure it out so you know how to properly rename the
> variable here...)
> 
> thanks,
> 
> greg k-h

Thank you for the info. i have updated the patchset V3 based on this
discussion and will keep this point for future patchsets
