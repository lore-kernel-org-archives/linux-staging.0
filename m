Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EE9168
	for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 11:30:35 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso3288488pjp.2
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 04:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RD4xUDZuCe1wEZ3uQByJXB39CveNW2Qc0Hvr7tXsRJs=;
        b=Sg4Ccr6QlPWrQ2h/+KeJyYDhUFirkHeojycmEO7Iwl8Bv8CqATfb49eED0okGm9l7F
         rZDBIFPyIBc+pkrDmqQv/ql3XlWO+7cAb5t7nL7cD/bVxkbg/i/BEtnTJZrRX+Wl9n60
         +VqqRtE4c3QPLGEIES+g276zgSbuohYiTL8+GQAgsPCG3MJuCQO+sFUmwdP+gwA08k2V
         2eE4Jlz/6qhWG3lVNZIoqIEGs3Yoz7xV2naenK/nfF3HNVaD02q+nSj6F1srNIIpKcYR
         VFVBYZ/Nzrg/QN5NudOkEZAnp2l5UAGK5Ulb4RJZJ9rfld9npcMmHkhu0NDIq/wvczcg
         LVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RD4xUDZuCe1wEZ3uQByJXB39CveNW2Qc0Hvr7tXsRJs=;
        b=TEeOZuLXBOAkZAgyrldstXBLu+BLKTTz9m7jnwVU8aeeP64XkGWltopApY1MlUEdV9
         /HLWgIpAoAjYrEcfky27ve+0yCkAH7z/smdvZvOu/0ANiMgd3HxRSpHXZKzu2ggL/Brc
         2BuMg/FSqWVqfjGtvb/BDgaSp6cCnONSDk2tzOJOG06O4Gz+bJ2Dd11y63MEkGx7i/Xd
         9ofZCRnWpXdKAdNyod3YabXukPYVezkirRVrkWjS56eRxk5rq0yOpwdNpTzd+7LQtKh2
         ZBQoznbsBXMIqEr+9LFIT73vJg4wxntOkABzdBfHYvUPx0Hw52GtbKtBl73/CHSmEVky
         CHyw==
X-Gm-Message-State: AOAM532nV0/nhdStbrlwzk/0f38RceqcP0pImCGIh8rXbyXwR+imooDK
	Au1/NK1PJeQ58sZ7CmbLrrk=
X-Google-Smtp-Source: ABdhPJyJpYAyhxm8BFVgbRH6hxthIt6tO7a7NutbSFexoL+fixZryLFYEteqplW4/PNJnVgtiu5SWw==
X-Received: by 2002:a17:903:31c3:b029:ed:6f74:49c7 with SMTP id v3-20020a17090331c3b02900ed6f7449c7mr3858261ple.12.1624534235272;
        Thu, 24 Jun 2021 04:30:35 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id q27sm2796735pfg.63.2021.06.24.04.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 04:30:34 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 24 Jun 2021 19:25:00 +0800
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 16/19] staging: qlge: remove deadcode in qlge_build_rx_skb
Message-ID: <20210624112500.rhtqp7j3odq6b6bq@Rk>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-17-coiby.xu@gmail.com>
 <20210622072939.GL1861@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210622072939.GL1861@kadam>

On Tue, Jun 22, 2021 at 10:29:39AM +0300, Dan Carpenter wrote:
>On Mon, Jun 21, 2021 at 09:48:59PM +0800, Coiby Xu wrote:
>> This part of code is for the case that "the headers and data are in
>> a single large buffer". However, qlge_process_mac_split_rx_intr is for
>> handling packets that packets underwent head splitting. In reality, with
>> jumbo frame enabled, the part of code couldn't be reached regardless of
>> the packet size when ping the NIC.
>>
>
>This commit message is a bit confusing.  We're just deleting the else
>statement.  Once I knew that then it was easy enough to review
>qlge_process_mac_rx_intr() and see that if if
>ib_mac_rsp->flags3 & IB_MAC_IOCB_RSP_DL is set then
>ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HV must be set.

Do you suggest moving to upper if, i.e.

         } else if (ib_mac_rsp->flags3 & IB_MAC_IOCB_RSP_DL && ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HS) {

and then deleting the else statement?

>
>regards,
>dan carpenter
>

-- 
Best regards,
Coiby
