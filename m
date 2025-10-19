Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4198329CB3A
	for <linux-staging@lists.linux.dev>; Sun, 19 Oct 2025 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760866004; cv=none; b=Dm9hSoUhEvsqzEJdNEfAX084tGskSvZLGEMdN6vC9ac4ea7BQ4Pdnoic1ZcHdhbrNxird6sCGVyhJGMWgYw2G4cb/8oUd543lu2hGxkqnSZ/PI8kgBCFqd8pZiXxzPlm0QcH4tXLenTG++q6iffHeedViJqO3kj6eYanCpmM1oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760866004; c=relaxed/simple;
	bh=5SFAw3cCDwJs++udcDZsFMzS7AZbi8LWabslXhlTGAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INAD/SKNbtMOBFcuXGVaMC6mk2XFo8Ll/z+FsPQ8H3mfKI5Iafw2fnaMk6AriD853eBkON+fFf0l7tSwUvvIRi03sNGHedAocbVc8r5vFJkdLjsW2RkDvAhQOIqyGpeLOaqpgpqFRnwW9Qu+gAw5FTeAdwVIhxnsbHJBBQ6VzEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TMQPuw6z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TMQPuw6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54893C4CEE7;
	Sun, 19 Oct 2025 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760866003;
	bh=5SFAw3cCDwJs++udcDZsFMzS7AZbi8LWabslXhlTGAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMQPuw6zsuGaSpmaanS37aV9e748uSUwHG/pZmza+Uc8NBKLNeQmjUKTLzN0ptl5b
	 dtDsMpBwvC+9hUPmahzQzqDjcQzxuDgKfhmcVmbGSL1HyE3wGi6UDgCs5TDdQ/4zod
	 /l1oXxFBWVAlriKZFIw8LpF4co93yn6R8dry7yqk=
Date: Sun, 19 Oct 2025 11:26:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Emre Cecanpunar <emreleno@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: nvec: remove NVEC_PS2_DEBUG and dead debug
 macro
Message-ID: <2025101918-unroasted-sterling-f8cd@gregkh>
References: <20251019091731.3064-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019091731.3064-1-emreleno@gmail.com>

On Sun, Oct 19, 2025 at 12:17:31PM +0300, Emre Cecanpunar wrote:
> v2:
> Also remove the unused `else if (msg[1] != 2)` block that referenced NVEC_PHD()

I think the bot said to check out the documentation that says to put
this below the --- line :)

thanks,

greg k-h
