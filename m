Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3E33ACA5D;
	Sun, 10 May 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429181; cv=none; b=LCjCAmurV3dTW93q3oWs5oUq6HUrRZWB3MYdU3YQs3g4GMkZ3VhITpiEbZlzGvgZWYHhYS0lHEtGrLPHl6fj/2t9DVhcN+ven4CEK52bZxYcqTNqF1hb9dTjRUPEO/QiKMxKKdzXLvdIZrwETrxC4QvoXPbFPIHahiXXbsiZWhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429181; c=relaxed/simple;
	bh=9M8cV5Smyn6+sbno0VaW2XV4sp3UGPnf3aIA8mKCGfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikg7XI77dWxYoue56ZxOZ7gHjyIcCzj/djKuK8UV+vSGYXxWD5oUsXs5L9Y5QL99ArHWJnp3UGkw59xbt1FlOx7VW3895F3iSvmSmdfKOoWuOsNV5dKRxfI0KmpPFjK7nh19ua3RMsA+DB4KGgAHyK1LQi6ODb11H74mxxSDCHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FeKxLts7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FeKxLts7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9EBC2BCF7;
	Sun, 10 May 2026 16:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778429180;
	bh=9M8cV5Smyn6+sbno0VaW2XV4sp3UGPnf3aIA8mKCGfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FeKxLts7tXtOg9JgtGuqb+/b+0c3VG31Fuf6XhLCPLqCu9Ky8PZ6qwGdWHQIVkKSw
	 bYwTIemPHeDcUMiMb6ctO7DYBMW9X20HXnHeYjhd35Z6mvT6BasFZR9sDcx7l+8P94
	 CHnxBnGRZv3eUQ7J7dqBm/zKBjtMf7z1D1OdRfSQ=
Date: Sun, 10 May 2026 18:05:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hanu-man12shaw <shawharshit116@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Hanu-man12shaw <harshit116@gmail.com>
Subject: Re: [PATCH] staging: vme_user: fix lines exceeding 80 characters in
 vme_tsi148.c
Message-ID: <2026051023-lecturer-why-53f8@gregkh>
References: <20260510090454.3474-1-harshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510090454.3474-1-harshit116@gmail.com>

On Sun, May 10, 2026 at 09:04:54AM +0000, Hanu-man12shaw wrote:
> Signed-off-by: Hanu-man12shaw <harshit116@gmail.com>
> ---
>  drivers/staging/vme_user/vme_tsi148.c | 5270 +++++++++++++------------
>  1 file changed, 2636 insertions(+), 2634 deletions(-)

Something went really wrong with this change :(
