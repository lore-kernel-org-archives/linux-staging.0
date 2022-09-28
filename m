Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E620EA40
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 08:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CFEC433D7;
	Wed, 28 Sep 2022 08:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664352306;
	bh=rXwi0RPYmQ40g4ZJTfah1A7qxV5p+LrVXhkF31cEfoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fijni+N6tYBL9GWPu3JT/ka/gXXzGaquSX8W0fbizEvWjTwuO73W4yFLIbslgYN5K
	 2LYnp89gDfIRu7REQWNwvXa4A90YapwiyI1zPIsRZt9uZXayBhqfLbvMIgvZkPEGQW
	 0/XDe/v84WSImIgW1doh3gF3DFM7KR6pq7n/gU8M=
Date: Wed, 28 Sep 2022 10:05:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joash Naidoo <joash.n09@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	dan.carpenter@oracle.com, straube.linux@gmail.com,
	paskripkin@gmail.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: r8188eu: fix too many leading tabs
Message-ID: <YzQALwjz5VT0uCyB@kroah.com>
References: <20220928075324.1605-1-joash.n09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928075324.1605-1-joash.n09@gmail.com>

On Wed, Sep 28, 2022 at 09:53:24AM +0200, Joash Naidoo wrote:
> Coding style fix. Fix too many leading tabs and line length.
> 
> Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
> ---
> Changes in V4:
>     - Fix compiler warning introduced: mixing declarations and code
> Changes in v3:
>     - Fix flipped condition mistake
>     - move skb NULL check before dereferencing it
> Changes in v2:
>     - Flip additional nested if conditions and don't reverse the last if statement
>     - Move declarations to start of function
>     - Separate converting __constant_htons to htons to another patch
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 75 +++++++++++++----------
>  1 file changed, 42 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index bca20fe5c..d4bcec152 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -601,42 +601,51 @@ struct dhcpMessage {
>  
>  void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
>  {
> +	__be16 protocol;
> +	struct iphdr *iph;
> +	struct udphdr *udph;
> +	struct dhcpMessage *dhcph;
> +	u32 cookie;
> +
>  	if (!skb)
>  		return;
>  
> -	if (!priv->ethBrExtInfo.dhcp_bcst_disable) {
> -		__be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
> -
> -		if (protocol == __constant_htons(ETH_P_IP)) { /*  IP */
> -			struct iphdr *iph = (struct iphdr *)(skb->data + ETH_HLEN);
> -
> -			if (iph->protocol == IPPROTO_UDP) { /*  UDP */
> -				struct udphdr *udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
> -
> -				if ((udph->source == __constant_htons(CLIENT_PORT)) &&
> -				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
> -					struct dhcpMessage *dhcph =
> -						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
> -					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
> -
> -					if (cookie == DHCP_MAGIC) { /*  match magic word */
> -						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
> -							/*  if not broadcast */
> -							register int sum = 0;
> -
> -							/*  or BROADCAST flag */
> -							dhcph->flags |= htons(BROADCAST_FLAG);
> -							/*  recalculate checksum */
> -							sum = ~(udph->check) & 0xffff;
> -							sum += be16_to_cpu(dhcph->flags);
> -							while (sum >> 16)
> -								sum = (sum & 0xffff) + (sum >> 16);
> -							udph->check = ~sum;
> -						}
> -					}
> -				}
> -			}
> -		}
> +	protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
> +	iph = (struct iphdr *)(skb->data + ETH_HLEN);
> +	udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
> +	/*  DHCP request */
> +	dhcph =
> +		(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));

Very odd formatting, why split that line?

> +	cookie = be32_to_cpu((__be32)dhcph->cookie);
> +
> +	if (priv->ethBrExtInfo.dhcp_bcst_disable)
> +		return;

Why are you not checking for this _before_ all of the above
assignments?



> +
> +	if (protocol != htons(ETH_P_IP)) /*  IP */
> +		return;

You can check for this right after assigning the protocol variable.

> +
> +	if (iph->protocol != IPPROTO_UDP) /*  UDP */
> +		return;

You can check for this right after setting iph.

But also, shouldn't you just be using the ip_hdr() call instead of doing
the crazy cast above?

thanks,

greg k-h
