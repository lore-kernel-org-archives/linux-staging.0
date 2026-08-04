Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12046424D42;
	Tue,  4 Aug 2026 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828010; cv=none; b=d1kgl5e4+ObAS9ECViqqmKQ44/7F49j9CXsokK4yjVVL469k7jhCI2NefKUZxa6WUfS0vShOUYkU6M7NnDNK9PxIhE/OfbzxH97w9FjWpvshpJW1iAG/JIUeOeYtB7MVSCnsNUpZHEzAijnLQK6yI6nxq4PX6FMCwx7Vib+Q2bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828010; c=relaxed/simple;
	bh=pp+C4We1bTu1VmsewEN4wDEntGe03Uaw3s3/ALTvI+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFTuIF7MWaSCOQLe+dxmkMsJlmWpAtUopvu+aixePwJq6Bw2lZs1Ol5GVg77zNwuOtIyWwt9KLVlINL2L3Z2iUr0r2JqEq+ZKkg6nDIcArONNZCC84gkmc3fcDg1nz/XOdvFgpHZDgpbNQ//VpTkScUX7LPq0FF4oq7S2FBQNCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FIw04Uk1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FIw04Uk1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB721F000E9;
	Tue,  4 Aug 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785828008;
	bh=EKm5OAJ6XZy/Jhx9aVjXFHoHqS5Oc0dRaDmE31PfVU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FIw04Uk12ONi9TAgXAdScsLVQLZwFSYud2JeeIg0uM5q7c3nkBJu1ULukCLsId2s9
	 RQy6hl36ZpPHICFB5LJV1+/RSNXn1qmXp4gwychxO8zLkXxAZVukbRS21ozer9FO27
	 mSuvggiCBJRE+9fjDwR3/P9HBo2UaJ/70feaZr2I=
Date: Tue, 4 Aug 2026 09:18:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: remove redundant ternary
 operators from return
Message-ID: <2026080401-annex-fiscally-5fb3@gregkh>
References: <20260803193922.11111-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803193922.11111-1-work.ashmitkumar@gmail.com>

On Mon, Aug 03, 2026 at 07:39:22PM +0000, Ashmit Kumar wrote:
> The Linux kernel coding style specifies that boolean expressions
> do not need a redundant `? true : false` ternary operator.
> Additionally, return is not a function and therefore parentheses
> are not required.

Why is this mixed with the media patches?  And they didn't seem to be
threaded, how was this sent?

And it's a resend?

thanks,

greg k-h
