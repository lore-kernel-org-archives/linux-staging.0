Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD04653
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZ7jvxrm"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507a29c7eefso2305611e87.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 02:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697879302; x=1698484102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4TngtiJ8wslPT+ncrEtZTiHmjc1NZD6oqFjXqbFwvgk=;
        b=NZ7jvxrmuByFrHh7lanEQ4wb0GHe1oGcCmCe4eyTeg4pNi6yfMrzwMlpNEPXXTe7vx
         4DXyLJY96oPX6MfXTTR0lhH0tHOnS6WXEZKgHNXS6o2cuZADxsp0rzqV4Xq4GN/74KvA
         NC+Qk608YpQnh9pf35tQGL5UAmFaPAqJDhfB/cl1zyvEDj7e+3gvJRJsEgCqXiulvtxY
         dIRghhRfTP+oJgn1L+WeJPmTsx2rMvT7JvsuhCHHc4mKwCZuj0jekb0VTUWXkaG5Mjg/
         VQz8Z+eZf/bT1QcalvS+KOGXcR4F0d1EhwLlL/sgHueZmBsIlcJk2vs32CgnWM9IuDsa
         ikOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697879302; x=1698484102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TngtiJ8wslPT+ncrEtZTiHmjc1NZD6oqFjXqbFwvgk=;
        b=teoLM9UOm3zojrFSe58avsXKZx9yp3X/JZ1hyzaSZjVjGoJULeKyO8VcK4M+i4u2L3
         krTCy9lHhh+uQoKPxcSSIA2R6cf2R0pN9NT+yBYjKOeJ312aLh2SmV3SBvXsd/BQu8D+
         tUk+wM/Rfrm6dV2ym2G1cqarWp02zqcrtCZYR36MSgY6VfT7S43dhKxzLdrohC4M4Oxl
         7m3y4pE7irAgVTzn6AgXG/weoA0Wa5paSd7paOpNqC/wJAMxhBinbXN91INnO1R/H56P
         /CcyfG1irWiaSr/YnlOqvdi5wfIh6DMUfe4d+nrA85iluUp9WL3iDOG6qN0GWsY455Uo
         kd9A==
X-Gm-Message-State: AOJu0Yw0z2q5UIifXCORQnzUTVz8ci3aInVSK0rJWZ/njcvcwTVljXnn
	Ib56tQZB/wb4Rsbt2lybSQM=
X-Google-Smtp-Source: AGHT+IGwh9dkJ93rMbNs/y7d88eS+miSCrd5rygw7KlZmDQTUrVXM5OwjwrvRWzac8BNKOjhfTZRTg==
X-Received: by 2002:a05:6512:3b8e:b0:502:ffdf:b098 with SMTP id g14-20020a0565123b8e00b00502ffdfb098mr3878804lfv.6.1697879302468;
        Sat, 21 Oct 2023 02:08:22 -0700 (PDT)
Received: from HP-ENVY-Notebook (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.gmail.com with ESMTPSA id o14-20020a05651205ce00b005032ebff220sm774692lfo.103.2023.10.21.02.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 02:08:22 -0700 (PDT)
Date: Sat, 21 Oct 2023 11:08:20 +0200
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Fix warnings due to introduction of new
 typedefs
Message-ID: <ZTOVBE4skMCbKjdr@HP-ENVY-Notebook>
References: <20231021081409.67570-1-bergh.jonathan@gmail.com>
 <2023102111-sneak-abreast-8061@gregkh>
 <ZTOS6eaygOA6nRKD@HP-ENVY-Notebook>
 <2023102108-trend-unfeeling-9b15@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023102108-trend-unfeeling-9b15@gregkh>

On Sat, Oct 21, 2023 at 11:05:38AM +0200, Greg KH wrote:
> On Sat, Oct 21, 2023 at 10:59:21AM +0200, Jonathan Bergh wrote:
> > On Sat, Oct 21, 2023 at 10:32:29AM +0200, Greg KH wrote:
> > 
> > Hi
> > 
> > >  This looks like a new version of a previously submitted patch, but you
> > >  did not list below the --- line any changes from the previous version.
> > 
> > This patch is a *new* patch which replaced a previous *series* of patches
> > so it was considered a *new* standalone patch, rather than a new version 
> > of the original series. 
> 
> Not really, it's a version 2 as you are doing the same thing.

Ok, thanks
 
> > > - Your patch did many different things all at once, making it difficult
> > >   to review.  All Linux kernel patches need to only do one thing at a
> > >   time.  If you need to do multiple things (such as clean up all coding
> > >   style issues in a file/driver), do it in a sequence of patches, each
> > >   one doing only one thing.
> > 
> > This patch only addresses removal of typedefs from the declarations 
> > and fixes up the implmentations that relied on those typedefs. The previous
> > advice was to not make breaking changes across patches, so this patch 
> > represents code changes which are as atomic as possible in a single patch
> > without breaking the build. It does not mix formatting / other changes
> > with the code change. 
> 
> Please fix up one typedef at a time.

Ok
 
> thanks,
> 
> greg k-h
