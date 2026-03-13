Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A924935CB8F;
	Fri, 13 Mar 2026 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417479; cv=none; b=MlshqtfteMrAjoYcxkkfaXqYBQyw+jEQByTgEXGcLRiLDUJrIagKGTs17YP2R9lMtAA5SZNiR5qMlRRaIAwAMtmhB11xbqIAh/EfMTb089N9HsCbxEtpPhFprECgF0Ql81TPuJMDrqmxBTulAhMaNZ1oRO0fkCiPxT8MyL1YgNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417479; c=relaxed/simple;
	bh=SDXZR8BOMSnAuJ4PeJ2ZGeq4kIqkBywKxCVam1l99ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3HCe/zVr4paqYAEBmgLfHmCxCf76s5k1M+xxui3Nu754wtYPTISAQaIQ+JmryFYi52M2525DaPQRWiKDVJDB1fCWIqzpxEV04v2Dp49D6FHnyVpX7+74GH/7VORpmIAwuTMLjym4T4HzgwcSsE9lyEVwSYjN5fzUmLoQ8QixFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZLm/Vm3B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZLm/Vm3B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5C9C19421;
	Fri, 13 Mar 2026 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773417479;
	bh=SDXZR8BOMSnAuJ4PeJ2ZGeq4kIqkBywKxCVam1l99ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLm/Vm3Bu4O2d5GnbpTS7J2b4AW2aI84rFErG32QkLqsAXI2uYVOvExyF1qj1a7fP
	 T9N8NEGijg5oMXlC1FOKZuked2wH+f6WJ5Sd7vIhngFUaOaQk+WdBOc3Ba8PjYJdV+
	 QeK66886e9PnzKCZMdh+uMqghTUPrwbigEwdtO48=
Date: Fri, 13 Mar 2026 16:57:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: replace C++ comments with C
 style comments in sp8870.c
Message-ID: <2026031344-popcorn-renewable-efdc@gregkh>
References: <20260313-sp8870-cleanup-v1-1-2d5069c4eec5.ref@yahoo.pl>
 <20260313-sp8870-cleanup-v1-1-2d5069c4eec5@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-sp8870-cleanup-v1-1-2d5069c4eec5@yahoo.pl>

On Fri, Mar 13, 2026 at 04:47:54PM +0100, Tomasz Unger wrote:
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>

We can't take patches without any changelog text at all :(
