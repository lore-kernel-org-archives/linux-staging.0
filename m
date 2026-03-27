Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D93E4C7B;
	Fri, 27 Mar 2026 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609131; cv=none; b=AF30CuNUuw7Y3NbZLNJQd4AcJwaVcf13fGeaC5RhSTL+RBZ5uB0rYVA3IpKtkzv1zUWy0YnBobODNRuswjLhqTB0oVMKQhZTBLHRWv2BlMA+UQJGCzBI2ZOYZpYcGGW+dHDDN1nbNWnViqbSDMWqUlvVri8uJ2skxHt2S++6RYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609131; c=relaxed/simple;
	bh=q10WyW3wSGcdTjXRXlWPDVlDAY8Ug9h55M8guSRybCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJStmm5H+pLDBmLLozoS6xvoBSG075Sf1MouEZwp3wdA1Nq5M16w7B1eLkjsHFuVZ+A1NIPOPUx3m67WaqFMIwlyat0CVvXJtZ1L2herqcnkecNITHA1rhoD/WlhsIwL7/MLthMC7FAJWIGLnDlBfIProhHDsshyZX4Fy/QbZH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZGBx20Og; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZGBx20Og"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C12BC19423;
	Fri, 27 Mar 2026 10:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774609130;
	bh=q10WyW3wSGcdTjXRXlWPDVlDAY8Ug9h55M8guSRybCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGBx20Og4KVM6aDLJPLUVVuvDaLYID7HGoJfMvrMHxO1+mKqWcAzhlyju5HOIGSFF
	 uN1hmUQlS28Vmg/zdKm75XTacYxY2pIz3D7x+OQU/WqnwVIiP2RfEeDA56watk/imJ
	 j8kKaIXPWW81yD7TY+zEcHPY4Y65aOsOcLTav7v4=
Date: Fri, 27 Mar 2026 11:58:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix spelling in comment
Message-ID: <2026032758-sublevel-escapist-7521@gregkh>
References: <20260327104842.3106-1-hechushiguitu666@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327104842.3106-1-hechushiguitu666@gmail.com>

On Fri, Mar 27, 2026 at 06:48:42PM +0800, Haoyu Lu wrote:
> Change "co-existance" to "co-existence" in comment.
> 
> Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
> ---
> v2: Fix author name format in From and Signed-off-by lines.

This is really v3, right?  :)

Be a bit more careful next time, thanks!

greg k-h
