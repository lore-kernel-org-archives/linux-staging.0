Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25582DECCC
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 11:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783165991; cv=none; b=fLcmxDk6AccRrW4FirTMk4M3/XyqNx1F+i4o0ut/yGr3QVjJQ1Z91oo5QhdbEXmNr8Cb8uEMHzTT5Fi4gC4xmyFU+v4fdUdMIYCfCMg3qGD/RQXYT3xr1Q7lr64ucwlzxauSLifpPsU9E2oVFjEuOiPuRkW7Ob9ryttrtK5KIyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783165991; c=relaxed/simple;
	bh=nw6bclERLqWkQe6ncg2qfzrM9WzJwPVGtqg/4MaqjTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eeygg045mAoI2crSuhC/l+lCWAmlz8LvMzlUYR96seMArDSejzThQN1EnYo/r79+mo8Duag7f88HfzHR5aFY/kY3xW2chFeoR+2L7vzVjU9JbrzuBym6bCTRgjs4Mr2fks7EnSSYzacBhXBtwDfYW2E03QFtrLQjWTzi+Gm69nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyu1wFdu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyu1wFdu"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ca1479dfe0so16011085ad.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 04:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783165989; x=1783770789; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xk4UVFMOS8PfIShadOTM+14JEL8d23RJhNHQT4BpQaQ=;
        b=hyu1wFduRpvrgOINf7Tr+aNdY6vEQO/NYRgzK5CSAUmXyEwAL4mQtrX06ly2TCBTfU
         lgCODqxSqJ585Oe6dgxb9PNSuV8L5uuIp4RyROkftQYzech8yt27a/zJlmvWz4xVa3wG
         LXvTaoqiGoyG4ruNdsZPwiX7Fw0gRc4DZShwZIR9NB+nmqTY7Gcfi1eXnthYjqMzdo9W
         2gENB9CEuCBTjkEBgmm5x14QVZcM5ECW4c0nyydXa66Ht7viS2jVhf4GXPC1OfUDzfXS
         qfTXHHM0UAT8pPxllWS6JlLCTHivTDHi8qILImj4rFqH9CvAZ+vbeOpc9m1+Eg1l3B5C
         xdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783165989; x=1783770789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xk4UVFMOS8PfIShadOTM+14JEL8d23RJhNHQT4BpQaQ=;
        b=GVcGhz8M4L1MGV5y4Wq4eBYp72QRPaqSXv8FpMKV5Xh38jl3pxnlhtJRA5EztezAKY
         4g5w9ODLdxgbw/L7oXsZdwW9z4B/gaeE89Jn9LTxXxwl/03Mp4fnzu/pFnIKoWmj0ZG7
         O5nQwYdc/jm+lP52tmJvL4XWFrGYHmJOnFWiTThte1+svFucEQNwRyKFH5PWA/jeUndI
         IfNqyynarlB3blWFc1qcAV6H4uilNVOyXCdbpSjYnAbcsfN/FZJO+MKcWnZ7JxP5cR01
         m0EiKGd6Wgzpgk7NTCUEaYUWbV9caUteAJmUuObkaNtvdLz7h3M+rmjK5G+XVOcoRAkD
         Agiw==
X-Forwarded-Encrypted: i=1; AHgh+RrRQgvVymFziu+BUpXGCmV//7GiMK1EG9/8L/dTS7GCOy+aJw0FNgh8AwJiENXrUflQluSuDnwpvFmWFZR6@lists.linux.dev
X-Gm-Message-State: AOJu0YxZwpjT35hernX8WBdRkZC1ww7TlDf1s0GAeWWtWaKps8EzKhAG
	pyBwwETL2690JyJ1XhV3iuanZf2AVv7TUSw/jF8UJ/txHVeCR8h1GaQv
X-Gm-Gg: AfdE7ckOJQs5DKNpauvd49BM5QdQtutIE+Oy8vx6EWWcyPo79OaeWS+9o6n8IP41+dF
	3gwX7F2pGrPo6ZwNnIzkrHoVIlav1qwrCVeylGURVhDakVXwi8CAiE8RgZ3Th8dc1sQhZhRSWPz
	fKFP8pk4xkSTmMkb9m2yiy2sXKhakcvaAMpXihJzPYdIyNconjjv8o4Ldy4T/zKM1e3ce81bLD8
	xwIhr6xO+prplnb8DhN7UBDvyHaiwpzyaZ+5YMKaEXDwtZ2gKTrpzO8nGXmKLfbEJ3CJNs1D3ZN
	KKW6ZnpEIUS9+qhy4gqWQ++y0YIpV8labeJq193rljK2TdDEzTqryJ++jqNN0XPEoy6dDhqtTll
	Da0b2pZRCJCy3tXOkc8Aa/keK+RRnY0FdDEpf7gtgENsno6iy6UDgpHhzK4eFt9JWYSgcXobhb6
	BdUyfyZm5JWmU32e5Od+ofs6/8cY59LbNojuBmnJDQdA40tiHrHoOU1Ok=
X-Received: by 2002:a17:903:28e:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2cbb808b0bbmr29120415ad.1.1783165988953;
        Sat, 04 Jul 2026 04:53:08 -0700 (PDT)
Received: from kernel-dev.multipass ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm27577974c88.4.2026.07.04.04.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 04:53:08 -0700 (PDT)
From: adi25charis@gmail.com
To: gregkh@linuxfoundation.org
Cc: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: bootrom: power off module on timeout
Date: Sat,  4 Jul 2026 17:23:01 +0530
Message-ID: <20260704115301.7113-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026070430-exclude-improve-f318@gregkh>
References: <2026070430-exclude-improve-f318@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Jul 04, 2026 at 09:34:47AM +0200, Greg KH wrote:
> Cool, but how was this tested?  What hardware needs this?

Fair question. Honestly - I don't have Project Ara hardware, and as
far as I can tell it's not really possible to get any at this point
(the project's been dead for years and I haven't found boards
floating around anywhere).

So this was build-tested only - compiles clean, checkpatch clean -
but I haven't been able to actually trigger the timeout path on real
hardware. I based the fix on the existing gb_svc_intf_eject() usage
elsewhere in the SVC code, so the API usage should be correct, but I
can't vouch for the runtime behavior beyond that.

That said, if this driver is effectively unmaintained at this point
and changes without hardware validation aren't worth taking, I'd
appreciate knowing that as well - happy to defer to your judgment on
whether this is worth pursuing further.

Thanks,
Aditya
