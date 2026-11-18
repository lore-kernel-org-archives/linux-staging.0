Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993640;
	b=Elm+Z3anXACOZgfNuESfgSg0OQylbmgLuvoOHydVxdvSER5KgEDBeHPpXbNInhzGiAc0
	 jRr47JmwrYbc92BWVSEVOVEXEjB29+9/E/rZTlN1uA9bSYmcUEg83PYAnwSRScHJXVVm7
	 5wdZw+kt18XdhJTXGRG5LilxYE//gYkQ3qBX9p+HfS3AbR1tsIY7xq9v2EE2FUWggzI+Z
	 dueuG5n3P0R0PO74Ciy9psjL/V2xHrhqW9YACjYiQ5ytTme+DtzYvc9GsNeJ3B3Dj+AXn
	 rsG9cjBDKcrfIyQpOHGV0dvI5FKPUswWucI/lzWsbPn+gUtDUWIzDnfi4irob2W8QkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7G2JleZyR72mUGx/SlF6TitvE9bUJJx/pf31x7lthho=;
	b=37X5O/vCbtIrXYBjNG8MRWe24Rdq8Hfvxub5VqygwTC3/8UtYWwI13ampcjwN/hqxbCw
	 i1QitJEkUmBn2o+cqtt2/KdmxE1nM3OMqpxASTSNDvEV3K7c3JyJmjw1AVlhfVMHs0LSl
	 mXsdG3MLylIVLOwTsxTOajWeVrnUIyUh3GEYyz+KmUP0Z2I4uQQ0gQKBwbjwqfhea0xTn
	 cZRCmr0syi9JunSTbgvHXvgjfjgvsBDp0SZrGamMLaHVhu9uPAJki0epcOOGCaSrOv9SN
	 qpcZ3jF/Vw5sZNHpHiSz2OW6utFT04lvCYvshdZgj2f7uHA3nvdldPGGMJefQbgKfHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/LKAZ5/";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908EF606A333
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 09:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 908EF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/LKAZ5/
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso6345405e9.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 01:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794993639; x=1795598439; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7G2JleZyR72mUGx/SlF6TitvE9bUJJx/pf31x7lthho=;
        b=m/LKAZ5/lrjKO7eGReLuBAxljRiNMIZw1UMDFWqmd+vObv+Qxu5+a/W/+Jt5oVBm05
         wGVPGykYNXhO3BQftAZByPv88aeWCMH/4y43XfxoykgRJbdDCdujHLlxZebppTNLnGIb
         VyxqSh8v7AVGbiSA3JqNweupk7aqAN4SkZQBOurFAmyx3rvQimrJkU9IDpXy8HZ5Zdl3
         NmdKVhp3Wizk/kd65u2Wb2BYN3weZy6AMdsMD0yTCWlg7IyfEKnVQRlfvLP7wIzCaGa1
         YwLU6kWcPxppJnDazsnfYpMXmYiCgyxoesqFtOvbLLyN6H1Xd3KVE1xyN39me2qsJ/f2
         xwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993639; x=1795598439;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7G2JleZyR72mUGx/SlF6TitvE9bUJJx/pf31x7lthho=;
        b=rLYHW1kjReQyYxSEbFJrBq/CmLvIZ9//GjM7jxJjw5OI+aGkSjKXtnwnWCuhRdEcqM
         oie0m5Teft9x7izcqAIoNhlDAUaKVZU+mpzkk6Qm2oI/h3wR8xU9lBpxdpYXHy2MtreE
         DU/mqDAy9nol+ARVWNwklAX/4GM0Zv7aiJLAgVvk0NVJ7PJyTqSujjB3prneX+BX4l/z
         5jaqrXL2VfnoGfIonEuwdWj9vy1LYNxVsSbjZOjjZm2IRAjGB4XZhUD8Eeq5p5NTgys5
         zfmzbevhEx9LWxoxZ+kXaAfasw0ZDn4+GwxhK5z12NAqac8UYpxJDtHcrzNLCYLMDipm
         g4zw==
X-Forwarded-Encrypted: i=1; AL+hErFj+PpOIvhDj+tYpza8VpOZJIaQKN8uLT1HEnn2oRwuH7g0kBv34Vn6tUpSh/XH/BiOu3LtYSOE22q/vZeV@lists.linux.dev
X-Gm-Message-State: APuU4Z/zmAtJ1j2yqyOspo7tAHVX7+65nrUSShURsg+aW/1gEVdYGgPX
	u0vQPisFhiCbTS1jpgXtUfRxTA0Kr+eICRuHzSBoTEWf5xUFUhF1cvGH
X-Gm-Gg: AYBFou1tOPLm5n7tYKMDsazQbMW5I76mfgI7nwjLjDofoCy4lsFiUucYXlxJWuBAeTn
	NUVfhFMp+iopb5MqHXDR/OHhqPKyMCPMeFiwsWYLTvOu33P9LLTEB+Co83msmytZ5P+3h7i+4HL
	CHmcSm+1axfhiHASWSwE15LcCVHXOFWqrlDnxmzFaGiKxUB8jVKbFWXjZGrDeez3VRjDYXg1RMT
	0z7Tuid14LsAyDB8RosF/1qSf978bFyvE2kZm8MCRmAyANQCNrOwHdhooyZDirMctV5xPDvYMzO
	AS8lhSEPhKAGy+9TFF/LIwYgsPHec9h1pwa5Wwig4VjwoojDJZJHd9kq0+i+a7LGDNpaooHZB1J
	waZK/oQQKn9BV5AmClZgAS62/820eWzi4187FHAs7Y41NerIMXDWeV872xAzBqMsVr7Gd7qqgYq
	POV/tF6daIBRqJ0zKhnn86NjbQ/7PEdASi0gK5BYKTiw6RLLzSGHWNHUAb06oW/Y/j7eOBsu7gO
	kfgCkOSK5hiGBlnDc8S7kp+e6w22TCXKaiFysPCbuXonHXiFn2OiInKeSEK9B/CTudduFKxr0Dr
	XyuZARXE/xhNTp624lY5KocNyP4Vo9qwPjotV0ugKUJvkoj2pm762jzyweR7GLJU5YBNZFKmc9+
	BNVHptBdJ9zzT7G3g2+jxzGmsl9jbHUnGFrvbmbAgUl7TGqb3G21v2ShHHCHTIZMf5JHq
X-Received: by 2002:a05:600c:4f14:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb7d6cc934mr40618635e9.1.1794993638760;
        Wed, 18 Nov 2026 01:20:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2aad96sm42979355e9.6.2026.11.18.01.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:20:37 -0800 (PST)
Date: Wed, 18 Nov 2026 12:20:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shivani Patel <patelshivani2283@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3 1/2] staging: most: video: Protect pending_mbos and
 mute with list_lock
Message-ID: <av1t4DbqGsmUmrZJ@stanley.mountain>
References: <20261117170558.33844-1-patelshivani2283@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117170558.33844-1-patelshivani2283@gmail.com>

On Tue, Nov 17, 2026 at 10:35:57PM +0530, Shivani Patel wrote:
> data_ready() and get_top_mbo() read mdev->pending_mbos without holding
> mdev->list_lock, racing with comp_rx_data() which modifies the list
> under mdev->list_lock. Also, comp_vdev_close() clears mdev->mute without
> holding mdev->list_lock.
> 
> Acquire mdev->list_lock in data_ready(), get_top_mbo(), and when
> clearing mdev->mute in comp_vdev_close(). Use list_first_entry_or_null()
> in get_top_mbo() so comp_vdev_read() can drop the redundant data_ready()
> check inside the read loop.
> 
> Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
> ---
> v3:
>  - New patch added after inspecting list_lock usage per Dan Carpenter's
>    review of v2.

Huh...  This is interesting.

> 
>  drivers/staging/most/video/video.c | 34 ++++++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 3a0445ff6..92d5fbc9a 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -60,14 +60,27 @@ static inline struct comp_fh *to_comp_fh(struct file *filp)
>  static LIST_HEAD(video_devices);
>  static DEFINE_SPINLOCK(list_lock);
>  
> -static inline bool data_ready(struct most_video_dev *mdev)
> +static bool data_ready(struct most_video_dev *mdev)
>  {
> -	return !list_empty(&mdev->pending_mbos);
> +	unsigned long flags;
> +	bool ready;
> +
> +	spin_lock_irqsave(&mdev->list_lock, flags);
> +	ready = !list_empty(&mdev->pending_mbos);
> +	spin_unlock_irqrestore(&mdev->list_lock, flags);
> +
> +	return ready;

It doesn't really matter if we take the lock where since we drop it
right away.  The list_empty() doesn't anything that requires locking
so far as I can see.

>  }
>  
> -static inline struct mbo *get_top_mbo(struct most_video_dev *mdev)
> +static struct mbo *get_top_mbo(struct most_video_dev *mdev)
>  {
> -	return list_first_entry(&mdev->pending_mbos, struct mbo, list);
> +	struct mbo *mbo;
> +
> +	spin_lock_irq(&mdev->list_lock);
> +	mbo = list_first_entry_or_null(&mdev->pending_mbos, struct mbo, list);
> +	spin_unlock_irq(&mdev->list_lock);
> +
> +	return mbo;
>  }
>  
>  static int comp_vdev_open(struct file *filp)
> @@ -143,7 +156,9 @@ static int comp_vdev_close(struct file *filp)
>  	}
>  
>  	most_stop_channel(mdev->iface, mdev->ch_idx, &comp);
> +	spin_lock_irq(&mdev->list_lock);
>  	mdev->mute = false;
> +	spin_unlock_irq(&mdev->list_lock);


I don't see the point of protecting ->mute.


>  
>  	v4l2_fh_del(&fh->fh, filp);
>  	v4l2_fh_exit(&fh->fh);
> @@ -175,10 +190,15 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
>  	if (!data_ready(mdev))
>  		return -EAGAIN;
>  
> -	while (count > 0 && data_ready(mdev)) {
> +	while (count > 0) {
>  		struct mbo *const mbo = get_top_mbo(mdev);
> -		int const rem = mbo->processed_length - fh->offs;
> -		int const cnt = rem < count ? rem : count;
> +		int rem, cnt;
> +
> +		if (!mbo)
> +			break;
> +
> +		rem = mbo->processed_length - fh->offs;
> +		cnt = rem < count ? rem : count;

The worry here is that we could have more than one reader open, right?
I don't think this is a complete fix, because they could both take the
same mbo and could have cnt >= rem and the other has a use after free.

I'm not super familiar with this code.  I assume it's only supposed to
have one reader at a time.  Maybe it's serialized at a different layer?

regards,
dan carpenter


