Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DBF6D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:47:02 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id t20so8962557plr.13
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 01:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KeY95AeaW248Jdni2uKvtKqKIpZ35VMIWlXLR/IAGFU=;
        b=QlTa9aP6Od7FRmPn45rgC6QgvbyPeSaUqqGMgJI574hUAXI30YiCad8zR/vfRum8rn
         bhp59cc10nLLdv2XVktckU+8S7828tO16CSXjgbps66TMuDZFZ0LzxuRVPGbzuslec26
         +awDgEZR+lA0lrF0Lnga3QictO9eeiBzB1auWCF2sVD4DXbJR6vLI1z/CNINmHvPG6fL
         qfogY65ne/lrMSGhJW72ytN9SRtIRDCPzSxG+MIdSIiAk1bw/dDODSSlSaqFLodVPo9q
         DsyX3xViFtQwHSxtWgPQmeXY4dszboeWg2Ua2QdGmRSXfuIaI0IO8liu1qy6E2zbHH3H
         7uYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KeY95AeaW248Jdni2uKvtKqKIpZ35VMIWlXLR/IAGFU=;
        b=oOdFpCAV0IWuoyMTF2WMQVW2J6r2SUDmjxxM2eGWjpSFH4VWmex0eDF6YShscO7AsV
         xpdKKkg2jM1JXBFYYfckvCWEEWUe/n7oiRPD/2g/qofBPiDtFm7BscVsDTG7hdaA+P9J
         xuB411ucjXB1fiLLlwFnrBhcCQs9PiTIqQzXogNM8VyxgEk/rr/TCj9U8ZCkAwZgPKWr
         8B0cFo2XVEVIo5kiq8QdJkig2J4nnkXZah4i9EzWf9ANbJnbpAt4kuxOmJ56pBL0kj4D
         R7H0W7op6KjLDOr1Rgzdjh1s3lvQZm/DhLRfYi3BYp8SdDz+uhPhZP+sv+ePyWJp2neR
         0c/w==
X-Gm-Message-State: AOAM5319ChRL+UFb8OK7STzmecFYyEKidNYidzZ5GR5RyHPwwnZXWqyD
	bSIhklv6NUmTfOhXQgEpMqk=
X-Google-Smtp-Source: ABdhPJw44TtNfcCxo7ESQE1gXwUUjSfXVkGGGi1FC8066Y5uIGei+/cRtYs/4Qour1eengsFiwGJuQ==
X-Received: by 2002:a17:903:2306:b029:e7:1c8d:63fc with SMTP id d6-20020a1709032306b02900e71c8d63fcmr2033664plh.35.1617785221783;
        Wed, 07 Apr 2021 01:47:01 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id k13sm20464718pfc.50.2021.04.07.01.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 01:47:01 -0700 (PDT)
Date: Wed, 7 Apr 2021 01:46:59 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/49] *** SUBJECT HERE ***
Message-ID: <YG1xg+EXSWZWn+pE@localhost.localdomain>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
 <YG1aVx3UuXR2JrC+@kroah.com>
 <YG1cCtbvINJ52tGT@localhost.localdomain>
 <YG1gDV6vqnUtDnbT@kroah.com>
 <YG1uNX1ZaZ106iy8@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG1uNX1ZaZ106iy8@kroah.com>

On Wed, Apr 07, 2021 at 10:32:53AM +0200, Greg KH wrote:
> On Wed, Apr 07, 2021 at 09:32:29AM +0200, Greg KH wrote:
> > On Wed, Apr 07, 2021 at 12:15:22AM -0700, Pavle Rohalj wrote:
> > > On Wed, Apr 07, 2021 at 09:08:07AM +0200, Greg KH wrote:
> > > > On Tue, Apr 06, 2021 at 11:35:54PM -0700, Pavle Rohalj wrote:
> > > > > Changes in v2:
> > > > >     - Removed type information from variable names
> > > > >     - Broken up the changes into smaller patches
> > > > 
> > > > Your subject is very odd :(
> > > 
> > > Sorry about that, I overlooked the fact that I reran format-patch. The
> > > subject should be:
> > > 
> > > [PATCH] staging: sm750fb: Convert camel case to snake case
> > > 
> > > Should I resubmit?
> > 
> > Not yet, let me review these first, I think they might need some work...
> > 
> 
> Ok, now you can fix them up, I stopped after reviewing patch 02/49,
> these need some work.
> 
> thanks,
> 
> greg k-h

Will do. Thank you.

-Pavle
