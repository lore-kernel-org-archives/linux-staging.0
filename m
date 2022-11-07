Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9A3209
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 12:54:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p16so6810501wmc.3
        for <linux-staging@lists.linux.dev>; Mon, 07 Nov 2022 04:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x/gjDZ1YQuAcmh+CpxdZMBXAa/U5srszeLdkjriKYp8=;
        b=NTivC4ETZtU1/X5wyJLZC4F00LZcyxyp6iUGzeEP7hmotz6pr+yEv0LFjjLw9XXq0e
         X9m5nLTr38Nhsensx1D1EvPBAtc2jqbfE57V13cgCuWiPxiWhAh5ytiCiHgiARar0t7F
         /EBYDNtpe+d8F509xzyJDp3RfBQjiiWkwCOJE1AHQBTAKoGcf8VJ/CnTInXFNZuPzfEM
         BLcpRfypWkjm2V++ZnXNO4yUK6R/ETXupadcgdui5e5f05tlJHSdm6ywR28CHImkVnyM
         vbGUSP4Rth750H7l8Qb3JtoKS2qf1UaDkHQmOGFsnTXE0701fZeFTDr+Jo4Gjl9OTsmp
         qG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/gjDZ1YQuAcmh+CpxdZMBXAa/U5srszeLdkjriKYp8=;
        b=WLz9VH2XCp753Qq9ys/wQI+yA+dn308f1T7D/TNFyYziPelkySWB2EjxJ/FsjnBrg7
         ZLqyHo+HZIe1/yKtO1S7E7gRrjARoqvJ1fU7ljfDD6sTlLHrthlwppHsXRRxzo3tqn2a
         vL9QsXMphLkP89f9Ehbykxf9vnd+bngC81UHpVEmSO5cpQfV+W//VmYo89MNj/HAgaTf
         ltG07G6WXbk9O87/ZgDgPi/TG9ACBWHaSvj/cH+YClfCwqFIvyJwijk93h/wc1NzMMnQ
         nx4K3eDESQGZz38/pWvyyYLvMp7qXOWidZdHBKxlcuIvybgLxiYiXFkgL3YjLrSVu/YM
         dOKg==
X-Gm-Message-State: ACrzQf12O21HkqBGDyXPblYNDdYRN+3+qGmj8yJsMkYUMDWBffl9leJ9
	X/a/6GDNeeyt+UvEPkV5K4M=
X-Google-Smtp-Source: AMsMyM7v49Nb+m2ayKO03i9bfCDc5uGPlIaBmmQYN5ErSV36EtHAfWw6o0TPzeRNwHLxP78KaHbpLw==
X-Received: by 2002:a05:600c:4b27:b0:3cf:67ab:3ac6 with SMTP id i39-20020a05600c4b2700b003cf67ab3ac6mr31931942wmp.35.1667825665526;
        Mon, 07 Nov 2022 04:54:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m2-20020a056000008200b0023662d97130sm7218408wrx.20.2022.11.07.04.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 04:54:25 -0800 (PST)
Date: Mon, 7 Nov 2022 15:54:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: r8188eu: use a qos_hdr in
 validate_recv_data_frame
Message-ID: <Y2j//dFRONly9kU8@kadam>
References: <20221106170455.743058-1-martin@kaiser.cx>
 <20221106170455.743058-2-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106170455.743058-2-martin@kaiser.cx>

On Sun, Nov 06, 2022 at 06:04:53PM +0100, Martin Kaiser wrote:
> Define a struct ieee80211_qos_hdr in the validate_recv_data_frame
> function. Use this struct to replace some numeric offsets and make the
> code easier to understand.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/core/rtw_recv.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index cb0f35d7ab98..245b931c483d 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -1032,7 +1032,6 @@ static int validate_recv_data_frame(struct adapter *adapter,
>  				    struct recv_frame *precv_frame)
>  {
>  	struct sta_info *psta = NULL;
> -	u8 *ptr = precv_frame->rx_data;
>  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
>  	struct rx_pkt_attrib	*pattrib = &precv_frame->attrib;
>  	struct security_priv	*psecuritypriv = &adapter->securitypriv;
> @@ -1071,10 +1070,12 @@ static int validate_recv_data_frame(struct adapter *adapter,
>  	pattrib->ack_policy = 0;
>  	/* parsing QC field */
>  	if (pattrib->qos) {
> +		struct ieee80211_qos_hdr *qos_hdr = (struct ieee80211_qos_hdr *)hdr;
> +
>  		pattrib->priority = ieee80211_get_tid(hdr);
> -		pattrib->ack_policy = GetAckpolicy((ptr + 24));
> -		pattrib->amsdu = GetAMsdu((ptr + 24));
> -		pattrib->hdrlen = 26;
                               ^^^

> +		pattrib->ack_policy = GetAckpolicy(&qos_hdr->qos_ctrl);
> +		pattrib->amsdu = GetAMsdu(&qos_hdr->qos_ctrl);
> +		pattrib->hdrlen += sizeof(*qos_hdr);
                               ^^^^
Why did this change from "=" to "+="?

regards,
dan carpenter

