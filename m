Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AD53A9D8A;
	Mon,  9 Mar 2026 16:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074477; cv=none; b=KYCBwHHWMu5DE1qyz54F/VlAPHML3Zwzqr8+P2Nm51BkahtlVGco8Ccc1FDgw2kFQo9Boc1lzseuL6lSn13ZS6LX6LKt8353GYOsSPY2QgbdPS5dOZfHcGNK5T1UlLt50pJio0Ql3foWBd9Cj7KL5zvzHXgmG639tkwE1zG2NPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074477; c=relaxed/simple;
	bh=ueEewZUsPw6oRpnYWByN2fo6GRRIc7owJxQId0wEEys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtonD7UfxncCRDOgHSs+eNBa+YeemHyhbxC2eXm3Wi1qp3/pVK7UsUMD1VNojI926jyqBMv58b9yc+TnZ2f45XDtYI2uOdZYeJ1JYpvUh4TbLPdwlpbCLZH7uJqb7c/aWcf1GLzBDHdx6+iZWyZFMzA+QzezV4C4R/zA3l2thXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kUmxBsYl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kUmxBsYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42846C4CEF7;
	Mon,  9 Mar 2026 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773074476;
	bh=ueEewZUsPw6oRpnYWByN2fo6GRRIc7owJxQId0wEEys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUmxBsYlMIyIJgN0UySJ7byaERcudFf5We6mDLxYnfHAvvVLxsc4fNGzbNvTplnTW
	 bawuQBQhpqKUSWOIWSvc0PBD/9MW1LMJnZnuaFpE+fIZQtoeZthDKiWbmHYhfsFAP8
	 HIup5ebnqYp9mXOCrsRDYxiiCnJ6S1zAnc3BxkCQ=
Date: Mon, 9 Mar 2026 17:41:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: replace BUG() with WARN_ON_ONCE() in
 cvn_oct_xmit()
Message-ID: <2026030949-banner-rematch-db18@gregkh>
References: <20260305005316.49848-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305005316.49848-1-marusik.adamenko@gmail.com>

On Wed, Mar 04, 2026 at 04:53:16PM -0800, Mark Adamenko wrote:
> All three values of queue_type are handled in the switch case, making
> the default case unreachable. Replace BUG() with WARN_ON_ONCE() to avoid
> an unnecessary kernel crash if reached.
> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---
>  drivers/staging/octeon/ethernet-tx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
> index f5bbedac6a65..f34d82a433e3 100644
> --- a/drivers/staging/octeon/ethernet-tx.c
> +++ b/drivers/staging/octeon/ethernet-tx.c
> @@ -450,7 +450,8 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
>  		__skb_queue_tail(&priv->tx_free_list[qos], skb);
>  		break;
>  	default:
> -		BUG();
> +		WARN_ON_ONCE(1);
> +		break;

If this is impossible to ever hit, then nothing changed here, right?  So
why is this even needed?

thanks,

greg k-h
