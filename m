Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E696D7A
	for <linux-staging@lists.linux.dev>; Thu, 14 Jul 2022 05:08:12 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id b11so1321797eju.10
        for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 22:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vy2MfzyPa9L9lOgfb/9mBRNFtfqDs9SVVZs/k4VMVS0=;
        b=TQjZUMSlaxkD994q2eniPOaQWVp4nLnWWtZwj1dClkwHmKDtjngLeVM4JhD7iXd04e
         OFvK4BORx1KndCIbYZiYzEr1zkaXAu/2jbrz13QK8qZ56nyaE9JyfItIInCtfdom3Z5B
         5jAo9FDohAj1fbT4wfRe551R+WjD61L0I4kMyN/UPtA5bPvbs1mZn4yDYeCY/Y7l/IKr
         cQlqXhG/rh9RwIPo8JR8+TXX0ZHYvfD8pSWY3/yLSUobSLqTNtXjxQgl21LA8a7upEJ5
         W5hkVX9eBw9r/l87TO8V79t+tiWbRCejxudQaoGzwE76gDnasNNKrwn341VBXKbenKM6
         3Bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vy2MfzyPa9L9lOgfb/9mBRNFtfqDs9SVVZs/k4VMVS0=;
        b=p3iNXfnOt55Q6UILDrTA+J7YNSgHJbH1YY/Z9cXqCM+WFJc7nGICQGP0Vh/qPzOaXT
         AeVI5xYBjvkoXZ22R/mFoMwmjDow8DCItO5nPyWXYcULq4SPVwk9bo/NvWRStrYw+dsK
         h6zVQ6ujHR1WB2z/JyEzheD8oBZ6PFQrmjlIVF69ApSnGdP9BpRx9z5RzIpKooQ3JrtY
         c8xxhNN10q/Njw/vgT3divZnOd+qv0JTtInncxUGpmPX93AFeEH3CJVwIqQ2aYJyAAMl
         hc6hoKKq786NbzlfZ5OGg0FbfiOCVt67royHoh24msPPOBdDyxuG7PYq5l1KYE6B1JWt
         x+uw==
X-Gm-Message-State: AJIora95TTuwj7BtRa2XPWU/E0dwUPEKGxgbL84xbtJQsadJFuDyOfSW
	lWttIhMlsWJR0mfuGi6qkMI=
X-Google-Smtp-Source: AGRyM1sGylVNJzBqzS/VtDtr7RS5Y3ga4zrndk6NOcnAKMduefISVlnrgaQQkiDfgV96YRd36sptBg==
X-Received: by 2002:a17:907:1dce:b0:72b:40c4:deec with SMTP id og14-20020a1709071dce00b0072b40c4deecmr7009870ejc.70.1657775291239;
        Wed, 13 Jul 2022 22:08:11 -0700 (PDT)
Received: from [192.168.1.101] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id e2-20020a50fb82000000b0042bdb6a3602sm376821edq.69.2022.07.13.22.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 22:08:10 -0700 (PDT)
Message-ID: <e847d211-ecd2-11bc-2657-5cae072dbed7@gmail.com>
Date: Thu, 14 Jul 2022 07:08:08 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] staging: r8188eu: fall back to random mac address
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
References: <20220713075552.140927-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220713075552.140927-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/13/22 09:55, Martin Kaiser wrote:
> Call eth_random_addr to generate a random mac address if we cannot load
> the mac address from the efuses.
> 
> Do not use a constant mac address as fallback. This may create conflicts
> if we have several r8188eu devices on the network.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/usb_halinit.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index 68d012a442a8..8902dda7b8d8 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -912,11 +912,10 @@ unsigned int rtl8188eu_inirp_init(struct adapter *Adapter)
>   
>   static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 *hwinfo, bool AutoLoadFail)
>   {
> -	u8 sMacAddr[6] = {0x00, 0xE0, 0x4C, 0x81, 0x88, 0x02};
>   	struct eeprom_priv *eeprom = &adapt->eeprompriv;
>   
>   	if (AutoLoadFail) {
> -		memcpy(eeprom->mac_addr, sMacAddr, ETH_ALEN);
> +		eth_random_addr(eeprom->mac_addr);
>   	} else {
>   		/* Read Permanent MAC address */
>   		memcpy(eeprom->mac_addr, &hwinfo[EEPROM_MAC_ADDR_88EU], ETH_ALEN);

Tested with:

static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 
*hwinfo, bool AutoLoadFail)
{
	struct eeprom_priv *eeprom = &adapt->eeprompriv;
	struct dvobj_priv *dvobj = adapter_to_dvobj(adapt);
	struct device *device = dvobj_to_dev(dvobj);

	dev_info(device, "AutoLoadFail: %i", AutoLoadFail);

	if (!AutoLoadFail) {
		eth_random_addr(eeprom->mac_addr);
	} else {
		/* Read Permanent MAC address */
		memcpy(eeprom->mac_addr, &hwinfo[EEPROM_MAC_ADDR_88EU], ETH_ALEN);
	}
	dev_info(device, "Test - MAC Address = %pM\n", eeprom->mac_addr);
}

Log:
[ 1799.018943] r8188eu 2-1.6:1.0: AutoLoadFail: 0
[ 1799.018969] r8188eu 2-1.6:1.0: Test - MAC Address = be:0a:e8:72:a8:4a
[ 1866.151995] r8188eu 2-1.6:1.0: AutoLoadFail: 0
[ 1866.152014] r8188eu 2-1.6:1.0: Test - MAC Address = 76:9b:4f:91:28:5f
[ 1900.266003] r8188eu 2-1.6:1.0: AutoLoadFail: 0
[ 1900.266008] r8188eu 2-1.6:1.0: Test - MAC Address = 5e:9d:d5:f5:ef:26


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150



