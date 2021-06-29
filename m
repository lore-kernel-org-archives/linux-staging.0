Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC66168
	for <linux-staging@lists.linux.dev>; Tue, 29 Jun 2021 13:37:06 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id g24so12469358pji.4
        for <linux-staging@lists.linux.dev>; Tue, 29 Jun 2021 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zio1lOhtG4EyFNe7HsOIIbxHd7wmDa19V1E41XFuv1o=;
        b=QKqCSEbf3r5/3ahfxkCWiGFGWMm2Gv2lEAIFmzvp6SohntKV+rz/kKv4TsSqFDMmqJ
         x2d29scCzZEI9dBPJCiS3U0tRQC12fdJbUAbL9LDs21f04ftV2mQ+DyY/ikZh0MCXsRS
         qO9MH9rpeiObY6b3ShJyUi+cNDTt3uKN6kxNg9SV5/+hM5pMuKqUTM3UTb+iEkeALkUV
         qdbIYUwIExxLXIhB/DbFu3T5EJ9MqgryNjGcJftUaN+eoSA4S7V5/XVT/6UNUsgzEKU5
         pAKiRaWwDJf6b8LWnFPcU0qOsc6EHAJ60+hZr+KkBZ6nwbWlb/9f0q0QWgIHW26V4+iL
         rPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zio1lOhtG4EyFNe7HsOIIbxHd7wmDa19V1E41XFuv1o=;
        b=E/Zcf6KHPDxFv/ZHsZUNgVakBxqZ8cBw+JU0j7GSGXM0qiaPFV/SvVe8wYauQF88Pi
         am/76nIL/oWzchXoP0JaLvqbrrf14QXv6SW8lM3i89RNVedajgg1pt37dzKF5qSjAArW
         +B88noJZhvPMoHwG8wDdeNphCEGr7z9Bw8yCrGJFeix2R3+h06XHzG8SbUtsJo5nmDyi
         5xjL+0x2yp5rjx1dCR4vDu+DCnkpGulyRwTI1lPTix1Byi/k5yLeSsQ86aIbA0Ys/Z21
         WLLDaMvRFbxZo2oyNOvef+Mg/ju7L33TIf8cK4zA3RfKjQT8N+55PafYv64YeXoZ4m5D
         HAcA==
X-Gm-Message-State: AOAM533tM6H3NQ+LVmUJYGoPjhAXahkvRhvPB4b1u7bYt+kbYuA2HC45
	x41+cgRm0SEffyuOXzY1Cc0=
X-Google-Smtp-Source: ABdhPJxT9XmVbs1wB+Pc8OCoEZk0cTF8wXN2v0ua6UfCpRvCCjvao0T2oxjaCqTrrcdWeD8WjxoTLw==
X-Received: by 2002:a17:902:ea0e:b029:128:ad9a:8c68 with SMTP id s14-20020a170902ea0eb0290128ad9a8c68mr17955940plg.68.1624973825988;
        Tue, 29 Jun 2021 06:37:05 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id m2sm3549327pja.9.2021.06.29.06.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 06:37:05 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Tue, 29 Jun 2021 21:35:41 +0800
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 16/19] staging: qlge: remove deadcode in qlge_build_rx_skb
Message-ID: <20210629133541.2n3rr7vzglcoy56x@Rk>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-17-coiby.xu@gmail.com>
 <20210622072939.GL1861@kadam>
 <20210624112500.rhtqp7j3odq6b6bq@Rk>
 <20210624124926.GI1983@kadam>
 <20210627105349.pflw2r2b4qus64kf@Rk>
 <20210628064645.GK2040@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210628064645.GK2040@kadam>

On Mon, Jun 28, 2021 at 09:46:45AM +0300, Dan Carpenter wrote:
>On Sun, Jun 27, 2021 at 06:53:49PM +0800, Coiby Xu wrote:
>> On Thu, Jun 24, 2021 at 03:49:26PM +0300, Dan Carpenter wrote:
>> > On Thu, Jun 24, 2021 at 07:25:00PM +0800, Coiby Xu wrote:
>> > > On Tue, Jun 22, 2021 at 10:29:39AM +0300, Dan Carpenter wrote:
>> > > > On Mon, Jun 21, 2021 at 09:48:59PM +0800, Coiby Xu wrote:
>> > > > > This part of code is for the case that "the headers and data are in
>> > > > > a single large buffer". However, qlge_process_mac_split_rx_intr is for
>> > > > > handling packets that packets underwent head splitting. In reality, with
>> > > > > jumbo frame enabled, the part of code couldn't be reached regardless of
>> > > > > the packet size when ping the NIC.
>> > > > >
>> > > >
>> > > > This commit message is a bit confusing.  We're just deleting the else
>> > > > statement.  Once I knew that then it was easy enough to review
>> > > > qlge_process_mac_rx_intr() and see that if if
>> > > > ib_mac_rsp->flags3 & IB_MAC_IOCB_RSP_DL is set then
>> > > > ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HV must be set.
>> > >
>> > > Do you suggest moving to upper if, i.e.
>> > >
>> > >         } else if (ib_mac_rsp->flags3 & IB_MAC_IOCB_RSP_DL && ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HS) {
>> > >
>> > > and then deleting the else statement?
>> > >
>> >
>> > I have a rule that when people whinge about commit messages they should
>> > write a better one themselves, but I have violated my own rule.  Sorry.
>> > Here is my suggestion:
>> >
>> >    If the "ib_mac_rsp->flags3 & IB_MAC_IOCB_RSP_DL" condition is true
>> >    then we know that "ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HS" must be
>> >    true as well.  Thus, we can remove that condition and delete the
>> >    else statement which is dead code.
>> >
>> >    (Originally this code was for the case that "the headers and data are
>> >    in a single large buffer". However, qlge_process_mac_split_rx_intr
>> >    is for handling packets that packets underwent head splitting).
>>
>> Thanks for sharing your commit message! Now I see what you mean. But I'm
>> not sure if "ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HS" is true when
>> "ib_mac_rsp->flags3 & IB_MAC_IOCB_RSP_DL" is true.
>
>Well... It is true.  qlge_process_mac_split_rx_intr() is only called
>when "->flags4 & IB_MAC_IOCB_RSP_HS" is true or when
>"->flags3 & IB_MAC_IOCB_RSP_DL" is false.

Actually qlge_process_mac_rx_intr calls qlge_process_mac_split_rx_intr when 
"ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HV" is true or in the last else,

     /* Process an inbound completion from an rx ring. */
     static unsigned long qlge_process_mac_rx_intr(struct qlge_adapter *qdev,
     					      struct rx_ring *rx_ring,
     					      struct qlge_ib_mac_iocb_rsp *ib_mac_rsp)
     {
         ...
     	if (ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HV) {
     		/* The data and headers are split into
     		 * separate buffers.
     		 */
     		qlge_process_mac_split_rx_intr(qdev, rx_ring, ib_mac_rsp,
     					       vlan_id);
     	} else if (ib_mac_rsp->flags3 & IB_MAC_IOCB_RSP_DS) {
             ...
     	} else {
     		/* Non-TCP/UDP large frames that span multiple buffers
     		 * can be processed corrrectly by the split frame logic.
     		 */
     		qlge_process_mac_split_rx_intr(qdev, rx_ring, ib_mac_rsp,
     					       vlan_id);
     	}

So I think we can't say that if "ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HV" 
is true,  then "ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HS" must be true. And 
I don't know how to reach the conclusion that the last else means 
"->flags3 & IB_MAC_IOCB_RSP_DL" is false.

>
>To me the fact that it's clearly dead code, helps me to verify that the
>patch doesn't change behavior.  Anyway, "this part of code" was a bit
>vague and it took me a while to figure out the patch deletes the else
>statement.
>
>regards,
>dan carpenter
>

-- 
Best regards,
Coiby
