Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B3B47CC9C
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219461; cv=none; b=om+k6Ho/goambkI627yMF2TIfqYTRmYrv0Cx2KX0+p0o5b+DrLVhS/LK461TinyMuWWx+qYV8l9oPAKavMLK4QNuXuCNKLhngyo3rKCvX1/TWrpWYocsgm6EZJZLynUtiwZyD0q53POovftRf1ErLwcocmDdmlxLBPZREp55PUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219461; c=relaxed/simple;
	bh=M3sR35tQ5K6JnPlLpNqOuF7I/PrARLfOJzKs8U989H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6vribkMo4EXujDoSXslRcAjvY6Ony06GCYXhbDKNST9NE9UI+xeDXryjYui4DlPtgJnAwah/N6sj8h6WjIpZQasFXw82OBXHFGum+mC5yOOWgUbjNbs0Ssdo+OBFa9Km864Cc7rkU6jnlYmpdlhEjm9yvTjHmafIOr/Pq00tKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbhSuAx2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbhSuAx2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso4549115e9.1
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219458; x=1789824258; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L1IRfk/ZVhXM0tDobEj8jOkMqWVwteMNo9N+xZSsVM8=;
        b=hbhSuAx2rnMusl9zh93lenQZAm1P0QVnt17KEXvDfoVwWM9gNlLnxv/dd2XGUspX3B
         n+y2bcmtY6we/E/IfYryX5enhMSKnkTR0x8Zj/0LNIjR9ZKUSfE+PnrZBb43kx7cciDR
         lsxOTHdqXd4PafxRVfBPKJU8Vdb1Wfdhx2KYXti3uCbqSU2hEPY8x+9kEa1HucsDKGnp
         SLUSpu8ZNvqgKCBDW9O0/FKs4Jrkn5UOjzqd1h797vxH07zcmxJom/yFbK8QOg3rWkbf
         I1glb8qeaRzM/sb279jNaclAqAKwyP9zeZzH+2k1lrDTcG5WGtQ9LrZXodWRcVY2LfiD
         7hVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219458; x=1789824258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1IRfk/ZVhXM0tDobEj8jOkMqWVwteMNo9N+xZSsVM8=;
        b=c4qh1ltZxl5aj6+mymrT+71hyI90fR5E/m+XlVKKokMtsFegDM8qwKzyffcFRqC9ap
         l2JNL8t37vg50Cp6oinjcflibN7w8iBSJq61SqebuOPussR2FJ02Qafowzm6tJB4UZ5x
         /RprVjfTjWDG2oE3w/HCMJzo0kDQQnuGuVUe7YRt+sPxr4srTdDpBM+CdCv4T4VORErg
         x1hezS/wkf/huxK/tGv+WUr3cf6cC2CjyvoySYDIvNZm0QwbGyfQ1Rj4PsocKFbkzd6A
         47+r5rw5ZckKM33WGD5kBV3eQntOOd8rqjliQOvbkEXAM8DFAkcbZk8N/ggh0aXY4TtR
         OuWA==
X-Forwarded-Encrypted: i=1; AKwUvBzPt84aV+/dojjvCSWvIXSDUYDLoDzq+anJcs5V/DKs0Uc+gdEVvCMX9un1AKwHs5SuXHUzo+NxOCHIT/eY@lists.linux.dev
X-Gm-Message-State: AFuF++kLUN5cOpl7VCVMTVhV/Q3QuhtarMnap+i5eTvtvasFWFUJGwuU
	j9xqkfLCm1zNIJMa/iC4zxx0nw52Tg1ydkhWfTImdNEqiGdTHxvnP9vB
X-Gm-Gg: AYBFou35tfPKFSbCF8n5anKyO68X+3eDGlgfxB51kyJ+q01mI8dp4/eKN+4L+Y5DXWb
	Fd7zs+uC2tH3P4DcFDCepFkdzCvH2mM09SSNii7DZ6tlZZ5zAOdaplTJ0ec8WtJCm7IRlcv2YuD
	puzIoIkUzkhgANMkoWF6ER0UsRX0ss2C9u+bYzuFxzqxkSup7mfylaJachOP1zP5bqPuMhQaszT
	+PTWanN2S58y8jHkyFPMg6yTGEgc+dIZkn4/JVuxm3Ol9550PYFtQZKn/4z+fyIpi6JTsi5Iku0
	xCiD0ZP1jQjyINj0VepdW1iuJkdO35+0JgVvH2VCdV0u9YXCYXMJmdHnsLOuIwVv32uHappVAIr
	hncwk9PY56dF808PzatMWyzPiLffqr/vi02+ydug4YAFfSChtUZFIH+p31Dyz9ZD4+IOJIOzThp
	tx2eXwRgb4manju3WlHo6PbguwIgDZQchFiiXE164k8XMFJsU/IOd56fowK+4hXIB+zjMQrJ0Hj
	0hosQ==
X-Received: by 2002:a05:600c:3501:b0:499:7219:122f with SMTP id 5b1f17b1804b1-49e6caa72c4mr23494585e9.4.1789219456945;
        Sat, 12 Sep 2026 06:24:16 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm150435315e9.8.2026.09.12.06.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:24:16 -0700 (PDT)
Date: Sat, 12 Sep 2026 16:24:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Muhammad Israr <7israr.work@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: add comments to mutex and spinlock
 definitions
Message-ID: <aqVSfA_Ns_plwCpK@stanley.mountain>
References: <20260910124403.95741-1-7israr.work@gmail.com>
 <aqKzBTM-CdBqQzXi@stanley.mountain>
 <CAGKr8w2e4YGF41X5mv5Mf2FDvoezpzeKmFMKaHKf43eypCKdFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGKr8w2e4YGF41X5mv5Mf2FDvoezpzeKmFMKaHKf43eypCKdFg@mail.gmail.com>

On Sat, Sep 12, 2026 at 12:21:01AM +0500, Muhammad Israr wrote:
> On Thu, Sep 12, 2026 at 12:19:00AM +0000, Dan Carpenter wrote:
> > It's supposed to but it is buggy...  What prevents multiple
> > threads from reading comp_vdev_read() at the same time?
> > I prefer to keep the warning around until someone fixes the
> > code.
> 
> Thanks for pointing this out!
> I traced through comp_vdev_read(): list_lock (the spinlock --
> the mutex field in this struct is unrelated, it's only vdev->lock
> used for V4L2 ioctl serialization) is only actually held around
> the final list_del() in the read loop. data_ready() and
> get_top_mbo(), both called earlier in the same function, read
> pending_mbos with no lock held at all. comp_rx_data() (the
> rx_completion producer) does take list_lock correctly around its
> list_add_tail(), but that only protects against whatever happens
> to be holding list_lock at that instant  which today is just
> the list_del() call. So nothing stops two threads from both being
> inside comp_vdev_read() concurrently and reading/deciding on the
> same list state unprotected, which is what you were asking about.

Imagine one thread is calling get_top_mbo() which reads:

	list_first_entry(&mdev->pending_mbos, struct mbo, list);

but the other thread is calling:

	list_del(&mbo->list);

It's a race condition.  We can't delete two at the time, fine.
But we also should be trying to read from one while it's being
deleted.

regards,
dan carpenter


