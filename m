Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7967772
	for <linux-staging@lists.linux.dev>; Sun,  9 May 2021 23:55:59 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so9237565pjb.4
        for <linux-staging@lists.linux.dev>; Sun, 09 May 2021 16:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B9gNzdRw34AgzKGQuey0qxX87HsKelUILGaPj7Ys504=;
        b=pcO/n70f/cgwzhG1tZO74Xru0BhOsTUZYMiJhMCrVapTGgCHq8q99MfqcKSLdjmmgS
         3gsLfrsKrYVPiOQWm3e5aPCp2OX6WRa6aiDnV70HGLY27LCdKCPRS7Yl33aVDq7BxJF2
         ykUBCkWmsRqXeacpjxJYFcvBkuJBWUbZVqrGzbDYNfx5m4CsZCsp7hgEiE0LZn+NgJ+d
         k2SmxYngOVJzwvEZ3cezugqoeU8m/yzvKRSDSJ5CJtvOqNMRabNyPd8Ol9Z13ODOAzHS
         8gxnIubXyxGkzEGa6VTA754Vi9cARZ3nUFaHBEa4q3VRenm+/GdUQosxMwflbhUwZXox
         uz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B9gNzdRw34AgzKGQuey0qxX87HsKelUILGaPj7Ys504=;
        b=DjFjeidjlGFSitOt8ERW6nlcwf65x7PrdUC8W/opAarxUN/mIZltqskiKAQwCVUkQL
         y02VDpszU1lEkw6zGcjeHvtztdIbRcD69qXf91dHe6A7tTtIbldbzB2zJzRNv/gB6/HD
         XIMHlWP91/LJnFSIzKp3yA6noPa8+YX8iNX3MFQhOnUq9340rOg8J2SwI92fNQ7kPwBN
         zinw/R+8750cnj/Uw/ol35gmayFZprWu1YJIQafNP2gq5VKvtSFyTmG0NFz6+/pwuIp5
         e4ZmokjnzBWkd9mAIHZpmJOqzD50gG8ukXZcBesBLXMGMcjwNDY78nTazDrZUID3odJR
         C60Q==
X-Gm-Message-State: AOAM531O6q2qq52XD24j5QOa7StYqX/svNSz24ktQzu2uQpP2b6cksih
	8GcV2vPEjtn1eO3mVY6Fjzc=
X-Google-Smtp-Source: ABdhPJyQEojhzKrDg07sKTXPdVehOmwD/kF2+y6cuTjr/gme13aSPBjJSusr81PtDwWs+x8HJAYK9w==
X-Received: by 2002:a17:90b:182:: with SMTP id t2mr23785579pjs.138.1620604558988;
        Sun, 09 May 2021 16:55:58 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id p36sm9414297pgm.74.2021.05.09.16.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 16:55:58 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Mon, 10 May 2021 07:54:05 +0800
To: Benjamin Poirier <benjamin.poirier@gmail.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: About improving the qlge Ethernet driver by following
 drivers/staging/qlge/TODO
Message-ID: <20210509235405.skx6vr2tulbxx53i@Rk>
References: <20210504131421.mijffwcruql2fupn@Rk>
 <YJJegiK9mMvAEQwU@f3>
 <20210507013239.4kmzsxtxnrpdqhuk@Rk>
 <20210508232705.6v6otnlphabfsgz7@Rk>
 <YJeUZo+zoNZmFuKs@f3>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YJeUZo+zoNZmFuKs@f3>

On Sun, May 09, 2021 at 04:51:02PM +0900, Benjamin Poirier wrote:
>On 2021-05-09 07:27 +0800, Coiby Xu wrote:
>> On Fri, May 07, 2021 at 09:32:39AM +0800, Coiby Xu wrote:
>> > On Wed, May 05, 2021 at 05:59:46PM +0900, Benjamin Poirier wrote:
>> > > On 2021-05-04 21:14 +0800, Coiby Xu wrote:
>> > > > Hi Benjamin,
>> > > >
>> > > > As you have known, I'm working on improving drivers/staging/qlge. I'm
>> > > > not sure if I correctly understand some TODO items. Since you wrote the TODO
>> > > > list, could you explain some of the items or comment on the
>> > > > corresponding fix for me?
>> > > >
>> [...]
>> > >
>> > > However, in the same area, there is also
>> > > 			skb = netdev_alloc_skb(qdev->ndev, length);
>> > > 			[...]
>> > > 			skb_fill_page_desc(skb, 0, lbq_desc->p.pg_chunk.page,
>> > > 					   lbq_desc->p.pg_chunk.offset,
>> > > 					   length);
>> > >
>> > > Why is the skb allocated with "length" size? Something like
>> > > 	skb = napi_alloc_skb(&rx_ring->napi, SMALL_BUFFER_SIZE);
>> > > would be better I think. The head only needs enough space for the
>> > > subsequent hlen pull.
>> >
>> > Thanks for the explanation! I think this place needs to modified. I'll
>> > try to figure out how to reach this part of code so I can make sure the
>> > change wouldn't introduce an issue.
>>
>> After failing to reach to this part of code, it occurred to me this
>> may be what the first TODO item meant by "dead code" that handle
>> non-split case,
>>
>> > * commit 7c734359d350 ("qlge: Size RX buffers based on MTU.", v2.6.33-rc1)
>> >   introduced dead code in the receive routines, which should be rewritten
>> >   anyways by the admission of the author himself, see the comment above
>> >   ql_build_rx_skb(). That function is now used exclusively to handle packets
>> >   that underwent header splitting but it still contains code to handle non
>> >   split cases.
>>
>> Do you think so?
>
>Yes
>
>> Btw, I think you meant commit 4f848c0a9c265cb3457fbf842dbffd28e82a44fd
>> ("qlge: Add RX frame handlers for non-split frames") here. Because it was in this
>> commit where the ql_process_mac_split_rx_intr was first introduced,
>>
>>     -static void ql_process_mac_rx_intr(struct ql_adapter *qdev,
>>     +static void ql_process_mac_split_rx_intr(struct ql_adapter *qdev,
>>                                        struct rx_ring *rx_ring,
>>     -                                  struct ib_mac_iocb_rsp *ib_mac_rsp)
>>     +                                  struct ib_mac_iocb_rsp *ib_mac_rsp,
>>     +                                  u16 vlan_id)
>
>It's possible that I referenced the wrong commit in the TODO. Clearly
>there is dead code after commit 4f848c0a9c26 ("qlge: Add RX frame
>handlers for non-split frames.") like you say. I don't remember for sure
>if I had found some before even before that.

Thanks for confirming it:)

>
>>
>> Another TODO item I don't understand is as follows,
>> > * the driver has a habit of using runtime checks where compile time checks are
>> >  possible (ex. ql_free_rx_buffers(), ql_alloc_rx_buffers())
>>
>> Could be more specific about which runtime checks are used in
>> ql_free_rx_buffers and ql_alloc_rx_buffers?
>
>This specific example was fixed in commit
>e4c911a73c89 ("staging: qlge: Remove rx_ring.type")
>
>I forgot to update the TODO when making that commit.
>
>Here are other examples:
>a68a5b2fd3a2 ("staging: qlge: Remove bq_desc.maplen")
>16714d98bf63 ("staging: qlge: Remove rx_ring.sbq_buf_size")
>ec705b983b46 ("staging: qlge: Remove qlge_bq.len & size")

Thanks for giving these examples!

>
>I don't remember of remaining examples to point you to. Maybe there
>aren't but given that there were indeed quite a few, I would suggest
>that you look at those commits and keep this item in mind as you work on
>the other items earlier in the list. If at the end you think that this
>is no longer a problem, then remove it from the list.

OK. I'll keep this item in mind. Thanks for the reminding!

-- 
Best regards,
Coiby
