Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980CF748E
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 18:03:10 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id q9so14867674ejd.0
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 11:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88oNzPUt/hklNuT3+gVgNnDseM0gTXsCehPcE6SyWPQ=;
        b=GFYJZG6otnGca9bScD7Poayx7YyMh2FQbAJYYZO3QTDhm0J/ucT8+44fWMqe5epE+B
         mktFu4Mbxv/S2SNToMGRkwQxhMKIzRbV2HO4ew52bvRjHsQug1NjA2+9lHZLwQYVXpj9
         TA1HCWRyJT1FctP5TNLJdqtez7ud9GmQGDZxpsm8DYertGakPGB3a2v0BpCvdVKZyG8i
         DeW3eE+l2KUCw6PEKqU7bxH+tXdoK1bP+2ImGVveCvseM680HkxvW1uTC02f4C3oWfBT
         eXopxfnGFa3zfi+AmyRBGlo9Uqa5E1DV2zZEL7yiaPW64t6TJxAxgCxe2gTNGoixjuep
         mmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88oNzPUt/hklNuT3+gVgNnDseM0gTXsCehPcE6SyWPQ=;
        b=eMPoOoE4UizqThrmIYNEM8zy6kYN53cmoJXrPDCjs+LH3lPBTWE7s+2GET+xQFWGci
         WvP4B9kM6azV0anPEMqkyfMFA6jUQWawu61dauNrocS1lTrvbcBno3066QHWOU9MwLQa
         RX5vifh+4Z/sHgIXre9gBz0MOtX6PiKJoOk4zdm+sTkMnVTIG0iEyi5Xs5/nAlALh0Zb
         aImTgtrLNTGVuY7vDe83hK1XzjZKaD5zQHdGDQWpuWvlFwYtYtDaxgU5hRTFq5FMXwvR
         EzuXWPaOG7CfWZEEN7g+FH/qikgwp7AaNu7UZF3IH3In/XxFQANdK37KUw0ef/o5wqso
         Q++Q==
X-Gm-Message-State: ACrzQf3YPiPKohqhVI4uTouofbL1fu1Ekriqrhi+dYLasQlyDS8lk4kv
	/PYMSDdcOV90Th/ghPloj0U=
X-Google-Smtp-Source: AMsMyM7jxemvRjEyCefHxnSbqR9TVfe194cy8GGDQOoh2WAI27lcc+ychBfZC384Krp8HbdE96KbFA==
X-Received: by 2002:a17:907:2cce:b0:77a:6958:5aaa with SMTP id hg14-20020a1709072cce00b0077a69585aaamr32168489ejc.245.1666720988827;
        Tue, 25 Oct 2022 11:03:08 -0700 (PDT)
Received: from [192.168.1.100] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id j5-20020a170906830500b0072f112a6ad2sm1746651ejx.97.2022.10.25.11.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 11:03:08 -0700 (PDT)
Message-ID: <262e9819-88c4-abc9-dcce-ee020b847c6a@gmail.com>
Date: Tue, 25 Oct 2022 20:03:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192e: rtllib_crypt_wep: multiple blank lines
 removal
Content-Language: en-US
To: Aaron Lawrence <t4rmin@zohomail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221025104402.xvbfobi7sdnwlqs2@plymouth>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221025104402.xvbfobi7sdnwlqs2@plymouth>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/22 12:44, Aaron Lawrence wrote:
> Removal of multiple unnecessary blank lines in accordance with the
> Linux kernel coding-style regulations. Said issues ware detected on
> this file by the checkpatch script.
> 
> Signed-off-by: Aaron Lawrence <t4rmin@zohomail.com>
> ---
>   drivers/staging/rtl8192e/rtllib_crypt_wep.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_crypt_wep.c b/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> index 7790271a6a40..062285e4d939 100644
> --- a/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> +++ b/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> @@ -27,7 +27,6 @@ struct prism2_wep_data {
>   	struct arc4_ctx tx_ctx_arc4;
>   };
>   
> -
>   static void *prism2_wep_init(int keyidx)
>   {
>   	struct prism2_wep_data *priv;
> @@ -46,7 +45,6 @@ static void *prism2_wep_init(int keyidx)
>   	return priv;
>   }
>   
> -
>   static void prism2_wep_deinit(void *priv)
>   {
>   	kfree_sensitive(priv);
> @@ -120,7 +118,6 @@ static int prism2_wep_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
>   	return 0;
>   }
>   
> -
>   /* Perform WEP decryption on given struct buffer. Buffer includes whole WEP
>    * part of the frame: IV (4 bytes), encrypted payload (including SNAP header),
>    * ICV (4 bytes). len includes both IV and ICV.
> @@ -180,7 +177,6 @@ static int prism2_wep_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
>   	return 0;
>   }
>   
> -
>   static int prism2_wep_set_key(void *key, int len, u8 *seq, void *priv)
>   {
>   	struct prism2_wep_data *wep = priv;
> @@ -194,7 +190,6 @@ static int prism2_wep_set_key(void *key, int len, u8 *seq, void *priv)
>   	return 0;
>   }
>   
> -
>   static int prism2_wep_get_key(void *key, int len, u8 *seq, void *priv)
>   {
>   	struct prism2_wep_data *wep = priv;
> @@ -207,7 +202,6 @@ static int prism2_wep_get_key(void *key, int len, u8 *seq, void *priv)
>   	return wep->key_len;
>   }
>   
> -
>   static void prism2_wep_print_stats(struct seq_file *m, void *priv)
>   {
>   	struct prism2_wep_data *wep = priv;
> @@ -231,13 +225,11 @@ static struct lib80211_crypto_ops rtllib_crypt_wep = {
>   	.owner			= THIS_MODULE,
>   };
>   
> -
>   static int __init rtllib_crypto_wep_init(void)
>   {
>   	return lib80211_register_crypto_ops(&rtllib_crypt_wep);
>   }
>   
> -
>   static void __exit rtllib_crypto_wep_exit(void)
>   {
>   	lib80211_unregister_crypto_ops(&rtllib_crypt_wep);

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
