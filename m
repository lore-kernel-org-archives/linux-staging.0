Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FEA1DD525
	for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761472463; cv=none; b=VaqCOpndxQfsI2aDXceQ1mGP+qqINL8k7OUU50inKvBeB8FeDwcFNOCgXgbxLjQheQpKPlh7sn8ohtZolnvYpECwUUu4LDNc9crRXkBmJ7+lmwtSYzwDO8s6T5A1y+FeN5JqRmOw4XKqiOEXAX6oIMRCquCPzJGgnOZ9190IEAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761472463; c=relaxed/simple;
	bh=XP0KxwKqdK6OgVJqh73LSnf/XiNV7jBAjKSA8mUwPuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcf3HPwkqp4A6hqvbQP2pCDwtqpEqMs+O4WkO3+E4i1rohrNGyxqt4Xs/qEokHvYrmIbrUECoV0M8c2XlHaCDwFBFF/Lj+iqsqMlvUri20J/BN/2bxiq4uWoJNLQTdjRJb+/vRvKMaCymRK9+jVfDFVgXrwHrJlE2KHhHED1aog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aFZDu93s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aFZDu93s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3091BC4CEE7;
	Sun, 26 Oct 2025 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761472462;
	bh=XP0KxwKqdK6OgVJqh73LSnf/XiNV7jBAjKSA8mUwPuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aFZDu93sZBQ4AcJ5aT0xvRPnVEFA+A4io5YS0EP7oaRgP5WhUWdvEzQmMzz7gTIsI
	 xNRd3XumWUnOXz25Lyy7zHVnLIf4QA5zUdmC8vssDwqFf/h+c1Ztce9JO+fnNstcvc
	 pQrmhRnR8futeA2nbXiBQdaKKrG7XiOsbllNoEvk=
Date: Sun, 26 Oct 2025 10:54:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: rafiqul713 <rafiqul713@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] [PATCH v2] staging: rtl8723bs: remove unused rtw_sprintf
 macro
Message-ID: <2025102618-tactile-quack-6693@gregkh>
References: <20251026094925.171310-1-rafiqul713@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026094925.171310-1-rafiqul713@gmail.com>

On Sun, Oct 26, 2025 at 10:49:25AM +0100, rafiqul713 wrote:
> From: Rafiqul Islam <rafiqul713@gmail.com>
> 
> This patch removes the rtw_sprintf macro from drivers/staging/rtl8723bs/include/osdep_service.h.
> It was defined but never used anywhere in the driver.
> 
> Changes since v1:
> - Instead of replacing rtw_sprintf with scnprintf, we realized the macro is unused.
> - Removed it entirely to clean up the code.

Please slow down, take a day or two, and go read all of the links that
were provided for you on how to do this properly, and THEN submit a new
version.  There is no rush here.

> No functional changes are expected.
> 
> Tested: module build works without issues.

This type of testing is always expected, no need to say so.

thanks,

greg k-h
