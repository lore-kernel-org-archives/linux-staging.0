Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73BC3DE457
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781637034; cv=none; b=UeGO9RYQPjS0SNcoUaPvy9/H+ecme+PFKqquLt7xNRy8ibPso8lrMrAmPM6hDM2y3+LW1AX2eFwE3KPL6GXFYaDX+FgnyM9nUFqnIwo0IglJhZiryWg+Pkas8G6j+nK4ZbccoD0Kblx/f1AhTiBQzVeoGXOsWhTaZ/QnYkatGhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781637034; c=relaxed/simple;
	bh=qPMjOWt4IKi9fKzU+nZeBuPwxs1Pt8tu642SEZY558c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpiNn77dlXo4dEThQbID0OoBq+/y93bg/kgrhqCkEhEho2AWzsqSD9Z6wVZhRcIwDRZl30DCqg1D2inSJCQOkaA0NO3LUypmg6CVYjwekIU66/bjCRo/AiYQaFydMd9FoBF13E9pgn3G6HIIWqgKYrgJvlIWt7P7Lh1LEM7yzTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WQAe7oTY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WQAe7oTY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7A41F000E9;
	Tue, 16 Jun 2026 19:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781637033;
	bh=6Sy57pYkfcTwFUWE62BgoXj1V3Nki4BllpeEPoZ/Nds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WQAe7oTYYwyZbpWYOTV/PbCvk4thKBKmKUMleB/eO58s0tvUgrUeJnY1/P1AHLft2
	 JI0vL0AmQ+JejvhaZjLR2fkx0vPGZSERT8rhtwPzuoQMeYWtaVeO0fRsSjbXfIa08f
	 kc3LJ3HUoMKKGrdtq6gQJm+Nq0F8Bs24KFjY50lM=
Date: Tue, 16 Jun 2026 22:39:07 +0530
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jad Keskes <inasj268@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace beacon timing magic numbers
 with named constants
Message-ID: <2026061600-rubber-prude-b4ba@gregkh>
References: <ajF50N_RW88mhF48@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajF50N_RW88mhF48@fedora>

On Tue, Jun 16, 2026 at 05:29:04PM +0100, Jad Keskes wrote:
> Ping. Any chance this can be picked up?
> 

I have no context here :(
