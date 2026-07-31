Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCC53C8708
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845473; cv=none; b=SEK/vYf/D5DcL0T8yzCwP7BLUnB42VdJcexPtlAxOXrTCD/D5oDUFyo+E3MStEVcs+J1H2YWUnFhYSu255Q1AanpfShBckTEGgeBBPSLGpphcqsppWb0KGmtknoKFtHbDU0ADmoea/BRLikFIQw/S/bDjs3Yx39zPA2xCjQOdeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845473; c=relaxed/simple;
	bh=OzvS7CfAl93KwTOsF9dBqEAhkdMV0D8E4axkSjAqmdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTRSC1Vc76ZQ82cob8Isf96IDZdjdl/hDXqORENQxmNVoJTT9Q7AOARBfYWCSG31cZvPUiHFjJ8naxCx+cGHXPx+53DiEXI5ZpNZ7j1vYvb9VtSanJKJ9crKgwbnWlVDT+F9L43zPB0v7m66H3Ezvf564JpQTeBC4gGUBxewuuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJhFeMrA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJhFeMrA"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848761b5897so3065398b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785845470; x=1786450270; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=79FLLLQAoGUCGM0RPrbwGDcrhx9pbiHdVYLJ5UCShwk=;
        b=kJhFeMrAJEL20T6E6VwfYKP3bd4PoFlN9EvTOvRTUUU3mvUICbBZ03/mJ2D6J2QwKI
         xSzGQ7dbZAyYmWfATvVFSw5wHwyQbGCKD7XrAIk5hIITF6/l7sdkjmNPr1vvHdgzb3eH
         ucP2nYvqkTdpGIzrpQjg9yQvcEIPkSSq9P98JhnDVBswX9p5q7cK5vE68GaNU4V3BSQq
         2G8ODDVq+Ly/XD10Hc2qebcNUWR2Yeb8f6XQtT1I6AIg748m+1yuE0rN3f4sQPNcFNri
         2RYddgHdYfFVpl94gdKZpmrMPGTT69GZtIpACJH1sNOsjFTgA9r4jM148Ok4Q8LMVISC
         Vh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845470; x=1786450270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79FLLLQAoGUCGM0RPrbwGDcrhx9pbiHdVYLJ5UCShwk=;
        b=dKXSgq/FLKRZMnQGu//KOd5o4I+1bnwHfGeOXOHe8tnx7Gw4AEHlUT9rgV2Uib6isk
         usP3IuL2De7isqJTUgxWD6YDSm7dZbE2Z92BYcPqK9ZaSIgBiVLbi/sy0JlNYOGYld7p
         KWGR75jQIV6WnsCelppkMh+YBuaOY4Wr9t3heHOKP5fDRLxD4gt2mcCmwUV1kLT6GxEc
         FpYlyNUUhXVLq6mh5NiJ9X/RT9PJQazva2m2NjzGGG0Z7KOsFspHeHuVogd7d4e5rIC+
         edgUwyrUQVOJoHg7yuIVfjmrZNbXu6QzFWD42GOAC7yKkbcCyoSpL1mX1ZeoN/eBy/fW
         O3mA==
X-Gm-Message-State: AOJu0YwU+YtOrY8XC3hhCR9Q+k0Y+cfAxiiX0f4kP+6hHHVF1knnAurX
	4URA1dH7QY52mBBIX887bFZj6PMe5/6XStS34GVt2EM7xL2o0r48YbbP
X-Gm-Gg: AR+sD11bVGCEs/NAtPVgftkHg22wFKz2zH7ewoQ7pdTzCWLzZrHiZb+TOknKLQ3uW3R
	ode7wl5mQQBHPbTC3XCTJnutYY5hec1ETk/1Z9bbu53yxbyVFgupQtnFGalD83j/NS0Pqu+QxaU
	X7QJw6GltsEmD+Efzoo/X9zoDCB41CpCYangxx8WgLwGI1YuiD5f09t0Bu59h6x/fsBUcspj1V3
	hHkO/UDBE1oqXGlIDi4J/9Cya/TQtlc0O6bUhLGh/PJJ2eLjh8bppBzIDYubUd1G7zO58j3LAyC
	r2aG63lL+Qt9UND9t1ypEgSykgPrFSGk4qWIllCvHmLSNWvgu7A+CE0pbX7rggwhrA7g1N4exDe
	jqTVGjcHLrWuSc7A2j7hj7ZP8LWCuCGCBO+F6ZXzPBGp1Sool1Pd4MAtwbUVo76Bqz7J2/vzdSz
	HM95of/utk1xm9q1ZW2k7KCaXUyEY4yBg4QupcIfjjIGKRsk2cwx+YeQ==
X-Received: by 2002:a05:6a00:2990:b0:848:44ae:47c1 with SMTP id d2e1a72fcca58-84ee4921ff4mr12979118b3a.78.1785845469392;
        Tue, 04 Aug 2026 05:11:09 -0700 (PDT)
Received: from localhost ([172.216.252.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7ff7sm4999275b3a.49.2026.08.04.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:11:08 -0700 (PDT)
Date: Sat, 1 Aug 2026 00:18:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ali Nasrollahi <a.nasrolahi01@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: remove unnecessary parentheses
Message-ID: <am0REWV_kDGDK2BP@stanley.mountain>
References: <20260731173310.101185-1-A.Nasrolahi01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731173310.101185-1-A.Nasrolahi01@gmail.com>

On Fri, Jul 31, 2026 at 09:03:10PM +0330, Ali Nasrollahi wrote:
> Remove unnecessary parentheses around comparison expressions in ov2722.c
> to be alinged with kernel coding style. This patch is only cosmetic and
> does not change the logic.
> 
> Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
> ---

How are you even seeing this checkpatch warning?  I disabled it
for staging.  Just leave it as-is.

You didn't CC the maintainers for this.  Next time use:
./scripts/get_maintainer.pl -f drivers/staging/media/atomisp/i2c/atomisp-ov2722.c

regards,
dan carpenter

