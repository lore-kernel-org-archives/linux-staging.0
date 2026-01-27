Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8CF35D615;
	Tue, 27 Jan 2026 14:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524967; cv=none; b=hhXWVxDcBcjbwb/cMBVZU/9kVzVXTdiHZEVSpKdb966IN0WaJPAKxXs1dBjMqTIs4LMio7enoL5twEfcGzrHdvb1k9p/z7N0b375/aK6vf1S7RgjqrtxyiVVBA1Wv+rlYqpOUgQWrzQGq8l40uWLm8BVjkIwxx52RFl3Urauq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524967; c=relaxed/simple;
	bh=wltDgsxt3cduOFL5pegYQdTHhzs7c4n36Lus0P7EltA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cq+svQ0xqnewFxpEc7DQzt3N29kEIPPmnSILWE/lrrtWRoP+J8I2iwVR2OyJl9wMftCwnwz28U7QoM5WFmLT2aXR7Ntlrfz6R11miE7nKA5BfTccJ6Ddbnhl882sE0HctkIbY7RIKHWphIhQ459Ehkx1aM8wqrkr5Dx68LwIgFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RwCViIuz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RwCViIuz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324B0C116C6;
	Tue, 27 Jan 2026 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769524966;
	bh=wltDgsxt3cduOFL5pegYQdTHhzs7c4n36Lus0P7EltA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RwCViIuzfwc7aaZQwantjRwjY2h2L7nJuYNBrr6j+2O5W9HUvdgPfmk7IrQh1euDt
	 55id3PhfT2D6ZJiX0EVlsConZPOOp2WXAtEtzADplCkNMPRepS6akqLqRXC9JU+8f+
	 SmkvuF5mBnOptkvE1uNeZ3gskyUAJ13UJ7eBa27o=
Date: Tue, 27 Jan 2026 15:42:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Huang <tehsiu.huang@gmail.com>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: remove unnecessary boolean
 comparisons and whitespaces
Message-ID: <2026012726-connected-eloquence-572b@gregkh>
References: <aXM34ZGQ4Q2dsRxk@stanley.mountain>
 <20260123095733.49301-1-tehsiu.huang@gmail.com>
 <20260123095733.49301-2-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123095733.49301-2-tehsiu.huang@gmail.com>

On Fri, Jan 23, 2026 at 01:57:32AM -0800, Michael Huang wrote:
> According to the kernel coding style, explicit comparisons with true
> or false are redundant and should be avoided. This patch removes these
> comparisons in rtw_mlme.c to improve code clarity. Additionally,
> trailing whitespaces are removed to satisfy checkpatch.pl requirements.

That is two different things in one patch, please do not do that.
Remember, only one logical change per patch.

thanks,

greg k-h
