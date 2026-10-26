Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993794;
	b=0K2H95TRVLcBINLkQ/8tEQz/iQrT513Ptnrkh8y3FaYIxuUX98xLYowrBM3dy77BTUeC
	 QrT8adw/rSI35SNJ8cblZ2f4XEQl0rkSRMu94Go2zVPAAiE6XoC+0SbtgjWhyIAGxNNI4
	 ebXBZwLA4UZPfR5dDsbycL4OFxvoGmq2pPnNrmewGKS7SNUwEKmenuGsIidrhCRaFJx7p
	 CWjMEHI1VpoR2sZWWvD53c6uJYUv4K8sKfiGP+fuM0gw/wIwmoME5ivIgiTi1DmdFLqUV
	 XWCl3koCmF4BJ/WSOi7d9SqLMEuT+XXgIMjb+devYknZGa4Plh5kmRs1AYzbWA/8kYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gkdqs/NrPzD13Pv6TZco/9L29+yn5yrwdhhFtX4Hbpc=;
	b=HN2ioshOkBsxUOfvCut0LrKJlZgBoXZwlCOL6tgcFPf2v7EECXT4n+9ENWAXD1wGv6hC
	 GU/QCYF5voQgU1ldkvB+A2tCR72eTFifWVzcIPka1xKD97CczhpJK7wJYZeq2HWsDRPNi
	 inADaQX/48b6LC55LcYi1o7Y22w/dNv46glK/MZj2CXHHFHRrFRSGVAVDw3FpW1kGwcYF
	 VA4euOYBpyRQWp/vx98W3N7JH2hyi/2ifGuMg4kAWWyn2tPV5TJHtQQEtXo6ZCzUabi5E
	 M3eeTSbUbkjr8QC10CQUBQUYsGj3xKPPrOpAw7nL0v44T6//V/o4sx0perk+cgrkhFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CsLy9yUM;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D777606A31F
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 05:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D777606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CsLy9yUM
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso26442785e9.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 22:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993793; x=1793598593; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gkdqs/NrPzD13Pv6TZco/9L29+yn5yrwdhhFtX4Hbpc=;
        b=CsLy9yUM/xLfxOdFE3eAQXhUvFBiNpttUU+4HWdMjFpZs8PMfbh8D4P2coOLI8u8dW
         67COxsWbRm31h+PQVHtqce3VcafB2EICAtfzqioG+zwXg+xd1UyhmUgNODfbU2MjSYaM
         odKoVEf4uUpELEN1S0A/MroGyXHFFPvAVZcmDPryB1cos1uX8vWGvKiOGx/zAVJmKt+F
         fdkf5ffKpZLyxB/fcMVlJXvPPykBYhLXE0zWTw6wXTtailwgaudtmiHpa2hT4SG04zvd
         jRpBZMWzumEfCVWOFtzcUWFeXWnB0aNqVg+vm0V0azA5RSkkAapXq8oHxC5llwu7gXnv
         0L3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993793; x=1793598593;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkdqs/NrPzD13Pv6TZco/9L29+yn5yrwdhhFtX4Hbpc=;
        b=sZfi67D7wuo/TRwEUQsxAsVamesSYIfc9eNfFZZWNNexVMW/QT/d6tAwfV+ybyDY/6
         t8lpzAYWX9pahvnkm3XykN/+sS4vQ0c+r7NI+C46m4vKDZeAOgVP+wg1IEgApIfmL92R
         3qTko57N7Uranfw3hu77y5v7duoFYrFOO74TlG9RIVm845DgGZijlotLc/MImI+HPvmV
         Yo2j8QWVAajxBD2HdkQEOX69dUpa2FPWHnwJHL27EJrIB1zFDR6yf0HzK1O4Z8YgOfWq
         vsN6DY6GUQXay8S3NtqT0lUlalCS+xVpy6l0Qswa6nBs8e7wpVWpYP3+QfsIHjafW4Q2
         /Jfg==
X-Forwarded-Encrypted: i=1; AKwUvBwXHumzJN07NbiyF0Av5MPVCfNoKmj0rU2G4l7fn3t7MZvDF3hglrG2VZDzP4TGg2nu9+Z8FKu7nfo99xrZ@lists.linux.dev
X-Gm-Message-State: AFq9FYIhYrQxRnqzqA9nWvDQ/Nafet2XPqZuKyqjRxxw2xXKZo+uKwa4
	91nB3W/DhpQcdGd6PiyVYiUo/8yymeMz5QPuvn0lTRSJJ4/LiF7YjY9H
X-Gm-Gg: AYBFou2GBdRRst76YxF835W+iFduflk8CbrAY2YJnzdKMCm6ci3Ac3khILvzbzztRE5
	mhPbhneFH7ZcD9Q/fpo69BIHc71gB0gntnZFfwnMCWWig3lHJNglAlN+OQPy0vJBbne9CLLVwll
	YOb0jei3dFF+jt6kAvlcDbH8s0lPuFmo1//wv2TQ+dqXYJBFOLuOfcF+xIq5/7qhPp/lCfbpp3A
	5vx1ZmvD32bGzHyHCCGSjHmjbBkOBejE0SGqlkSS82v6jgT0NjvjbcTr4Rpa4+FS8mj0Iep7aU6
	Te6AuH5tfLkCRtfIEnpMRi26hn2XdKR0b8HSGrRGNn1QAi5fi5tP0wITDBGNJDUeQbUJrImqz95
	LxtPuyYs+vYaEmQ214HEvhaTqsM15RA8iUnZGiEAwW8dhe5cBLB5UtKJBoynt/7TR4fubIaC7rD
	Tf68GGNrfPJI1tHSl3JSfh75Fnfs4pz/kX0TyzGgssyuWo15N30cI0Msff7Krm5k1gAr7BcpykP
	a4vRB8ft936c4miOuazirgbCcvIBhOGPec72NGyiDdTnPwPWhKu
X-Received: by 2002:a05:600c:8b62:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a35acd5f91mr88675875e9.23.1792993792435;
        Sun, 25 Oct 2026 22:49:52 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm134644205e9.3.2026.10.25.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:49:51 -0700 (PDT)
Date: Mon, 26 Oct 2026 08:49:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Anghel Mihai-Alexandru <mih@ianghel.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: add missing
 newline to sysfs_emit()
Message-ID: <at7p_FWu_3leali5@stanley.mountain>
References: <20261025205427.259512-1-mih@ianghel.com>
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
In-Reply-To: <20261025205427.259512-1-mih@ianghel.com>

On Sun, Oct 25, 2026 at 10:54:27PM +0200, Anghel Mihai-Alexandru wrote:
> Documentation/filesystems/sysfs.rst recommends that single-value sysfs
> attributes end with a newline, consistent with other Greybus sysfs
> show() callbacks (see e.g. loopback.c). The name/vid/pid/intf_id/
> ip_devices/op_devices attributes were missing it.
> 
> No functional change.

It absolutely is a functional change and that's why we have rejected
it a dozen times already.  :P

regards,
dan carpenter

