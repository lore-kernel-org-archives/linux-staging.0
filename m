Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B22C81
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 13:08:51 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id m42so18843756wms.2
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 06:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4P4AVlRuS+D8nRRZwY7bESCy+/9tZLn5inc7/Sy4z+g=;
        b=XyzvrgVNkV/afwxqMkX5uoSxL3qX4Hb0sTQfo44r6x/QtqVKaSBK/7OlAuOIAlRrjE
         NbszUB0kB50R4XBwLdOENLmlQwexDnDhOIiN8oHs/7y5FuGrOP2Pw1Tv40oDTytAfNlj
         UojVZ8UMguW/TueF7aeKl98cY0wfwMpOz68CfC9J2FaUNv4gLTvEiycezbR7+mwP7Ar5
         L4+KJTZX12i7L+QMgyMMOlZX94fFMefhocAyip/fGcy5wK+T9hgV8G1mFITiq57Kx55+
         Uc3wIW/aNMGxTIyxRNXhc89sMuKPJICdcNFWY0lu6WW9WjQQyGk9i7JUEMuyPxgLNuCy
         RjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4P4AVlRuS+D8nRRZwY7bESCy+/9tZLn5inc7/Sy4z+g=;
        b=pApIPCHlefo4TkCD41mSol/2R8m4g4Qa1ZJ5CHXy0UlFxjrhCmZC37TkQdmPKia/H6
         03BZfGF9mvmYc3UqWaLPVZ7pTamWK8IALWSpoa38wHZV9uVjUe6pSNT7QgWaeqCwz9gk
         5TRfaPB4Ehbu80c8mHuZc8QvvMXvFLnPKypW5nylBXeiB1aOR+tPgzzyXniKsrkvIpCI
         Nf8KkkHlDYDOwK2g8g3j3mr6DUhP22OsWycB5xSTAdzJp0iXAD/nJ0J86PSKRqOV+bul
         ZmFtMjmton1BTOYu347cGHO4V+4N4Z3vnxHjMuiHzXqKRmmlcxyzkQ3JDxcD+cooNDbL
         H76A==
X-Gm-Message-State: AOAM532RMlHyX5pHNuAO/qFRmYH9nEDqHcdm3WVBFfg4mFsVgzk3gR60
	5Z66vigv2Ox86WFtZWG8EYk=
X-Google-Smtp-Source: ABdhPJyBxaVbJZpais0T6mHisqa9q1uhVgD3hlebgRYc6WsQ0a5As2/UOlqoeZF29HBhlvSZhyQgHQ==
X-Received: by 2002:adf:e7d0:: with SMTP id e16mr51195752wrn.283.1634735329623;
        Wed, 20 Oct 2021 06:08:49 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62? ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id g25sm2012944wrc.88.2021.10.20.06.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 06:08:49 -0700 (PDT)
Message-ID: <c89758e11e9d159135b7bc0f16b76b99b34a3ba8.camel@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: vt6655: Rename
 `by_preamble_type` parameter
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org, 
	forest@alittletooquiet.net, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 20 Oct 2021 14:08:47 +0100
In-Reply-To: <alpine.DEB.2.22.394.2110201456190.2930@hadrien>
References: <20211020084033.414994-1-karolinadrobnik@gmail.com>
	  <alpine.DEB.2.22.394.2110201051300.2930@hadrien>
	 <6089e564f89ceaa7303bf3a4b4c864bf1389ac25.camel@gmail.com>
	 <alpine.DEB.2.22.394.2110201456190.2930@hadrien>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2021-10-20 at 14:59 +0200, Julia Lawall wrote:
> On Wed, 20 Oct 2021, Karolina Drobnik wrote:
> 
> > On Wed, 2021-10-20 at 10:54 +0200, Julia Lawall wrote:
> > > On Wed, 20 Oct 2021, Karolina Drobnik wrote:
> > > 
> > > > Drop `by` prefix in the first parameter of `bb_get_frame_time`
> > > > function.
> > > > As the original argument, `byPreambleType`, was renamed to
> > > > `preamble_type`,
> > > > the parameter referring to it is now renamed to match the new
> > > > naming
> > > > convention.
> > > > Update `bb_get_frame_time` comment to reflect that change.
> > > > 
> > > > This patch is a follow-up work to this commit:
> > > >     Commit 548b6d7ebfa4 ("staging: vt6655: Rename
> > > > byPreambleType
> > > > field")
> > > 
> > > This is not going to be practical.  If the previous patch is
> > > accepted, then this it not needed.
> > 
> > This change was there before but Greg told me to do only one
> > logical
> > change per patch (which was a struct member rename), so I reverted
> > it.
> > I believe this is needed because this parameter still uses
> > Hungarian
> > notation, which is against the LK coding style. Also, it makes
> > sense to
> > update the name given my previous change.
> 
> Sorry, I think I was not clear.  It's not practical to explain
> constraints
> on other patches in the log message.

Oh, I see. I thought about this log message as "why" but now, when I
come think of it, just saying it's about the Hungarian notation should
be enough. I'll correct the log message, thank you.

> 
> The important thing is
> that if you want to make two different changes on the same file,
> either
> the first one has to be accepted before you submit the second one, or
> they
> have to be in a series.

I see, thanks for clarification.

> > > 
> > I can add this in but will that still count as a one logical
> > change?
> 
> No.  It's a different change.  It's just a small whitespace issue,
> but
> it's not triggered by the other changes you have made.

Ok, I'll submit a separate patch for it later on.


Thanks,
Karolina

