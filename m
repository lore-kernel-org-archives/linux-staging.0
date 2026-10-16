Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E23F443ABA
	for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138328; cv=none; b=ob+pCQRE1a++AFdOZ8LmGfSPnBuxltt+yejD9Xc5E9BZMcox4b33jNDIRgDb1PvBxIoFF5iRyGLHUqXs6pQz8hnZmoEztM/W9kJmTU4C44nFpdj5EPMvTsTf1qLoABjvmfiIGJ+sq8gBsZJwbCUsEfQs+9eI1xq2ZTZkiBxVjfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138328; c=relaxed/simple;
	bh=4jk+j9YNuu/5rZ6mDSj5zkzgKBVWnJ0lqMSB5k2Ri4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJGx0ntO87N1ODzKMnJc7LHdAQxt6QSGzbY/oWRKrCFYOlYRajlaeZKz8/7p8k93/UyKyjwCHytDhvm+l2N6vkW0lGT2c5v5MDTHnYPvVkKPvnsK7mODrbOgAZgdEbSjXuJDqmJ9V9084c7n26VYrqLFV9Mm0nPqK8lgHML98Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeCBp5E8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeCBp5E8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso27410685e9.2
        for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792138324; x=1792743124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=coNAFChQpDjBCCj96hHJcqUiTEEavSTGgtqRHjd5Zp4=;
        b=WeCBp5E8tYaYeHjsvS01uWUjQRIBi+vJytiZWLpkylJeaOe6Gh9GYv8QUAL/4L8Csg
         xKdkw0Rq6Sn3SARbg59yUaAKRE5C7tQr+aVtS+nqFfHgb2q/GlwxvOIWbOfytN+VqnPz
         kLJcFDOm/HyzBMBdqSEabPvLCf7zpLN6AtajFDUBuynNsnrku5xdPNIh1bAjIYZFhviJ
         1n2M5hra9R2YQdiuU1om+dErob2TLIxvGWuFpP2emJ2ehiOMCJ7Tbt8b5O/1myaGT8vG
         rzFLScvKZpkrRzkv4BqgFl0eL7Qv9ul0w22ich+glTOeD+RmMZ3XSUJjJ2yqUcagURwZ
         7BbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138324; x=1792743124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=coNAFChQpDjBCCj96hHJcqUiTEEavSTGgtqRHjd5Zp4=;
        b=KyldJ+16gaoGVMMIPTIC1/MmaTwdQyQr6qw6ncXjcbOBEgN4jkhke/jgPnG5GUwvrx
         el3a9WP7wxNGYRzURfi3Ujuokl5ixjVEBu3eu1ggq8akaT0z2kU4FFEZ+06ixg+VnEsY
         XaWpgLHsusGCLUSv8ne4/ucPMk1y0NgcBvWuhGP3xUNc87HVKigASCpMzkB8Ca0/ieFb
         vOf9ThzC7t0ZjiXZ6iA4Bb9sCX1dqd4hofsNRn9PctPKW7C0aIzMWZoFIVrMaW8D6XAn
         qCdgerD8AqrJrnrgt3KfREkjllRSbRR5mUwVOGrYt1peUEo+TDtrYKNpEvW2OtZOF4h2
         f6KA==
X-Forwarded-Encrypted: i=1; AKwUvBxctpYlOecZLCa9LJQvJjpxj2mYSBixo0nqcjqMfuKgeC0S7Q+tQDbDPmSGB7VTjZXOghzanYiiiwPk8Y13@lists.linux.dev
X-Gm-Message-State: AFq9FYJneIYcqWUiPTyk1YkOXTsagmKBxH3l8n6SqI+AE6LnTkB2ZpB4
	JBwcu7Ryy9ZqzQEBDJa8gzVo7vVIpIGUhfRx383XFmA8SmUQFQ3uyCcrSJyvJg/IhynI2g==
X-Gm-Gg: AYBFou3WX3G7BWRLyXbvh+bYNq3aKsDOtQGfTUFpez7nrKBm+uvgIvCHCeDzRmLV040
	KzWGpLQqjfIgKmnGl2KXcXAPbigTTs+PY3zm3EGaFndz+KRmG5gWlQaS/zSrdny2hSnUqMZgP8B
	wNOD9ApnrCOV+g9E+5PKT1gHUx4hRM0nKsJD5bj89xxj/4ZOAqf7GV2TgWRRZbgaxJKVzuOuhy0
	FdcSq5xeu70472RxoMiZ+x2fZmbUAV5UUTO5/Tb24JnK7Jm1LiJnOzBaEG2W9J6OaiCNJtLqgsL
	LZYSicNzAArIYgEwtitJFqp5lJUDZNFduFIHD/IuJgeA2kxz8b8cejeXyh8cILO43DTzEYPto4k
	OiSqZoupt9VqlwOjcJefino6F5KV5PjLHFWeELN5vGJ6L4WBsZeLUYC2sEdRMg36i4ugOEewfA0
	dK0P8Ax4BNTYl+kOka0q0FrCVuwu4+9aFC4spuGo1WlT/Ud0oVx82UneWDE+ACrin+/HI=
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr421665075e9.8.1792138324082;
        Fri, 16 Oct 2026 01:12:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdeb18f8sm2892143f8f.20.2026.10.16.01.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:12:03 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:11:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>, Ping-Ke Shih <pkshih@realtek.com>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>, pavankumaryalagada@gmail.com,
	gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	dennylin0707@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <atHcT5GG8zzoH7kk@stanley.mountain>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
 <atEtUV5q9MHRSTJb@stanley.mountain>
 <672f78b36290a4021d3f94d9ec401d23420febbc@linux.dev>
 <dec2320eb01dc6499948a936c94512ddfd47e2a4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dec2320eb01dc6499948a936c94512ddfd47e2a4@linux.dev>

Ah...  I didn't realize this patch was applied to a different tree.
#Unexpected.

https://lore.kernel.org/all/7e53bd59b7b146caabebeca4347674c7@realtek.com/

That's a mistake.  Staging patches should go through the staging tree
or atleast they should be Acked by the staging maintainer.

So, yes, that's always going to lead to merge issues.  Not a super big
deal because the conflicts are simple to resolve.

regards,
dan carpenter
