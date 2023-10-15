Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58755FBE6;
	Sun, 15 Oct 2023 19:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Es0UZLKa"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso1416545b3a.2;
        Sun, 15 Oct 2023 12:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697397553; x=1698002353; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6D1FB5LCWe5+pgRGVMl8YGDlVNocRdZi5zO7vTLOp1k=;
        b=Es0UZLKa0Blp372VFjkB48C+/MZnFq1mz/zuZUiOOuKToCZG7GR9qz0gnqelsPYD8D
         nZd0/0TWPYDwr8gH/XEA/c6L55RL5RHSALVmj392PEAvlBti4nHOFrhUCDTZJOgvfnvV
         83Of/fcfaFA69ZoBx5mEf+++JvYasK3l6ouyyHWxJDotWckEvOFZftzQ0yTL/iN6ExPz
         HqcS69SB8wBb84DyHjzJEVzyPxSsv1k85DhQoRt2QkTtBi2PdNnw6nbaDs7zFpTAj3Zd
         Jkr9HZCtjr1fR75iK8BPtc7P5B96Gz/NnBLmv8AotHXELQfQClfqBPRB3n560nuiRGVh
         VdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697397553; x=1698002353;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6D1FB5LCWe5+pgRGVMl8YGDlVNocRdZi5zO7vTLOp1k=;
        b=MjUj4kW4YI4KSbUEm58x6/QTWMiNMXrvu3km235jHSLfkOJEori1ahNk8bQRXlHzz+
         PfqxkZ0f0nqgy5PsVEj1Xg9FA3obUQuSsLZ8WcLGuhMJ/QeOR2ZOW6ulRY54LVkdb/F9
         yhVipbzeh557dvfBB2jFHNmCf+MbH0dD12qWP/iGuQySCV4o2XydJpq0PY2egNmqlFUO
         xajCxFEF2rrI58zHl2vd5x3mdLMLHYCS7DOHAwf6wU/mal3ginZXCC6q7nw+0PSwtIFw
         14V7fslEOy9DNIbsm6ayPAahYx3REzOKrxZefZcqSocQ87booTNVd9MdNeNCLccdUShI
         hHpQ==
X-Gm-Message-State: AOJu0YzDLNE2T7ybI8ljvIB0icLDPl2bGEGTeC55ZK8Ky8994GguIVy2
	HwsovsInWmve247O7Aebg+o=
X-Google-Smtp-Source: AGHT+IGwnPwzd1w/U3V/+aV6xYyt2haECnHpqgVZhtugIsRBR7bQ6rZcoH8alxLhhb2Gh41Crg25Wg==
X-Received: by 2002:a05:6a20:5490:b0:13d:8876:4c97 with SMTP id i16-20020a056a20549000b0013d88764c97mr34217524pzk.16.1697397553507;
        Sun, 15 Oct 2023 12:19:13 -0700 (PDT)
Received: from Negi (2603-8000-b93d-20a0-2184-6fa4-0d39-1c6b.res6.spectrum.com. [2603:8000:b93d:20a0:2184:6fa4:d39:1c6b])
        by smtp.gmail.com with ESMTPSA id i15-20020a63b30f000000b005891f3af36asm5641490pgf.87.2023.10.15.12.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 12:19:12 -0700 (PDT)
Date: Sun, 15 Oct 2023 12:19:10 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] tty: gdm724x: Add blank line after declaration
Message-ID: <20231015191910.GA2361@Negi>
References: <cover.1697184167.git.soumya.negi97@gmail.com>
 <3b24ca9976cf873dbaadb499e09d7b545e9db89c.1697184167.git.soumya.negi97@gmail.com>
 <2023101551-placidly-garnish-3ee7@gregkh>
 <20231015060716.GA31326@Negi>
 <2023101508-curry-disorder-1b10@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101508-curry-disorder-1b10@gregkh>
User-Agent: Mutt/1.9.4 (2018-02-28)

Hi Greg,

On Sun, Oct 15, 2023 at 02:50:44PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Oct 14, 2023 at 11:07:16PM -0700, Soumya Negi wrote:
> > On Sun, Oct 15, 2023 at 07:37:30AM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Oct 13, 2023 at 01:26:35AM -0700, Soumya Negi wrote:
> > > > Fix WARNING: Missing a blank line after declarations
> > > > Issue found by checkpatch.pl
> > > > 
> > > > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > > > ---
> > > >  drivers/staging/gdm724x/gdm_tty.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > 
> > > Why do you have "tty:" as the prefix for a staging driver?  Shouldn't it
> > > be "staging: gdm724x: ...."?
> > 
> > Hi Greg,
> > 
> > Thats what I thought too. But when I looked at the git history for
> > gdm_tty.c the last few commits had "tty:". So I went with that.
> 
> That is because those commits were tty-wide, and they changed things in
> multiple drivers all at once, not just for the one file.
>
> > Should I change it to "staging:"?
> 
> Please do.

I'm sending this patch in a new thread since the other patch in the
patchset(had 2 patches) was reviewed as unneeded.

Regards,
Soumya
