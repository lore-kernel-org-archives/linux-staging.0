Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0093DFC8B
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776091471; cv=none; b=UGXCeouI2FxSfRlgSkG38IL+A0Z0JxsXV09oLrhK5Ha0V/uKvJKM7DBmNt4OlajT96fLaYuXxYVLRCrCYtGsRBs6ajU6Y7uIuCAtUsDZFcXv/rcyD5nv2UOR6Pq4aVENVvHejQYruNFlarHx9zZpaWjxC8LwlejD1bFouRgjtvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776091471; c=relaxed/simple;
	bh=OiZxwnD9Hxt+1QDbMh/RUvV1q4EWM5v7octJO3HLZuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSd2RFiwa+QIhgp0S8WpLVoMLtmysz7UabsK7GbAERMoaYL3VkcK00LEff2IuYMYVFPaeCxVobSRw25rAJc/OTVUdWkyF9PKjDdM6BlC0EmVPhiv+j549xopAojVg2x3h+UkAcCWvLyjde2chc/OcagFpo5HQjCfTtBfNzEj/hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prEKVVb0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prEKVVb0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so72080785e9.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776091468; x=1776696268; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wUSn6JhByTBr9SL0zKoqyVDYGQSakXuLOH5KvBNw/xk=;
        b=prEKVVb0SyUb89bYtHlqPFGMiAKIO60thMYz1qj0QBYYLO9e0N3cAp1Yc/f5J+LNsb
         oFgM9+w1u+jTaWsBilTm9iR0ZLMlzTHFBw+iQbTVorSkwYcQ9J/rFksi0rToOTRCAspG
         DgXbp8OIBJjaRijx9J4kCYLK0EY2zKkikSZUL9bmVU+dJX2qQf7FkNYD3mKfkIOCINZl
         Ueidk0hCUCMXyy1tcalkxDT8IlLHJ2Gqf0e62dVch7NLrgMuYUubFrTqad0Ce4QPsGK/
         pKaZr9wzE3o1d5rZ0xmJxI/+ZS9X5n6UemhBOcCM3H81uz93qbKip4UA/NZ/K3nS+mxJ
         VYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776091468; x=1776696268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUSn6JhByTBr9SL0zKoqyVDYGQSakXuLOH5KvBNw/xk=;
        b=HmZvF0K3SZhr5Cd/nVxHoZdH/xf5owJtKVRWPEAhJxNwthv0eSDbl51k9myVSEgIVb
         TW2lvNZeSsGvdN2TCUAZkx63VtLAX4oXx7ccBi/0TTusqx+aw1zvEhyTVKogaDGBlXaZ
         hv1cTExqDvpQgyhiU1td71aItEVv778LyH/uDo68lcR39qq/Nz51MPilvXzKl2NmNqsv
         D0A2cl1HjmiBkFDEQn6n3J1ATcKng1vLoosgjlANF7C2lxud45g4coWwKdws2DvijHbn
         NltVjWp7A7rpoZDuE6b2MYZQJ9x6bc6ZDRiFYlaq3mn9RzRLKAUckt7Lpg9HLDKFDqkO
         wuqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SsnefhH5fKN5X7FpaqY4IdwpS3VLlbv6SEl2e261RAn015FMc1ZvNnQVM8+YUKjFzOZcltvCCgJsO9u9R@lists.linux.dev
X-Gm-Message-State: AOJu0YxkKFt7vhVS9ldlQwdEZ4JOaMdp9y9Ohz/HhhRsg44lWWuOP/KN
	vOCD+k9JVnke2PVaOj8R1USl+mZ5Q26OPLwmurBw+0L7YyCh5LT/p3Jp
X-Gm-Gg: AeBDievypyGbiWg2+HwZqneUVOwWAVEQKhDCqxLIlgCbOMEnNwl4IOMvla2k6YFb5Zy
	va7F3vZjI0EDZtwP2jbyKMVhjxKqkqQ03t4JOz9cNES15DvyNSllWgo8TEBJy2MXDoGehxD/+5e
	dhu8WT1ogyvrON1zkWsYaSQi9+9AsbbgRH+LCZQPTrlQLzl1bX2721z9yXTjGIXQt9MZGyAXeiw
	lku+XW8iVu/fcXZtJjSS3QZqJof3MWI1TNYNeqJyNuqRPMz+85+K0utDUdmT6JjpHxdVssp8u59
	QlDRBz+KQfLsXAn1/fUSSkyB5mWUb2htQdQIyqkLHS46wUZUGyj3WbcQebMbQtk5rCebwJB9NDB
	6+D451GocAwyERWYOushPiT0gNISrz4HiDfnI+2CiSCxzCzWMJbnVkoATaj47xJS8C1Wlq5bVFl
	aw+TFMJ71xSZeO7e4hFRVxMehaomk5pg==
X-Received: by 2002:a05:600c:5298:b0:488:c014:34da with SMTP id 5b1f17b1804b1-488d688687cmr197754545e9.26.1776091468149;
        Mon, 13 Apr 2026 07:44:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488eaf62cc4sm10624245e9.2.2026.04.13.07.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:44:27 -0700 (PDT)
Date: Mon, 13 Apr 2026 17:44:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: deep@crimson.net.eu.org
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: convert int16_t to s16
Message-ID: <ad0BSPP6jbeCHOJ-@stanley.mountain>
References: <20260413143320.1246385-1-deep@crimson.net.eu.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413143320.1246385-1-deep@crimson.net.eu.org>

On Mon, Apr 13, 2026 at 04:33:20PM +0200, deep@crimson.net.eu.org wrote:
> From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> 
> The TODO list for the rtl8723bs driver mentions the conversion of
> unusual variable types to the preferred kernel style. Convert the
> "power_limit" variable in include/wifi.h from int16_t to s16.
> 
> Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> ---
>  drivers/staging/rtl8723bs/include/wifi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
> index 230b2c4ffd3b..8ab0cb6ba344 100644
> --- a/drivers/staging/rtl8723bs/include/wifi.h
> +++ b/drivers/staging/rtl8723bs/include/wifi.h
> @@ -457,7 +457,7 @@ struct rtw_regulatory {
>  	u32 tp_scale;
>  	u16 current_rd;
>  	u16 current_rd_ext;
> -	int16_t power_limit;
> +	s16 power_limit;

Generally, variables like s16 and s32 should only be used when they
are defined by a hardware or protocol spec.  You should just use
short and int for normal code.

In this case, the rtw_regulatory is never really used.  There are
a few functions which take it as a parameter they aren't used and
we always pass NULL pointers to them.

Cleanup the functions and then delete the whole struct rtw_regulatory
and struct.

regards,
dan carpenter

>  	struct regd_pair_mapping *regpair;
>  };

