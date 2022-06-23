Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB59323C4
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 19:41:57 +0000 (UTC)
Date: Thu, 23 Jun 2022 21:36:41 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Wei Han <lailitty@foxmail.com>
Cc: kadlec@netfilter.org, fw@strlen.de, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] netfilter: xt_esp: add support for ESP match in NAT
 Traversal
Message-ID: <YrTAyW0phD0OiYN/@salvia>
References: <tencent_DDE91CB7412D427A442DB4362364DC04F20A@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_DDE91CB7412D427A442DB4362364DC04F20A@qq.com>

On Thu, Jun 23, 2022 at 08:42:48PM +0800, Wei Han wrote:
> when the ESP packets traversing Network Address Translators,
> which are encapsulated and decapsulated inside UDP packets,
> so we need to get ESP data in UDP.
> 
> Signed-off-by: Wei Han <lailitty@foxmail.com>
> ---
>  net/netfilter/xt_esp.c | 54 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 45 insertions(+), 9 deletions(-)
> 
> diff --git a/net/netfilter/xt_esp.c b/net/netfilter/xt_esp.c
> index 2a1c0ad0ff07..c3feb79a830a 100644
> --- a/net/netfilter/xt_esp.c
> +++ b/net/netfilter/xt_esp.c
> @@ -8,12 +8,14 @@
>  #include <linux/skbuff.h>
>  #include <linux/in.h>
>  #include <linux/ip.h>
> +#include <linux/ipv6.h>
>  
>  #include <linux/netfilter/xt_esp.h>
>  #include <linux/netfilter/x_tables.h>
>  
>  #include <linux/netfilter_ipv4/ip_tables.h>
>  #include <linux/netfilter_ipv6/ip6_tables.h>
> +#include <net/ip.h>
>  
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Yon Uriarte <yon@astaro.de>");
> @@ -39,17 +41,53 @@ static bool esp_mt(const struct sk_buff *skb, struct xt_action_param *par)
>  	struct ip_esp_hdr _esp;
>  	const struct xt_esp *espinfo = par->matchinfo;
>  
> +	const struct iphdr *iph = NULL;
> +	const struct ipv6hdr *ip6h = NULL;
> +	const struct udphdr *udph = NULL;
> +	struct udphdr _udph;
> +	int proto = -1;
> +
>  	/* Must not be a fragment. */
>  	if (par->fragoff != 0)
>  		return false;
>  
> -	eh = skb_header_pointer(skb, par->thoff, sizeof(_esp), &_esp);
> -	if (eh == NULL) {
> -		/* We've been asked to examine this packet, and we
> -		 * can't.  Hence, no choice but to drop.
> -		 */
> -		pr_debug("Dropping evil ESP tinygram.\n");
> -		par->hotdrop = true;
> +	if (xt_family(par) == NFPROTO_IPV6) {
> +		ip6h = ipv6_hdr(skb);
> +		if (!ip6h)
> +			return false;
> +		proto = ip6h->nexthdr;
> +	} else {
> +		iph = ip_hdr(skb);
> +		if (!iph)
> +			return false;
> +		proto = iph->protocol;
> +	}
> +
> +	if (proto == IPPROTO_UDP) {
> +		//for NAT-T
> +		udph = skb_header_pointer(skb, par->thoff, sizeof(_udph), &_udph);
> +		if (udph && (udph->source == htons(4500) || udph->dest == htons(4500))) {
> +			/* Not deal with above data it don't conflict with SPI
> +			 * 1.IKE Header Format for Port 4500(Non-ESP Marker 0x00000000)
> +			 * 2.NAT-Keepalive Packet Format(0xFF)
> +			 */
> +			eh = (struct ip_esp_hdr *)((char *)udph + sizeof(struct udphdr));

this is not safe, skbuff might not be linear.

> +		} else {
> +			return false;
> +		}
> +	} else if (proto == IPPROTO_ESP) {
> +		//not NAT-T
> +		eh = skb_header_pointer(skb, par->thoff, sizeof(_esp), &_esp);
> +		if (!eh) {
> +			/* We've been asked to examine this packet, and we
> +			 * can't.  Hence, no choice but to drop.
> +			 */
> +			pr_debug("Dropping evil ESP tinygram.\n");
> +			par->hotdrop = true;
> +			return false;
> +		}

This is loose, the user does not have a way to restrict to either
ESP over UDP or native ESP. I don't think this is going to look nice
from iptables syntax perspective to restrict either one or another
mode.

> +	} else {
> +		//not esp data
>  		return false;
>  	}
>  
> @@ -76,7 +114,6 @@ static struct xt_match esp_mt_reg[] __read_mostly = {
>  		.checkentry	= esp_mt_check,
>  		.match		= esp_mt,
>  		.matchsize	= sizeof(struct xt_esp),
> -		.proto		= IPPROTO_ESP,
>  		.me		= THIS_MODULE,
>  	},
>  	{
> @@ -85,7 +122,6 @@ static struct xt_match esp_mt_reg[] __read_mostly = {
>  		.checkentry	= esp_mt_check,
>  		.match		= esp_mt,
>  		.matchsize	= sizeof(struct xt_esp),
> -		.proto		= IPPROTO_ESP,
>  		.me		= THIS_MODULE,
>  	},
>  };
> -- 
> 2.17.1
> 
