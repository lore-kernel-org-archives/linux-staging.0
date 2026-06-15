Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E991E3BBFBD
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507074; cv=none; b=OM3pl4no/L5gHMjV9WdceKrAK4MHDMBlUiH+Yva/+50jq7e3R9+11yaz0d59gISBWyP/2g53B0xlKfnxrhxpKoITiSY88e9uZEDLNchzDzSmpj+6pZXbiLztg0W/OAMZhyiKLylS2NZPjKH+/oOw8k12VD1rQQDkIuBcmCqlVOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507074; c=relaxed/simple;
	bh=BS+zjw4eLL+0rpZ4fo0H95h1h9szhgSOmNArPS1Fd2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUQ6e/R9geuwYnITdlN17Fze1QHmT6dUj9PlLmibM2UUBEiwlhmYS8PAM1FyLQE1kzNrrkLknddGhlLOExbV0MhhvPsudowafm1qbcRrl10tZbyAg246UgCwVkGMSb4GHDPN8PGpBds4ODWg2hTIg3kSk4F8BQ9bExXD1Eb+yWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ruSw8DNL; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruSw8DNL"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5176fc0cc72so32864581cf.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 00:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507071; x=1782111871; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+RENlgkMWjL7wUhEcHLmNILGCKgCfCzFao/ekYQxfiE=;
        b=ruSw8DNLbfU2Y5zU7pQlkKEWE4e1xG0UaNiYIqpUSlukOUbG62LeUExiwqyOf3wfVw
         xvJ6H3XT6vx+uUbTCdBX0vayOC3ypeZ663DcjTJ1IS7UdGWhXt78RWNRnhxMcixNwPOr
         cGNdfUMIhhHuIYQpFdd92I5pRgnj93bM3aa2ck+MW+3/puL3KOhqjNdBhxNtoO8QvQAx
         zHDCGXq0nuyKqP+JMhFQvfMmAeDeTMOeSgl8FTq2R7KW0YGA15gId64GPpAG5IX38xIh
         HjBG3g6LjtjJ5e3HEODr2UHR/m9AUQrH6KNhLDtG7Nu9qUYNq42BuGYeS/+iDC67aBzq
         OY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507071; x=1782111871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RENlgkMWjL7wUhEcHLmNILGCKgCfCzFao/ekYQxfiE=;
        b=XNTQKBgdEmCWCiPzqAYAN4wXbzOGrW5dpbYh94ZYReaKEGNS3NwoUGRTN7LJw2ZZV8
         /LSBMVGwDZbyPvxlPWQTkgS0uzV9arpEBjacNcFPwvgCjQMmn2XPUOJym2tpKuSJx9wt
         ltGcWPr0gWA867BAkMNZDGAJhYea7Y8bHLA2/EyghrZaZABdBcsWCwEvyKd7N+ZmkZkJ
         tbwwxavIn7ngcwNFq2zouWVODmqpRSFRJ9uBSnp2iciZnctKeYJ2LCuBZ+WrtY0BQVUL
         nF/ZYT4YOTxohdxilDwEdTOFF6TZtq3dNbwaZjloHUk/hWSYSfNJbOP2oRoz352xrycr
         7hEw==
X-Forwarded-Encrypted: i=1; AFNElJ/UrCcZav2FM+MlLu8wxHDRFiWnlFvjWBXNED+MSDeF+6k609cBYZUlmpKgLfbBaB0jDFjgAwV9QGIrVdBs@lists.linux.dev
X-Gm-Message-State: AOJu0YyqyZscVJguSeF07Qe+GXnK3t/IXftgJYYaDYEPm81H85tOc4+C
	qPy5i0XnLHwVEeOxSRt+La9axJgbKAiHxcjX6xmdytT4c1/BtFUsPmYw
X-Gm-Gg: Acq92OE5eRc1MTV4QIVE9J0/eJkSzMTh4Tokvv96wjYmHrA7Ply3FKfR+UAQM+k+l5k
	c/Bb9wul9/lXy9GvVdAJxnI+DnUQaNKNWXygTSTlGoxiPcMSRGrTofLs6hioPQXY1lN5Lc1psC7
	0c1o2I+MjS0sOO8/PKM7YQdZ8J8EE2XvRWIrtYg6KE4IRBmvQD2BAMgFj7CtyQvo7tSpSBCfk1z
	GVEpnkFjxWahupoYbYmxoHkbkvjPHurenq318T6yJNbel4y4AgxtLSKHYBJBh0D+JpuJk4UvFvX
	wgArzvdYusBosgzjFs2lD2Bz2pbSJXsM4CaUq1hXRw5r6cZj8krh5+nM3d/GA0mzLVL196ZFxHj
	9yf3g/79UmVgqLOB2D2OnTSmZyrjKk6tokNquXmotK081BiJ4uajZn0DAVLRv1AGf9h79FdEG5P
	0fZukbF4fReTgUPplPRZcyZ5+HcJc=
X-Received: by 2002:ac8:7d55:0:b0:517:6350:ed4b with SMTP id d75a77b69052e-519535366bemr150581661cf.36.1781507070757;
        Mon, 15 Jun 2026 00:04:30 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb61eaf4sm99229171cf.4.2026.06.15.00.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:04:29 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:04:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: neha arora <neharora23587@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: sm750fb: rename pv_reg to io_base
Message-ID: <ai-j96dVwtPMERVM@stanley.mountain>
References: <20260529111927.14138-1-neharora23587@gmail.com>
 <CAOWJOptv1JcOGcEt39HVy7LkpAsvzbw9yj64kJG+X5J=VbWrMA@mail.gmail.com>
 <CAOWJOps9RBNAGsPFsBCbzFkEUN1=75YvwmqJX6RdQBbt1C6W-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOWJOps9RBNAGsPFsBCbzFkEUN1=75YvwmqJX6RdQBbt1C6W-Q@mail.gmail.com>

On Sun, Jun 14, 2026 at 12:45:05AM +0530, neha arora wrote:
> Hi everyone,
> 
> Just following up on this patch to ensure it didn't get lost in the queue.
> Please let me know if any changes or a V4 are needed.
> 

It doesn't apply to linux-next.  Did you work against the lastest
devel-next tree?

regards,
dan carpenter

