Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCA832B13E
	for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789735408; cv=none; b=WkYHR4b8EUbzwkr8SklWbBrpiFnySAkwoBxMtRsjWtBAcDnfLc8eIdu4MZiYCjxyOVDTZtfUKXP15UoiILfo+i3wnhKdImCsdyHTOcATMz3tNiCqmHfvWuU8PRc8G5w5Kz7mPupmHOrdQSc2JqgVE3e5svOQGiNKmlcM/0xHXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789735408; c=relaxed/simple;
	bh=Fki0Z58sl1Lax2xAdEguDUgGMsvyVPHYeMtHhtE8hnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXw2m6vyqy0QfFhPfronhdPvABdRF9JvcOGbJ+/COfpPgJOUNvyMI1CbowCflQZ1eDkIA71B2JTvfOR4nkQ8vws1Tc38HPkF9iWJeeVh7ItzuKgZv64W/jtLrDRXyu0akhsNFt4kI81obSMZvrSz7v/jRYkro6naHWivsmH8G9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBvVB/Dj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBvVB/Dj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so3531905e9.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 05:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789735405; x=1790340205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3CWo7b77SmOJ9ld6re2K1rf1wCAqvwVlkIAU56iGSRQ=;
        b=lBvVB/DjqNygebSz1c9u840m6Wo0MzAhyj3ddtfXTnJRSwbehlWEPcTmRwIuE/VF42
         bcrQh9eWxLXAZ75FQmH/rG1+cbhW6vna/7HE1LrpogPxa6Q2LDplGx5+FPgNU/bGS2kN
         QKnvvDE9JTyOuO6tG1w3/7HTUo4UAC36ufKmI053B6LfzlZ8kis71puUmg1spGE5Ybym
         wo82DFjPcurnPsWO82XEurqhewIfxSQo3UjH4FRiHsbchVrG6hwnhI7eaLUrzitC6Dby
         qLeSxnYlkpwUeD6vFTb1TXpJyqy3bFbsRGtF7361uVvoh1qDXQ+SuGacjiwYFNPgKPNv
         Livw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789735405; x=1790340205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CWo7b77SmOJ9ld6re2K1rf1wCAqvwVlkIAU56iGSRQ=;
        b=w30Eahuoq0zSTDnv9ea2SMzP81iD2WV58cg2ldSnBKY6hX/wZbSIRrx1qhhjS8bbLe
         P9yap/kqHNaiac+WId7Vbn0hP8w/toWWiyQG+BU49pXbYSgOPYcyBw+4TGzQdmeqXazc
         kRu9tTrRDV/tMn9rfxFu8D9H9mWXWZ5dXskMb1OLvQ6xR9XtFHKHaBZCFSINIwoch2gT
         7EwGfTBCxdFxAHnAo6UKGgDDC9Ywzq8idoktzdtU1JYaT013xsjQCg+FMPEgfa9nvzfx
         x+9hrxxvyUBlDm1NaEzBMbmbyEtu24M2y1R5jcJrqxE12CguFQLQ9I08+zoSKogTyA9H
         dA5w==
X-Forwarded-Encrypted: i=1; AKwUvBwXvnIZOnGAklDP/yDwCmDwu8o5Dkpf0oj4jMCFWQuJVUcACGfZ+JDPSo7/Xr+xhrEhTWb16s3YO+ho6qRY@lists.linux.dev
X-Gm-Message-State: AFuF++lzpvYi1kZ9Hpq3xFHVLuvnFqL8nAOVFlnpH0CSkZS4RSDLmIXb
	99mnuk281dpSfXndUCcEDUxrkE3KqmZZeKJ64R1PMfC5rRk0OayAa18kVfrly4gHUkn7xw==
X-Gm-Gg: AYBFou1F5jD2OpbV2qSSG+Vsl5LAVbiyhkNfx78KxSsivIPLMaUdB45xWNzW/jU1ats
	iAI3+INMNWOCBp281dWRuy8a7tGsPmLRBh/zdSI6OTdA5SlXP1YPIOV5ZqaqijE+WpXs7GWiNBh
	YDtyvMldnd8VMqmLUzi7ITaBo9WwTmVIcSSztYNxw0bJTGIMMUUPH+81mrIZBuzIxoqN1UGKoZC
	KI5zH+OwW1kp+2S4O68DNlySjQF535GVPVafs+AlA3apyKrflsKiBQ7mdzu+EOMFw0PS/s/bVNG
	UcJiSNL+WVR8l/hb+LaPXiDKpPUByj31OyawL2RVWGbyN6jmv+9L3KJjajvM40GhVlIRUJwCtPA
	mGE52wjlIY+3nJC3BCnG2YO8ep8UAkoGP69uv4JYI/tj6gnvVDZd1PxxX/XdrZMl+QKNI5yhbuj
	lvGEbAkywVSJhvAtpG/th1KiXNcwCnlAhSnzAKb0hqdlZVFf4IL6HUMw4+IfZ5SDW0SyGs92V4T
	STq9A==
X-Received: by 2002:a05:600c:6308:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49fc5728e35mr30568225e9.20.1789735404540;
        Fri, 18 Sep 2026 05:43:24 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd22dbf2sm149078515e9.10.2026.09.18.05.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:43:23 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:43:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: greybus: remove camera driver marked as broken
 since 2016
Message-ID: <aq0x6IGnKd2IYXoU@stanley.mountain>
References: <20260918011437.108678-1-enelsonmoore@gmail.com>
 <3f152ed6-e572-4c96-8762-2fb7cdc77695@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f152ed6-e572-4c96-8762-2fb7cdc77695@ieee.org>

On Fri, Sep 18, 2026 at 07:18:54AM -0500, Alex Elder wrote:
> On 9/17/26 8:14 PM, Ethan Nelson-Moore wrote:
> > The Greybus camera driver has been marked as BROKEN since
> > commit d4f56b47a8fa ("staging: greybus: Add drivers/staging/greybus to
> > the build"). It has not been able to compile since at least
> > commit ec0ad868173d ("staging: greybus: move core include files to
> > include/linux/greybus/") because it includes greybus_protocols.h from
> > its own directory. These two facts make it very clear there is no
> > demand for this driver. Remove it from the kernel.
> 
> Hmmm.  Do you know why it is BROKEN?  Do you know what it
> would take to make it work?  I understand the point of
> removing it, but in part the Greybus code has historically
> served as sample code for people to work on.  It might be
> nicer to have fixing it be a pet project.
> 

The compile breaks because of:

commit aa1b4da6af67d5c6a4e933c2d30890c6f282f505
Author: Boris Brezillon <bbrezillon@kernel.org>
Date:   Mon Nov 10 14:28:35 2014 -0300

    [media] v4l: Forbid usage of V4L2_MBUS_FMT definitions inside the kernel
    
    Place v4l2_mbus_pixelcode in a #ifndef __KERNEL__ section so that kernel
    users don't have access to these definitions.

regards,
dan carpenter

