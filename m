Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA8B1E9906;
	Sun, 14 Jun 2026 03:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781408603; cv=none; b=irzxDFI998h8fYTf99II+9CO6L8I0NtCwv6W78gxYY/kK3BfTRZ+L33I1ByeIjuNMSDJYXWiLAdkxSAcUWCTSJDcQv40w7hOlwK4IIA8HNfduYyzPnXSCHgQScc3Ifs1cD3zScD6TjxRTsEhi9088RJoIc4ZJvLVTn4BE6+6pnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781408603; c=relaxed/simple;
	bh=ox587mKpVln0yunEhoaOPlwPumZKiojUvVffcCYxI7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R96brA1loUb8XNRtskySejTFYeLSIAi2VzJMD8Qo2grUZznv/XTHsefGQuQ4eg5XsjS9nAbLSj5mg2V7NfB/GdkaxNW/VEi+yyyjlpD+ir2RyWifHa6xYTMRgjoX/eZnsAZHg27D94kUEM5yh97D1oIJEpP/L3NAxoJwVBHwpsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KjDMYpCX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KjDMYpCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A36E1F000E9;
	Sun, 14 Jun 2026 03:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781408601;
	bh=IlkRm+maqCCpKPGuI4nwb57B4LUWEMtgmLMKSP9QO5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KjDMYpCXAbHg2J0M+yBlpzXeACK6vFwvShLDuECwIZtLzccf+W7uxTZB/YO1oGAKY
	 fUmopNBzGHKPHZFuPnaakcM0ymBqe6/ndc0r7EdsLOyccQqu1MSMAQGseWH6GQAW5M
	 h3bNgqf83wmh8KYI3R1mIg38S7Tm0VzUPX2aS2Jg=
Date: Sun, 14 Jun 2026 05:42:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriel Ramos Barbosa Mota <maguraa53@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: remove obsolete VMEbus driver
Message-ID: <2026061453-muster-twice-8561@gregkh>
References: <20260612193729.579790-1-maguraa53@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612193729.579790-1-maguraa53@gmail.com>

On Fri, Jun 12, 2026 at 04:37:29PM -0300, Gabriel Ramos Barbosa Mota wrote:
> Remove the vme_user driver directory, Makefile, and Kconfig
> entries. This ancient 1981-era industrial bus hardware framework
> is obsolete, unmaintained, and no longer necessary in modern
> kernel versions.

Are you sure there are no current users?  And always test-build your
changes :(

thanks,

greg k-h
