Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AED972
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 09:27:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3763661058;
	Thu,  2 Sep 2021 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630574837;
	bh=82jAsd5ucM4y4MfsjWEHLTMjJeY6MKU7mDhIATERYzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEKzGXZwed3XPdNAWIPWXqC5ejyCuopnYb1hCpYo979o9HHDgV56+TJ5iDQZe56t6
	 OO2nptiFU3LQjnyUTzdzfVmOqz1ptMHVm5h/LQaQH99U1w2dNGZUPWdWiKVrhfFRKF
	 yzkeMXoMAmL6FrQf0f8sYKZj0dSSi/okAgx4o22A=
Date: Thu, 2 Sep 2021 11:27:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] staging: r8188eu: incorrect type in
 csum_ipv6_magic
Message-ID: <YTCY81DGMM2+bSHN@kroah.com>
References: <cover.1630148641.git.aakashhemadri123@gmail.com>
 <0b7d6e92c79a6daf55a0c3a4961df6f33a9bcf37.1630148641.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b7d6e92c79a6daf55a0c3a4961df6f33a9bcf37.1630148641.git.aakashhemadri123@gmail.com>

On Sat, Aug 28, 2021 at 04:40:45PM +0530, Aakash Hemadri wrote:
> Fix sparse warning:
> > rtw_br_ext.c:771:84:    got restricted __be16 [usertype] payload_len
> > rtw_br_ext.c:773:110: warning: incorrect type in argument 2
>     (different base types)
> > rtw_br_ext.c:773:110:    expected int len
> > rtw_br_ext.c:773:110:    got restricted __be16 [usertype] payload_len
> 
> csum_ipv6_magic and csum_partial expect int len not __be16, use
> be16_to_cpu()
> 
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index aa56cd1a8490..38f1bd591da9 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -615,9 +615,9 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>  						struct icmp6hdr  *hdr = (struct icmp6hdr *)(skb->data + ETH_HLEN + sizeof(*iph));
>  						hdr->icmp6_cksum = 0;
>  						hdr->icmp6_cksum = csum_ipv6_magic(&iph->saddr, &iph->daddr,
> -										iph->payload_len,
> +										be16_to_cpu(iph->payload_len),
>  										IPPROTO_ICMPV6,
> -										csum_partial((__u8 *)hdr, iph->payload_len, 0));
> +										csum_partial((__u8 *)hdr, be16_to_cpu(iph->payload_len), 0));
>  					}
>  				}
>  			}
> -- 
> 2.32.0
> 

Same question here, does this mean the driver is broken on little-endian
systems today?  This should be tested...

thanks,

greg k-h
