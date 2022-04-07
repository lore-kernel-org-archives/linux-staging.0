Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573952564;
	Thu,  7 Apr 2022 12:35:52 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id z1so7663487wrg.4;
        Thu, 07 Apr 2022 05:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tUrfXqkYekxSMnuWbX3OlNEJmzCyXafj9mwWNcCj8H4=;
        b=Tz5Iq08KGRUx7hloT92JNwU36GWMyEuVP2W3+SrKoB4RJsCAWhTDsAi+C9B6KAyysp
         6r622AeGiq+2lM4egA++4LTaY1+FeGBJ+ntNrjZbtz8Rt/jtejzMS6OR16IXG0hJIg06
         ZjzZdf7FOGPXCl/VdVzeJe8dmXWqDMK5qZbf9TClbhQTYFy4ydH8iEhhWZtzteGqUWXk
         BLMhTuSQE1bP6P7gA+z+MsAPZmqTtS0Js8PS6hRUAIjukhdFulhvIYRizjxdYnifBl/0
         RAxGxStvFZaaWbvEig52zaf4UHcIP/apMsStN+4tSlYknMZLba8IvfIXqnSnVAhF8RDT
         8g3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tUrfXqkYekxSMnuWbX3OlNEJmzCyXafj9mwWNcCj8H4=;
        b=csNy7kBEnSotnPAmzHuD+NNgTOGoRWW8PuZtFO8CruRbdaTTb8Qw+UboB8bo0pnRLa
         k38kpBqpYHYx2fwkTXPfkJlpzrDd9NF/g+xnF4MmGnbkdI4O3wbY9cRsrqH2GoQ4oAzu
         IBB692dOZ2/qRrngJkt+3bLruSua/a1PNH+eaOxG4TBlQhACpu3Os+jN5DrkdL0UokVo
         ilxaix/g4/38KP94G0uyAmlPmVLGaVjJZ64F6ozCqxXYhldTKtZaVvvE56Z4t5PWRmPt
         ni/duKqhU3OWoec7uaW3EtZUW+9JrB1jJfadZ6tCQ0d/9EYF8t/0wtpdcZazpPObNxlZ
         Ppvg==
X-Gm-Message-State: AOAM533kGSig/lw6/fJfw1qj96eYY+pr/3EiPAw6ojoAZraKXhYy9b47
	QsMxl+lpZp1zrQRZdqZPIfU=
X-Google-Smtp-Source: ABdhPJz2y1PWezXsq/8+p86zuoG928T76KQDEjM0TNAVhd66Bd/fGP9DcOcom0U/Gm/cOyUPlFAFlg==
X-Received: by 2002:adf:fb50:0:b0:206:d26:c20a with SMTP id c16-20020adffb50000000b002060d26c20amr10788261wrs.446.1649334950370;
        Thu, 07 Apr 2022 05:35:50 -0700 (PDT)
Received: from [192.168.1.14] ([197.57.231.245])
        by smtp.gmail.com with ESMTPSA id o11-20020adf9d4b000000b001f0077ea337sm16984753wre.22.2022.04.07.05.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 05:35:49 -0700 (PDT)
Message-ID: <658b52bb-7384-143d-ab90-afcfdcec6eeb@gmail.com>
Date: Thu, 7 Apr 2022 14:35:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] staging: rtl8712: remove unnecessary parentheses
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220406224057.5260-1-eng.alaamohamedsoliman.am@gmail.com>
 <alpine.DEB.2.22.394.2204070606000.2191@hadrien>
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2204070606000.2191@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ٧‏/٤‏/٢٠٢٢ ٠٦:٠٦, Julia Lawall wrote:
>
> On Thu, 7 Apr 2022, Alaa Mohamed wrote:
>
>> Reported by checkpatch:
>>
>> CHECK: Unnecessary parentheses around param->u.crypt.key[16]: 85
>> CHECK: Unnecessary parentheses around param->u.crypt.key[24]: 87
>> CHECK: Unnecessary parentheses around padapter->mlmepriv: 603
>> CHECK: Unnecessary parentheses around wrqu->encoding: 1497
>> CHECK: Unnecessary parentheses around wrqu->encoding: 1592
>> CHECK: Unnecessary parentheses around padapter->mlmepriv: 1593
>> CHECK: Unnecessary parentheses around wrqu->param: 1673
>> CHECK: Unnecessary parentheses around pmlmepriv->scanned_queue.lock: 1967
>> CHECK: Unnecessary parentheses around pmlmepriv->scanned_queue.lock: 1977
>> CHECK: Unnecessary parentheses around pmlmepriv->scanned_queue.lock: 1999
> This still needs to be improved.

Should be something like :

CHECK: Unnecessary parentheses '(' around struct

?
>
>> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
>> ---
>> Changes in v2:
>> 	- Edit commit subject
>> 	- Edit commit message
>> 	- Fix the same check in more lines
>> 	- Remove space before '.skey' in
>> "memcpy(psta->tkiptxmickey.skey," in lines 84 and 86.
>> ---
>> Changes in v3:
>> 	return the space before '.skey' in
>> "memcpy(psta->tkiptxmickey.skey," in lines 84 and 86
> Thanks for taking care of this part.
>
> julia
>
>> ---
>>   drivers/staging/rtl8712/rtl871x_ioctl_linux.c | 20 +++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
>> index 3b6926613257..f1e352b7f83e 100644
>> --- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
>> +++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
>> @@ -82,9 +82,9 @@ static inline void handle_pairwise_key(struct sta_info *psta,
>>   	       (param->u.crypt. key_len > 16 ? 16 : param->u.crypt.key_len));
>>   	if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
>>   		memcpy(psta->tkiptxmickey. skey,
>> -		       &(param->u.crypt.key[16]), 8);
>> +		       &param->u.crypt.key[16], 8);
>>   		memcpy(psta->tkiprxmickey. skey,
>> -		       &(param->u.crypt.key[24]), 8);
>> +		       &param->u.crypt.key[24], 8);
>>   		padapter->securitypriv. busetkipkey = false;
>>   		mod_timer(&padapter->securitypriv.tkip_timer,
>>   			  jiffies + msecs_to_jiffies(50));
>> @@ -600,7 +600,7 @@ static int r8711_wx_get_name(struct net_device *dev,
>>   	u32 ht_ielen = 0;
>>   	char *p;
>>   	u8 ht_cap = false;
>> -	struct	mlme_priv	*pmlmepriv = &(padapter->mlmepriv);
>> +	struct	mlme_priv	*pmlmepriv = &padapter->mlmepriv;
>>   	struct wlan_bssid_ex *pcur_bss = &pmlmepriv->cur_network.network;
>>   	u8 *prates;
>>
>> @@ -1494,7 +1494,7 @@ static int r8711_wx_set_enc(struct net_device *dev,
>>   	u32 keyindex_provided;
>>   	struct NDIS_802_11_WEP	 wep;
>>   	enum NDIS_802_11_AUTHENTICATION_MODE authmode;
>> -	struct iw_point *erq = &(wrqu->encoding);
>> +	struct iw_point *erq = &wrqu->encoding;
>>   	struct _adapter *padapter = netdev_priv(dev);
>>
>>   	key = erq->flags & IW_ENCODE_INDEX;
>> @@ -1589,8 +1589,8 @@ static int r8711_wx_get_enc(struct net_device *dev,
>>   {
>>   	uint key;
>>   	struct _adapter *padapter = netdev_priv(dev);
>> -	struct iw_point *erq = &(wrqu->encoding);
>> -	struct	mlme_priv	*pmlmepriv = &(padapter->mlmepriv);
>> +	struct iw_point *erq = &wrqu->encoding;
>> +	struct	mlme_priv	*pmlmepriv = &padapter->mlmepriv;
>>   	union Keytype *dk = padapter->securitypriv.DefKey;
>>
>>   	if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
>> @@ -1670,7 +1670,7 @@ static int r871x_wx_set_auth(struct net_device *dev,
>>   				union iwreq_data *wrqu, char *extra)
>>   {
>>   	struct _adapter *padapter = netdev_priv(dev);
>> -	struct iw_param *param = (struct iw_param *)&(wrqu->param);
>> +	struct iw_param *param = (struct iw_param *)&wrqu->param;
>>   	int paramid;
>>   	int paramval;
>>   	int ret = 0;
>> @@ -1964,7 +1964,7 @@ static int r871x_get_ap_info(struct net_device *dev,
>>   		return -EINVAL;
>>   	data[32] = 0;
>>
>> -	spin_lock_irqsave(&(pmlmepriv->scanned_queue.lock), irqL);
>> +	spin_lock_irqsave(&pmlmepriv->scanned_queue.lock, irqL);
>>   	phead = &queue->queue;
>>   	plist = phead->next;
>>   	while (1) {
>> @@ -1974,7 +1974,7 @@ static int r871x_get_ap_info(struct net_device *dev,
>>   		if (!mac_pton(data, bssid)) {
>>   			netdev_info(dev, "r8712u: Invalid BSSID '%s'.\n",
>>   				    (u8 *)data);
>> -			spin_unlock_irqrestore(&(pmlmepriv->scanned_queue.lock),
>> +			spin_unlock_irqrestore(&pmlmepriv->scanned_queue.lock,
>>   					       irqL);
>>   			return -EINVAL;
>>   		}
>> @@ -1996,7 +1996,7 @@ static int r871x_get_ap_info(struct net_device *dev,
>>   		}
>>   		plist = plist->next;
>>   	}
>> -	spin_unlock_irqrestore(&(pmlmepriv->scanned_queue.lock), irqL);
>> +	spin_unlock_irqrestore(&pmlmepriv->scanned_queue.lock, irqL);
>>   	if (pdata->length >= 34) {
>>   		if (copy_to_user((u8 __user *)pdata->pointer + 32,
>>   		    (u8 *)&pdata->flags, 1))
>> --
>> 2.35.1
>>
>>
>>
