Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45833890E4
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 18:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782239752; cv=none; b=nXuQPfRgEe8+EKAfaZ5IhpinLALzCr4XjZ0yoQ0zITsSZL0INWv1j9kIMMR9ExuJJTpp8KGrG02tiJ2tD5skuJwwjtrZQaBG8ShRw19byNV8eE7RCFwMNySQ1vIGQ5xD+6trW9WXQIG+dkDvNEl+ZnATB5eCrOr8k8VHb947zbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782239752; c=relaxed/simple;
	bh=v++oZ4B3WlclRkJwQJtJCPPJjgqaPLOsZeiw5l6CEA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMGChX0knGzpWG/5p56e1GO5WF0Aigj82DIM0a8Kpt2TmjLGcxqKqaTkm9sheQqUJNCcRwi0QZw3JyIgy9tm0yPj1OQc0C++kjV9LFxmtX2WWwwEkQO5g3yML52lGO4HRg1SQQ8nYPiKXyckLxBOGAkfxfQhUiSR2NMpJSKw9YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+lVTD5g; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+lVTD5g"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c07ea058c1aso24008966b.2
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782239749; x=1782844549; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7PleyFPA3Oi4OpJNJXnDqrQg/YFHemzbxXqY0lIvYc=;
        b=N+lVTD5gZqP9mRSoYboJ15TA4+PEcRO0d+ijRCwk+FpTQUZcKMr8ExS7VuEKQGBbBc
         zIeyNMVFU57mKsNcO1DRINIGBPuhsb/p3Zam2clo2f07IHZ6fWCDNmdi+4FqQEfvWp27
         chHBLx4ZxLDKn+GUSD3fZpAJQ3zFOmuFg4/U+HA+iWwi/1oMPIZP/5jYdK0kb5/XUgf2
         f3TZQdSMFJyUrUae9+h9c2sHuVKKWQz3a7IZ0jU6Yu2+i+eZP1Xk+LDW+ftat9SAbrDT
         wj/SeU1N684O1RReweTaX9R2aHq3yj6dhw69rRLQDSKDSEb24ULPdrzdVDNxl01QBpse
         VAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782239749; x=1782844549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7PleyFPA3Oi4OpJNJXnDqrQg/YFHemzbxXqY0lIvYc=;
        b=SicFRqayZp9iZd8dkRV4Zb84O56YHiE2GIxViVrjLkNRLoZeCwsIUGTUvXk/DrDRrR
         kOBPPgtu3XZUxpYxoy+enoXM5rtaAw+vYxzCp61YqhlsmajHnku0SNUYroAUXgOeTxhh
         5IJ6/tTy5w3xde6/zFJ8L4QlY2S9Evip4CmAzUvc9FdtyNKon7eNmVoJChgMFpLwRmcr
         r6WFiNUAnUxLwfMqhOG2b4PYk+qKs/sELHNcllDmJDSrPTza7ayO1zK8JccXJY3PtXVo
         BqDD7DQSDJMPSfLAnIOmaw7p2lrVJrNqT73/HsN9SZ9ADeUaQ3IIt8dwUlil/RlFoFEr
         xYUA==
X-Forwarded-Encrypted: i=1; AFNElJ+i7+4Nn75PVNmuPdD7aT0fwIHtY6K86n4AS4ZzyXZe7+mKImNwsjYahTrsQqlD5sxbLH1Qev0KrGUaeNix@lists.linux.dev
X-Gm-Message-State: AOJu0YxpSjOk+WVh6hpmvvB56WBF/a8Z/RqW9Y3idv7SlHeRYMBITqaY
	5la0jsV8dki5piCZrKN88Ctz2axviCwn4nerjOqtBaLpOShnsh9QuNlF
X-Gm-Gg: AfdE7cmnckoqwgrYKXUl1ad2SN4ri5oikvKvVkPY9HDvD526w5ij7wwOY3dFFJenvJ3
	pz+jMj+soOmwbBfSPGbUE7tJasaLJDeTlSGz0dZEFsKdjRxZCqRkCZSsPTnaW0teGggrnf5vjAP
	PXlCC0LG2FDTterO/M4qmpO+DDR11lkNJP7WYy8kjCLGNZK90ycUlkNstBqpEqmhRocv3E8bvBS
	KJpQzPgW3nvWaf0tfj/vTHdciSQ3mRPQg4ILOROCq8DcGReyzPmsXhB+BLwGjuLvF7Jr9uPDFB0
	UkVGQOD8EGNdQUQcdA2qDvuttf9QxHeyviiwDHYRnSFgZ3jZQaTqR6KRmCb34XmG1FEeHLkt1PQ
	WJEYv5L1OovUxrVeLV9fGZjDr5XFLrnk7HHDnfM7ONs5wQlkVHYN7bcChf6pNh2zmROSCbQTiGt
	EhNUKZGxH0
X-Received: by 2002:a17:907:c087:b0:be2:d66:eb4d with SMTP id a640c23a62f3a-c108f9f8225mr256511966b.44.1782239749164;
        Tue, 23 Jun 2026 11:35:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac97aesm552253466b.30.2026.06.23.11.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 11:35:48 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:35:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Batu Ada Tutkun <batuadatutkun@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: use dev_err_probe() for clock
 errors in rcar enable functions
Message-ID: <ajrSAIQUjTgAtuey@stanley.mountain>
References: <20260623124243.1245-1-batuadatutkun@gmail.com>
 <ajqHS-i9zNeYq-Ll@stanley.mountain>
 <6a3ac564.561280e1.325e99.1bee@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a3ac564.561280e1.325e99.1bee@mx.google.com>

On Tue, Jun 23, 2026 at 10:41:56AM -0700, Batu Ada Tutkun wrote:
> Yes, this was drafted with AI assistance. Thank you for pointing it out.
> 
> You are right that the error code was not broken here. rcar_gen2 and gen3 already return PTR_ERR(dev->clk), so unlike the fsl_mx6 case there is no -EFAULT bug to fix. This is just a consistency cleanup, plus devm_clk_get() can return -EPROBE_DEFER when the clock provider has not registered yet so dev_err_probe() suppresses the misleading "cannot get clock" message during a normal deferred probe.

I checked this and sure enough, clk_get() returns -EPROBE_DEFER.  Please
specifically mention clk_get() in the commit message in case someone wants
to check the code...

Useless: grep "when the clock provider has not registered yet"
 Useful: vim -t clk_get

> 
> clk_prepare_enable() can't return -EPROBE_DEFER. By the time it is called the clock handle is already acquired and deferral only happens at acquisition. Because of that I deliberately left that path as dev_err().
> 
> Compile tested only. I do not have R-Car hardware.

This is good information and it needs to be in the commit message under
the --- cut off line.  Obviously, I know that changing dev_err() to
dev_err_probe() does not cause a problem, but I also want to know if this
is something which is already affecting users in real life or if it's
just a correctness thing.

So the patch is fine, but the commit message needs to be re-written.

regards,
dan carpenter

