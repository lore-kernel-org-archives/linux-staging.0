Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D055FDA7;
	Sat,  7 Feb 2026 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770465331; cv=none; b=Vvt2HaFwa7fiyG7zWpLqhLpL8tmjQH3gmCo2wdPeIixlZGC37NLFRPB2EU+p1JlghEzY2IZpJynbs578UofchD0m0x6t1Nl0F+QPrnZam7RML5JxdYiiYvhKd0e3MBdmGP9VNVKkAq5AWo/vueINKRZUxQRjpJVh7Kcaa6wD8CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770465331; c=relaxed/simple;
	bh=Q1iygGUBiHUnl4nIDkavT8iQ3wKzpQRMgdY900Vztbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVE+u5lQ49AqpoP412/eL+JOGFcTsIsmtTvVw9T+SklPoXTLToZOim20U4caGlZ7bfIjefXV98wPpWAbNRm+4mvM87B+jRICJKmphbCirJztQ2U8xG9bSFQVf97g8YcRzbglp5YlwSq+5xFnvsgnJ4EULeIB6eXugTJumyTA9Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gg+HcWnF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gg+HcWnF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A852DC116D0;
	Sat,  7 Feb 2026 11:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770465331;
	bh=Q1iygGUBiHUnl4nIDkavT8iQ3wKzpQRMgdY900Vztbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gg+HcWnF7f3ZQV6K8szEpM1K4KI9GGATQY/VEnoCcYpgLZaATsKugSjkjZHXEyky0
	 G+mv4ylOYbrScnpVMOBdtPzob3+GNMrKwlQvTdx6iPdM1yvhst9nVAjgPe2C2nYtDC
	 1A+5FccWjf4qejLnk/6ovVtHmKw8dk4ibTF0canU=
Date: Sat, 7 Feb 2026 12:55:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: fix a race condition in
 complete_all_mbos()
Message-ID: <2026020700-clear-playset-c329@gregkh>
References: <20260205160231.1543828-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205160231.1543828-1-s9430939@naver.com>

On Fri, Feb 06, 2026 at 01:02:31AM +0900, Minu Jin wrote:
> The current implementation of complete_all_mbos() repeatedly acquires
> and releases the spinlock in loop. This causes lock contention.

Is that actually measurable?  If not, don't worry about it.  Only if it
is should you worry about it :)

So please, benchmark the code and see if this is the case or not.

thanks,

greg k-h
