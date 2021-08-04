Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131E470
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 17:20:42 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so4528539pjh.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Aug 2021 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AQyHcpJjTts/ZjtVgPUT+mxcn9mCHDoW6ei2h1W6TL4=;
        b=MFAH9BsY3FS8ZC+UAZCsYV3qxvovyfvBHmd+PeEtBjCfBALdsFW1Q0VtdtSjlhVK6o
         tiFFZbBC36lRZ3jTkAUp2z3LCivitXpO6XOxVEQuXYIDym64fC7pXvgjClLz0ikCQ8DM
         mWvkumAovkD9rUcqk+X7sITFYm1iqjllkeik9nEt0IQv/uHDce5yMDs/qcRtJCPv8ANG
         b5uTi3eaaUGED6+qkxr2jBo9WPz04wCRC3dIO6AizTWMy1X4Ms9y8vImGx5IGe6Y4qE3
         3+QP3ds3O6E64G48IIv0krgFJIjmGeAtSMyCWJcdKpMeHO2mG5Fcauwa+7SNwr2+hlgF
         Ps2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AQyHcpJjTts/ZjtVgPUT+mxcn9mCHDoW6ei2h1W6TL4=;
        b=kr1Ed7E035Q+HWPX6Br8SHNUPDyFq4jAAz9ZjE6YVIQU7gcMvHjXn1El19pzCjPMZ1
         eZ/ARqBl436Ccl3kRfjg5oYJV42IIIGf5DY0MB3BDgFpO/NRPjyFs979+SAj/jlrF3/c
         UhKrXTnPshiSgr32RUxax6HDbTu9c80xvblkaaGHxVwAih97jk7RQOcQKFjgtyFe5Ygc
         Ed8gaAeqDBCuimZwEYF7PXdMFFO9KLAwfW4kJ49UpHQH7C59mRVm4v1XVtIz9poJph2p
         IhaJFsGVQyetya/KKqjORLNOCq2mEUGZOeiwatqJ7Df/8L4wAse3tNHWRbGTMFhgKTs/
         DgEw==
X-Gm-Message-State: AOAM531QOiz5X8eI0rPLMk/uJKXlrWst6US3aepnfSs6XGy/JgwYDZiI
	zfZnr3tTAY/zmAWLLC1k9n4=
X-Google-Smtp-Source: ABdhPJz5Yy+7QahSP+zwnvqUmMVsL7OZFkdDOQTxT+4E/rZbjjNOT5KxOLJTU99RIRvZuLq/COFHng==
X-Received: by 2002:a63:e214:: with SMTP id q20mr188944pgh.134.1628097641345;
        Wed, 04 Aug 2021 10:20:41 -0700 (PDT)
Received: from user ([106.212.234.168])
        by smtp.gmail.com with ESMTPSA id j19sm3494658pfr.82.2021.08.04.10.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 10:20:41 -0700 (PDT)
Date: Wed, 4 Aug 2021 22:50:36 +0530
From: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: fabioaiuto83@gmail.com, marcocesati@gmail.com, ross.schm.dev@gmail.com,
	insafonov@gmail.com, linux-staging@lists.linux.dev,
	saurav.girepunje@hotmail.com
Subject: Re: Post to linux-staging@lists.linux.dev denied: [PATCH] staging:
 rtl8723bs: os_dep: remove unused variable
Message-ID: <YQrMZEND3pY8Pav4@user>
References: <1628081824-28535-mlmmj-16bf2009@lists.linux.dev>
 <YQqZ4TlTzZGIaixJ@user>
 <YQqccPSjYA/lR11g@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQqccPSjYA/lR11g@kroah.com>

On Wed, Aug 04, 2021 at 03:56:00PM +0200, Greg KH wrote:
> On Wed, Aug 04, 2021 at 07:15:05PM +0530, SAURAV GIREPUNJE wrote:
> > On Wed, Aug 04, 2021 at 12:57:04PM +0000, linux-staging+owner@lists.linux.dev wrote:
> > > Greetings!
> > >
> > > This is the mlmmj program managing the <linux-staging@lists.linux.dev>
> > > mailing list.
> > >
> > > The message from <saurav.girepunje@gmail.com> with subject "[PATCH]
> > > staging: rtl8723bs: os_dep: remove unused variable" was unable to be
> > > delivered to the list because the list address was not found in either the
> > > To: or CC: header.
> > >
> > > (The denied message is below.)
> >
> > > Date: Wed, 4 Aug 2021 18:26:57 +0530
> > > From: Saurav Girepunje <saurav.girepunje@gmail.com>
> > > To: gregkh@linuxfoundation.org;, fabioaiuto83@gmail.com;,
> > >  saurav.girepunje@gmail.com;, marcocesati@gmail.com;,
> > >  ross.schm.dev@gmail.com;, insafonov@gmail.com;,
> > >  linux-staging@lists.linux.dev;, linux-kernel@vger.kernel.org;
> > > Cc: saurav.girepunje@hotmail.com
>
> Why do you have ";" in your email addresses here?
>
> Try removing them.


Thanks Greg, That was the problem.
