Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCD4372670;
	Thu, 21 May 2026 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354852; cv=none; b=vEbSzbOZ+UxJb3tJn3/10AK+pS8TA77Si+DR69wkfreswz85bRR0WG7kPBnZzFf/VRdQKrDqllax1c+xrgqdW/giNCSqDuMGO5zV8P31cb+YdPJQ5DFTW1iF6/3R14wTkz5YMec9pvD4pQwd09MNaxccRxeI0UtyAcMsAVVxuUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354852; c=relaxed/simple;
	bh=4z1OZVqzUHO5SbDqak2p6xmR22w+4zhbOIWKAN300qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfFXejWs7/VmfXxjHgUdk/5PoAsZBc/Y1vyTURekHgQla/TcvzHMz91S4ZYuvnlpjSfH3EtmOxwpXbvLUZkMxFQJMXP1HPcsIJo8mRYC4HD1BSgch4lN+A4uTDgMhXStqP8C7+KU57gw1y9VNC4OZekV4FkbFN3jWBTZOxJQNKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WkDs/koo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WkDs/koo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C1A1F000E9;
	Thu, 21 May 2026 09:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779354851;
	bh=kPZpZ6Geu4y3x3FaqnMcQWsomQ6WVvlVyo+oGH7dtYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WkDs/koonB+7p5Cc5awbmww5EaZ6oqgxj2H7TaDH8fDWTNlA2qS0pzqrwRENc1uyp
	 AdUO2vR3XQD6ciZxbk9+6PchE+NjOJzlZk4vDfazubBIq5TRceGQ1IPHu7hZlX1QCX
	 RDZxL/org8Ljfom/If5YKkY+592WfL79BEruktx0=
Date: Thu, 21 May 2026 11:14:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/1] staging: rtl8723bs: fix missing frame length
 checks in OnAuth()
Message-ID: <2026052158-tarnish-trustable-beb5@gregkh>
References: <20260511185314.1625375-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511185314.1625375-1-hossu.alexandru@gmail.com>

On Mon, May 11, 2026 at 08:53:13PM +0200, Alexandru Hossu wrote:
> v8, addressing the sashiko review comments on v7.
> 
> The Challenge Text IE checks from v7 patch 1 and the OnAuthClient
> frame length checks from v7 patch 2 are already in your tree:
> 
>   9d6d63cf3c37 ("staging: rtl8723bs: fix heap overflow in OnAuthClient shared key path")
>   6ad4395aab1e ("staging: rtl8723bs: fix missing frame length checks in OnAuthClient")
> 
> This single patch adds the remaining fix: frame length guards for the
> AP-mode handler OnAuth().

Still more comments:
	https://sashiko.dev/#/patchset/20260511185314.1625375-2-hossu.alexandru@gmail.com

