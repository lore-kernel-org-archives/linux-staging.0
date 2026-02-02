Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE77261593;
	Mon,  2 Feb 2026 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770021523; cv=none; b=EozBzlkICQQlcSv9GMk8tfL2g+ZMS8pBGI9ybtsWDMgt57nfIe7CNxIdcDi5sW+HXFtbNA81tpEk43vqp3QYxIr6c+JctyjLiBHa25SSnaIwe7rFdOnPdh/9pESHiWJ847tOLlnXODJLhOFWH4KF0N8GHueUssqAOBWfLYrcmg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770021523; c=relaxed/simple;
	bh=tgfrlt2AFI+A4VLCdvM4K3Wp5ESLbNDRj3shGLm9ATs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICoPpS3e3q0pcEz82f0FhohFXBqInB7hSePCv6LFJ4NK0+aDr7Hdn8fIGzN1eOsgyyStcTmcw3uVvdiNO18qzN7O27nwv53LCJyB8PlAlUR7fDt5+ntVoS4WTzoeCzWJtGHHnlagXgPXirG/o/geB9boJr++1q0+bzkAdHcDojc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vc0kA0OA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vc0kA0OA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A6AC116C6;
	Mon,  2 Feb 2026 08:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770021522;
	bh=tgfrlt2AFI+A4VLCdvM4K3Wp5ESLbNDRj3shGLm9ATs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vc0kA0OAfwTyYNigfI6OByEfg7h3Lc7uWgPZnCX5NWiki6nXBumAyutJqr4NJS3o6
	 ItvZ3SAnk9/Ecn2GyehCldzqR+uNQgOeeVwmnCBrVRs5u05+qn9g+D5mg4H+ms1xQI
	 SApXpVDq0pZJep6ixV3wjYnDyKd1ztgGPM+2s648=
Date: Mon, 2 Feb 2026 09:38:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: straube.linux@gmail.com, dan.carpenter@linaro.org, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] staging: rtl8723bs: fix null dereference in
 find_network
Message-ID: <2026020213-exonerate-error-b3d8@gregkh>
References: <20260202063808.664468-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202063808.664468-1-ethantidmore06@gmail.com>

On Mon, Feb 02, 2026 at 12:38:08AM -0600, Ethan Tidmore wrote:
> The pwlan variable has the possibility of returning NULL and is not
> checked for NULL and then later dereferenced.

dereferenced where?  Not in this function :)

Please be more specific as to what exactly you are fixing here.

thanks,

greg k-h
