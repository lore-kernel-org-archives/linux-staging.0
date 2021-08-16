Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E926D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:02:56 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id w14so25155803pjh.5
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 01:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZPqknjNzaufmduNdjU0mAHH6gZfWOqvX7q/fZLbL5ng=;
        b=B4qYSnlvNNz7TLyHCvUhsRRvdPOh8DwZZipzEU23mwnLNimj/uDuikVCPQ+CCctkS6
         +mDgDrf0KqAtoFAhLSLfEiaQxLCIPOpaGBrxkAyACZQ0S8wisCqrfyAK1rGHcPD5ldZH
         +rJqhSnKcJAsetQ+/EeBNuXikA2+GuXxRvW4CvwHWmEYYnXBvEMUf9Yp/92UqvHS/zGq
         R8N1czXe+VuWnAd83Y5kZ/2emhugdg+zDs22bv/s6YaGKHOdA45Q6VkAuDDzMXiv8H3w
         SWCmXHuGZlFrUH6S6xE0DSoeSwcd0axciPPho5UvueTLGmYncpyGAxdav9onGYrzeCD2
         lvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZPqknjNzaufmduNdjU0mAHH6gZfWOqvX7q/fZLbL5ng=;
        b=fbrNqoASraq+GdD8xFovC3byHxi4TeTsLLheqJumuCtW2aSRqhUefTHhCfQl88SJ5V
         uo2yJGQOc1FBPNBJaT04/4qDHmru8pkzwYIeUjbje7/XVjPt3pq431xWo3kWJ+F1Jc4X
         xkXtHZVMVMgidvR0aXsuW5Ceq0v153dFMvaJlxP/B5uX9FwPim7afcWTi7ePz+kiRh37
         aVBTzHydqr+q8vRwxO7EjH4x4Z79DKcatNIDnP0Jj66YggOpdpg7i8Q8K0mthiETZd+J
         Qw1nbViQl3PAGJ+2U27AlmqNCrJpzd3Ah8xbFUbzqXcqfeizP37dn4mdZlDkY7ZHy0r1
         Owlw==
X-Gm-Message-State: AOAM531kEU7piCr9VyhFW1RRcCXavJSnnUNya8MjDrGfqZaDQCTdkYWt
	sKy8YljNlxe4NaVzv/Ddm4zw05oNAYn8VuQjw3KypQ==
X-Google-Smtp-Source: ABdhPJxRfAptrBjMSXyZpe+0kYrXce/Ga6ZWfWLqJJ8SQlcOSPZ9l7tqWIaJQiFgkoHeNm7GtS9af0fak4dzS9vkQv0=
X-Received: by 2002:a17:902:ac87:b029:12d:3e59:cb7d with SMTP id
 h7-20020a170902ac87b029012d3e59cb7dmr12186697plr.22.1629100975968; Mon, 16
 Aug 2021 01:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210816073450.668993-1-gregkh@linuxfoundation.org> <20210816073450.668993-2-gregkh@linuxfoundation.org>
In-Reply-To: <20210816073450.668993-2-gregkh@linuxfoundation.org>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 16 Aug 2021 09:02:45 +0100
Message-ID: <CAA=Fs0kG3eTdFULyciudMDZy7+i1yVuEEa6DBPyt6M+FHDLDVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: r8188eu: remove ipx support from driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Aug 2021 at 08:35, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The ipx.h header files are being removed from the kernel, and support
> for them was long removed from the tree, so remove all references to it
> in the r8188eu driver as well, to allow it to continue to build properly
> in linux-next
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 228 ----------------------
>  1 file changed, 228 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index fb2bb36f9e2c..8be025992270 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -5,7 +5,6 @@
>
>  #include "../include/linux/if_arp.h"
>  #include "../include/net/ip.h"
> -#include "../include/net/ipx.h"
>  #include "../include/linux/atalk.h"
>  #include "../include/linux/udp.h"
>  #include "../include/linux/if_pppox.h"
> @@ -133,36 +132,6 @@ static void __nat25_generate_ipv4_network_addr(unsigned char *networkAddr,
>         memcpy(networkAddr+7, (unsigned char *)ipAddr, 4);
>  }
>
> -static void __nat25_generate_ipx_network_addr_with_node(unsigned char *networkAddr,
> -                               __be32 *ipxNetAddr, unsigned char *ipxNodeAddr)
> -{
> -       memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
> -
> -       networkAddr[0] = NAT25_IPX;
> -       memcpy(networkAddr+1, ipxNetAddr, 4);
> -       memcpy(networkAddr+5, ipxNodeAddr, 6);
> -}
> -
> -static void __nat25_generate_ipx_network_addr_with_socket(unsigned char *networkAddr,
> -                               __be32 *ipxNetAddr, __be16 *ipxSocketAddr)
> -{
> -       memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
> -
> -       networkAddr[0] = NAT25_IPX;
> -       memcpy(networkAddr+1, ipxNetAddr, 4);
> -       memcpy(networkAddr+5, ipxSocketAddr, 2);
> -}
> -
> -static void __nat25_generate_apple_network_addr(unsigned char *networkAddr,
> -                               __be16 *network, unsigned char *node)
> -{
> -       memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
> -
> -       networkAddr[0] = NAT25_APPLE;
> -       memcpy(networkAddr+1, network, 2);
> -       networkAddr[3] = *node;
> -}
> -
>  static void __nat25_generate_pppoe_network_addr(unsigned char *networkAddr,
>                                 unsigned char *ac_mac, __be16 *sid)
>  {
> @@ -584,203 +553,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>                 default:
>                         return -1;
>                 }
> -       } else if ((protocol == ETH_P_IPX) ||
> -                  (protocol <= ETH_FRAME_LEN)) {
> -               /*---------------------------------------------------*/
> -               /*         Handle IPX and Apple Talk frame           */
> -               /*---------------------------------------------------*/
> -               unsigned char ipx_header[2] = {0xFF, 0xFF};
> -               struct ipxhdr   *ipx = NULL;
> -               struct elapaarp *ea = NULL;
> -               struct ddpehdr  *ddp = NULL;
> -               unsigned char *framePtr = skb->data + ETH_HLEN;
> -
> -               if (protocol == ETH_P_IPX) {
> -                       DEBUG_INFO("NAT25: Protocol = IPX (Ethernet II)\n");
> -                       ipx = (struct ipxhdr *)framePtr;
> -               } else if (protocol <= ETH_FRAME_LEN) {
> -                       if (!memcmp(ipx_header, framePtr, 2)) {
> -                               DEBUG_INFO("NAT25: Protocol = IPX (Ethernet 802.3)\n");
> -                               ipx = (struct ipxhdr *)framePtr;
> -                       } else {
> -                               unsigned char ipx_8022_type =  0xE0;
> -                               unsigned char snap_8022_type = 0xAA;
> -
> -                               if (*framePtr == snap_8022_type) {
> -                                       unsigned char ipx_snap_id[5] = {0x0, 0x0, 0x0, 0x81, 0x37};             /*  IPX SNAP ID */
> -                                       unsigned char aarp_snap_id[5] = {0x00, 0x00, 0x00, 0x80, 0xF3}; /*  Apple Talk AARP SNAP ID */
> -                                       unsigned char ddp_snap_id[5] = {0x08, 0x00, 0x07, 0x80, 0x9B};  /*  Apple Talk DDP SNAP ID */
> -
> -                                       framePtr += 3;  /*  eliminate the 802.2 header */
> -
> -                                       if (!memcmp(ipx_snap_id, framePtr, 5)) {
> -                                               framePtr += 5;  /*  eliminate the SNAP header */
> -
> -                                               DEBUG_INFO("NAT25: Protocol = IPX (Ethernet SNAP)\n");
> -                                               ipx = (struct ipxhdr *)framePtr;
> -                                       } else if (!memcmp(aarp_snap_id, framePtr, 5)) {
> -                                               framePtr += 5;  /*  eliminate the SNAP header */
> -
> -                                               ea = (struct elapaarp *)framePtr;
> -                                       } else if (!memcmp(ddp_snap_id, framePtr, 5)) {
> -                                               framePtr += 5;  /*  eliminate the SNAP header */
> -
> -                                               ddp = (struct ddpehdr *)framePtr;
> -                                       } else {
> -                                               DEBUG_WARN("NAT25: Protocol = Ethernet SNAP %02x%02x%02x%02x%02x\n", framePtr[0],
> -                                                       framePtr[1], framePtr[2], framePtr[3], framePtr[4]);
> -                                               return -1;
> -                                       }
> -                               } else if (*framePtr == ipx_8022_type) {
> -                                       framePtr += 3;  /*  eliminate the 802.2 header */
> -
> -                                       if (!memcmp(ipx_header, framePtr, 2)) {
> -                                               DEBUG_INFO("NAT25: Protocol = IPX (Ethernet 802.2)\n");
> -                                               ipx = (struct ipxhdr *)framePtr;
> -                                       } else {
> -                                               return -1;
> -                                       }
> -                               } else {
> -                                       return -1;
> -                               }
> -                       }
> -               } else {
> -                       return -1;
> -               }
> -
> -               /*   IPX   */
> -               if (ipx) {
> -                       switch (method) {
> -                       case NAT25_CHECK:
> -                               if (!memcmp(skb->data+ETH_ALEN, ipx->ipx_source.node, ETH_ALEN))
> -                                       DEBUG_INFO("NAT25: Check IPX skb_copy\n");
> -                               return 0;
> -                       case NAT25_INSERT:
> -                               DEBUG_INFO("NAT25: Insert IPX, Dest =%08x,%02x%02x%02x%02x%02x%02x,%04x Source =%08x,%02x%02x%02x%02x%02x%02x,%04x\n",
> -                                       ipx->ipx_dest.net,
> -                                       ipx->ipx_dest.node[0],
> -                                       ipx->ipx_dest.node[1],
> -                                       ipx->ipx_dest.node[2],
> -                                       ipx->ipx_dest.node[3],
> -                                       ipx->ipx_dest.node[4],
> -                                       ipx->ipx_dest.node[5],
> -                                       ipx->ipx_dest.sock,
> -                                       ipx->ipx_source.net,
> -                                       ipx->ipx_source.node[0],
> -                                       ipx->ipx_source.node[1],
> -                                       ipx->ipx_source.node[2],
> -                                       ipx->ipx_source.node[3],
> -                                       ipx->ipx_source.node[4],
> -                                       ipx->ipx_source.node[5],
> -                                       ipx->ipx_source.sock);
> -
> -                               if (!memcmp(skb->data+ETH_ALEN, ipx->ipx_source.node, ETH_ALEN)) {
> -                                       DEBUG_INFO("NAT25: Use IPX Net, and Socket as network addr\n");
> -
> -                                       __nat25_generate_ipx_network_addr_with_socket(networkAddr, &ipx->ipx_source.net, &ipx->ipx_source.sock);
> -
> -                                       /*  change IPX source node addr to wlan STA address */
> -                                       memcpy(ipx->ipx_source.node, GET_MY_HWADDR(priv), ETH_ALEN);
> -                               } else {
> -                                       __nat25_generate_ipx_network_addr_with_node(networkAddr, &ipx->ipx_source.net, ipx->ipx_source.node);
> -                               }
> -                               __nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
> -                               __nat25_db_print(priv);
> -                               return 0;
> -                       case NAT25_LOOKUP:
> -                               if (!memcmp(GET_MY_HWADDR(priv), ipx->ipx_dest.node, ETH_ALEN)) {
> -                                       DEBUG_INFO("NAT25: Lookup IPX, Modify Destination IPX Node addr\n");
> -
> -                                       __nat25_generate_ipx_network_addr_with_socket(networkAddr, &ipx->ipx_dest.net, &ipx->ipx_dest.sock);
> -
> -                                       __nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
> -
> -                                       /*  replace IPX destination node addr with Lookup destination MAC addr */
> -                                       memcpy(ipx->ipx_dest.node, skb->data, ETH_ALEN);
> -                               } else {
> -                                       __nat25_generate_ipx_network_addr_with_node(networkAddr, &ipx->ipx_dest.net, ipx->ipx_dest.node);
> -
> -                                       __nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
> -                               }
> -                               return 0;
> -                       default:
> -                               return -1;
> -                       }
> -               } else if (ea) {
> -                       /* Sanity check fields. */
> -                       if (ea->hw_len != ETH_ALEN || ea->pa_len != AARP_PA_ALEN) {
> -                               DEBUG_WARN("NAT25: Appletalk AARP Sanity check fail!\n");
> -                               return -1;
> -                       }
> -
> -                       switch (method) {
> -                       case NAT25_CHECK:
> -                               return 0;
> -                       case NAT25_INSERT:
> -                               /*  change to AARP source mac address to wlan STA address */
> -                               memcpy(ea->hw_src, GET_MY_HWADDR(priv), ETH_ALEN);
> -
> -                               DEBUG_INFO("NAT25: Insert AARP, Source =%d,%d Destination =%d,%d\n",
> -                                       ea->pa_src_net,
> -                                       ea->pa_src_node,
> -                                       ea->pa_dst_net,
> -                                       ea->pa_dst_node);
> -
> -                               __nat25_generate_apple_network_addr(networkAddr, &ea->pa_src_net, &ea->pa_src_node);
> -
> -                               __nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
> -
> -                               __nat25_db_print(priv);
> -                               return 0;
> -                       case NAT25_LOOKUP:
> -                               DEBUG_INFO("NAT25: Lookup AARP, Source =%d,%d Destination =%d,%d\n",
> -                                       ea->pa_src_net,
> -                                       ea->pa_src_node,
> -                                       ea->pa_dst_net,
> -                                       ea->pa_dst_node);
> -
> -                               __nat25_generate_apple_network_addr(networkAddr, &ea->pa_dst_net, &ea->pa_dst_node);
> -
> -                               __nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
> -
> -                               /*  change to AARP destination mac address to Lookup result */
> -                               memcpy(ea->hw_dst, skb->data, ETH_ALEN);
> -                               return 0;
> -                       default:
> -                               return -1;
> -                       }
> -               } else if (ddp) {
> -                       switch (method) {
> -                       case NAT25_CHECK:
> -                               return -1;
> -                       case NAT25_INSERT:
> -                               DEBUG_INFO("NAT25: Insert DDP, Source =%d,%d Destination =%d,%d\n",
> -                                       ddp->deh_snet,
> -                                       ddp->deh_snode,
> -                                       ddp->deh_dnet,
> -                                       ddp->deh_dnode);
> -
> -                               __nat25_generate_apple_network_addr(networkAddr, &ddp->deh_snet, &ddp->deh_snode);
> -
> -                               __nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
> -
> -                               __nat25_db_print(priv);
> -                               return 0;
> -                       case NAT25_LOOKUP:
> -                               DEBUG_INFO("NAT25: Lookup DDP, Source =%d,%d Destination =%d,%d\n",
> -                                       ddp->deh_snet,
> -                                       ddp->deh_snode,
> -                                       ddp->deh_dnet,
> -                                       ddp->deh_dnode);
> -                               __nat25_generate_apple_network_addr(networkAddr, &ddp->deh_dnet, &ddp->deh_dnode);
> -                               __nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
> -                               return 0;
> -                       default:
> -                               return -1;
> -                       }
> -               }
> -
> -               return -1;
>         } else if ((protocol == ETH_P_PPP_DISC) ||
>                    (protocol == ETH_P_PPP_SES)) {
>                 /*---------------------------------------------------*/
> --
> 2.32.0
>

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
