Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003301;
	b=r+3pub5vgmP4u6g51oDac6tMgZhWrPHRthngEQuGuoFVDehr+ME6rgKMYMzmUinf+Vp+
	 5N/6/A9xMA+PkEW4OfPQtzpGXuUu+n5jQl2v1sIiZxyZnnz31b1woTCwD0ulKq8hPsLt7
	 t0T0RzAMkVMdphL9TDZpw+lt1vLRbjRJC9uQttyZQ00cSaneoWi6L3plmTcgi9FT0WvKu
	 IxNPMTWUDzIRTV9qw7r2fpiMVN9Vd/ZdvKsD+/58YQgTk/5bjfq9u/glVE0x/61/LSmsM
	 C9N0EEbQKOKv28snxCCLlNmbx/9LGtDNVh5Uh2AATCbLNdVOTXOvQcAk+zQLDhTLPNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KSUxz0kUmubjph+cp2VPmoNpzQJPoX8IF209FgUek9w=;
	b=Fhwg2GR820ZRtE9tHGPfZjN2nPfntq5FwCQ98LTpcT3LcMCi93TMtCIToaiwdX4TgF9z
	 01V0oVL1rdW6I6N/byaaioEeRVnHcbaC2n/DLde+qUzNyvahFv1Ypcwi0paUXw9+7+QV5
	 2jm1yHSrgBt/MGjnU2d8hL0DCmC62XNymbH9TBePLm3eAhfpoekbZrQUpBGNpHDxMVlCE
	 Qo+/P2+4vOtbWAgQec5aj+k2JvmSzEbTY7bFvSDZD6L6TQhnXhWJg5PCcEV+2HP76UXOM
	 OfuDZ5J1G2fhW686lYC+gff307KGwTxWkipeO0JFxAtjhczayZSD0+zAeSRB4NnywxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+gwDp+M;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3F0606A320
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 12:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD3F0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+gwDp+M
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so6747615e9.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003299; x=1795608099; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KSUxz0kUmubjph+cp2VPmoNpzQJPoX8IF209FgUek9w=;
        b=b+gwDp+Mtdc4vfLXqSkjCq1WkNfx8FsR47CqYXlKiUiuXPWwBIB9zOF373cbhDtNcw
         82pGlWoqrpa/XlHZwpHHW1YCUzuDv4Q8bEaNDgwa14XPfHMjugLlfQTQAXmJim6xkzoL
         Z9/nP/t2ZbEy03ZyA6Jf8hNQKP5FP10A0R8iuBZJCiLlrCr5DI1x6ZO8FmLy7Ndev6bm
         Npou/CVYyXClkWvwrsmOo23gWgXVpZvCKCYHibHlh8+WkR4D5E+mCLUMidNS5ejtxKYF
         kH/vFuQOj7LZZV3UdGI9x7vsnr5ced0VHgVRKilZeUQa+5PX/vIN1xp+g+mnZ9gKilnb
         jBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003299; x=1795608099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSUxz0kUmubjph+cp2VPmoNpzQJPoX8IF209FgUek9w=;
        b=ujXZmLF2LJBMGBqqcwOe7HOp4UFY3XLCzDMfGqvMtHquEajCutPfD1qiLmp7Vp7V22
         egb3OvVe+9ydU2bhisSOxV0Yv0nhdSbbV9vDgDIGXhhvAaJEMUUl/IMpcBMah8jeo/WL
         MnsEruhvh7hOTUoza0bJbHSZiYoRHoNqjjKb00UPwWMHf/WEcBAk1/LBiVnZ6fsrEpYB
         K2KWkToZaG8W/qHpHGTRMEBXUrdqOe6wSWjfkW0bXRCt9Tsth4Wv0vO1Sbf4uZSviuJC
         QMwOBQZGha8LBkHqFtBplZWCXVggnoAqfOecf7c7ggrb+7ltCLvBDEqEqVnslnRJlQsX
         7zRg==
X-Forwarded-Encrypted: i=1; AL+hErF1IFUMx5uDBkoemv81hPzHHlO/H1QOQmb1voIlMxwnnavl7jndWU8IjDWfrVpO/QqZE+TVlHSqU6Vqg2ux@lists.linux.dev
X-Gm-Message-State: APuU4Z98AVRMgDhtWQuuFACAdWSSt90klzqP/Qz2D9a7TfP7HEsN+9hE
	W/EZPb5qF5DLn6vdzZL9/q2IlNO6NkkY6Mvd+BHSNXTMNs5D2khGgoNs
X-Gm-Gg: AYBFou0wMnifi6kw1s6374RGvoVGBFXpeqCTPXbYnVM6ch1fqX6nZHSsGvSn/YCNTwg
	PzlLMJR6ZfLk6CxKbcGEaZPV1E+Yzpq5szVbolNaSKTjePCcHYvhjYKe+PEHTUBgtvKImAfJmbL
	UHBP7XScf7sOYLiynklUdF6Qiyttib0n6kN2ePGHvtF/kLIPaR+uNjgWLAb0FOwNywRQBhK8Qvx
	UEjWTPo83n2bCZ52y7S/HoCqiTAWwWc+n9YBPFFc8l0FrWdp0xyP9wpFhTovaN1RrgpsfQ7UH7T
	llAvQcs06ikzjDgD0UtEyjarvRobnqHgwKvjkkscmKB8yKJEnfGBBgxgV9eDVn8gDzFkb5tcdf6
	hND4nGxxC1MN2mZiTOcUYItmP0rLyEs1iUnephylaioPkeat7sxlmZK4YoRmvLcOkAyjBVTSXBd
	MJuLVtdBL+Olo9hnVFB71I0E7U9d9LR2krakf6XMegFQZeIuU2jaVUkHPm21rz/0jp5b2NIBI0a
	siOESPqoEtDXBdhOi1nJ7nY0YDOsH3NWEa85BjxSyVnyl4wByq+OmZ4OUHnul9QmTPt5uet2CdB
	O3eF4xndUnP6W7ORjG3G7CvbLOm8r0jia2mW63tY2GVeFV1mfQQrimwYDarZYBCU+AijtPe1eiO
	fNYT7RMJ2y5ePSy+uGFf/C0gbE9H1j9gc5g7b4tKn8X2MiA79SAh11USTNI6U6CClNaA=
X-Received: by 2002:a05:600d:600b:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4bb7da3a374mr41928875e9.32.1795003298771;
        Wed, 18 Nov 2026 04:01:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6575a5c28sm4520927f8f.59.2026.11.18.04.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:01:37 -0800 (PST)
Date: Wed, 18 Nov 2026 15:01:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Shivani Patel <patelshivani2283@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3 1/2] staging: most: video: Protect pending_mbos and
 mute with list_lock
Message-ID: <av2Tnre7L8iEAf98@stanley.mountain>
References: <20261117170558.33844-1-patelshivani2283@gmail.com>
 <av1t4DbqGsmUmrZJ@stanley.mountain>
 <av2KgdP5EuLamxpe@ashevche-desk.local>
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
In-Reply-To: <av2KgdP5EuLamxpe@ashevche-desk.local>

On Wed, Nov 18, 2026 at 01:22:41PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 18, 2026 at 12:20:32PM +0300, Dan Carpenter wrote:
> > On Tue, Nov 17, 2026 at 10:35:57PM +0530, Shivani Patel wrote:
> > > data_ready() and get_top_mbo() read mdev->pending_mbos without holding
> > > mdev->list_lock, racing with comp_rx_data() which modifies the list
> > > under mdev->list_lock. Also, comp_vdev_close() clears mdev->mute without
> > > holding mdev->list_lock.
> > > 
> > > Acquire mdev->list_lock in data_ready(), get_top_mbo(), and when
> > > clearing mdev->mute in comp_vdev_close(). Use list_first_entry_or_null()
> > > in get_top_mbo() so comp_vdev_read() can drop the redundant data_ready()
> > > check inside the read loop.
> 
> ...
> 
> > > -static inline bool data_ready(struct most_video_dev *mdev)
> > > +static bool data_ready(struct most_video_dev *mdev)
> > >  {
> > > -	return !list_empty(&mdev->pending_mbos);
> > > +	unsigned long flags;
> > > +	bool ready;
> > > +
> > > +	spin_lock_irqsave(&mdev->list_lock, flags);
> > > +	ready = !list_empty(&mdev->pending_mbos);
> > > +	spin_unlock_irqrestore(&mdev->list_lock, flags);
> > > +
> > > +	return ready;
> > 
> > It doesn't really matter if we take the lock where since we drop it
> > right away.  The list_empty() doesn't anything that requires locking
> > so far as I can see.
> 
> Right, but the problem is that we possibly might compare valid pointer
> (list head itself) with the stale pointer (head->next and/or head->prev).

It's fine.  If you strip away the macros what the code is doing is.

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff62f4..7bebbf1e11cb 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -62,7 +62,9 @@ static DEFINE_SPINLOCK(list_lock);
 
 static inline bool data_ready(struct most_video_dev *mdev)
 {
-	return !list_empty(&mdev->pending_mbos);
+	if (mdev->pending_mbos.next == mdev->pending_mbos.prev)
+		return false;
+	return true;
 }
 
 static inline struct mbo *get_top_mbo(struct most_video_dev *mdev)

The lock is unecessary, but also harmless.  Why I don't like adding a
lock is because we drop the lock before we return so the return value
could be wrong by the time it gets to the caller.  Nothing really
relies on the return being correct.  It's useful because we set the
error code based on it, but if it's wrong the system isn't going to
crash.

It's pretty common to do this sort of thing where we check in a racy
way if we can return early, then we take a lock and check again to
ensure that something is still true when it matters.

regards,
dan carpenter
