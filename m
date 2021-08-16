Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F272F80
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:02:19 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id u1so2732577plr.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E8DpRg7Ud9YdGb86UPnW5LGAv3FPr8UyIr8GCda7roA=;
        b=fZ6DqZ25fjbsUnd2ufGNd6+1QzBB5bp6mTtrYWW4eXN10DnhKgAZM7AS75BoS80yl0
         DWzvmbzRnejMuHxRD3c1Tl/0jGLmXVuSMcd/v0vXrrZ6U91lzSop94aWSazqspfgnyqo
         yDN0B1fhQzAcMqAD/kajcNYdG4HlTDbWd2eUN74Zg7RsSQy+my/c56Uk2n/KI0Z8zwtw
         Vmh+GsRK1ZU+v2LtoENANUM5e3p5msEKALx6TW3KPEPk+mplmkbt0RGAc56HI4JTnUe1
         ochSEAqPwEs4YJSK06JwyMADs1iLeNyHPjvgaHb5JYfKWQYCgbokOPMzgQGufH3/Qiyx
         0jQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E8DpRg7Ud9YdGb86UPnW5LGAv3FPr8UyIr8GCda7roA=;
        b=XiMOmFoVZJrD+W1/T17jDxx/oT3YFb7qbjpFdGkk8f4plvrW7VpzqiB1tyYMGR+uQs
         oMIfsc7JG7zSSM8lBJnjPKsa7PZAUe/TMmKi1LsNmeIB68/yX5loy3etsm0FbfjUxI0w
         uEObcttKfPJ4U0B43NHOe8TKBiccvr5izz4mv+fTZio5pSBglZEgj13rbxBKEV7Vo0WS
         VPkRZ0IQt4PQb42z85ypFa9Q33Pr5ijJhP1aqb2HtUk9d8oxX1LSpnQE5XxzrIw/H0Lz
         DQ3P19tJtSdRncjID/aQlgHyGgSvIbw3x7onGeEKplleuCi5GnKFFWpM1rEX1vKMRMdg
         7fdQ==
X-Gm-Message-State: AOAM5327YjDWEpkgwqp+1LyHzxm+nS4pGHVvudtl+IseGVtb34N5sP6h
	Z/jYAnEXWRYARlIHSRiG+EM5n7I8x7oRCcu8Z0hSTg==
X-Google-Smtp-Source: ABdhPJzzTAf5c5KyTUHHE1oLnVn5LVVauM//ggb5igIHstiHUIWtFmYR2SGzidAypQwN1IzwCYrul3ROdi+J1wAR1f0=
X-Received: by 2002:a17:90a:6906:: with SMTP id r6mr15898466pjj.162.1629100939364;
 Mon, 16 Aug 2021 01:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210816073450.668993-1-gregkh@linuxfoundation.org>
In-Reply-To: <20210816073450.668993-1-gregkh@linuxfoundation.org>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 16 Aug 2021 09:02:08 +0100
Message-ID: <CAA=Fs0=C6fX0AhJ5J3=GsxJoB3YqxgRg3PXsKK8puJ9FOLGkyQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: r8188eu: remove inline markings from
 functions in rtw_br_ext.c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Aug 2021 at 08:35, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The compiler is free to ignore, or follow, "inline" markings so they
> really have no use in .c files, so just remove them.
>
> This allows functions to properly show up as being unused when all
> callers to them are removed, otherwise gcc does not warn you about this.
>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 24 +++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index 22737cd0fe44..fb2bb36f9e2c 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -49,7 +49,7 @@
>  -----------------------------------------------------------------*/
>
>  /* Find a tag in pppoe frame and return the pointer */
> -static inline unsigned char *__nat25_find_pppoe_tag(struct pppoe_hdr *ph, unsigned short type)
> +static unsigned char *__nat25_find_pppoe_tag(struct pppoe_hdr *ph, unsigned short type)
>  {
>         unsigned char *cur_ptr, *start_ptr;
>         unsigned short tagLen, tagType;
> @@ -66,7 +66,7 @@ static inline unsigned char *__nat25_find_pppoe_tag(struct pppoe_hdr *ph, unsign
>         return NULL;
>  }
>
> -static inline int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *tag)
> +static int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *tag)
>  {
>         struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
>         int data_len;
> @@ -106,7 +106,7 @@ static int skb_pull_and_merge(struct sk_buff *skb, unsigned char *src, int len)
>         return 0;
>  }
>
> -static inline unsigned long __nat25_timeout(struct adapter *priv)
> +static unsigned long __nat25_timeout(struct adapter *priv)
>  {
>         unsigned long timeout;
>
> @@ -115,7 +115,7 @@ static inline unsigned long __nat25_timeout(struct adapter *priv)
>         return timeout;
>  }
>
> -static inline int  __nat25_has_expired(struct adapter *priv,
> +static int  __nat25_has_expired(struct adapter *priv,
>                                 struct nat25_network_db_entry *fdb)
>  {
>         if (time_before_eq(fdb->ageing_timer, __nat25_timeout(priv)))
> @@ -124,7 +124,7 @@ static inline int  __nat25_has_expired(struct adapter *priv,
>         return 0;
>  }
>
> -static inline void __nat25_generate_ipv4_network_addr(unsigned char *networkAddr,
> +static void __nat25_generate_ipv4_network_addr(unsigned char *networkAddr,
>                                 unsigned int *ipAddr)
>  {
>         memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
> @@ -133,7 +133,7 @@ static inline void __nat25_generate_ipv4_network_addr(unsigned char *networkAddr
>         memcpy(networkAddr+7, (unsigned char *)ipAddr, 4);
>  }
>
> -static inline void __nat25_generate_ipx_network_addr_with_node(unsigned char *networkAddr,
> +static void __nat25_generate_ipx_network_addr_with_node(unsigned char *networkAddr,
>                                 __be32 *ipxNetAddr, unsigned char *ipxNodeAddr)
>  {
>         memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
> @@ -143,7 +143,7 @@ static inline void __nat25_generate_ipx_network_addr_with_node(unsigned char *ne
>         memcpy(networkAddr+5, ipxNodeAddr, 6);
>  }
>
> -static inline void __nat25_generate_ipx_network_addr_with_socket(unsigned char *networkAddr,
> +static void __nat25_generate_ipx_network_addr_with_socket(unsigned char *networkAddr,
>                                 __be32 *ipxNetAddr, __be16 *ipxSocketAddr)
>  {
>         memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
> @@ -153,7 +153,7 @@ static inline void __nat25_generate_ipx_network_addr_with_socket(unsigned char *
>         memcpy(networkAddr+5, ipxSocketAddr, 2);
>  }
>
> -static inline void __nat25_generate_apple_network_addr(unsigned char *networkAddr,
> +static void __nat25_generate_apple_network_addr(unsigned char *networkAddr,
>                                 __be16 *network, unsigned char *node)
>  {
>         memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
> @@ -163,7 +163,7 @@ static inline void __nat25_generate_apple_network_addr(unsigned char *networkAdd
>         networkAddr[3] = *node;
>  }
>
> -static inline void __nat25_generate_pppoe_network_addr(unsigned char *networkAddr,
> +static void __nat25_generate_pppoe_network_addr(unsigned char *networkAddr,
>                                 unsigned char *ac_mac, __be16 *sid)
>  {
>         memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
> @@ -258,7 +258,7 @@ static int update_nd_link_layer_addr(unsigned char *data, int len, unsigned char
>         return 0;
>  }
>
> -static inline int __nat25_network_hash(unsigned char *networkAddr)
> +static int __nat25_network_hash(unsigned char *networkAddr)
>  {
>         if (networkAddr[0] == NAT25_IPV4) {
>                 unsigned long x;
> @@ -305,7 +305,7 @@ static inline int __nat25_network_hash(unsigned char *networkAddr)
>         }
>  }
>
> -static inline void __network_hash_link(struct adapter *priv,
> +static void __network_hash_link(struct adapter *priv,
>                                 struct nat25_network_db_entry *ent, int hash)
>  {
>         /*  Caller must spin_lock already! */
> @@ -316,7 +316,7 @@ static inline void __network_hash_link(struct adapter *priv,
>         ent->pprev_hash = &priv->nethash[hash];
>  }
>
> -static inline void __network_hash_unlink(struct nat25_network_db_entry *ent)
> +static void __network_hash_unlink(struct nat25_network_db_entry *ent)
>  {
>         /*  Caller must spin_lock already! */
>         *ent->pprev_hash = ent->next_hash;
> --
> 2.32.0
>

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
