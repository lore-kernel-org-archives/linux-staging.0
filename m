Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24DD259E
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 17:29:03 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id f6so1201164wrv.12
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 10:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q/pPAPgGU/W0eWYpvJgPXIzYE99umLz25OGAt5xbxQs=;
        b=JKAfyacofh+Xq2PWnCyWh3n6Y17IR6zk01mfjIMKD+KF2E6SEEZQMEo5j7jgdcAhCk
         PVKkSQB17FJXRn+XPUR3CCBZre+UQV57MqLXs+rkgSrqvzy0h7h9xKKU3uuI1xVeQQRD
         4MyBVgQdSUrDJKePvoNx6/MyeUJpigWzmFBiU0SqDydED1Yp7AEIuqW/KpA9sPuF+iw5
         eBh61eClcOLZmGVrGeUq4GQLXZO/aLhL5y7vpOA9d+SZMKLMP5+GpX4I+3zeOzzmRPFJ
         jncd0drftERauuGyOKamg2Ah31A7PBaLW3VSvtt4xkLUICX3C9D+pznFbxXuLYBzBYPc
         1d+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q/pPAPgGU/W0eWYpvJgPXIzYE99umLz25OGAt5xbxQs=;
        b=LJX03RurVLWg2Sz5kgYQP001RkWDrH/fXFEnmUpGCp3jKPDIe+mdJfm5UTvxYyFP5O
         Ve9Azi92kFUq4GuiRMmLPxxtweyshQW44oQ6griUk1mEVEyNFyh/iDnu6uufFu18f/bI
         jS/SKRnQTuKcqTrQFdHgO6JzXc7sRcVi5ScCQKq3VlhR6a33b0f/xY84L+GuTCBeDnxg
         kBRHHJ0zevPVqN2U5NGA57M3QkqnlyN+3upeY3DbTKLveFyqxY93UJ1U2/5KFhi9Qlth
         b330f2IPtrq+GQJQrrKViQUqSQGn/m/5o+ITbrItW+nKMiCtfxg0LwQhn8u+vx1vXQEj
         br2Q==
X-Gm-Message-State: AOAM533baTnpFCmy8onuI3cZdaA0vTMRV1k8uiUwVSnD9l4f6W6nXn0N
	WYPD0Fc3d1dc7bStU633EiU=
X-Google-Smtp-Source: ABdhPJyRH/CHvAviZMtvw61sFhJd5FLUaPL92VP/IlkksWvp8fHGVgigRE7F9tOZMTJXyIOM6Kt/bg==
X-Received: by 2002:a5d:4884:: with SMTP id g4mr20849042wrq.191.1617470942295;
        Sat, 03 Apr 2021 10:29:02 -0700 (PDT)
Received: from agape.jhs ([5.171.80.207])
        by smtp.gmail.com with ESMTPSA id a131sm17258422wmc.48.2021.04.03.10.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 10:29:02 -0700 (PDT)
Date: Sat, 3 Apr 2021 19:28:59 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/30] staging: rtl8723bs: remove RT_TRACE logs in
 core/*
Message-ID: <20210403172858.GA2397@agape.jhs>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
 <1cd79d781cdcccf621ce8e104a9cdf1e90e7f803.camel@perches.com>
 <20210403152143.GA1403@agape.jhs>
 <7120836b08b680d54c15fd89b8630ccc67a53116.camel@perches.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7120836b08b680d54c15fd89b8630ccc67a53116.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Apr 03, 2021 at 09:17:37AM -0700, Joe Perches wrote:
> On Sat, 2021-04-03 at 17:21 +0200, Fabio Aiuto wrote:
> > On Sat, Apr 03, 2021 at 08:02:25AM -0700, Joe Perches wrote:
> > > On Sat, 2021-04-03 at 11:13 +0200, Fabio Aiuto wrote:
> > > > This patchset removes all RT_TRACE usages in core/ files.
> > > 
> > > and hal and include and os_dep
> > 
> > Hi, 
> > 
> > I was just about to send the second patchset relative to hal/ files.
> > The whole has been split up in directories in order to reduce the
> > number of patch per patchset
> 
> > It's a good idea, but the patches relative to RT_TRACE removal
> > could be huge
> 
> That's really not a significant issue.
> Simplicity in review is also important.
> Mechanization of patch creation can reduce review efforts.

Maybe I wrongly associated simplicity with patch dimensions, but maybe
for patches this simple have expert reviewers some tool for
automatic review?

Is automatic review possible?

> 
> Few people are actively working on this particular codebase.
> As far as I can tell no logical defect is being corrected here.
> None of this is likely to be backported.
> 
> Applying each individual patch has a 'cost' in maintainer time
> and review effort.

got it

> 
> Fewer patches create lower overall costs.
> 
> Good luck...
> 

I like your idea, and sure I will work in that direction,
for this particular case I wait maintainer's opinion. If
patchsets will be rejected again I will apply the scheme you
proposed, if it will be accepted I will apply the scheme for next
patchsets.

Thank you,

fabio 
