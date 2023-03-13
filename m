Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D2C3C35;
	Mon, 13 Mar 2023 18:26:07 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id ek18so21285430edb.6;
        Mon, 13 Mar 2023 11:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678731966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNpONYyMLc+O1cKJ44IbWyBUFtwAAv8E60RL7W04AJs=;
        b=TvMwO/eRVJjtB5Li/d+OdXqri6XouTMznM1hLlNq+N1QlMcq5ib4hDjeR8W2r/Bu6F
         husjX1IJLLGago3Ee0Sxi1ZJZVDJjno//1cZPO3pABr5lUDq6gvx0o3YtbRNXwLJgoFD
         f+tDflU1C3bidWnVdF9zqqx43WogpaF4CTL7czigncnO0AZquvqjQ4kXZayjWteAKO2+
         YZORJe3tr6kTIM3ubTaK4YxnRRZDhb7VxW5/WdqHRagLtCnyy8XVEUd62ma/1EY9TYVb
         6SAb6wY9mbbdLKi4xh8mDrDyY3BlN3tiJo1GshOnl46swXN+oHEFrQqd324xuJKNAfUD
         AAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678731966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNpONYyMLc+O1cKJ44IbWyBUFtwAAv8E60RL7W04AJs=;
        b=qN/FrhYHaj1k5KqrWL5l3SPDFjk9L9B77SFXaTf1lFNBMkFD0/xZ11oGQdUneHFrK+
         Ol4aOojXAbuhm0J/tukJmEZ5TObXDLor+n0Jd5xWpE+YCT4Xpj8aPvXUVxOXS8U296qi
         oKWYguqKEmxGiInu4josnKWjaO02uSFCpmjy4AQ03Az9BZFbsS6vImnr0vJq2dkxk3mL
         hkqIi1Tk9mTxqvCVndIiS1g3+flOuPK/WsLux/D7gD4sfen+G2KuFXolhaKsT1V7k+Zj
         11uSRvlqVtBwAQ2jpmTD8Ah+DJQsVjWvUavLXq3otL5YWTTq8qTjyg30wbdaioIPbja3
         xQwA==
X-Gm-Message-State: AO0yUKXUfRnk+7DVBpz7t+K1W0+LYHe1+LS8ApAcbtmoJfkomlwrWBJ9
	rtSmaAiijcrDAnxNVmktkDk=
X-Google-Smtp-Source: AK7set+Z8ronD1GN+O2t9fXb5cb2hJc2oxsGuVi0IlG9McCgm+whf9GReA9jIB1G/rvu3znojVY/3A==
X-Received: by 2002:a17:907:3186:b0:92b:dff4:f8e9 with SMTP id xe6-20020a170907318600b0092bdff4f8e9mr1804273ejb.8.1678731965814;
        Mon, 13 Mar 2023 11:26:05 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id x5-20020a1709064a8500b008e7916f0bdesm102538eju.138.2023.03.13.11.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 11:26:05 -0700 (PDT)
Date: Mon, 13 Mar 2023 23:26:03 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: axis-fifo: initialize read_timeout and
 write_timeout once in probe function
Message-ID: <ZA9qu+E/gPZ68mw4@khadija-virtual-machine>
References: <ZA4M3+ZeB1Rl2fbs@khadija-virtual-machine>
 <9938109.ZD9C4EEAuf@suse>
 <ZA83yzPTq+nQF9Dd@khadija-virtual-machine>
 <ZA9ZY91K8iQtn0ev@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZA9ZY91K8iQtn0ev@aschofie-mobl2>

On Mon, Mar 13, 2023 at 10:12:03AM -0700, Alison Schofield wrote:
> 
> It sounds like the git commit hook for checkpatch, suggested in
> the tutorial, would have saved you here. Please look that up.
>

Hey Alison!
I had set up git post-commit hook following the tutorial. The script
showed the errors, but I ignored them before. I have submitted another
patch. I had 'trailing white spaces' errors in my code and removed them
in the new patch after consultation from 'coding-style.rst' file.

> Also see the section "Following the Driver commit style"
> And, there are sections on revising patchsets too.
> 
> Much of the info in the tutorial doesn't make sense until you
> need it. So, keep reviewing it to catch more useful info.
>

Yes!! No matter how many times I read the tutorial, I still end up
getting back to it! :)
Thank you!

Regards,
Khadija

> More on running checkpatch:
> - Add that git commmit hook.
> - The final checkpatch run can be on the formatted patches.
>   After you've done git format-patch and have a .patch file you
>   are thinking of sending, run it again. 
> 
> Something like this:
> scripts/checkpatch.pl --no-tree --strict --codespellfile=/usr/bin/codespell ~/my_patches/*.patch
> 
> > 
> > Also, I had one question. Is it okay to write a long subject as I have
> > used in this patch? 
> This is in the tutorial. section "Following the Driver commit style"
>
> > 
> > Regards,
> > Khadija
> > 
> > > >  drivers/staging/axis-fifo/axis-fifo.c | 18 ++++++++++++------
> > > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > > 
> > > 
> > > 
> > 
