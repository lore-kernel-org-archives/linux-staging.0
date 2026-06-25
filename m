Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725833DDDA8
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388705; cv=none; b=RSGG1UVIHXHK4W0pB2ulhwG2nd9IOUEBWycyvwDogZlKnLYtPfry6SertoT4RuEbHaI+m7dZlqEMpmjtqwFqGHpMcq6lkLL57/j9bMOVHLsEPdNy3/Q2DLDoouG4pvreF5YN8iuM5a4cMOI2WWmDihLdhtwQYZLAIy5YvTRPl40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388705; c=relaxed/simple;
	bh=3eDaWhVrdaI5qhweYpUlO2HERuSAQJQ4eQARlgRWWQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVYl4QK6WLpIwwQjx3Y+611WzH/DDMpN4qY1PWJy9FrVP9Hd3XyoubCTYeqpZ5SxpWuotuT3HEWSqk3s6XSQ7OtDUqlmCg772df8XyGaTrKW4tsdodPiTNHXZul3fN2UvmChI30JxI66ZDzqkawv+WVqSlq/6ivkkrwfZxYMZRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlaOBH/L; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlaOBH/L"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e6d991991dso1668502a34.3
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 04:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782388703; x=1782993503; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1cMFsB9TOtodHy+6dDwE6KCdh5Q1jF5GsF6eebxqdQw=;
        b=TlaOBH/LkjxlRPYp6u+ryLwT0KQWR7JjxJNoGSjAFuxPK7bTZXiR/BgzahEVIcwyHt
         /CB2JdDp16dURhROSi2GjOhvXzqnlCdEOzIeve982H0y0x/mjGCHMc6t3qB3QwSCF/Zk
         qK+jhwk/ZomqJ5sEtIDD80SFBDNUmGCeIltpEYn4mMUEmhN05Hk5GZQNFSpMkQCsHjwF
         cYoPmG24r2apU5Smp4MdSOc6c5FMC9sW1Wo6/mtAbkwscE8ebkX6du4yf9ICDOUyoAu4
         4kYDeNKicA+crlH9SGWR2SthXGRg18KO0fnZk7RRXVAoGQEJyNgCFvnClsMz2JXspHFC
         yPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782388703; x=1782993503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cMFsB9TOtodHy+6dDwE6KCdh5Q1jF5GsF6eebxqdQw=;
        b=ARuYA5vAIDWMawG6+oqD59J1suWQ7GXVPmNYc8iAPJEQYgQv/sKSJBFeZbzXZXVyOY
         Cm5uqRbGvdU3LjeTABiZgUo2sAbHn6CKhV4bLvqSXkNKlVgaGJvokUPYhVQcK/bq9cZo
         4nbv3KiJhU4rAQIu3L78/enbiGEMMbXFHeP2qPno4MM3y0z9wxSkp44vyyqpTiynh6rD
         gG/sDgx7p2wYZZqmqIdEUZcioIPPg5lwr9HQ8ORpN/OUp4B5h/f70ggSDQhMzNKi0qMR
         Evd4/XWTQ8xPrDYK8RGyygyAQQAkt5dbOwRtfGEx2xh17cgKX709ib08WxhRD7YbAI1T
         IDkw==
X-Forwarded-Encrypted: i=1; AFNElJ8qe+IRO0YyPub6aWgijlVkpA2WhP7WD//O5UAb+iTrEEuWht7m9tAj/GV4CFqcLmYHVygTpH4jELMLIRrI@lists.linux.dev
X-Gm-Message-State: AOJu0YwjSXVlbMhMgG1aDwV/0z2wfbquiNyhykwjL5QTw16dFKrTJGFK
	5eInTYZrsDGViVaTxY5x9hIrnnDnfcW1qrReIcq5ACn4+Y83IvCXz+Pu
X-Gm-Gg: AfdE7ckI9LBpfr6siNsirYiiigxwTJvlZKQ/wAHRVpLrEb9qKf8OOfFuUWL6NuhhxDG
	93io8s+217jrz/EAa5ndIQFDLV52lmg+Kq3RXrASjuEW89V9ptMPjR1bx+edfyBGemJbOQRRpAf
	NpVeGwQDtXwrE4npLt+zAiSGU5UEGg4uev4mALQEsvd5wJ59V9cp9ftli+tlbV4yuTWZE0rGJdC
	TGEte9Ih6yz/bS0EvxUzn0cNt/8tAWO7Nbd1+euHAqxvMFv3dk4p80l5UYkYkXPDWyRB76CnNFK
	6DNu5Ycw+esowmQxovqXu4PR8cSFZgxdcXlu9xK3zoZZ8DHjqj/GnwiiozyQAPJBMn4drQsSi7+
	uz5ngOYCLuELE4M8iHiUcJZ+3FbWqu2V3EOBurUZE/8h4PalP6uHjnIGU4b4vcLloyZRE4CrLkk
	DeB++I
X-Received: by 2002:a05:6808:16a5:b0:486:39db:ebfd with SMTP id 5614622812f47-49217f19cb1mr2129934b6e.33.1782388703550;
        Thu, 25 Jun 2026 04:58:23 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aee43c088sm10674654b6e.14.2026.06.25.04.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:58:22 -0700 (PDT)
Date: Thu, 25 Jun 2026 14:58:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: bound slave windows to DMA buffers
Message-ID: <aj0X1ltvBoJDEbES@stanley.mountain>
References: <20260625093137.6589-1-alhouseenyousef@gmail.com>
 <aj0WWwiOzjLGbY5z@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aj0WWwiOzjLGbY5z@stanley.mountain>

On Thu, Jun 25, 2026 at 02:51:55PM +0300, Dan Carpenter wrote:
> There are two bug fixes in this patch:
> 
> 1) The driver allows you to set any value for size.
> 2) The vme_get_size() function returns zero on error but nothing
>    checks for error.
> 
> There is a third bug as well which is not addressed.
> 
> 3) The slave.vme_addr is not checked and it allows you to read/write
>    to any memory.
> 
> It sort of looks like bugs 1 and 2 only affect
> drivers/staging/vme_user/vme_fake.c.

Actually, no.  The bugs seem to affect drivers/staging/vme_user/vme_tsi148.c
but the variables are stored to registers instead of variables so it
was a little more convoluted.

regards,
dan carpenter

