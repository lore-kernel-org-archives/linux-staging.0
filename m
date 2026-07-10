Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A082437136;
	Fri, 10 Jul 2026 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694851; cv=none; b=RiXUSXnFzXWPcYLsTs1sOECRa8KyQycBjwCpcQCIAv1e8vs/SNKFGqwmyui00l8sWEWFDJjWskDpflnhnM2dQZMFuOQguYPDbiIPnKgpT2XyGZ8ptKVsyrOdffTuZkk7PTW8+7hA5e14nCPzL4FxnULNU7Dp7RsxhltjQ8xUItI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694851; c=relaxed/simple;
	bh=LZKZSSF6AGSUQSz3S+613szs+sGIEMikfv5spRyIzAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2I65lWSbsVuhgP9Sh0yyQpJUEM07SZTZ00+OOGmwcGIbV/6YLBSHjmviHCNI+MmYDqz7rzy931vi8PRa+2IPwQgUyKdraRk3A/0tSV4cHs7RnJ756srab3N1HsEmd8/zKoSD99dxHY4WeV0+CRMDLUVtYLrj3bAX3jY2bGTKxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X1J5v/1w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X1J5v/1w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB5B1F000E9;
	Fri, 10 Jul 2026 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783694849;
	bh=tIncgkODI9FLlbPll4z8dpIIatLuwnQ6wXqecYCfL6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X1J5v/1wFfVHYRTlQZPoPHAmRKXuUziYlW5ItHX50JWTArs7i2WKoKcwAzf5epH8f
	 FgtWChv+iC5btetT2VKBwrnKL7upUwBqMcr8pK/BnlA5PRWB0pXni/3/hi+Qfc2gzN
	 B4eZtKSVMFwpfWiNOqYFrjxhg8CWNyUcEYwKl9a4=
Date: Fri, 10 Jul 2026 16:47:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Guihot <daniel.guihot123@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary braces from
 single statement blocks
Message-ID: <2026071019-exert-delete-4888@gregkh>
References: <2026070718-charging-outsource-81a1@gregkh>
 <20260708120747.22388-2-daniel.guihot123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708120747.22388-2-daniel.guihot123@gmail.com>

On Wed, Jul 08, 2026 at 10:07:48PM +1000, Daniel Guihot wrote:
> Remove braces around single statement blocks in rtl8723b_hal_init.c to
> comply with the kernel coding style, as reported by checkpatch.pl:
> 
>   WARNING: braces {} are not necessary for single statement blocks
>   WARNING: braces {} are not necessary for any arm of this statement
> 
> No functional change.
> 
> Signed-off-by: Daniel Guihot <daniel.guihot123@gmail.com>
> ---
> v2: No code changes, v1 was accidentally delivered from two different
> addresses. Resent for consistency.

Doesn't apply to my tree :(
