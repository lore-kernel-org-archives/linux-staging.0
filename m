Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D206E33F598;
	Wed,  1 Apr 2026 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040619; cv=none; b=FRF9L+Ys/ba7bhbPguRsK8mDDNY+9lBk51e0AMN59RCVjyZc5CVBlwIJMe7Iy4hBSV/SaysGMB9gghrO+GSswlcras7HuMkiWgqOTdP2rkDIv1PgAWVTQCYIM6/9CiEiWbH8lUmEPFp6I82kwsaZTGWZGL7HOG/2Pj/vG+TSt2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040619; c=relaxed/simple;
	bh=nWQ+dtSPHR5pKla8UlaBrTu3BRzOh7d/pNYuYYGiim0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZI/QQHG418rtDXLyEeGnGx/VCDORUaqAfPHwxzhwh3Pp9eV8Wr7YHLgEF8Reu9ilbZCLogTf+BNEaCTe3ve1VkCGxl4Q+0Ebj/QHFgoVxcchRJ9zS5c8Ap+39XQCXKbNktvNsc/gnhmEeLvz+fXCmOC4o93xxy83rDBLesIFpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dDMplHmt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dDMplHmt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2701AC4CEF7;
	Wed,  1 Apr 2026 10:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775040619;
	bh=nWQ+dtSPHR5pKla8UlaBrTu3BRzOh7d/pNYuYYGiim0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dDMplHmtHvfG0vPY4jQ7w8qqaT3tdj33fIbN4ob2UBEyNiA18PZY3CIOC8jqmizcR
	 OzKIDJ4yycFyiCGEoZidoHihJcB2S5oAp7mH+/oL8NonnTEHbv6h18XJ5YsLQvUn7T
	 R+ncjycS2Bcp62yZNgcSr3amyH3dW8sFHLi8iHS0=
Date: Wed, 1 Apr 2026 12:50:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: omer.e.idrissi@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
Message-ID: <2026040140-september-numeral-0865@gregkh>
References: <272CEB11-DD9C-43BE-B47D-49F8BE1A0392@linux.dev>
 <2026040159-bamboo-ended-620b@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040159-bamboo-ended-620b@gregkh>

On Wed, Apr 01, 2026 at 12:29:52PM +0200, Greg KH wrote:
> On Wed, Apr 01, 2026 at 12:17:41PM +0200, Luka Gejak wrote:
> > Hi Omer,
> > Thank you for submitting this patch series. I like the idea, however
> > during my review I have found that there are several issues.
> 
> <snip>
> 
> Please review things "inline" like a human does.  With the code in
> place, and the comments right below the code.
> 
> As you are using AI for this, PLEASE use an AI tool that actually works.
> Use the ones that we have public, which DOES get this right and puts the
> review comments in the correct places, and in the correct format.
> 
> If I were confronted with a review like this on patch 0/X, it would be
> very hard for me to actually digest and handle it, given that the
> context is not there at all.
> 
> I suggest you take some time off, work on your review workflow, and
> then, if you still want to help out with reviews, do it in the proper
> way that we all have been doing for decades.

And your bot has exploded, sending it's response multiple times to the
list for some reason.  I think I need to add your email address to the
ignore list for now.

greg k-h
