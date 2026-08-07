Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380393B3891;
	Fri,  7 Aug 2026 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086296; cv=none; b=YHxxWX20p0OauSUWQSnpWMwW64lc1Q4JbfQpGY/9QgoZq2ycGolj0S2PSLF+136LkaPxV9rQmRU3pvVlYSAv2hrFL31x4QlUrT8nmvIPrWMYw44cwqQwSBtvLNiMOq8R2cHxWYWUryJJksMtdVdLfzjxYjKtxkErteG+QoXv69A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086296; c=relaxed/simple;
	bh=icioOuqrg12RsOWm5WZyjTq1XCsH/muo1TzrbtlFkRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVVzKuhsagB1yNNO0Pj1hQx+8KdywQXNVWqq7+1DSK+Qzn5+GkDk+IT+Gr5Ix8ulB5JPHMm1nqrG0tMnjxja8I393x6YW9F+3qYsXxHl4OGHBkxV06BGFZcZnLVSD6sNf32yNx2ShQ5P9EFjdTZ0M3y8bPAVYTg3RShIbQKwKSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dU8PNJYY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dU8PNJYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CB71F000E9;
	Fri,  7 Aug 2026 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786086291;
	bh=76JHb4Iybh+Wrot0OhPFr070juKAsXlTX+ujuXIrrQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dU8PNJYYiMMETUXGgHBXQhnB6Dh1+xYWbFrV78OgQaTPQFKrWzZp9gUmQm7CDSnTI
	 z+hxgEiIuOgB+9LdC8nNlwHTOn0/uQQZI3ZbyPXNPLvYcYXPk3p/7qLHFCPj/MFE5P
	 c0DT/dX2GS3WpfjOn/rXcUmdP4rS4FlOBSpeEBCc=
Date: Fri, 7 Aug 2026 09:03:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove static HalDetectPwrDownMode()
 function
Message-ID: <2026080749-dolly-never-0406@gregkh>
References: <20260806-rtl8723bs_efuse-v1-1-fedb8b91f346@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-rtl8723bs_efuse-v1-1-fedb8b91f346@gmail.com>

On Thu, Aug 06, 2026 at 10:34:48PM +0300, Nikolay Kulikov wrote:
> The return value of this function is ignored at the call site, and since
> the function has no side effects (except for the assignment to
> pHalData->pwrdown, which is not used anywhere else), it can be removed.
> 
> At the same time, remove the efuse shadow functions, as they are
> becoming unused.

Why not remove pwrdown first, which shows that it is never actually
used, and then remove the functions in a separate patch?  that would
"prove" that this is a safe change, as-is we need to manually verify
this patch is correct.

thanks,

greg k-h
