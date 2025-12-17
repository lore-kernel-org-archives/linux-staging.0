Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DD01DF73A;
	Wed, 17 Dec 2025 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976994; cv=none; b=HI6tyt63SZyiN83z4qV8irfuHc5u+BsKYMy9Ewz5ciDwr2BGQNDBAQZ4TF1Tov2I7R0J5V4/mIpEvJ7mmzWHm2qLIH+0pQy6uVy+rpkNrfeY2Wa7s4+O2xeuMmRyRRZC/awyXdhEV0nm1i97doG6Iqg1cayzhqy7+/MqLScKnn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976994; c=relaxed/simple;
	bh=zeeCM/o0l/9J5o5jI0ja+UjMUm+XTjJal/HSPpdrA9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htwh4PjPN52GBiE4PJd0WfqlKh7B7Yn/lwh4FjBdeIu6+aUxN1DXvlGo8cBklEhclkt4S7lqyPsxh1r2P2cidaHSXezVG7TC79il7zTdUNymuglF1eQ/m+UvVGYW3ZI059zGp1T9c3T00OZ5h1ObxEkgkr3q1TxX7dCQydA/+0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YyAgeBrZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YyAgeBrZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779E8C19424;
	Wed, 17 Dec 2025 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765976993;
	bh=zeeCM/o0l/9J5o5jI0ja+UjMUm+XTjJal/HSPpdrA9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YyAgeBrZeWizpD3NtHM8WMWtLYt6WXhCxd9dZvyinBmT5tvEjyBs3y0jDOjh+bmIW
	 iU8dQWy/fltyJ3Stc0BCbHh8aIpYV4hiH5wXIR6UuhLUMSkkOgsSbXr0hDzWwedKFt
	 ECs3fP0+XnqGhatjsW4Z1Nx+yqlRaboegQKzynr4=
Date: Wed, 17 Dec 2025 14:09:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Darshil Shah <darshilshah7070@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: clean up redundant parentheses in
 rtw_mlme.c
Message-ID: <2025121704-unroasted-faculty-a76f@gregkh>
References: <20251215210901.12058-1-darshilshah7070@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215210901.12058-1-darshilshah7070@gmail.com>

On Tue, Dec 16, 2025 at 02:39:01AM +0530, Darshil Shah wrote:
> - Removed unnecessary parentheses around if conditions

Only one if condition was changed.

> - Removed redundant '== true' and '== false' comparisons

Ok,I see why you removed this at the same time, but really, it was not
redundant, you just changed the operator to something else.

But why?  It's not really required by anything, what is driving this
change?

thanks,

greg k-h
