Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE729A8
	for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 18:55:24 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id e18so14463505edj.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 11:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=bqugloM2Y8aCi2qG8p8+F3ThQcJ5AIPxECmn/x8eIrE=;
        b=gfTPM688gx3l4YGXoxDheh7RTGwuc1anuKv0KAlFX69irHqoTuLdvxsF9FZ0eZLr2+
         wZ+Qo5KAN2VRFOtpTGOOruZZq+BdxNXF7QLLH1BWSXjyTjZLPaa90R8k/VKET3kwYtuV
         N+JLXfLGX4TfdCn0d6hmH4ncVcBLF11gmclSXCetPRGdnYHDfN55nZc106Wtm/X7Sz5X
         l/CPLefs10eJtd+NAqCWXUbyW16gS55SbtQpPMesEh9jxu3vzZsqKG2wpeKnQQnNuzzF
         lxecDk7poz4ALQbfsxrXfwnI72k39P64G92deX+WC4PYu1hR2zoyYict3eW7qckr/E1Q
         mt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bqugloM2Y8aCi2qG8p8+F3ThQcJ5AIPxECmn/x8eIrE=;
        b=eiE/BGXNI16jjOACuqkZ80eQwKTLLt2HNPu6HB7JGZ3SYr7mbNA3PDm0EX060Sd8na
         sVKT8vCZwiuCQAOX/tJmiBhuTdEx+hJC1zEvMyhxtQ01mguDHOXN5nIL93yUyRr+T2e8
         IvtkiI53ex4aQZVrOeoN6x+/m9PCRlMm9eaV2ybaR3afWzM/Sf7/uU93fHpL3oBYAnRs
         GcP6gRzu+1pi7CEtqq/gQufpvkjW8ATVt43OFBG3rm6siWyAUT4thV5ionJ3iuwSSWZc
         TVIa31oDvoTM5ppUcLw1NClMY2WyAHWS7i+Q4HRy4YAHJCiOh6xyU57Dw0j0wXiTeMst
         1bPg==
X-Gm-Message-State: ACrzQf3dGMnhBphJe0a1rnw01x8oJ09hDdC8XgLDBe7y0dMzMzc0s9bZ
	T0vfvNI4w1gqIphtgMhPyW4=
X-Google-Smtp-Source: AMsMyM6o4kD/jMy/qV1H8hi9Mufy6mNrUfOfSgn8r7b92/kZHkUcAotx6FFAoyCoCEmrNAybQbW43g==
X-Received: by 2002:a05:6402:1f89:b0:453:8093:c4e5 with SMTP id c9-20020a0564021f8900b004538093c4e5mr29842996edc.182.1664304922581;
        Tue, 27 Sep 2022 11:55:22 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-158.ip.prioritytelecom.net. [217.105.46.158])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906318d00b0078128c89439sm1199457ejy.6.2022.09.27.11.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 11:55:22 -0700 (PDT)
Date: Tue, 27 Sep 2022 20:55:06 +0200
From: Nam Cao <namcaov@gmail.com>
To: philipp hortmann <philipp.g.hortmann@gmail.com>
Cc: Shang XiaoJing <shangxiaojing@huawei.com>, gregkh@linuxfoundation.org,
	wjsota@gmail.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH -next] staging: rtl8192e: cmdpkt: Use skb_put_data()
 instead of skb_put/memcpy pair
Message-ID: <20220927185506.GA32477@nam-dell>
References: <20220927024220.14044-1-shangxiaojing@huawei.com>
 <20220927183110.GA16965@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927183110.GA16965@matrix-ESPRIMO-P710>

On Tue, Sep 27, 2022 at 08:31:10PM +0200, philipp hortmann wrote:
> Tue, Sep 27, 2022 at 10:42:20AM +0800, Shang XiaoJing wrote:
> > Use skb_put_data() instead of skb_put() and memcpy(), which is shorter
> > and clear.
> > 
> > Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> > ---
> >  drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
> > index cd8bbc358d01..57b4c8433e8e 100644
> > --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
> > +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
> > @@ -61,8 +61,7 @@ bool rtl92e_send_cmd_pkt(struct net_device *dev, u32 type, const void *data,
> >  			tcb_desc->txbuf_size = frag_length;
> >  		}
> >  
> > -		seg_ptr = skb_put(skb, frag_length);
> > -		memcpy(seg_ptr, data, (u32)frag_length);
> > +		skb_put_data(skb, data, frag_length);
> >  
> >  		if (type == DESC_PACKET_TYPE_INIT &&
> >  		    (!priv->rtllib->check_nic_enough_desc(dev, TXCMD_QUEUE) ||
> > -- 
> > 2.17.1
> >
> Applying: staging: rtl8192e: cmdpkt: Use skb_put_data() instead of skb_put/memcpy pair
> error: patch failed: drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c:61
> error: drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c: patch does not apply
> Patch failed at 0001 staging: rtl8192e: cmdpkt: Use skb_put_data() instead of skb_put/memcpy pair
> 
> Sorry 
> Bye Philipp

I think this patch has already been applied to staging-testing..

Best regards,
Nam
