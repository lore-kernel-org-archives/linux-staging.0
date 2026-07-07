Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1749F3D812C;
	Tue,  7 Jul 2026 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422127; cv=none; b=Hq4DZoRTpfEgsFAjTEieyd/yXFEoPEY54jES4BXT9XO7sKvTIguKPjSdxHFVBYvmOn2xT2D8/bxy3LNqdiEBk+7cIlfRTd6f/wOzruVmCLyUjINeCLRNTV3ndKiaLr05dLNVYIPLRZA0T9Kr/EX4IuIsIp1v3PTNKTqHw90+OL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422127; c=relaxed/simple;
	bh=tMl+7QTzSYQH7+vyWq2hpGPKZYUA2KwTvhja8u+h8Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5rHsfhLUN5d1RZXO/gF4FCpwJHKp6wwxZGO9oCCn38y/1MS52bPGwBAJsqXEq/4JSdzyBm5MvKhgxdOOFhAwCNbUkJeOn0lIRq5E2FriKLGyEfeV1cUTfq1QrdKnn13NwhPSwGuAQ5pf4ha8QxJ6kU6KpaEXIWvIF99e3rc/kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wBgAZuNa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wBgAZuNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E56D1F000E9;
	Tue,  7 Jul 2026 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422125;
	bh=z7g/JvjlVBfmbSRF3wrAjFzrHGkwae3PDLU4jGMrKKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wBgAZuNacviB+TvQ1lJydqJDMyrOljIVmgiV9RVd2CEonC5WRi+/QyOUH5GYQ958c
	 j0J0Put7iQBfddEWD9fG1vs16L2Flj4+cTVFOqUtosWMa/YBNLbtm+z6HrtwOF4cJf
	 caMhZWlSxvf9Pop/UkGTBn7Qi3msoBvr7esaPEuY=
Date: Tue, 7 Jul 2026 13:02:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: fliegbert2@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] staging: rtl8723bs: Rename camelcase variable
 dot11AuthAlgrthm_Shared
Message-ID: <2026070747-certify-gallon-27fe@gregkh>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <537369224ad6d8dff2d045561d0d821469dd125c.1780343502.git.fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <537369224ad6d8dff2d045561d0d821469dd125c.1780343502.git.fliegbert2@gmail.com>

On Mon, Jun 01, 2026 at 08:39:57PM +0000, fliegbert2@gmail.com wrote:
> From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> 
> Rename variable dot11AuthAlgrthm_Shared to dot11_auth_algrthm_shared
> to resolve checkpatch.pl CamelCase finding.

It is not a variable, it is a enum :(

