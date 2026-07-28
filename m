Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D035F3E49C7;
	Tue, 28 Jul 2026 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223936; cv=none; b=qCWU9BmhYrl/6WFfMJsL4DQQfflfgxC1ekkz6mnHiARolHejoq/2IdCan5Sf21cvBXI0wW4i84y3D8P06bXDBscuMigq/Oz7nyhuT4TNGH1Bg4dMRTNUiWWUPoqVe48GW9NfsqEzuYtP8CV7grA7aBtEYMyQUN45WaF6VrYGiRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223936; c=relaxed/simple;
	bh=99p1KSvAa0dAFpkvFdpAAgGkubwMuNgEpBrkmWQZEOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnEYqRYn5gWSFw1chM5S/I4IQ4Nw2k6kQ744tkH/34neFgzQrv7zII937fnrB+lHUsMTVw8o6NsG4H4WBR7clpzi6to+o7fDt7kLEAsT7ssIi3QfXWdO4PstXs2nAP+MY80cHGquvdmNx/GBcofIecsDIYf9MvW2juyZmZ66pqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QUXeVQWp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QUXeVQWp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BFD1F000E9;
	Tue, 28 Jul 2026 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785223935;
	bh=eXRLUVDWJ0vGKaT2AnZ3D+v6opbgP/UyulBGp/NCD5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QUXeVQWpvz2TX9vb4gXAOResPkVHQleY6ILobXkDAfCpWknw3/BAoY9cIe1wUi/jG
	 QkwMCHGLQ9HX4LTw529BfhlMwNgNlqnzhCm9sj8aL1773Qk190AqIK9Ur/zEfhQb9s
	 D8KCcAh2ro6AaH9aIF8ptinSEKFCoNYFHCtwrnP4=
Date: Tue, 28 Jul 2026 09:32:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Cc: Eric Wu <kunjinkao.jp@gmail.com>,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: staging: octeon: ethernet: removed unneeded
 parentheses
Message-ID: <2026072834-aviation-fang-608e@gregkh>
References: <20260721160417.242644-1-mukhtarfaisal03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721160417.242644-1-mukhtarfaisal03@gmail.com>

On Tue, Jul 21, 2026 at 09:04:17PM +0500, Faisal Mukhtar wrote:
> removed redundant inner parentheses around "interface < 2"
> in 3 if statement instances within the file ethernet.c,
> got the warning by running checkpatch.pl script on the file.
> 
> Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
> ---
>  drivers/staging/octeon/ethernet.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> index f3fa221f452e..5083d9596972 100644
> --- a/drivers/staging/octeon/ethernet.c
> +++ b/drivers/staging/octeon/ethernet.c
> @@ -247,7 +247,7 @@ static int cvm_oct_common_change_mtu(struct net_device *dev, int new_mtu)
>  
>  	dev->mtu = new_mtu;
>  
> -	if ((interface < 2) &&
> +	if (interface < 2 &&

checkpatch should not have warned you about this, as it is correct.  Be
sure to use the latest version.

thanks,

greg k-h
