Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5F3254841;
	Sat,  7 Feb 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471801; cv=none; b=CC7U1Hyym6Zoq4SwNF3y0tomiIFIB8o42Q138tx1+l/pwhWC/kH8gJRVlWE8qKDPE5TdLEanynLIVXd01WTxfPncPfh+UoRO66TEetH6IpC1slh0MnY99RYxsX2L5Ftr2eYbMeBbdg9buQaQMRRQd1yp+KU11jgcmhdj6vIHL4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471801; c=relaxed/simple;
	bh=6pZptdIjqmZYqt1GCm77kqd056iyWTCC7bRop4sYyOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7DLXgwdMXDhZ8e+r2+nQZftzBdSqCzUoJuQp6IX1cdGNCMy8Y3KJovNP28h25By1JfO62RDD8Q1GgwSdw0Un91ibmr9jLOTJTsBF45wogvaRHZcDMypnXqDpqPq7x3l8EVdr12JtCnyClujM08KqSFD4LQsUqAbygXUx17s19o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qGLtSddR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qGLtSddR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818DDC116D0;
	Sat,  7 Feb 2026 13:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471801;
	bh=6pZptdIjqmZYqt1GCm77kqd056iyWTCC7bRop4sYyOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGLtSddRe1dCzkfGl99QGHqc8hWa2WRAjjvU2eO+P4qhvP3TPzKYiENIMBkn12ZWe
	 C6xJNHvkNmg8aYQ8OCQYkV5/oTDqj3ySxX68RRwZU7sSFcMZ7nvuXIcgvTtQ/KSL8z
	 ktlqmfcw5oQAN5Mdo+7NqQ/dkSPOlWjVnR1tdpwA=
Date: Sat, 7 Feb 2026 14:43:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename camelCase variables
Message-ID: <2026020733-blatancy-periscope-e425@gregkh>
References: <20260206123013.15533-2-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206123013.15533-2-nikolayof23@gmail.com>

On Fri, Feb 06, 2026 at 03:25:53PM +0300, Nikolay Kulikov wrote:
> Rename "pHT_caps_ie" to "pht_caps_ie" and "pHT_info_ie" to "pht_info_ie"
> local variables to comply with Linux coding style.

Why did you pick these names?  You kept the "p" prefix for some reason,
which is "Hungarian" notation, and is not a kernel coding style, so
shouldn't you just use a name that reflects what this variable is doing,
and not encode the type in it?

thanks,

greg k-h
