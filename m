Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D063C3449
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301119; cv=none; b=Hc839FoCzMuB/5CLv+R4dxeXEot1hTZQcJeo++TeWHAmNpncXO+dDi21igLEV75pgQlcE+4mFO54PJyDsAgaR0SCyDY4Kg24DtV+SV9Y6IWR0ypM1ZCG/HCPtk7hF6wmuIsdIBQf0YKch3wdI/ny7It3b9tkl0ZC3l7TxAx1t1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301119; c=relaxed/simple;
	bh=d2FNAbFDRQWcUVWu7exSOqOsDpfZUHM7JIYdlmNtkjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMpZipZjALtn13hX5pWqys5llW04T4TAyJpx7VbxKR48AJ9XTVLxdS60NMflNiQ3QzkuVAYHJ9qp9EobVu8R4w22CsQ8eSrmFrGgo1YJy7pxC1Pc0FY903nE15kN7uKj/IMRXNVrDBEodhuq0lPgsiGZP7rkitOsgVYekALIOKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPre5yHl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPre5yHl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0046078so94684725e9.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 07:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777301116; x=1777905916; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CBbooDkiMWydo0N/PYjSPsB4FcRhgQZ6/QelSimT4EA=;
        b=OPre5yHlbJvBIxvdgYtr0oyIpN091dGbGblDYVKgS9fbOw2etJExVrPUYypco7ozAI
         nkJ+WIOLs+NX8trMkyJfZXZFT8U5evxZn0IP9sbHDdRy2xG4pL4BvMQHiOfmY93wpDlQ
         xgBNTF0exqs3hKOpzZfccqjAXCNhJl0PrTe6EaGT3ql6S+we1IB1YcLDCyt4umrFCTDP
         ZIa3q3tZG3NgHELg4bqu1x9R938mRLOj0PDSTusu7eu0XZ3LDbqOT7brCZoPguCBC4ug
         ytR1o+OOAKl/G5Qj0IUCqNY5/9hDacGN369XOFBTsLsmCpG4Cs0qDTZqak9G9O/yx/FX
         QzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777301116; x=1777905916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBbooDkiMWydo0N/PYjSPsB4FcRhgQZ6/QelSimT4EA=;
        b=rrXgl/QG3f8lFbH6zywEz1zAoXdhMoIiry978/qrRFJaBZyzcnC0e4JPx6do2UkfDR
         FbhidFp2BCWfxxL+iPcFYdpfdWknk4qE70g7YvGwaJzfp7SuVy3YTDHU4q3IqorXatGI
         QCoppyrOnKgtGuIUH1z6GicBZaSa3alK8XdsumvWPYtpW60Si+gBjbjH4F7dBcv9usM7
         1KkdoHof7ay5Ec+QArjvLxodE2tuwptESA33BKYXHkO4q6YEMTdacyKfwS1S5k5Y9FXd
         QJlCg81GhoHnrC1FUbjL6Xt5D8HnKIJEAItKekpeiAAdg0J9UNhYTA9r1Uh06qaqk/pv
         SkNg==
X-Forwarded-Encrypted: i=1; AFNElJ/yKOZBqMeN+n1EBTlKmDr9n/OmFnaLzjaZUoKAjTBh/4YdhazHfh4NcFUQ8xxFiQoPi8aMLxQB9Vl1RxNt@lists.linux.dev
X-Gm-Message-State: AOJu0YwrkV/P2Pvn8xqCozRMVPkN36fWh5zl7NsgImyJBMQ6t7jdt7DH
	RVkdCfXsT6WoFEgFn4ybGwtPTjUPv8F1c/O9gafthGWONmUOewvh/rE1QkUwAQ==
X-Gm-Gg: AeBDievI4B6mB5UGq2PS0g7peO0JMFEJRDtLm2cVHSLbphYObZOumWI457lUDCkjdMp
	mCmzKscLW8oBRkHM/rFtKmg63jzvJDprUwazix/VXkl9YWi6j1wgt5xx8OmVSbdmF0zr9uqhDel
	moTJPiM+cUAqY1oq1imdVSmX2Dtf6yt2ldgaXWlJWNTodVyOmVITzQil3hy+iHJdt5Qq9Vqd8gc
	L5xPIw1kifb1lVHn6/m4TpMY9hdTCxrkKs7kYNbnrH2AOkIdGzPMmQMWooL5hSjRm3HxsEGMGjh
	psJPNmAe5K7N28r8KuVgch2kT70XfPBClPMApPIWs886OUAPFpNlzi3aYGYGUlbNN0tXN3Azz6r
	BzTam3dbGI3q4G6ZZ6rCuaO0BJmQfHa4pZF318qTbml3/uzcmw72uRQy71QJ1nDZSVnDydb0hI1
	I4VQGMA9370jQ0BRI926/nlYV0A5N7HA==
X-Received: by 2002:a05:600c:a106:b0:48a:58ae:9933 with SMTP id 5b1f17b1804b1-48a58ae9fbdmr256070565e9.18.1777301115717;
        Mon, 27 Apr 2026 07:45:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm575074515e9.9.2026.04.27.07.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:45:15 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:45:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandru Hossu <hossu.alexandru@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix OOB write in
 HT_caps_handler()
Message-ID: <ae92d2MQXf4MZcPg@stanley.mountain>
References: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
 <20260427081748.3407939-2-hossu.alexandru@gmail.com>
 <ae8pq5YzEe2wTJmx@stanley.mountain>
 <69ef2c47.5d0a0220.2e33d8.bde8@mx.google.com>
 <ae8w9tkpM8G2NWWM@stanley.mountain>
 <2026042737-riding-bunkhouse-f8e0@gregkh>
 <ae9db6KjYMsFOG3F@stanley.mountain>
 <2026042713-buffing-recite-c3d7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042713-buffing-recite-c3d7@gregkh>

On Mon, Apr 27, 2026 at 07:11:28AM -0600, Greg KH wrote:
> On Mon, Apr 27, 2026 at 03:58:23PM +0300, Dan Carpenter wrote:
> > On Mon, Apr 27, 2026 at 05:11:19AM -0600, Greg KH wrote:
> > > On Mon, Apr 27, 2026 at 12:48:38PM +0300, Dan Carpenter wrote:
> > > > On Mon, Apr 27, 2026 at 02:28:39AM -0700, Alexandru Hossu wrote:
> > > > > On Mon, Apr 27, 2026 at 11:17 AM, Dan Carpenter wrote:
> > > > > > We need a little change log here.  I was hoping you would provide
> > > > > > a link to the AI review in the changelog.
> > > > > 
> > > > > Hi Dan,
> > > > > 
> > > > > Sorry about the missing changelog, will add it in v3.
> > > > > 
> > > > > For the AI review link, I don't have a direct link to the bot output.
> > > > > What I know is from Greg's reply in the v1 thread on lore.kernel.org,
> > > > 
> > > > What about a link to the email on lore?
> > > 
> > > Sorry, I was on a plane with no connectivity to look it up, here's the
> > > AI review for my patch:
> > > 	https://sashiko.dev/#/patchset/2026041408-grill-mahogany-d1e3%40gregkh
> > > 
> > 
> > Ah.  Very good.  That's fair enough then.  The AI is very convincing.
> 
> Yes, but is it correct?  That's the problem with these tools :)

If we go with this approach then probably we should probably
change HT_info_handler() to match as well?

regards,
dan carpenter
