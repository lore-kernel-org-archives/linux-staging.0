Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68680373C17
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774423383; cv=none; b=NDkcLiVxsTs0YsnrHXDHZda2HnobQunZGfqhaXNgCj9AXEYhBNobZ+k0wR11cl/fUGVwQI/rwmtFzJRte8PRDBRs9jzlsHyK6VVa4VTrNgWGagnFzVXMIhFpF1Q+tiyUUrJO+B+NWTQv6aWNkV5HlrNfQ/7TWK6E06AUDo+tXcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774423383; c=relaxed/simple;
	bh=7ipQqte2yZ9MDbN8E5IAsgZVd4f3naqAvh7sc+iSMis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+4K+BVD7h2eq55CDcNd7cr7Ych/iOCIohst8Ud+pTg8zYkGATZyUOMWjvazfXLOHeJnaLbm1Vz5B+UcDX5kAFpGVwECP7CqA95RlnonlaZZpLh+GALtWNib1ARkZUxsYK8UXmhveLxYcdJ0TXP4ZVJzpzwBNvwrNnQgq2EW788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bLwxX5u0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLwxX5u0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c56e822eso1931947f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 00:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774423381; x=1775028181; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QktAvSAbPbJn2FQ5qCNJTp7ZAkBCXrm/IRSUflqLguM=;
        b=bLwxX5u0FYU5gWAlLUdFYBpretVTKS6DdKpXSJlS7PV6/gXdtmUhzh7DB3Y3m45puU
         3z6aL+4ijrbh4Js68nWDdbJBjuldKEsYaoS06tRl5ebi3AZEkyl9ND1tboctU1sQK+36
         fTZPs5HpThtTjywS+1djHEbgjKub0gflY5qRK0pyraMO1pcjRA9kuBPyxHdqglKO3XnK
         ZNzyTnIRCqtSi2pbMrqffr5u4DzZrSz7Z5M60rMIL9f/hc50vMdpq+rtUcJC0/fBNOTN
         7UmqQygqZ71dpF4f3VkTVXYqpPxlUK8YTbXXqNxcrq+LBcKJWQQsg0T/nwZ013VB6A4c
         mvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774423381; x=1775028181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QktAvSAbPbJn2FQ5qCNJTp7ZAkBCXrm/IRSUflqLguM=;
        b=W+8+ayyFCf9BiROUtAfOGjOqzEZ9XMTR1ZvdYFS5ydWRzI1gtYFUenDXhsVZT8PzPy
         k7DilHXABPAgDMXiiBENl6QAJK0cGOAwtn9w0ebdNd0C1mI5jP+Rhgzl6PPQZAp4cFym
         JLPgIGiVtqgsvQx4c+MOh3MWlpIWoYZGuRiT7RXIf4v9WdBzCu16LZ88NPdvSuJwDSXu
         zkQeHozenKWT0UhU5xlUtqxiLztTCLzJNiH6dB0peDTB2bV1G7zfOAYadv5M26RfjQlM
         N+D3ABWVpZ5jIKrWRk7ah5GFjdHrnJDpoqtHXBDlljRkhd81WypBGk+JGb0Vo/2HG0bk
         eUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWyOqjLy9zkVZJbzqe+22ODzmPaVeNbKy1oQsA9VcIhrh7ewH7ELEwybDS81ginO95y+QDgS3ELjberdz3@lists.linux.dev
X-Gm-Message-State: AOJu0YzZgNmMo72oF/iSKkmLdk+aavT2Ky93trwKj4U9rYMVv8qnBvvX
	7pPJ7pavWPVfOZajjL3roE0wKpbfwl9y93vQOoXplV3lgco8PAE3VDfWeTSNdUx8uSk=
X-Gm-Gg: ATEYQzx+penBdswAXv8FKA3EwwnBCvg+X8Mk+hogBzCFCcnneg/hyMgWRpr9TurwzCl
	rK2jdidD4b9/cmTpfhaprHz3sESiXv88kIIWiF0C9Vdo4ZnbHd5+mZwG/eUx2I/QTJrZfpViGEx
	QAuRjZP07lAmmcVgA3htjCZh9o3QVWMPcmRiexSgMyN5PZjiaytxLmsM5SK7yCURvbh3fyyyHGi
	nDbUshhMlPrHjK1qk3WwDaE4PCXrhJKKUSWt6KXUUy7hMSR1QMZvhl1w5n55pzDZQUnUUxCR399
	BM7D3+UNgjQo2qxFveCxKFrpOXdpnzUgIyBPtZfkLkVXZS0Q32LbvXgmvi5AUXcnNzbXPKxN95z
	sqU3t348weg+TarXwcE44Y0B9XX+VV6VjXbvCmm4TCMGHdT8WffxOFSMN4NXxL4k/g5NOv/nUpv
	+kTAZkucQ+Q90hG3jpDfzSE0puBh6L
X-Received: by 2002:a05:600c:1e8f:b0:487:36c:f5ab with SMTP id 5b1f17b1804b1-48715fe70f2mr31812345e9.10.1774423380596;
        Wed, 25 Mar 2026 00:23:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711764625sm112332235e9.14.2026.03.25.00.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:22:59 -0700 (PDT)
Date: Wed, 25 Mar 2026 10:22:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Prithvi <activprithvi@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, weibu@redadmin.org,
	knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com, lukagejak5@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <acONUF2nLAk6uhQs@stanley.mountain>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
 <20260324130234.3776tp4ykuerffcg@inspiron>
 <acKU7JjW3OFugHXY@ashevche-desk.local>
 <20260324135551.grth7jfjyoh5krzr@inspiron>
 <acKaP0Jz-VqfmEqj@ashevche-desk.local>
 <20260324160229.f46h25ebd2mxcfiq@inspiron>
 <656d3bf5-8d97-454e-9691-540cdb79dab4@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <656d3bf5-8d97-454e-9691-540cdb79dab4@linuxfoundation.org>

There are a couple of different things happening here.  The mentorship
program has its own rules.  The rule that people should test their code
seems like a good rule.

In staging, most of the patches that we apply not tested.  I assumed
this patch wasn't tested.  Patches like this are not a big deal because
we can easily review them.  Sometimes, patches change runtime so unless
it's a security issue, we want those to be tested.

> 
> -	if (0x00 == PathAOK) {
> -	}
> 

We normally wouldn't merge patches which do multiple things at once
but it doesn't really make sense to reverse this condition around since
it's dead code so to me it falls under the "related change" category.

regards,
dan carpenter

