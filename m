Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4475D1BD4F0
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725046007; cv=none; b=NWMYjLSx3c/N1Gf6QheU9/gAuYMhD6+uVzfDdvrIUIF0XZqFKd5WvNIPbCymzp4dAzafJiIEA/QC5d/izxA3+dts1UgLp2A2IjM7Qa4In4FLtb6lLjsjqE+a+3bsRnLmYIsYgEtS20YsF9yOzAav6ZF9EDG3RpcCRBaqdkxhJrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725046007; c=relaxed/simple;
	bh=jLQQcel5PV+WlQ1BFVs90K/OYnQEHFS+vlO4si99VM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aiNFregoiwGxhhvCxC52P7+XyEoXpdgWVTTWT+x2HMppxBQCGOrsdbZyTMY6dMexDAvzZMGJ9zr9QiuxB3vQyCkYD1IprMliH0n9JdX2z9eVdf7lDzRn5NjfsV9VA48Pu3widRQq8ZcDZNz8KTeAkkWX2xMTHeLU04C7G40u1kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF7MTVMf; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF7MTVMf"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5becd359800so2334187a12.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725046004; x=1725650804; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0FWycbDpSx8vg0t6wE+nnwIbgPDqipzBuDgw3Tji2GQ=;
        b=JF7MTVMfDT2RMAlPzBPMr5Jmtxp6R0xf1I8qjHSupZN51MtmyLirsIl0FVXEzdkiMz
         8l4f2alZU8pOW5ejKrRXZ2LfI86wydcbTCTj8CQoI+oOxRXanEeUx6RCiPk7wpVuk4Gz
         fgkuGNm6dUf6iYGhUAsNcSGrppjDNxKwzoj6qd6r107wX1CPwlZUtAHj5my152SuPQD1
         oV18w+CKWzmU9OBWIpCS0bSXdLO2uSjH6T5L4TuQbDNpni49IceGAUa/Y3miQH2DaIOF
         CUuCF9cc7kIRnUr4KTo41yXX3SMLlFHw1jRpleUgPiBjo+u+EuJNzyUTOt6Nssp2jKLT
         V3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725046004; x=1725650804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0FWycbDpSx8vg0t6wE+nnwIbgPDqipzBuDgw3Tji2GQ=;
        b=FHXSR08cnicMQK6GhH/dlrPQBaGkk1nC7yntevdiSCvZwhQVuGw4SGeFitYBunKp78
         2Ue1mnf55lri8/Ao6s7hLxQWRNIrcm6qRPZTF9J4w5gOC4smeGHPuZ/ZLe0taI1o4c4x
         BnoF2uMBdbFmTr7WZK6uCUBabgSb5/BtfDKUCIGpN+mltJOKphJNZzPfVVD5w787KYTx
         79Z0YeNSIERMMFweuXXSn98/cjsTIO9otFNdkxm1xTi37JdKHsNf5xzRYU05ZlE0+vTI
         nCO0GNi5gXb830mfGzqF9O62A5ynajYY9UWF2jD70TzReAI62pJ5Ppu5g2UXHasmE7PO
         ytBw==
X-Gm-Message-State: AOJu0YwOJscR1mp1VHS7zdiPhoEH1eoDUn8sZ/Kcj/2275H0tw+6P77T
	Rd0+Ks0UpY/LGsrxI82+S28txAcPj4GPHG6+cBefGjsLY7++/g3VoUMwvQ==
X-Google-Smtp-Source: AGHT+IHoZrMTkgpE3zH9JVHmFsPalLgB3vZzGbS+/nX4TW9rtd8ROdubRCjKRrq12NMbVoZ8mQ5CaQ==
X-Received: by 2002:a05:6402:2814:b0:5c0:a8b1:ca8a with SMTP id 4fb4d7f45d1cf-5c2437312d7mr349708a12.11.1725046003099;
        Fri, 30 Aug 2024 12:26:43 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c2455908eesm1922a12.55.2024.08.30.12.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 12:26:42 -0700 (PDT)
Message-ID: <496aa12c-16c2-4050-8f55-caa584116c58@gmail.com>
Date: Fri, 30 Aug 2024 21:26:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Staging: rtl8192e: Add spaces around operators.
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240830020508.532945-1-tdavies@darkphysics.net>
 <20240830020508.532945-4-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240830020508.532945-4-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/24 04:05, Tree Davies wrote:
> Add spaces around arithmetic and bitwise operators to improve
> readability of the code.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>   drivers/staging/rtl8192e/rtllib.h | 62 +++++++++++++++----------------
>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index 76f53b797644..17a6fb565c9d 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -339,12 +339,12 @@ enum rt_op_mode {
>   
>   #define	FC_QOS_BIT					BIT(7)
>   #define is_data_frame(pdu)	(((pdu[0] & 0x0C) == 0x08) ? true : false)
> -#define	is_legacy_data_frame(pdu)	(is_data_frame(pdu) && (!(pdu[0]&FC_QOS_BIT)))
> +#define	is_legacy_data_frame(pdu)	(is_data_frame(pdu) && (!(pdu[0] & FC_QOS_BIT)))
>   #define is_qos_data_frame(pframe)			\
> -	((*(u16 *)pframe&(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA)) ==	\
> -	(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA))
> -#define frame_order(pframe)     (*(u16 *)pframe&IEEE80211_FCTL_ORDER)
> -#define SN_LESS(a, b)		(((a-b)&0x800) != 0)
> +	((*(u16 *)pframe & (IEEE80211_STYPE_QOS_DATA | RTLLIB_FTYPE_DATA)) ==	\
> +	(IEEE80211_STYPE_QOS_DATA | RTLLIB_FTYPE_DATA))
> +#define frame_order(pframe)     (*(u16 *)pframe & IEEE80211_FCTL_ORDER)
> +#define SN_LESS(a, b)		(((a - b) & 0x800) != 0)
>   #define SN_EQUAL(a, b)	(a == b)
>   #define MAX_DEV_ADDR_SIZE 8
>   
> @@ -414,13 +414,13 @@ enum _REG_PREAMBLE_MODE {
>   #define WLAN_GET_SEQ_FRAG(seq) ((seq) & RTLLIB_SCTL_FRAG)
>   #define WLAN_GET_SEQ_SEQ(seq)  (((seq) & RTLLIB_SCTL_SEQ) >> 4)
>   
> -#define RTLLIB_STATMASK_SIGNAL (1<<0)
> -#define RTLLIB_STATMASK_RSSI (1<<1)
> -#define RTLLIB_STATMASK_NOISE (1<<2)
> +#define RTLLIB_STATMASK_SIGNAL (1 << 0)
> +#define RTLLIB_STATMASK_RSSI (1 << 1)
> +#define RTLLIB_STATMASK_NOISE (1 << 2)
>   #define RTLLIB_STATMASK_WEMASK 0x7
>   
> -#define RTLLIB_CCK_MODULATION    (1<<0)
> -#define RTLLIB_OFDM_MODULATION   (1<<1)
> +#define RTLLIB_CCK_MODULATION    (1 << 0)
> +#define RTLLIB_OFDM_MODULATION   (1 << 1)
>   
>   #define RTLLIB_CCK_RATE_LEN		4
>   #define RTLLIB_CCK_RATE_1MB			0x02
> @@ -507,11 +507,11 @@ struct rtllib_frag_entry {
>   
>   struct rtllib_device;
>   
> -#define SEC_ACTIVE_KEY    (1<<4)
> -#define SEC_AUTH_MODE     (1<<5)
> -#define SEC_UNICAST_GROUP (1<<6)
> -#define SEC_LEVEL	 (1<<7)
> -#define SEC_ENABLED       (1<<8)
> +#define SEC_ACTIVE_KEY    (1 << 4)
> +#define SEC_AUTH_MODE     (1 << 5)
> +#define SEC_UNICAST_GROUP (1 << 6)
> +#define SEC_LEVEL	 (1 << 7)
> +#define SEC_ENABLED       (1 << 8)
>   
>   #define SEC_LEVEL_0      0 /* None */
>   #define SEC_LEVEL_1      1 /* WEP 40 and 104 bit */
> @@ -696,17 +696,17 @@ union frameqos {
>   #define MAX_WPA_IE_LEN 64
>   #define MAX_WZC_IE_LEN 256
>   
> -#define NETWORK_EMPTY_ESSID (1<<0)
> -#define NETWORK_HAS_OFDM    (1<<1)
> -#define NETWORK_HAS_CCK     (1<<2)
> +#define NETWORK_EMPTY_ESSID (1 << 0)
> +#define NETWORK_HAS_OFDM    (1 << 1)
> +#define NETWORK_HAS_CCK     (1 << 2)
>   
>   /* QoS structure */
> -#define NETWORK_HAS_QOS_PARAMETERS      (1<<3)
> -#define NETWORK_HAS_QOS_INFORMATION     (1<<4)
> +#define NETWORK_HAS_QOS_PARAMETERS      (1 << 3)
> +#define NETWORK_HAS_QOS_INFORMATION     (1 << 4)
>   #define NETWORK_HAS_QOS_MASK	    (NETWORK_HAS_QOS_PARAMETERS | \
>   					 NETWORK_HAS_QOS_INFORMATION)
>   /* 802.11h */
> -#define NETWORK_HAS_ERP_VALUE	   (1<<10)
> +#define NETWORK_HAS_ERP_VALUE	   (1 << 10)
>   
>   #define QOS_QUEUE_NUM		   4
>   #define QOS_OUI_LEN		     3
> @@ -996,8 +996,8 @@ enum rtl_link_state {
>   #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
>   #define DEFAULT_FTS 2346
>   
> -#define CFG_RTLLIB_RESERVE_FCS (1<<0)
> -#define CFG_RTLLIB_COMPUTE_FCS (1<<1)
> +#define CFG_RTLLIB_RESERVE_FCS (1 << 0)
> +#define CFG_RTLLIB_COMPUTE_FCS (1 << 1)
>   
>   struct tx_pending {
>   	int frag;
> @@ -1288,7 +1288,7 @@ struct rtllib_device {
>   	u16 scan_watch_dog;
>   
>   	/* map of allowed channels. 0 is dummy */
> -	u8 active_channel_map[MAX_CHANNEL_NUMBER+1];
> +	u8 active_channel_map[MAX_CHANNEL_NUMBER + 1];
>   
>   	int rate;       /* current rate */
>   	int basic_rate;
> @@ -1486,32 +1486,32 @@ struct rtllib_device {
>   /* Uses the channel change callback directly
>    * instead of [start/stop] scan callbacks
>    */
> -#define IEEE_SOFTMAC_SCAN (1<<2)
> +#define IEEE_SOFTMAC_SCAN (1 << 2)
>   
>   /* Perform authentication and association handshake */
> -#define IEEE_SOFTMAC_ASSOCIATE (1<<3)
> +#define IEEE_SOFTMAC_ASSOCIATE (1 << 3)
>   
>   /* Generate probe requests */
> -#define IEEE_SOFTMAC_PROBERQ (1<<4)
> +#define IEEE_SOFTMAC_PROBERQ (1 << 4)
>   
>   /* Generate response to probe requests */
> -#define IEEE_SOFTMAC_PROBERS (1<<5)
> +#define IEEE_SOFTMAC_PROBERS (1 << 5)
>   
>   /* The ieee802.11 stack will manage the netif queue
>    * wake/stop for the driver, taking care of 802.11
>    * fragmentation. See softmac.c for details.
>    */
> -#define IEEE_SOFTMAC_TX_QUEUE (1<<7)
> +#define IEEE_SOFTMAC_TX_QUEUE (1 << 7)
>   
>   /* Uses only the softmac_data_hard_start_xmit
>    * even for TX management frames.
>    */
> -#define IEEE_SOFTMAC_SINGLE_QUEUE (1<<8)
> +#define IEEE_SOFTMAC_SINGLE_QUEUE (1 << 8)
>   
>   /* Generate beacons.  The stack will enqueue beacons
>    * to the card
>    */
> -#define IEEE_SOFTMAC_BEACONS (1<<6)
> +#define IEEE_SOFTMAC_BEACONS (1 << 6)
>   
>   static inline void *rtllib_priv(struct net_device *dev)
>   {

Hi Tree,

in many of the above cases checkpatch is asking for using the BIT macro. 
So when you add the spaces to those lines the next change requested by 
ckeckpatch is the BIT macro. I think we should switch only once.
Find examples below:

CHECK: Prefer using the BIT macro
#44: FILE: drivers/staging/rtl8192e/rtllib.h:417:
+#define RTLLIB_STATMASK_SIGNAL (1 << 0)

CHECK: Prefer using the BIT macro
#45: FILE: drivers/staging/rtl8192e/rtllib.h:418:
+#define RTLLIB_STATMASK_RSSI (1 << 1)

CHECK: Prefer using the BIT macro
#46: FILE: drivers/staging/rtl8192e/rtllib.h:419:
+#define RTLLIB_STATMASK_NOISE (1 << 2)

CHECK: Prefer using the BIT macro
#51: FILE: drivers/staging/rtl8192e/rtllib.h:422:
+#define RTLLIB_CCK_MODULATION    (1 << 0)

CHECK: Prefer using the BIT macro
#52: FILE: drivers/staging/rtl8192e/rtllib.h:423:
+#define RTLLIB_OFDM_MODULATION   (1 << 1)

Thanks for your support.

Bye Philipp


