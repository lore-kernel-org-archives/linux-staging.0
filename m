Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5863C276E
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478204; cv=none; b=k6i39boxggz3864vEfO1pB/wOYdkG9d9I3Qs4TP1TwVzToH7awJYNb5J5DiU42a5zm/mjnCfyCHaxBUq200rKxQhDwD8Ry6oQpq/E538n/P7929ia3k2qT5RfJET6IBRyCCcj6Tj15PUIm1l7QmtHpsSkxmPpKGKHcpjY0pIqBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478204; c=relaxed/simple;
	bh=usQ6otGy61tea2/+SN0kWeGAn4CCH12vYdkTnhTHXWs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B8VIpLezMRUBzbO++q1yd+OI9V6yUJ5r9CpkhVQEx7pt5gWXvIQ/rNqwysae0hAuZM+8mUs9FLkklnxFFawfRQiNC9DLaLkv838WtSMIsaM2NeP3w5bEgDzK1JdT08LE3m43dxOXwkUf13fTh/OvAJtfinmlhpeIhjrB9Ie7AJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SamUpQwP; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SamUpQwP"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so15331265e9.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 06:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789478200; x=1790083000; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yOh4YxsUy9cnJP0mnCeYYmhsQkJTthFN6MeVe5U5BCY=;
        b=SamUpQwPN8qzm5Mm8WN1x+LJzYuA6xd/tSP8bgaCGj4lKIrutLZL5hFDMwyMM0zvZi
         vBTWkwso/7M5fi2Ha5Ths2KdA5+y0EjPDatU5eoTUvaIUvLl3aN6M5hKuYYhM6w8rKLh
         hEr1IetvVMx99Ik4PdywpimkgJjpey1fVEfcmYWenKkLzgXM3ddeYHv0byg9I048uMmR
         jXbVg/5D7t9shdzGqq0/vw6ziJTUw/LP11L0vL3WW1lTP60foSEYgqoHCEc8UOpEJHsu
         Rh5vFmV11qU5w1YQTopFVLKYO1VugdrrgeMnPcXzDStGdzJZF7p3kCXblbzoNeJzHL/P
         tVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478200; x=1790083000;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOh4YxsUy9cnJP0mnCeYYmhsQkJTthFN6MeVe5U5BCY=;
        b=FGrKREek1j8JBOJz0+VRCGluTebFVW0V0vLgMwYhW6I2/KdKFrXm5vcuF32ORKV99Y
         Y/gJHc67sYcUFAwZuftwX/5iA4kUEvTffjAKWXKbqublmQXHNyXXhDgnIelbHy8zP7ng
         dDBFTEqytia0cYu99I9OhDKI3wsh847ogVlCy8UT7ZDTKiQP77kFVwx0/9O6M35Y8Jol
         zmIBiQmXC1ghB1kKKHR4VOhCbqE+Axn2HFvYR/JlIFB/nMmhscL7LS+ZL/iqV1VIv5pd
         yQhOjjRjMzt07h+azCYQHX0s0DUPyIuGVvaodKvcECIq/fr/irGCaQtpYJUt+Z8iAJZf
         jyJg==
X-Forwarded-Encrypted: i=1; AKwUvBymzzlVbn+fHUOGk0ywWfBsS2o2JT5att2N1hSFHf7ZM70dJEwTr0ZzEFT2DezIUGuuCy2sfSf9usVTQF1o@lists.linux.dev
X-Gm-Message-State: AFuF++kIH1eLEIdRS7c6w7s/Ch6YYcTi7DsNqyRmty9V9rSPzM0bnzce
	Z+sSXxgNts8ROJRA/WwOXVogq+aZr20csZi0OYksK2vWAPWdDiOrA5fl
X-Gm-Gg: AYBFou3zdGiuAjuKo7WoqUXoYmoHuI2By/b6a/WkOQoe+BKcwaFpjQODUHxvx8Pqwdd
	tS3sgE1hLXQsq6qQSw2Nj8LB8sue8CqTApWY7F2hMb/oOkar6n83dNck82MtMRdmHRTT66/dKH3
	u65vp6pGcrUc4AfHV19oOoVpzIYfVm/bdRAs5CVLml/BjkZ6GPe3T7lvf0Itw9FSZnPcCoAVsV9
	sTnnw3G9qBczX3LRniZckTjagRO5Hut/x3ObflR8mO9P/SW6hb4w33tFR1E6xRQ12wMgVjpzFSE
	PAwR5acokETO+nx5m1cFU7tvNEfPV4hZ8QqbuLOqhAlq3J9E50vl8U9tMTY+j8K7yI5r7ET3FAU
	iPqlWAuBq2O4JU7evWGUi7/OubTO/u4vb4JUmtZgnsUY3OJiuaxb8yc6VP/uBo+qJKUeSsulstE
	2rRO8DbRUhmZYEvP9y6gVjrfP8QugSaJz1TK+7rPxyomzXQtfY7f/uQy2VwhN+WRrCO2UhAxyci
	CZzw+FXZtuTUqM1SYj2B9YqC9aZ7O7leUZte4T1gO8znmT/CY7K3gQ7r8oFrAmi45no5bKIJPFq
	mPMyB1dAM62LNuna8SNH740PRWFBQlGStvWj4e5NsRXoNdpB4lbawlTBITOgyLQpEwFmmKm6vr6
	ULGPFL6uIC/EcMtX+rSyq+AV5cc7NYddYRWCaJ+or+gA6tqShwUH6o1olOM7JZXxoRgmzMOoc2I
	V2Glgx
X-Received: by 2002:a05:600c:81ca:b0:49e:642a:4f6f with SMTP id 5b1f17b1804b1-49e7a69ba24mr89660425e9.33.1789478200316;
        Tue, 15 Sep 2026 06:16:40 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef735cesm65466155e9.6.2026.09.15.06.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:16:39 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:16:34 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] staging: iio: adc: ad7816: Serialize SPI
 operations
Message-ID: <20260915151634.0000787e@gmail.com>
In-Reply-To: <20260915075939.18180-3-abdelnasserhussein11@gmail.com>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
	<20260915075939.18180-3-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 10:59:38 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

...

> +	ret = devm_mutex_init(&spi_dev->dev, &chip->lock);
> +	if (ret)
> +		return ret;
> +
>  	chip->spi_dev = spi_dev;
>  	for (i = 0; i <= AD7816_CS_MAX; i++)
>  		chip->oti_data[i] = 203;

The patch in itself is fine, but Sashiko points out that the mutex
could be added in the ad7816_store_mode/channel() functions. Nevertheless,
this patch only focuses on SPI transfers so you could add guards to the
GPIO functions in another patch (I don't think you need to send a v8 though,
just another patch after this series gets merged).

Does this newly added lock also need to be acquired in the sysfs store
functions?
If a userspace process concurrently writes to the mode or channel sysfs
attributes, the GPIO pin and device state can be modified without acquiring
chip->lock:
drivers/staging/iio/adc/ad7816.c:ad7816_store_mode() {
    ...
	if (strcmp(buf, "full") == 0) {
		gpiod_set_value(chip->rdwr_pin, 1);
		chip->mode = AD7816_FULL;
	} else {
    ...
}
drivers/staging/iio/adc/ad7816.c:ad7816_store_channel() {
    ...
	chip->channel_id = data;
    ...
}
Could this concurrent access corrupt the rdwr_pin state, chip->mode, or
chip->channel_id variables during an ongoing SPI transfer, leading to
malformed transactions or corrupted ADC readings?

-- 
Kind regards,
Joshua Crofts
