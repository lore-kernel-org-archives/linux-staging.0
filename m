Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5459E2405ED
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393199; cv=none; b=CNg+xvTcdhKrt04vFCBw+/5ULgt5igqvjkPx0MGanLzoy3YC2v6/1HgSFbcAVkXJKhVzawIdNjYCU7hYXyfQNvheH7HTmqsapKloKhudz/GRjb8gflcTCSS09WnEEyMW9m8D4rcFxdwdmmtg3w5hfYqLMrmzP1cLVE1pO8chwHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393199; c=relaxed/simple;
	bh=SQ+Q78EF6IyYSZD5r6toQBFiuznzkMCEO84t5mCII4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4h6gzFq7CJ8zx+KCluTsN8sM4HonSz2KkkzN/9EnJfbO7qK8J/g0zdQWnAxqdAEqxyijD6o38YudGUOo57Anv0z0c9OXliFKyctTiC+jCM+rzUpIL8hPQSkGBTE4ZmPoJkru6ctXGVOnpEnaQKH98DhEyI0KvyZel+ezC/512A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nBwxRVV0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nBwxRVV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A03C4CEF1;
	Mon, 22 Dec 2025 08:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766393198;
	bh=SQ+Q78EF6IyYSZD5r6toQBFiuznzkMCEO84t5mCII4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nBwxRVV067itRfvG7de8JEM65EEOdLhbf6fGjPG/K1N4mzodxb612o/OK7j9lxsDC
	 l8Vv1Emy5woc2H3x7DEfaB1SwfOq/IfB8N58QFfeYsrr0P3MVULoy5NKNRvGFdJ4Th
	 t4NISXNvoTEZtOxI+Ai00s1AnqHnVqkjlFOQFX1A=
Date: Mon, 22 Dec 2025 09:46:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: linux-staging@lists.linux.dev, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH 3/4] staging: greybus: gb-camera: use BIT() macro and fix
 formatting
Message-ID: <2025122217-chapped-spending-f1c5@gregkh>
References: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
 <20251219063415.46818-4-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219063415.46818-4-zhanxusheng@xiaomi.com>

On Fri, Dec 19, 2025 at 02:34:14PM +0800, Zhan Xusheng wrote:
> Replace `(1 << 0)` with the `BIT(0)` macro for input/output flags
> to follow Linux kernel style.
> 
> Also adjust the indentation of gb_camera_ops->configure_streams
> parameters to match kernel coding style.

You can't do two different things in one patch :(

Please break this up.

thanks,

greg k-h
