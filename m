Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE0A365A08
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481975; cv=none; b=IF1jK5XZbbxeN3UwhRb7x3JzEwrtU6AmF3NQ/vTt96ffkMrqQqQsrCa/9JPh5ftM/LJbDPc0BGhTQ4469KREGcSly3NXzqLqofj8D1twF1ftzxPleTfZ4wzGPdkemOXZjoW1PRFDY+osYXBniCaBM8ianHbH+hnXBm0PFEOgq1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481975; c=relaxed/simple;
	bh=6sq8Dmgfv99Hiy4Kp3kIJ8Z8rxZ2t/2PqKFVCLWt5+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJ4NSX85O/QDPzos3eU9t/yDoT0rfbXIfP/j5V7Mxii5gOsvFbwJ44Ad2kiv0jzb243VibvtWiuT2uhW6wgp/wD4ESR6cEYE1hyNaZPnWKm2jxigD/NyAAhfL7AofPYMJ7GqaOz6u8+2zOzAOI23Au9Q/jba5T7Q2USuw3sNzWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYf5LiZt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYf5LiZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9077C19421;
	Tue, 18 Nov 2025 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763481974;
	bh=6sq8Dmgfv99Hiy4Kp3kIJ8Z8rxZ2t/2PqKFVCLWt5+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYf5LiZtZpHvsorhZzbdMPpyDZyaH+50EkkY5OOCtx4uNA7z4KzEsgb3uQeA/BeyI
	 J/qZmkJ7Y/68DqchrwkCmxmFOrBGi/g3ePAopqZJuf+cfDXzXdzrwqXpQ8FpvsyECu
	 gQAYQAl7lD+QU1FQvbwPnyjAy+Kis5hGpk636rSTV4ASnCHlKXZsP0jhLTe4BGd1Pg
	 yWAr9yV3nxe+RqfqSgXk8PPObqRXS7mkiPN2KxJkecTOYAkq+ix2XiKt8JX87mf+0o
	 VlKI1SyIG/P7rXgX7/gOlVZr6YVhmywMLOtIPUkmdR8DpQKoIyVY6daOGEyAocJgPg
	 jhz6LPRBMucLw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLODd-000000003Dz-1aBO;
	Tue, 18 Nov 2025 17:06:13 +0100
Date: Tue, 18 Nov 2025 17:06:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: gregkh@linuxfoundation.org, elder@kernel.org,
	linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
Subject: Re: [PATCH 12/13] staging: greybus: usb: validate hub control
 response length
Message-ID: <aRyZdZC9yJuZilP_@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-13-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-13-ayaanmirzabaig85@gmail.com>

On Mon, Nov 17, 2025 at 11:48:17PM +0530, Ayaan Mirza Baig wrote:
> Clamp hub control wLength to a reasonable maximum before allocating
> the response buffer to avoid oversized allocations and remove the
> FIXME about unspecified lengths.

I don't believe you this is what the comment is about at all. Leave it.

Johan
