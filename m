Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C192066C5;
	Fri, 10 Jan 2025 05:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736488785; cv=none; b=mM+mOsXTIKJyG/jaxGfps44xkh+u0STwvHF2TX+l/FJpT6BqRGN2VEROHDwAVw28cSItuwOwC50Z1xeUsBhiEuEjFD4PMKkGSTN5sIyNfmkp0zgqAqW1K91zUsaADIwPknWE6PZiTdYDqx3y5IgTkEVqXyOJrCCzqsFQWZOph8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736488785; c=relaxed/simple;
	bh=Y5HdDVtslhwTLFmIrp/8Ngh3Pch1bCJpoB98PNUiakw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRYj8RNumqAZUgZQQqk0d2/w/8NoSksQrvfGWB4XuLS+SKHyCx9tIjzRokyXbwpMi9U7eg5zkqm7oqJVTZ5Wr+I4kIUWg/06WWBct9qsUUjtOraIdL2+TdJgWrkG2ZBnZDcU61KQhypqda98p4FW6F+jzWWy8KM8CO/CDxyqKI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MBLYG77t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MBLYG77t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8E7C4CED6;
	Fri, 10 Jan 2025 05:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736488784;
	bh=Y5HdDVtslhwTLFmIrp/8Ngh3Pch1bCJpoB98PNUiakw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBLYG77t1UEdZ5XYnbISXDHfwABxa6GhTLxOkqsoZCBgMdXrLvL7W/JS62hY1gLPK
	 FXVbYPjsEOwu8eEe8GTwEXJvDgdLYIAGFayIxVv/qZfMu8FJmx9mdVbaJ3SxjxrciE
	 7dQQdxPENhvZByOJsYQK2IWIZRlBE8In3tSo3OyY=
Date: Fri, 10 Jan 2025 06:58:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sandeep Salwan <salwansandeep5@gmail.com>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Remove commented-out debug code (v3) Code
 cleanup. This code has some debug code which is commented out. Delete it.
Message-ID: <2025011042-herself-ammonia-e49f@gregkh>
References: <20250109224536.3531-1-salwansandeep5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109224536.3531-1-salwansandeep5@gmail.com>

On Thu, Jan 09, 2025 at 05:45:36PM -0500, Sandeep Salwan wrote:
> Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
> ---
> v3: remove leftover braces, re-write commit message

I don't see any commit message here :(

