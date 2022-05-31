Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEF7181
	for <linux-staging@lists.linux.dev>; Tue, 31 May 2022 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653986598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9fPaBZDsV84kO0IEmLkMM+G7p0afLOtSjYZX9TssTp0=;
	b=KD2GEueMmD56jLsUlq+hXVpsGyTJKUavvPSr58Ip2Gn+frPlVKJ80idEnwFyF0umFIbjGF
	IxA38dqYg7KB24eEtgHcmyOM0sUYt8DJoQTi9ME6AsHvB6W7hxJhad/cblWdEcB6azJFDe
	GX9BraDjSAk2QBrYKQ+czESoXVcVggM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-zYKFf2XDOEWXJUcPV_XEjg-1; Tue, 31 May 2022 04:43:12 -0400
X-MC-Unique: zYKFf2XDOEWXJUcPV_XEjg-1
Received: by mail-wm1-f71.google.com with SMTP id j40-20020a05600c1c2800b003972dbb1066so1078585wms.4
        for <linux-staging@lists.linux.dev>; Tue, 31 May 2022 01:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9fPaBZDsV84kO0IEmLkMM+G7p0afLOtSjYZX9TssTp0=;
        b=TwS2bUpIdLeHHU13W7BP3rdKDt3SrZEbXcf4PynwekvtNISsAX+HeNkkXIlmK/71QQ
         isxglI/lYNgxoBZ17oi5n4LRaYysNS0zxsBD47Fq9YE9GMeAz0XH+bXui5xsnJj3Jj9D
         N17xSSmAq+RebbXv5PU4VTPrY3J9BrAhxsn6HqLLZigVBDsPEOoF/zFnNpckbyqu2PaF
         4EJXG3FTBIrTSrE5SAC/uIlksTQkWLRojDj1eU7ljZ4lpy67VpBUzIaQJmHhF7mYF6wU
         PFEQw3LLaIbp5VyUDyD1LJ5PNiWRCVVPlkp+kYuYgA5dOfMdKa/ruPVPJxYS1J0NW2cL
         LJ/g==
X-Gm-Message-State: AOAM531kbcoOtiqv0BJG7+SfpEFdAIgeAcWbcxUl/alyWjEGhzDNeFnL
	JUkesif8QZP2LjyU2qSKesd7ZA4mPHgQkBVW/hA+Ia3lDKLe92Fsavd40P8ofY+W8J1xhHwha20
	D2kib1fKEvwOufbbxxGsNjDuWSg==
X-Received: by 2002:a05:600c:3b05:b0:397:54ce:896 with SMTP id m5-20020a05600c3b0500b0039754ce0896mr22494784wms.3.1653986591070;
        Tue, 31 May 2022 01:43:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfshR+I/hDPQmtoECOmlS+FrzrfxKwqTinLxQRa/ZAYNB2+FaUFLoMjB75XtGMJIFbhKjijA==
X-Received: by 2002:a05:600c:3b05:b0:397:54ce:896 with SMTP id m5-20020a05600c3b0500b0039754ce0896mr22494767wms.3.1653986590859;
        Tue, 31 May 2022 01:43:10 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-112-184.dyn.eolo.it. [146.241.112.184])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b0039c17452732sm1554367wmq.19.2022.05.31.01.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 01:43:10 -0700 (PDT)
Message-ID: <e530dc2021d43a29b64f985d7365319eab0d5595.camel@redhat.com>
Subject: Re: [PATCH 1/6] netlink: fix missing destruction of rhash table in
 error case
From: Paolo Abeni <pabeni@redhat.com>
To: Chengguang Xu <cgxu519@mykernel.net>, netdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Date: Tue, 31 May 2022 10:43:09 +0200
In-Reply-To: <20220529153456.4183738-2-cgxu519@mykernel.net>
References: <20220529153456.4183738-1-cgxu519@mykernel.net>
	 <20220529153456.4183738-2-cgxu519@mykernel.net>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

On Sun, 2022-05-29 at 23:34 +0800, Chengguang Xu wrote:
> Fix missing destruction(when '(--i) == 0') for error case in
> netlink_proto_init().
> 
> Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
> ---
>  net/netlink/af_netlink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> index 0cd91f813a3b..bd0b090a378b 100644
> --- a/net/netlink/af_netlink.c
> +++ b/net/netlink/af_netlink.c
> @@ -2887,7 +2887,7 @@ static int __init netlink_proto_init(void)
>  	for (i = 0; i < MAX_LINKS; i++) {
>  		if (rhashtable_init(&nl_table[i].hash,
>  				    &netlink_rhashtable_params) < 0) {
> -			while (--i > 0)
> +			while (--i >= 0)
>  				rhashtable_destroy(&nl_table[i].hash);
>  			kfree(nl_table);
>  			goto panic;

The patch looks correct to me, but it looks like each patch in this
series is targeting a different tree. I suggest to re-send, splitting
the series into individual patches, and sending each of them to the
appropriate tree. You can retain Dan's Review tag.

Thanks,

Paolo

