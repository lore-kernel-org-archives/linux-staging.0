Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E70E72
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 19:53:28 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id hs10so34002551ejc.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 12:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=BUgCzb4vho0IWW5yOd/HOeeraEmZuXONPhZCDeDXp/c=;
        b=utzq5M8VyrtAlfDzmdLwJL7n+TnidmEJw+qv2zaoUGTCAwCx57DOrbo84nQJDCKdSj
         wduFZHOPBbIp/S/K8wnhWWoT7BYe0uhZDPM9NLuC1hWOP6zSRISm8mRQ9dABoLIyl+GY
         Ku1N90YN5PqMJKzdK+D0+fGQRjGlSkApWosbFRr7p0pmFdv82pOJwYybcxWL49e2A0YR
         tddA0AWh2bTtmCpv+synUycaQDMGnd4qq28sONbe3cwwOtOEsYdqlsp/eNarwS+9VxNv
         KUg8gpHDLdfiuIOCT8IMfvYFjSabvW+GX2ESe6PmExNXq6xwKYUcoaPK3trdzw7HTRaj
         1IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BUgCzb4vho0IWW5yOd/HOeeraEmZuXONPhZCDeDXp/c=;
        b=Y1Uwv/QS6iJ0owQymx65oE/cJrUwscyRwbOEnEINH6QO0N8DQgS9GQmD5q6IiYsF8V
         VVucVjkysrLzqW26zp2nt2jp8vID9aRjFXHd35mKmWrmNEsobeX5lQCqvDN3SbFKcCXi
         fRk4mP7e/0reDoTNAQ+OPL+0V/OoJ9yYFWNV2abdLoxrbKNEYOjoVWQZp6LxPEuZ0P8p
         FXmbB31ukYiiCOaW3fQvZTa+C6TA090lF4mkKwUAEZpYAtKA18m3TEIui7OdGi1vDNen
         vOt+wNsFdCgDQisLqzu2zZYx+/mWYsDo0FsGHeRpXjL96JAhYqyWgdYL0QVotrG//XRL
         IDfA==
X-Gm-Message-State: AOAM531jveQhiJ1LAelT3puzwAiesaR5GGYAMQl31UBQ7I6MFzwAqwua
	BfbdQ5Mvs6xuEE9TkhljbQM=
X-Google-Smtp-Source: ABdhPJy4Tfyz4lmrTFInZ0OMQYPDASoRI/BS5xJuO+7Jmy/hxskbMK0ykNLnsNW56DHfrvi5H1rJhA==
X-Received: by 2002:a17:907:3f0b:: with SMTP id hq11mr134294ejc.95.1629143606957;
        Mon, 16 Aug 2021 12:53:26 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::4058? ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id k19sm79874ejq.42.2021.08.16.12.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 12:53:26 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] staging: r8188eu: Remove no more used variable and
 function
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210816180540.29734-1-fmdefrancesco@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <dd30721c-e83f-745e-38cd-251c06ed25c4@gmail.com>
Date: Mon, 16 Aug 2021 21:52:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210816180540.29734-1-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/16/21 8:05 PM, Fabio M. De Francesco wrote:
> Remove the 'sender' pointer to integer. Remove
> __nat25_db_network_lookup_and_replace(). Following the deletion of the
> code related to the NAT25_LOOKUP method, they are no more needed.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> v2: Rebased against latest version of Greg K-H's tree.
> 
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 52 +----------------------
>   1 file changed, 1 insertion(+), 51 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index 0402f48319c4..ee52f28a1e56 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -295,56 +295,6 @@ static void __network_hash_unlink(struct nat25_network_db_entry *ent)
>   	ent->pprev_hash = NULL;
>   }
>   
> -static int __nat25_db_network_lookup_and_replace(struct adapter *priv,
> -				struct sk_buff *skb, unsigned char *networkAddr)
> -{
> -	struct nat25_network_db_entry *db;
> -
> -	spin_lock_bh(&priv->br_ext_lock);
> -
> -	db = priv->nethash[__nat25_network_hash(networkAddr)];
> -	while (db) {
> -		if (!memcmp(db->networkAddr, networkAddr, MAX_NETWORK_ADDR_LEN)) {
> -			if (!__nat25_has_expired(priv, db)) {
> -				/*  replace the destination mac address */
> -				memcpy(skb->data, db->macAddr, ETH_ALEN);
> -				atomic_inc(&db->use_count);
> -
> -				DEBUG_INFO("NAT25: Lookup M:%02x%02x%02x%02x%02x%02x N:%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"
> -							"%02x%02x%02x%02x%02x%02x\n",
> -					db->macAddr[0],
> -					db->macAddr[1],
> -					db->macAddr[2],
> -					db->macAddr[3],
> -					db->macAddr[4],
> -					db->macAddr[5],
> -					db->networkAddr[0],
> -					db->networkAddr[1],
> -					db->networkAddr[2],
> -					db->networkAddr[3],
> -					db->networkAddr[4],
> -					db->networkAddr[5],
> -					db->networkAddr[6],
> -					db->networkAddr[7],
> -					db->networkAddr[8],
> -					db->networkAddr[9],
> -					db->networkAddr[10],
> -					db->networkAddr[11],
> -					db->networkAddr[12],
> -					db->networkAddr[13],
> -					db->networkAddr[14],
> -					db->networkAddr[15],
> -					db->networkAddr[16]);
> -			}
> -			spin_unlock_bh(&priv->br_ext_lock);
> -			return 1;
> -		}
> -		db = db->next_hash;
> -	}
> -	spin_unlock_bh(&priv->br_ext_lock);
> -	return 0;
> -}
> -
>   static void __nat25_db_network_insert(struct adapter *priv,
>   				unsigned char *macAddr, unsigned char *networkAddr)
>   {
> @@ -493,7 +443,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>   		/*---------------------------------------------------*/
>   		struct arphdr *arp = (struct arphdr *)(skb->data + ETH_HLEN);
>   		unsigned char *arp_ptr = (unsigned char *)(arp + 1);
> -		unsigned int *sender, *target;
> +		unsigned int *sender;
>   
>   		if (arp->ar_pro != __constant_htons(ETH_P_IP)) {
>   			DEBUG_WARN("NAT25: arp protocol unknown (%4x)!\n", be16_to_cpu(arp->ar_pro));
> 

Acked-by: Michael Straube <straube.linux@gmail.com>
