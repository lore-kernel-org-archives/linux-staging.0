Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B9370808;
	Tue,  7 Jul 2026 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417746; cv=none; b=Gk8ItpKmld1YQzv/ysZ+Qb5hSDizo6GX0QS9gKsiRuLyl6zlctpadTuijw6FAI3+U6+u575nrBxKTPsPWhp1qpnuFPPKAqf1hGR8xMtRWbDElnPslr1MnO6Aq37UabJw1LNbSTiT8+qw1oKIHwHnPW9tTp86UuSFv3Rglf5DPAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417746; c=relaxed/simple;
	bh=U6UugQ7RJHNLPGIhMTUB/fFefqLzF6hY21AbW0Y8a0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BanTpqR10zy7fsdsL0r8Yy16HET7BgumtG1uNYwAyl00x8dvrTzzMzfFagSQy3tjdQOsnTTRjU6VDSA+6QjiyuMD5YaKD0ovOkEe3+EXUBHzAOwSZxwq+SrJQye0qkp52rhRHQOFoT5urMhf3EhqBSfJjVShQgqLeMVsauxNOxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xj9EjvZz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xj9EjvZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796101F000E9;
	Tue,  7 Jul 2026 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783417745;
	bh=vX1HcsWGnMjQU+ltjxUvY4YP6nImzqTtG0hE7Bq3s3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xj9EjvZzPSKkBPj9qoqVC3AsWR3/EiSTRQrgNCwZg5qsoOrJkid/EA2RfCTMh2tHt
	 A9n/Iz8chs/uO5l65CwUATy6sqCAgcVMC0eOSypH3/qyWPKF8KfGbdYEJDhHZb8wB1
	 NiPxE+9bAa+re4IrckYIrYg4cCTlLXSUgVyHte8g=
Date: Tue, 7 Jul 2026 11:49:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: William Elder <williamxelder@gmail.com>
Cc: "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: remove comparisons to boolean
 literals
Message-ID: <2026070738-usual-rinse-7c52@gregkh>
References: <20260604190508.404642-1-williamxelder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604190508.404642-1-williamxelder@gmail.com>

On Thu, Jun 04, 2026 at 01:05:07PM -0600, William Elder wrote:
> Remove comparisons to true and false as they are error prone.
> Use the idiomatic C forms instead
> 
> v3: Fix inverted logic for ht_option checks

This goes below the --- line, as the documentation asks, right?

Also, what happened in v2?  Always include all of the information.

thanks,

greg k-h
