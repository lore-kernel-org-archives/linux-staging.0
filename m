Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33151B86FC
	for <linux-staging@lists.linux.dev>; Wed, 10 Jul 2024 06:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720591321; cv=none; b=Yh/Iy8mu8NkMn6WH783gBq364hnfl5pE3ggUW6ThVr2509yapoKEske1VZV/TjjUegiyHOuzMFUG2LkYLu587jk+6H2M1bKm9i24I/LSiF0d42d6B1slQMPeyvK+Pqk/4XvXLadbWmVdycLy2mSKZvum0tVx5eDVe4elMBmS2ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720591321; c=relaxed/simple;
	bh=QDFuKbY/lFGtlFiMEK/m0bauR/F2ScuWg1EF/31L9A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLu3KzkY7pPD7JCi7dg0xyoA5uVdyWOYY6nlwvx8ovqIf7nMqmDDec0B+eDAu8aagvQQuOTw1J8fcAXAix9ub849pMLKbfztef1hGFQ6NGCaLTFsUIvKFFAtjSbXuBlULIr+C+YLHlIyc4gCAFYW+G4vXB7WfzAu5EDB4he8Ee4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1bGArdIE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aY765yiw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1bGArdIE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aY765yiw"
Date: Wed, 10 Jul 2024 08:01:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1720591316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VFpeUUACA6NTNu3LnOhh72MWRdsJCh6gQP5+7xWftQs=;
	b=1bGArdIEO5lUJKNOScOJoD4pXU+iVhYkdcfsXtcKPLMjyfUWMjOTVRevnJ6G/FJQVvtd8F
	vam/RPc041BMhsGnkmtODtwsvV/DvLPDVB2sFpQRT+4YZiCbgcVnxpdFwHkaGGzBP4BCVT
	RCCqXMNA/9Whe2xuALb4XYTRcxuFxZC8oY9RnQu8vStJJexALO/xwudCl10O+UFIbHFcip
	lCKW9MQpsQExjrMGVsZz9GPfhOng6+fIsvcQUXhJ5jel6r/x5Yf28rEee0jh5SayclF2d5
	XZ5z2U9NkWw+9aRkIEqf3srE3JssJfMPGvskcV43irNTUrq3ymEDWdhQ32BSxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1720591316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VFpeUUACA6NTNu3LnOhh72MWRdsJCh6gQP5+7xWftQs=;
	b=aY765yiwoBLANlpGh+lK48587cnzfDthp1PKt6+du8XnLwrHnOYzuc4+8cGfXPwqOKHbhc
	+fI1qMYfT02nB0BA==
From: Nam Cao <namcao@linutronix.de>
To: Tyler Taormina <taormina.dev@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: Remove redundant parentheses
Message-ID: <20240710060152.Qu9miO0u@linutronix.de>
References: <Zo2MTjKCM_UaLIGx@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zo2MTjKCM_UaLIGx@localhost.localdomain>

On Tue, Jul 09, 2024 at 12:15:26PM -0700, Tyler Taormina wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Unnecessary parentheses around (...)
> 
> Signed-off-by: Tyler Taormina <taormina.dev@gmail.com>

Staging tree's maintainer (Greg) disagrees with checkpatch.pl on this one
and prefers to keep these parentheses. So I would leave them be.

You can look up the staging mailing list for details.

Best regards,
Nam
