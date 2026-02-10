Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199953164B0
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770720108; cv=none; b=uetU9tofREvqGGD+WlONkaeuq0BYmEvH2m7f184lEHyiIDQShFIFhOS/N9EdIXtzGXzXeLg/gGvSDyrwgOAgjDEX1AhhWz2Y77VZQ4DD/nrT8QYlOEarZB1sPO/dMtKUOxeWI8InVAb+pVNBmXS5ZZYegbk9YXPVFlSglSde2DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770720108; c=relaxed/simple;
	bh=5yguZTpHZAetzVT0m/G2atwSQgnI3L7bO5sDOgboRNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnFha4SDai6dYQb0EzNDS8c6karnXnfE4e1mGF3P81/+SBJRtjXyO7CPMB3mYRAWkx4v54fL2dD2rxocIUyCbvATSkQ9myuQczSNfQou5hyhPY3m9QKYNh0D37MsAAxnVDdigIhTdU9spY2PS6kEVEJ4J1dqEHhkHP8dbfufc2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M1FzcdRS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M1FzcdRS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-480142406b3so42300685e9.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 02:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770720105; x=1771324905; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hh2KvuBEeO5STWbByn8Hf6YpIpJjnJYWqY4W33WuXkY=;
        b=M1FzcdRSffBsr3teVDWrXeeh+3iC0n/ja0JmgnVZJdxpA+W1apkj7aQpR1NaMElcrM
         wf5j8Hc1rcZ7sE4olUwOkD2BgVmcbqY4MbR/QtEmjtdzS+PGE6HDaUjfpD8789M7Yic0
         1wxNcsw0WO8iZ/C9NbB7JQ0UOpjsuVbeHmjf57yCkyCDzZiLS3OUKZ6RZHRJjGh4aCRQ
         zwvdO5vExINH4cMAGcd+rHk0XR6V+W+XeAfoXZbTdFhpwP6Dsv9iNBl8Fo0nSt/LGz1Y
         FJ02PzsFGbzgm83GFb4PNVf65EdWIqNmwI39lniIUYrkJHMRPPmcYAXDeqcisSaROLkW
         w+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720105; x=1771324905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hh2KvuBEeO5STWbByn8Hf6YpIpJjnJYWqY4W33WuXkY=;
        b=ChWU4SXz8B/K3Bx8NBoOFPeaC6VVCV4YOT/uekYhJk83v5dXHLx+o6zjAbWItnYTiE
         rR2MoIpXkGjPs72SCXl77S37KxSVY5yGU0WZr4iUL4DVZbxmVYmf2zjgNeHI2H9Xv/EX
         WDHJmRjScVbr6Py4jSeo9L+Fi2zIu80s1xldaj0hLGm0FXpvLoYR8cf4kOaCHgYeL3Du
         bUXv+z6NcQfspX4wQCHBiyOlEXR/13SqOLk1bogXqTlMAFye68JZ/P+az6ck3wZ6pBQ2
         9h2fCXCwyMO8FEK2qdlDcVeWn+rnIbmAlmbbnd0+HNbQHrTdSwj5sMuvKJ9mu9VxU+Kc
         xBgw==
X-Forwarded-Encrypted: i=1; AJvYcCXh94V3hkJ7ExLcNmqJhPZTSuTJ5OqpLBrUEcBJyNOOrIPNpv4Srtnom7ipfY+TYJX79ksKl9oGfcOnDZqY@lists.linux.dev
X-Gm-Message-State: AOJu0YywhKYLGRu4q/OHvHTPUuEkbrXNwKNs3W7MtLI9UQg0PXfTJzij
	u4YBB70ny1f+zblbieL8+zF4IexqPN2GrLb678buaw+RyxSoXJMr+tc9P71PLnl8rR4=
X-Gm-Gg: AZuq6aKMckP7UM8RtgJn2dz4bUeSJKro2yKNTxjh0yFNHRPyJzM2WOqLqVuI8GHyKHv
	8uxWJSDYacF2jciy0QXIwwTwQKK3EBdl2d+CMFekk+0Kexq0QxXP3tzqLYt22p7PmdtGsPxHS7w
	TtW+6uvUaMmu+11wvII2g9Sl2rw+nRIsFIOhtRe0tlaG/ORorBp+f6lokMZnp1XFNC6+8HfUYPq
	2jgcLMDsjMu8YghQFJMsAZ+hOTH2ybqWqui8Qk4E5i5+ejKvW0JDDRn9NgYTaqZCYNFzMtwx7mB
	1eV035gKpBQoXh1imEsFzR38NFnqd/C8Qh4Z6hIlDC6aZ3HvJsUAzTTnjjedrwYBnoZ6RaZmB8b
	pkZEKN0lErq7OJXhg1wjlzOHZozamBDwKvEU+nbXtm9uSxbC6p/+ks/5ugNQszKTwByK1q1QJiG
	vs3gFWkDqEpey1frLyQfUxMyi57gG2
X-Received: by 2002:a05:600c:8211:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-4835081e92emr21363335e9.19.1770720105230;
        Tue, 10 Feb 2026 02:41:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8f2csm76512465e9.1.2026.02.10.02.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 02:41:44 -0800 (PST)
Date: Tue, 10 Feb 2026 13:41:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Yoelvis Oliveros <yoelvisoliveros@gmail.com>,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: type change from uint<bits>_t to u<bits>
Message-ID: <aYsLZcRhZ7kB7f51@stanley.mountain>
References: <aYq028TNyXQWZ_v5@home-pc>
 <20260210101952.631bf50c@pumpkin>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210101952.631bf50c@pumpkin>

On Tue, Feb 10, 2026 at 10:19:52AM +0000, David Laight wrote:
> As a separate issue, what is the purpose of all these bit-field structures?
> You can't portably use C bit-fields to map hardware registers or network
> packets.
> It isn't just byte-order, the 'bit order' can differ even for the same
> endianness.

Huh.  I didn't know that.  Can you give an example?

regards,
dan carpenter

