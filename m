Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CBD70
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 06:48:14 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v4so8175336wrp.13
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tgrRgfC/AS75qx+sFS4KzZOps5eBumxQzPquj/kuv/s=;
        b=Yac76LSYnblNMeet6KFw2iCUTCT82eHZ2VzON5r5iOdiIFNBfOS7Jxf65f/kCUsm9X
         liZyHvWgA0l0K3RGko6Ntywzbu8CuB0Z2s/Km9/MMJnFVJGQv9ATdyxXlR/0mZa3CemX
         FxQlNl9qZqngZJwIAkmsk49EaHaZhyvHppXZ/tUS5FN3HG4CmiDQ5nSXb1SXhStbMiQZ
         ekYCjAr9rWVrg5ZjY2hGsu8Qq+OqvNj2D+ulJxpSaOals4AqJqvK7/I3GZ5ecqjb52t9
         bV2SCgnZoXHOnIppogaJGfr0vehBfHWRo0nKe2tT09yLuLaE0E2gTKHlS4klRAiQyLNP
         2ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tgrRgfC/AS75qx+sFS4KzZOps5eBumxQzPquj/kuv/s=;
        b=XuXYna5DdxJc+vuTyqW57fSMSI3GGix/sToCuFEwZpysPPXl2HoDDTTj6o31HW7dOF
         527xC3dFTVTOnaCjvlmgYAqcDCGnW0UjG9SgZC9NQmUuHmjfAmEtp7Q2nHC1JrFPJE7Z
         +JPNOZjggfDK+nANG5GRSDjmYGS4dQA91cS3QipP4TvGj6bNvn36io6aYiETIWE8M7aS
         l5boJTX9y9YH5mIv9syId+KuiGlQCSAjkCY5Rs8yiepiFwQzNcud6gVoUEhqCVS5pV7I
         oZPgwrq+szzZAYeAS9NEf3y47FzZ9hxMrpStPrMAwrWAkNXytOPBcWYTyFydREkEzDWB
         E5AQ==
X-Gm-Message-State: AOAM532sMYTTskccJ7DcCLsZLl9ru2sBLubKICjSTXme5DLFvnBGZUJu
	sMDz175S0VH6EqSceeEsX26Bee9x4L3o/g==
X-Google-Smtp-Source: ABdhPJxGxKv+uMmzCG1cAz9sUBEHELavzR5LYu99H4bHKKBWaKeWxdpiqZ4sqz8OuFOPsTCIfh3Hfw==
X-Received: by 2002:adf:a15e:: with SMTP id r30mr4808440wrr.101.1617518892649;
        Sat, 03 Apr 2021 23:48:12 -0700 (PDT)
Received: from agape.jhs ([5.171.80.10])
        by smtp.gmail.com with ESMTPSA id i17sm22888100wrp.77.2021.04.03.23.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 23:48:12 -0700 (PDT)
Date: Sun, 4 Apr 2021 08:48:09 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/30] staging: rtl8723bs: remove RT_TRACE logs in
 core/*
Message-ID: <20210404064808.GA1401@agape.jhs>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
 <1cd79d781cdcccf621ce8e104a9cdf1e90e7f803.camel@perches.com>
 <20210403152143.GA1403@agape.jhs>
 <7120836b08b680d54c15fd89b8630ccc67a53116.camel@perches.com>
 <20210403172858.GA2397@agape.jhs>
 <844503af879d05b209d9af98e378350b4f74ff9d.camel@perches.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <844503af879d05b209d9af98e378350b4f74ff9d.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Apr 03, 2021 at 01:02:04PM -0700, Joe Perches wrote:
> On Sat, 2021-04-03 at 19:28 +0200, Fabio Aiuto wrote:
> > On Sat, Apr 03, 2021 at 09:17:37AM -0700, Joe Perches wrote:
> > > On Sat, 2021-04-03 at 17:21 +0200, Fabio Aiuto wrote:
> > > > On Sat, Apr 03, 2021 at 08:02:25AM -0700, Joe Perches wrote:
> > > > > On Sat, 2021-04-03 at 11:13 +0200, Fabio Aiuto wrote:
> > > > > > This patchset removes all RT_TRACE usages in core/ files.
> > > > > 
> > > > > and hal and include and os_dep
> > > > 
> > > > Hi, 
> > > > 
> > > > I was just about to send the second patchset relative to hal/ files.
> > > > The whole has been split up in directories in order to reduce the
> > > > number of patch per patchset
> > > 
> > > > It's a good idea, but the patches relative to RT_TRACE removal
> > > > could be huge
> > > 
> > > That's really not a significant issue.
> > > Simplicity in review is also important.
> > > Mechanization of patch creation can reduce review efforts.
> > 
> > Maybe I wrongly associated simplicity with patch dimensions, but maybe
> > for patches this simple have expert reviewers some tool for
> > automatic review?
> 
> Coccinelle is a relatively trusted tool and using it as a scripting
> mechanism where the script is shown as part of the commit message
> gives confidence that the change it produces can be applied without
> significant doubt.
> 
> To improve confidence that any change that does not have an output
> object code delta, comparing the object code produced before and
> after the change is useful.  Showing that the code has been both
> compiled and compared in the commit message also improves confidence
> that the change is useful and can be applied.
> 
> 

which tool provides an object code delta output suitable for a commit message?

I dare a proposal apologizing in advance if this question should sound off topic,
if it is please tell me how to ask it,

is anyone of you all available being my mentor?

I realized that what you told me in last weeks helps me a lot, and maybe
a mentor can address me working towards more useful code bases.

I choosed rtl8723bs quite by random, just to make experience in cleaning up code,
and get more confident with required dev tools, but if there is some other task 
with higher priority that I could carry on, I will be glad to
follow directives of a mentor. I really would like to become an expert kernel developer,
and the way community works gets me more and more involved.

Thank you again to all people helping me,

fabio
