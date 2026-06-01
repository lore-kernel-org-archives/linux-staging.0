Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF618369D47
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 18:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338593; cv=none; b=aCF9NxSu4+0dtVjU/pW0kLjdJFSnJJazYL9hMhw+1ojkpYgsAIFb9t+4pxwF/CvIDkHtU216ZcTXx9f0cWMRWnGNw3NjeNhtZ6a2D8Jd8t/Vd5qtIdlzotMwpb+Kfsk6PibisIGR/ce0PrJMFSPI1igQz20nT3PX8jOdOIieOj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338593; c=relaxed/simple;
	bh=nadSAkhHHCb9f3c6rk4eM63toF0mz1MXe3So0Pi8lgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFKBdeqlUmtFl7GRvjyGhfnwQ00PBWzbvRVLOluhvxuiGc3R2fdCfLf61HdTwIlSUTPiXYPMJ5q3L5QN8WUX2OjIByuV4l+Wl3LTkUh0MhrmCn+GEpi5f/eZMv4DgHMHHfjcbiELtfWj7Q7jVdQJeVsgAahPN1R3FkuulkSSOZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlPYq1SJ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlPYq1SJ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68b90fc6a1dso7621398a12.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 11:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780338590; x=1780943390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXHa4sPZRNZdOP8iF9391NRH2h78tUBVH5EmiEm/OR0=;
        b=QlPYq1SJgYliapadf1aQ449kOPA3zAMM9N6q8eGojuDNbDtZs558VnoZtEHqEziHg4
         rwT+puvOjwVSjd+FR8T9ZnKd0p5BbBLR4qs0BwrnryVPPVS6oQTCOanWLBt71c8+X9Oo
         T576E2RSjfLd29/jfm2ehLfcr6d3fZdgSU62G1auDNDroYEsYpzVoY9jER65zh6uw6rQ
         WBczbl8bj6fKhGxlBJKoc3bnM/XAOJIxoONXcK0cxUWcrRpsPxahNlPLMpdU7my5NgeK
         IHMKTA0cgZF6CnfepS3yHmnyYtmcHM8t/i7cHaQDGEiDkm5Hz7b/v9yvzrhpgrfnJ7gA
         UDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338590; x=1780943390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXHa4sPZRNZdOP8iF9391NRH2h78tUBVH5EmiEm/OR0=;
        b=meRnHKFG1MKChJ/BLJOefvsDp7DCHlJ54Xr60O2p1ol+8WYZfgx09iZdEqNCzpsMTU
         EcFTKELYfv1I7RlZgd7krd+62XPwpJFSJuXmIDQjNSPEwTksIblBBSwsAi4FAXsvDeZK
         FMieeSybfeGqpA+73/XuBveHBkPlLb+Q6pfsT57WaGZG6NOTz1Wmwfw0mKG8KbmQGY/q
         KRNtHnh59+20icQliCfruqak24RE24JNaObnXbOF+VBD60EAZV//VkbYMCXcSnq6viR3
         0IcXSIwijXnOIpF7bCbJ7neOZSINw53Djfr3z5g5iFMwHefDZmj/0qn59TW4b/5zYbza
         nfUg==
X-Forwarded-Encrypted: i=1; AFNElJ8YC4JAYPVXcOveaUqX6Miu7ATPslNfMwO6lM9tx9Ep+6G03yqj9LnAFoKg9scVWpQAZe9y1uuL2hiTP5tI@lists.linux.dev
X-Gm-Message-State: AOJu0YwEzeeBbbTLfkTsXpIJORIVR34YYqzOEUC0v2CjSgjVc7ZtsJKa
	VtcXcpPW9NvTwnykafzgyKk/Db09kDSOTfR2cmx30XZBqeb6xkpwQH6l
X-Gm-Gg: Acq92OFDRKXQHJrO/T3qNEG8g4DbTp1hAttw9XCZeZws+xvAu06srE1yfCfRDS0joNW
	6q3nOOk2V3Mj90BewS6xl+5vEFvhnz3Fz5efDktR95qzDk69t6/RYWVsxHiJxbOZb7U7+urIcOL
	WGZ3J/uFyi8fbeWOqaGZrWMORpc2zS/onOo6S7jVkWIv34zYc2onZ4IKrYv9cSfVbD/v9qrZUVF
	end+5C34ZEDW6MlinK5Yg2jjqyQDzMSZUbQnORRss0a4mQ4ZOYlzA/uYODKEf9At6uKlY57sgwi
	elued7H1cjDbaxfrizt8xpPfhVyDqcD4K9oTE8aaGT5+yQSio6d/AGuBHseXtEz7GdvgmYThL7g
	I7R7xBCKmD5th3ZTFwHsBcZoRc7pyOKME1sw9RcvHstShXQSJI1tSedUL5qa2BdfBiX4xIj9qOw
	99N42g7yTB89EXP7/STBp3khg7gWwvKA==
X-Received: by 2002:a05:6402:3211:b0:68d:c45d:e64a with SMTP id 4fb4d7f45d1cf-68dd77193f1mr363586a12.4.1780338590013;
        Mon, 01 Jun 2026 11:29:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb8523f1sm2274331a12.21.2026.06.01.11.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:29:49 -0700 (PDT)
Date: Mon, 1 Jun 2026 21:29:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <ah3PmjHQDwe-_orU@stanley.mountain>
References: <20260601-staging-fix-1-v3-1-331ec58683c0.ref@yahoo.pl>
 <20260601-staging-fix-1-v3-1-331ec58683c0@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-staging-fix-1-v3-1-331ec58683c0@yahoo.pl>

On Mon, Jun 01, 2026 at 08:11:59PM +0200, Tomasz Unger wrote:
> Remove unnecessary parentheses to clear checkpatch.pl warnings
> 
> Example of fixed warnings:
> CHECK: Unnecessary parentheses around dvobj->cam_cache[id]
> CHECK: Unnecessary parentheses around 'val != 0xfe'

This changed in v3.

Btw, how were you even seeing this warning?  I disabled it.  Were
you working against an old tree?

> 
> Checkpatch warnings regarding line length above 100 columns on modified
> lines were also fixed

Please no, that's a separate fix.

> 
> V2->V3:
>   Reverted condition parentheses changes per Dan Carpenter's review:
>   staging rules deliberately silence this checkpatch warning
> 
> Changes in v3:
> - Reverted condition parentheses changes per Dan Carpenter's review
> - Link to v2: https://lore.kernel.org/all/20260531061022.573089-1-mavick4022@gmail.com/
> 

This stuff doesn't belong in the permanent git log.
There are still some changes which should be removed from the commit.

> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://patch.msgid.link/20260527-staging-fix-1-v1-1-66ad880bcf76@yahoo.pl

Those sorts of comments go here.

> 
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-staging@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org

This stuff is fine since it is just discarded but it's also unnecessary.

regards,
dan carpenter


