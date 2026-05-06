Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A351354774;
	Wed,  6 May 2026 05:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778044283; cv=none; b=SlKZjAK2pknJYh5zsuUdQ8ivwMmdaIZzBPrkKOMGQY1XAnpafxqLZ9Fi+/QqEMnL5B2L3fO5h4soz5mgoKmupDeqXHkAl1N9s4ORInDd3OWBL7mw5Q4n4lnjUMviSjnzJyIEX5hT9wbOSzZhfbiDJjd7gLZHp/dY6FlfknPFx9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778044283; c=relaxed/simple;
	bh=xRx57fRb/3zOkeqjhyqMGztJyw/K43/nTbpperk7Y1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIMWzc8Gnz8XaoBzBX1LrlqV8duw3mQH2LPc+gMwOx4aro4YVU57NjpToeTueSlvo0PINg00j+yK/jmUPirMiPNsLxTcJ/A4/KComSqgJtuLUNrvgGDwZG25j3pomT4dbtLEEPJpWs5ATmYcX9f9qQUoSruADufhc9CcXI4BVQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HRjh7K7c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HRjh7K7c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187E1C2BCB8;
	Wed,  6 May 2026 05:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778044283;
	bh=xRx57fRb/3zOkeqjhyqMGztJyw/K43/nTbpperk7Y1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRjh7K7cfLYg8g8pDMrSC20IVVuf93rg+Cfk212a1uxGJ7zMBgB7ZPcwalICsi1eY
	 DFG2gVIVlkViSl2mSiQhhGDb4TYxrpCG/ojzWYhqTn49/mGqxAI6odWyPAMRNO58KT
	 CESKPAMkTQ7SRtwWVlN+ZQ3GXKgXWVIeBT2tFDuY=
Date: Wed, 6 May 2026 07:10:40 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary comparison to
 true
Message-ID: <2026050614-roster-walrus-6995@gregkh>
References: <19dfbab05a8.2d751ade4111.3028810368318669188@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19dfbab05a8.2d751ade4111.3028810368318669188@zohomail.in>

On Wed, May 06, 2026 at 10:33:02AM +0530, Ashwin Gundarapu wrote:
> Remove explicit comparison to true in check_fwstate() call and
> add spacing around the bitwise OR operator to improve code style.
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
> v3: Fixed double --- line and corrected whitespace formatting as
> requested by Greg KH.
> 

What changed from v1?

thanks,

greg k-h
