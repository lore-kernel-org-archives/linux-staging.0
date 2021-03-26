Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ACA70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:57:17 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id f17so656860plr.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IV75pZ2r/lTsGbcVB2HXKVQUuEN280uU9C5RzK68fYU=;
        b=Q3rWXH4gNK6ohJquLwTkSl66Qdoxp6MTOgiXSDiftgNaBe/5H+stw2V/iZ+pl35nVc
         B/QZKZFVXGmObWTqMrfutIeevZt2Ht5zWHTPj6WFFw3kQwdVuoEU3e1fsIyiSJYjHHHg
         HC9nhqFM9YOuRLJZVNqydWrEVjC6spa5H8BcN1P0Rhee5XzSeEFEUn+U7SC9wUpf+Ny7
         YvRfaMgXAHZ+NluNeUtlO9mlqL/2AKFSkMLRW4v+sz9OfgJkfXjbILveGHRMY/aFSz4f
         9m0hEJ8tssrD4d2h73/PlM0qWRwIE3Ac4aBKsZw11/ygsZhBGJPgP8L3829shuktto1J
         f+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IV75pZ2r/lTsGbcVB2HXKVQUuEN280uU9C5RzK68fYU=;
        b=nALAI1zWy/PaZ8jET27lJO/mJjptX57bf89dJmKAVdaD2HxChhQ13rtiFDjCPm3gDj
         aJMGO5eLQaIQv/XVmoHxwbxdGEnE1LhzS9dvRmdKODck1+ivwj7l58GsFSZwe29vGf5u
         NZ1RpZNKTJBrez8hChH6Wcy8qklT+2FEmAwWnzi7cV3TPEcHYZETP2QXtCK7/QvS9nkY
         P1w0nU2uih51dt+HJpo+YGIdW0kakWbSrQzrBuWnz2sRaicUE8kM1R0LQKh6nCJ/POid
         mwiJqxpSLEAtT2BPEHyVdrWzZpvQXOo1QhNt+AgeYkRS9QIEnarLvp6gh0EagguVrQy5
         7Oug==
X-Gm-Message-State: AOAM530SmEX7wfdAO2QUHr7zrdcqKBHtl9YxYmFNpZGc2C7zioYM2lZK
	PAPyk/AJzkifrinwX0UNl8k=
X-Google-Smtp-Source: ABdhPJwwEZXFzZ/RNYveH7mefeJwagBObcPX98zYirGFuzA6NDif9CDcB1Ouvm7REbJkongZ1JDlZQ==
X-Received: by 2002:a17:90a:a414:: with SMTP id y20mr12906128pjp.77.1616752637305;
        Fri, 26 Mar 2021 02:57:17 -0700 (PDT)
Received: from localhost ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id n5sm8997971pfq.44.2021.03.26.02.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:57:16 -0700 (PDT)
Date: Fri, 26 Mar 2021 17:57:11 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: zhangxuezhi1@yulong.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix a typo
Message-ID: <20210326175711.0000684f@gmail.com>
In-Reply-To: <YF2qhUD1lz3LbEhC@kroah.com>
References: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>
	<YF2dXIxMOUyLzfnQ@kroah.com>
	<20210326171634.000011f5@gmail.com>
	<YF2qhUD1lz3LbEhC@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Mar 2021 10:33:57 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Mar 26, 2021 at 05:16:34PM +0800, carlis wrote:
> > On Fri, 26 Mar 2021 09:37:48 +0100
> > Greg KH <gregkh@linuxfoundation.org> wrote:
> >   
> > > On Fri, Mar 26, 2021 at 04:05:15PM +0800, Carlis wrote:  
> > > > From: "Carlis" <zhangxuezhi1@yulong.com>
> > > > 
> > > > Change 'tft' to 'TFT'    
> > > 
> > > Why?  What is wrong with "tft"?
> > >   
> > I think abbreviations should be capitalized.  
> 
> Why?  What requires this?
Many people use capital letters for abbreviations in comments, which I
think is a good practice
> 
> thanks,
> 
> greg k-h

thanks,
Xuezhi Zhang
