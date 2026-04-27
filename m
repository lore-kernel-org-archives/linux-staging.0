Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0D3BC68E
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294711; cv=none; b=d/HfpVZcqVwYQ76ZI0vQphX9I40YA0xOvoV8A/4yDTKXapSejDETu8hs7yLy2ry3O7NNiMgQleSXXdkUqMNOfYpbZFzeGv6wdD/oaIvhyVcPz/iIoWJGRZB+U99C4DRe1WtcIxnjLr1Qgl1Nuf34fb2IQOPXwkVIB+T/3Tw9De0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294711; c=relaxed/simple;
	bh=R+JVAx+RBpQxJ2bs/jmXNm9xDvjTer0iDG0II/hdrik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZOFQRBVkNCwkcGxOsPFbjV/PeBQYzFr6fS8PTqS1Vk2RIUDGLhQpsf8klKD2aVhuKXjEOmc965X5RLQNIlgyJSS0bW/w3nin3fdhIXoCF9uz3LO9dYyPqVsggReP+fqJyVJonR5igWUjippTM90/WkXTYD7W+495foY9r2O66c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RB/6UNz1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RB/6UNz1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so54096185e9.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777294708; x=1777899508; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DWPwhcIVJegParEMP5xi2f1qREsVOBmVUf/CtH2XiQ8=;
        b=RB/6UNz1p4qk4gkW4IUw3YQwdt23gqXoDFidlM4RAWqaen4a8x04hzyDLlepwxTzpH
         CS8/C5uAVnT4IlFhPFepOOS1DWN6WEI9rRbuJonUDPAywgDpHdKJB4PdBzpp7O711+0H
         hXP9lPvNSfH1HmBxV2OvyAxDA1y8o+4avt+53frEykcjLWQzAPfOEnMvu/yOIB8e+4V/
         nMTIMsvIJmgPjx+2jnEgXYK9IceEcDLZq0g3LmJ7vsF7kdQdZcP3aymtIMzHfmR4zR0i
         A3l5U6Ufi3tRRqtHP6N264a11H8YjMx8AWvz1jERzHeNkK4lnBuhsra/LhNOJM6/i5+R
         WYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294708; x=1777899508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWPwhcIVJegParEMP5xi2f1qREsVOBmVUf/CtH2XiQ8=;
        b=EOcGqgvIu2NpEaE0Wo5AIxckN8FwQ5H/dU77IjZLqchtFGkm2AIG46QgzPR6CQvBfQ
         cSy9o88+oQvhN+ge4WIStO9B+jsXFpiUH3oV6vX2Icx1799Fr9WyI48GPDuSkzVQrsu0
         OWLNwJ533g4tVbbuFTln2tpa8B8uUj/s/mR8FCEtNY3LQvrldC5Z+4ocyITAXUJMjKB+
         qJy+m0/cZ0TOoRrXceZN1E8FL+QcMYtIyW5FYh7wnVAOEjyWcUDAnTYLzPZbSXFMf5du
         5fUT7uRzJ75Lyja5IYcIFJW/RKQ1ZBWLRlHVm+BvSGAdXsQD5yjezqAQoZ+4Z9cnRJ1D
         IBHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/w/Gs4ox4CPxiT+KSA637QlXdaEz1O6d40dOe6VwkHK5/sR503FaNGN+wo1d7O/nrSGdJpiHePva6xOW7M@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4SYoF8KsmuV0o7dVOZ7h30VB/AlmZZbMrrJ40EuitJ3ZJ97vs
	S7hhPa6jLBcB6h5y442U1OxySPDmLwtOzvCTfIf6+sHhF4yZx1S/i+4b
X-Gm-Gg: AeBDievhWDTzVYi363D+Hw4R5AhonvHSR1g3Z9lSE6U9G+JMzoBzPUzxMR66qqlWCjs
	4QbczM/YqPPkXfXRtkehBohqPnUMOcLFqHcpQ9lORZP7YgC5YRIN1H8Gb1eEBRkH2rFHpenx2+I
	8Zi8kPU9hWQavHIhDFK08yjZrk4GFPTRa25WPelY5/ZTk6glT/rzCKUEAbTE63pdSSroq1TiHkR
	GF9UPPvii6sMhFQsAfDLbBD7mwezaok6xo57JzKFvghxqLrGCcvfvDP/hCXIG2uOeldtmrDCoCm
	o81ptsp8GTmPDRmRym2MEF+txAGAOKjpD1+AYJ8Wl4rPcinERMeqGvbj9MQ93Ngam4UsVhnOpRk
	5DCnEtnnPrD1pEK+hsKBY7ICwHSyetERLzAlDfnMWvDPJJe7qO4Il855GKmtE/d6uZr11Em0YRQ
	kOc122JHcfzcMrRL3geZ3vigIVgjslKA==
X-Received: by 2002:a05:600c:3ba0:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488fb8b91a7mr556712585e9.12.1777294708023;
        Mon, 27 Apr 2026 05:58:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm174070255e9.23.2026.04.27.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:58:27 -0700 (PDT)
Date: Mon, 27 Apr 2026 15:58:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandru Hossu <hossu.alexandru@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix OOB write in
 HT_caps_handler()
Message-ID: <ae9db6KjYMsFOG3F@stanley.mountain>
References: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
 <20260427081748.3407939-2-hossu.alexandru@gmail.com>
 <ae8pq5YzEe2wTJmx@stanley.mountain>
 <69ef2c47.5d0a0220.2e33d8.bde8@mx.google.com>
 <ae8w9tkpM8G2NWWM@stanley.mountain>
 <2026042737-riding-bunkhouse-f8e0@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042737-riding-bunkhouse-f8e0@gregkh>

On Mon, Apr 27, 2026 at 05:11:19AM -0600, Greg KH wrote:
> On Mon, Apr 27, 2026 at 12:48:38PM +0300, Dan Carpenter wrote:
> > On Mon, Apr 27, 2026 at 02:28:39AM -0700, Alexandru Hossu wrote:
> > > On Mon, Apr 27, 2026 at 11:17 AM, Dan Carpenter wrote:
> > > > We need a little change log here.  I was hoping you would provide
> > > > a link to the AI review in the changelog.
> > > 
> > > Hi Dan,
> > > 
> > > Sorry about the missing changelog, will add it in v3.
> > > 
> > > For the AI review link, I don't have a direct link to the bot output.
> > > What I know is from Greg's reply in the v1 thread on lore.kernel.org,
> > 
> > What about a link to the email on lore?
> 
> Sorry, I was on a plane with no connectivity to look it up, here's the
> AI review for my patch:
> 	https://sashiko.dev/#/patchset/2026041408-grill-mahogany-d1e3%40gregkh
> 

Ah.  Very good.  That's fair enough then.  The AI is very convincing.

regards,
dan carpenter

