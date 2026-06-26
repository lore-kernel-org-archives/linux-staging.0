Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC961F5EA;
	Fri, 26 Jun 2026 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467533; cv=none; b=Z5BlPUNh4bISk8nlfgL4H5q88zXuxODi5XTCf7JIW3bx70vV7NhEJRA4ydWkHpgnkgLXE64ltvKKCrhIAWsT2fGnvRwY87j0vxq6p7X0nS++qx7PXskdb+/McG+SCEhym2p88GJ78h7ljBp68IV0hCl5i5s1WSVT0OugyFOqqTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467533; c=relaxed/simple;
	bh=Djs7YZFRnbwttIWWR9W3TEjWAdD7pv/a3qqAkLyiEQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3iz0cehAvzSNIECm2XJHm2S742KVLBezTbQYGxZKtAyjkQqQWu8N/glNjep1Ih14ClMsTBeuN4d59wapRFcjagc14pB1RL5jDZcx7VGtw83B6BGKh5Ubn8WXYWCvtO0JGw2fWp8IhrXtX5RmddhWubEBDLtfiVkLWGutm2rU38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B4S5XiHC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B4S5XiHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9051F000E9;
	Fri, 26 Jun 2026 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782467532;
	bh=Djs7YZFRnbwttIWWR9W3TEjWAdD7pv/a3qqAkLyiEQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B4S5XiHCzR9cU03qdJ6VX1O/KfPzd6WL5h6n66WzzlsDcnCIt3QYTUW1lhV/oo9KO
	 wqieHqIePmz8+pNltSIMlsU6tnVTGnW1kfGMniquo6nmJxzHHXOjgNJzUR5AtHBaDw
	 psBRQeMTzpziG6VoDU1kCCtyOJuISfg/fAIPdQAk=
Date: Fri, 26 Jun 2026 10:50:59 +0100
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-staging <linux-staging@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: greybus: camera: remove broken camera driver
Message-ID: <2026062649-reroute-obsession-e3e2@gregkh>
References: <19f0349dd14.1bc6649d56096.1569442698771761840@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19f0349dd14.1bc6649d56096.1569442698771761840@zohomail.in>

On Fri, Jun 26, 2026 at 03:06:40PM +0530, Ashwin Gundarapu wrote:
> >From 7ca271ef0862b0ca24fb50fb1823699fd67ef318 Mon Sep 17 00:00:00 2001
> From: Ashwin Gundarapu <linuxuser509@outlook.com>
> Date: Fri, 26 Jun 2026 15:03:18 +0530
> Subject: [PATCH] staging: greybus: camera: remove broken camera driver
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit

Something went very wrong with your email system :(
