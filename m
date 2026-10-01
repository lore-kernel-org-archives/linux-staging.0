Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1233C3E49D8
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851368; cv=none; b=HkEa1Tsej1GlpcUyKUDAzXicoxzXJ6ke+vE9jv+20qJE/nfUMHT6hwKYkAI8prdKanxktFeEDwBaa9kLptfwI54GtdWqXLqG+VqavQH51sDrMY+uQAJXeUqfnDoZoNUinzgVrMycWzSFmZatkTx48E8yogxo9IIVCVpmfXBuBkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851368; c=relaxed/simple;
	bh=lEoXV1QFxcBBPNnfpdpaqnedrBNV6euredLXJ07PvbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnYUbH9Mkknq4MCxhHhiorZjTkOBXHLyBCnQ/3bqAaEAtwVkGW+1LH1Ok4cgI5H2vgUjSM0eFpzMcSbb3Q+6EJ9EJz+WYfspMr3DQQLd7lP13S0gZx/GZLqagQR5dIDJU0wLvTH8QbKxYa5ysXvx9KAHqlx86Z4X4Wjhg1PiFGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCYBUy93; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCYBUy93"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e35c3bbdbso93319466b.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 03:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790851358; x=1791456158; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+64khRp4KbgkO8juqqsE5rAagecy3Xz4KrJ45qjCyjs=;
        b=sCYBUy93n8NhxGHQmF9HgELFskkyu3LD0W45XfZL13PhhKhPiNWow2f+ipcGk1xcAM
         rZD9iWAGwGXtIJO9yu1hLFaFQx0KkAazWQ5PVAx0KQd8PLVjNddUrtnTkcnljI2IDBDP
         Nd4lHMs+EiabhbuVZywgjlhyPAZqYpvxrNeXjCX8KgUG8nVdIEtX2c93tDWHdB68Vyna
         4769W4PEZFx5aYjkKwObha5vp/KV3nFukF5Px3fg4ouTfZgImJ4pTYqpBc8dBYb4DHb8
         pGApZDNh14m0rkWZAPRDHOJ+tR3XGGq8uSEkznbaO3C5d5dzxPxRWM7mgVjbpKsJtonq
         Opvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790851358; x=1791456158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+64khRp4KbgkO8juqqsE5rAagecy3Xz4KrJ45qjCyjs=;
        b=MIVUgUajecdvZnPmX5JdPKrTkPaySZlcACyVAn6Epy2HYwtPUNm+6EkGcbnOGdQp/g
         T4+gjIR85tWuFF1y3MB5iitrMd1zec7xegq7gWBCaXwFwaTNK/YM75nfvP4kFveiajH0
         0Jbfz79Hks0FQ54u3jcj5C2wnf0brgH0chXxavGKV04KUHnIkqXBUJKAh3fbrZ3du3J8
         0eGU8YoxCXax3+4BAKYWQgZT9AzfRTIHjyzZgyyziekDbknee6SwL+spF55Clq0ROtS4
         +LR+80kTz1Zapeejva8Gof127+C5xdSgTGNkaKc2rbZxJodAjcKnwUwl/aXRzK3TOuEK
         AXIQ==
X-Forwarded-Encrypted: i=1; AKwUvByowzjyc778FP7K6NmyFKf2/OVH04FIW6iR+ztNQedxdGZ+qvoVv4UG6zs+EJ5bcmvyV3FPy25h15B1Ytzh@lists.linux.dev
X-Gm-Message-State: AFuF++lkTIaVR9kk1MUkmy1Zjyy5L6EqASg+jF1xbzmkfeXsU4zIm4wV
	ZcafknPxUogPQJlJ+RjGV2T0AHOPypfm3bUcUgj6k3Jf7CD3MZdsmUaV
X-Gm-Gg: AYBFou3McwEh24wPBs1ZHWSPnPiqkGedf8LodWHVQ4Lb1h/cIFQQ/nU64kVcTX8HO+D
	19+u3c/0+t7zLF4fzZuNggKimhZOAIoceSKnRPKzcmkAwI19I6ctlag0lzVSlwnoDjBzJ8kyUyP
	NZpwwWn+YpgaF4veMYE97r8XSUd0xVfmp8YNY3hXfUmK92fhZUb5U6XLlx3sM7G1QWkFYSPniBU
	v8CePa2OiSNtfm0wle0xNd66znAAAM1/Lo3IYwOs0xvtsFuUQynG/RSeIXfFrSkmVhTwMNzx/iB
	3kkfpcmiBp5bvYEAlqpjrkg3B1XNV9zGsrKTeRmUpUHAxCgJ4cZtCZdNx5qfdjIhcKS6Hx+mk/W
	gyrMPFk5VyVT6jp5AqMAAgQ/+3/b99fkzX1hHPw5YRZ8g8EHx1U+fKWohYitBRycyyEtvHLU4ks
	5c8wUMOAOhEm7NmEa4TG5tQ6SGCJ47dq21vqReqQ7o6kKyOjd0WW/lSRHiU9dCOrnhtsg=
X-Received: by 2002:a17:907:60d0:b0:c2d:ca32:217a with SMTP id a640c23a62f3a-c2e23da3c15mr328686966b.33.1790851357626;
        Thu, 01 Oct 2026 03:42:37 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c93c31sm131768866b.11.2026.10.01.03.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:42:37 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:42:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Eric LI (Honggang)" <eric.lee0305@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor xmit_xmitframe
Message-ID: <ar45GeQXJ-dIUw91@stanley.mountain>
References: <20260924151606.333467-1-eric.lee0305@gmail.com>
 <2026100121-chirpy-stomp-9fbe@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100121-chirpy-stomp-9fbe@gregkh>

On Thu, Oct 01, 2026 at 11:34:30AM +0200, Greg Kroah-Hartman wrote:
> > +					if (pxmitbuf->len > 0 &&
> > +					    pxmitbuf->priv_data) {
> > +						struct xmit_frame *pframe;
> > +
> > +						pframe = (struct xmit_frame *)pxmitbuf->priv_data;
> > +						pframe->agg_num = k;
> > +						pxmitbuf->agg_num = k;
> > +						rtl8723b_update_txdesc(pframe, pframe->buf_addr);
> > +						rtw_free_xmitframe(pxmitpriv, pframe);
> > +						pxmitbuf->priv_data = NULL;
> > +						enqueue_pending_xmitbuf(pxmitpriv, pxmitbuf);
> > +						/* can not yield under lock */
> > +						/* yield(); */
> > +					} else
> > +						rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
> > +
> > +					pxmitbuf = NULL;
> 
> This jumped out at me, why add this new line?
> 

The patch is correct but the new version is as confusing as heck...
Glad that I'm not the only person who thinks this.  I've been doing
more and more AI coding these days and they say that AI makes you
stupid so I was worried about my own brain health.

regards,
dan carpenter
