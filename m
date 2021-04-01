Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7377170
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 15:04:49 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id x21so2336724eds.4
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kUgcLehiCS2Liu+9B7yEqjgIRfZbGgW3tjIFAhk2RdY=;
        b=RWD1OhRpCTvG7+q/A99FBIQBZKMizyVtPJTRMSR3U4ydit7U8ka0CD+eP6BEMv/Clo
         RNkjcJTmX6VbrAsqYLN/0ooq0hCyWMXUr6MDjj9VwRafte34nAYnlCVrgn6HhQK9CZQe
         n8Zaoh+1X24FTOV1nWrU1d+kLbD+eyb9JCIfUg6HnURJpmSgEYpzMe5bTw2bfpo5YIHP
         sbWZpZDuH8SS5sXyQU9f67r0pSZ9JWMYi/FDsnU3H3JI353GtQhmHdeCryhS+qCOeSUe
         tqVBspGk5LH48jPFrZUvkpbhh5jPTuN43Ol4qpzZr/X6Dsy06ZyctOA1A01651fEwo77
         V9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kUgcLehiCS2Liu+9B7yEqjgIRfZbGgW3tjIFAhk2RdY=;
        b=L/pWsSBvUHKo2PXyBQtLKWWGFUSwVONK6/hsQG18apRyB3snDlOUdg68+t3oY+0isA
         y2hZ+DnPr03zbGsfPf4Wr/exnXK1bvwA8pUmfGfyBUQXH4E0LR4TnEE8ECInX753b+rj
         NmGtB1tApEReCTCbgwruZVyR4MTtF1sQqrk2byZU4+4ikuoYXfodFlsUzozfAVST62DM
         PZ/iuIk+J0cKY63hNXRh2z1/Bn20Ym3NRs2ENLYN4EC7zv+SABe6wZvmrMUAEVFo3ynC
         Y/BQxxoMJROsOD7ysa0BQiT+oXB5hfEVebUB7PzUtLUCYoAtrFYiF9g9VHzYSYWdL7qJ
         cK8w==
X-Gm-Message-State: AOAM5331qE9jp67thzy1el5AJmo1Vsa5iHfQOC2/pkoZlxFtz7tDMk1X
	j6pz/Qj8FICOOTXLW6oNVP8=
X-Google-Smtp-Source: ABdhPJzpC3+n2F8xqohnsJM07ONTeJHJoJszze98yi24ldPwRjkvMC75+XQGmfzYgAAWtXbz6oUv5Q==
X-Received: by 2002:aa7:d5c9:: with SMTP id d9mr10801758eds.102.1617289487930;
        Thu, 01 Apr 2021 08:04:47 -0700 (PDT)
Received: from agape.jhs ([5.171.72.40])
        by smtp.gmail.com with ESMTPSA id q16sm3797944edv.61.2021.04.01.08.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:04:47 -0700 (PDT)
Date: Thu, 1 Apr 2021 17:04:44 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/49] staging: rtl8723bs: remove RT_TRACE logs in
 core/rtw_cmd.c
Message-ID: <20210401150443.GB1691@agape.jhs>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
 <7f51432d99459d79742639341f107115f0c224c5.1617268327.git.fabioaiuto83@gmail.com>
 <20210401095017.GR2065@kadam>
 <20210401135536.GA1691@agape.jhs>
 <20210401143235.GV2065@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401143235.GV2065@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 01, 2021 at 05:32:36PM +0300, Dan Carpenter wrote:
> On Thu, Apr 01, 2021 at 03:55:37PM +0200, Fabio Aiuto wrote:
> > 
> > Hi Dan,
> > 
> > I have the following:
> > 
> >  	if (rtw_createbss_cmd(adapter) != _SUCCESS)
> > -		RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("Error =>rtw_createbss_cmd status FAIL\n"));
> > +	;
> > 
> > will I leave
> > 
> > 	if (rtw_createbss_cmd(adapter) != _SUCCESS)
> > 		;
> > 
> > or just
> > 
> > 	rtw_createbss_cmd(adapter);
> > 
> > ?
> > 
> > what's best from the static analysis point of view?
> > 
> > smatch and sparse says nothing about that.
> 
> rtw_createbss_cmd() can only fail if this allocation fails:
> 
> 	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
> 
> In current kernels, that size of small allocation will never fail.  But
> we alway write code as if every allocation can fail.
> 
> Normally when an allocation fails then we want to return -ENOMEM and
> clean up.  But this code is an event handler for firmware events and
> there isn't any real clean up to do.  Since there is nothing we can do
> then this is basically working and fine.
> 
> How I would write this is:
> 
> 			ret = rtw_createbss_cmd(adapter);
> 			if (ret != _SUCCESS)
> 				goto unlock;
> 		}
> 	}
> unlock:
> 	spin_unlock_bh(&pmlmepriv->lock);
> }
> 
> That doesn't change how the code works but it signals to the the reader
> what your intention is.  If we just remove the error handling then it's
> ambiguous.
> 
> 			rtw_createbss_cmd(adapter);
> 		}
> 	}
> 	<-- Futurue programmer decides to add code here then figuring
>             that rtw_createbss_cmd() can fail is a problem.
> 
> 	spin_unlock_bh(&pmlmepriv->lock);
> }
> 
> But for something like this which is maybe more subtle than just a
> straight delete of lines of code, then consider pulling it out into its
> own separate patch.  That makes it easier to review.  Put all the stuff
> that I said in the commit message:
> 
> ---
> [PATCH] tidy up some error handling
> 
> The RT_TRACE() output is not useful so we want to delete it.  In this
> case there is no cleanup for rtw_createbss_cmd() required or even
> possible.  I've deleted the RT_TRACE() output and added a goto unlock
> to show that we can't continue if rtw_createbss_cmd() fails.
> 
> ---
> 
> > 
> > Checkpatch too seems to ignore it, maybe the first one is good,
> > but I would like to be sure before sending another over 40 patches
> > long patchset.
> 
> Don't send 40 patches.  Just send 10 at a time until you get a better
> feel for which ones are going to get applied or not. :P  It's not
> arbitrary, and I'm definitely not trying to NAK your patches.  Once you
> learn the rules I hope that it's predictable and straight forward.
> 
> regards,
> dan carpenter
> 

thank you Dan for you explanation, I will do like you said. I appreciate a
lot and it's good for my patches to be acked when they are fully ok, there's no
hurry :-D.

I will send them in smaller patchsets then.

regrards,

fabio
