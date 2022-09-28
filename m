Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60C94A11
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 17:00:05 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id t4so8904825wmj.5
        for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date;
        bh=DFoXWdr2RbqngWpy4aop2zKIzUkhOOU6glMK5DRV5AM=;
        b=X2yJY5xxR1jUSIfXIjb2Te2y7wvc2DzfdUQEfCx2zQoZuDE6ZCCzfJEPtrjJpAaAY3
         azAcqNi30P9o1EJczq9788PZd9Yzyot1C0A1UdmYk1uhyfwPSJ27x5VHWokip9/VHQ+x
         8BfAwCsaY1eG00ucrFGHB2iWkb2Dvl6NKx6+sdt0JPz8qAaEPuXP12Ouv9+dHh3dqY9r
         9xAak2hFTHyA5zVsTCPwg8gDvBF/6jjHDIFZX30lNxHE7GV+v7Vf11+HFSbjsd2TGx/Y
         3UESliuglUopgUZMzFQHKfzHyeNGy52IjShPt5OPFdcaiU5P9xUR2sFqZujnwOv6D/kV
         2/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
        bh=DFoXWdr2RbqngWpy4aop2zKIzUkhOOU6glMK5DRV5AM=;
        b=D/soHArMYEiWoBxKA8IT82Y6G36O14o5C08V5l0pvqSd0NEVa+tr7dcLBrD6rIb5Yo
         KpwBPz3o/Kj9x8vx2gy2nnp0TLwHFQbUdtDE9Mu8LBwub81jE7CtLahZJXJ5AWt5hM1U
         aGvyLDHWoL9joqfskItv2FmIJsnYp+yhAcPFvUJWEtE1CcroUD0IroKPLAbitDZqTIeG
         v5idgXbV8uUwLRHjPWsCvflGV+RmuihyzASiTfd72IKge5vlXs3/g3MxuTy8lMgjBe5Q
         Ail9Ua0Gl3/N3Sw43pDmR8aU08AGEtjXhE6wwaUxY2ZQd2cC98KITONQj6OsQilvksUc
         djhw==
X-Gm-Message-State: ACrzQf1zstu2iXfKPlYrEY02c7/ehVKTFSFpcKruROx7zya2VG5vcFBj
	MmNcO/bWppWLsVIpX/ieb6dzSxXLEJSfRg==
X-Google-Smtp-Source: AMsMyM7IP1k//z5d5WsqFggMbZGvk7WGkV+Z+4ebpW/bP2jwJ071I4MqIKerwzAHiNe1CtSwJS2/0A==
X-Received: by 2002:a05:600c:3205:b0:3b3:3813:ae3f with SMTP id r5-20020a05600c320500b003b33813ae3fmr7943786wmp.158.1664384403356;
        Wed, 28 Sep 2022 10:00:03 -0700 (PDT)
Received: from localhost ([105.184.251.180])
        by smtp.gmail.com with ESMTPSA id e11-20020a05600c218b00b003b47ff307e1sm2168081wme.31.2022.09.28.10.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 10:00:02 -0700 (PDT)
References: <20220928075324.1605-1-joash.n09@gmail.com>
 <YzQALwjz5VT0uCyB@kroah.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Joash Naidoo <joash.n09@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 dan.carpenter@oracle.com, straube.linux@gmail.com, paskripkin@gmail.com,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: r8188eu: fix too many leading tabs
Date: Wed, 28 Sep 2022 18:20:28 +0200
In-reply-to: <YzQALwjz5VT0uCyB@kroah.com>
Message-ID: <87r0zva18v.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed


Greg KH <gregkh@linuxfoundation.org> writes:

> On Wed, Sep 28, 2022 at 09:53:24AM +0200, Joash Naidoo wrote:
>> Coding style fix. Fix too many leading tabs and line length.
>>
>> Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
>> ---
>> Changes in V4:
>>     - Fix compiler warning introduced: mixing declarations and 
>>     code
>> Changes in v3:
>>     - Fix flipped condition mistake
>>     - move skb NULL check before dereferencing it
>> Changes in v2:
>>     - Flip additional nested if conditions and don't reverse 
>>     the last if statement
>>     - Move declarations to start of function
>>     - Separate converting __constant_htons to htons to another 
>>     patch
>> ---
>>  drivers/staging/r8188eu/core/rtw_br_ext.c | 75 
>>  +++++++++++++----------
>>  1 file changed, 42 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c 
>> b/drivers/staging/r8188eu/core/rtw_br_ext.c
>> index bca20fe5c..d4bcec152 100644
>> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
>> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
>> @@ -601,42 +601,51 @@ struct dhcpMessage {
>>
>>  void dhcp_flag_bcast(struct adapter *priv, struct sk_buff 
>>  *skb)
>>  {
>> +	__be16 protocol;
>> +	struct iphdr *iph;
>> +	struct udphdr *udph;
>> +	struct dhcpMessage *dhcph;
>> +	u32 cookie;
>> +
>>  	if (!skb)
>>  		return;
>>
>> -	if (!priv->ethBrExtInfo.dhcp_bcst_disable) {
>> -		__be16 protocol = *((__be16 *)(skb->data + 2 * 
>> ETH_ALEN));
>> -
>> -		if (protocol == __constant_htons(ETH_P_IP)) { /*  IP 
>> */
>> -			struct iphdr *iph = (struct iphdr *)(skb->data + 
>> ETH_HLEN);
>> -
>> -			if (iph->protocol == IPPROTO_UDP) { /*  UDP */
>> -				struct udphdr *udph = (struct udphdr 
>> *)((size_t)iph + (iph->ihl << 2));
>> -
>> -				if ((udph->source == 
>> __constant_htons(CLIENT_PORT)) &&
>> -				    (udph->dest == 
>> __constant_htons(SERVER_PORT))) { /*  DHCP request */
>> -					struct dhcpMessage *dhcph =
>> -						(struct dhcpMessage *)((size_t)udph + 
>> sizeof(struct udphdr));
>> -					u32 cookie = 
>> be32_to_cpu((__be32)dhcph->cookie);
>> -
>> -					if (cookie == DHCP_MAGIC) { /*  match 
>> magic word */
>> -						if (!(dhcph->flags & 
>> htons(BROADCAST_FLAG))) {
>> -							/*  if not broadcast */
>> -							register int sum = 0;
>> -
>> -							/*  or BROADCAST flag */
>> -							dhcph->flags |= 
>> htons(BROADCAST_FLAG);
>> -							/*  recalculate checksum */
>> -							sum = ~(udph->check) & 0xffff;
>> -							sum += be16_to_cpu(dhcph->flags);
>> -							while (sum >> 16)
>> -								sum = (sum & 0xffff) + (sum >> 
>> 16);
>> -							udph->check = ~sum;
>> -						}
>> -					}
>> -				}
>> -			}
>> -		}
>> +	protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
>> +	iph = (struct iphdr *)(skb->data + ETH_HLEN);
>> +	udph = (struct udphdr *)((size_t)iph + (iph->ihl << 2));
>> +	/*  DHCP request */
>> +	dhcph =
>> +		(struct dhcpMessage *)((size_t)udph + sizeof(struct 
>> udphdr));
>
> Very odd formatting, why split that line?
>
>> +	cookie = be32_to_cpu((__be32)dhcph->cookie);
>> +
>> +	if (priv->ethBrExtInfo.dhcp_bcst_disable)
>> +		return;
>
> Why are you not checking for this _before_ all of the above
> assignments?
>
>
>
>> +
>> +	if (protocol != htons(ETH_P_IP)) /*  IP */
>> +		return;
>
> You can check for this right after assigning the protocol 
> variable.
>
>> +
>> +	if (iph->protocol != IPPROTO_UDP) /*  UDP */
>> +		return;
>
> You can check for this right after setting iph.

Thank you for your time and feedback. I agree with your comments. 
My rationale for having the way it is stems from my inclination to 
stuck to the original code as close as possible. In hindsight, the 
ordering could be better. I will submit another revision.

> But also, shouldn't you just be using the ip_hdr() call instead 
> of doing
> the crazy cast above?

I would need to investigate and test first before commenting. If a 
change had to be made, I believe it will go in a separate patch?

> thanks,
>
> greg k-h
