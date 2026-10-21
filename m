Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562374;
	b=W7zrpTng+AmFCZctjhLPEfUYgQnbc/g1AYz8SzCkKCj/Z+JT81X1FOWeOtD3taWj6WJI
	 FbS5yBZLuYoJCjX2Un3F5g4uTNFKavXm8opCgNt5HlTY2m4IM27sGyCq7Xs8a1zra7uxj
	 f6pak+fK7adA2QyEQwzVMi4BMS/7Bsw7/OzOiyOiBarrDGpEnHfoEKhxXmOo0gf1AGZn2
	 9Y5sstRnkNCVVwp+pP5RodbDde4JIkfW3xljShCHXCReQ1L4rqro3phmXbYVg64b/tPfw
	 ziqnF1bhwQ5bj44zKEjnd6/Qc1bsKRo8P2zYYLYGKDsLRMJNZU7TG2hLX+OeJC+Su4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7wvxYM7tnszHbpN8YPIatF2rX8H2hfZfH08DLyoi0hs=;
	b=TUo1SKiXC79H2cKJ0UAxZrKMFcQSfx3EKXuO1nc3rL83pnY7ht5bR/pbp0yA73o4WR2W
	 ELozhvlWJkmCXTwB/7gOlxOlxPV+oBq/W3cgISeBwtAI6Fw3EXd6qlAE/jdP2iTW/ujQw
	 e5wqEO5WpNjcjT1OuhwBu2hLaACtEDBXu4AqUP4meDdGW+kDNRqmn10+WzflzjjGul+TM
	 +BLXXvb9KUDnLUcAe2pUDOXjAK3LcvRNemomP05OZV4BmAVumThyMGIsQNs1yyMNreFTE
	 Iw/tT2xZuNqOBZvvKruLemGsyWp+4VT6bddqxnfL/QfdcHVYWajKN5RE6NsHeHNDYXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P0bSa5k1;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34512606A31B
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 05:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34512606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P0bSa5k1
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso166746f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 22:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562372; x=1793167172; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7wvxYM7tnszHbpN8YPIatF2rX8H2hfZfH08DLyoi0hs=;
        b=P0bSa5k1kUjymUJPbXuy1cA8qghRU1FrjFTWlH69W86jrz3mrXImpIttZm4/C60vyW
         FHzKkj9sTfwpODZsQ6kreoO6cTZ6tP1vu17NPcBh2dIFiGF3XKYKhVZLzEgXx3SEfPXx
         a7mIT7TSHG+ZdFczMHksPlD3a9n8ZPFBkok94SXMzNUv0xSa6m9WLJhwtfvkUAXwsZzp
         aaz7fwZSKt1MoJ2mqkyRZ+KrhGAKfXpCz2jTJ0lX7CAVQ9Sn8hbVPN6W9wCPp0JNsgTq
         0vrRLH6jHQbVIk6w0MxiRotueQWWCVdHdYWRjyQn177PxCV87/4pwSnmOWvHSvCxoKNw
         1/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562372; x=1793167172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7wvxYM7tnszHbpN8YPIatF2rX8H2hfZfH08DLyoi0hs=;
        b=V+/Aa5iCfIt90N3/c9tdiWkVpPKd0lKexF7Cem9LcDcfpLLafxssU4f5AOMgMqRIJf
         c/m70oeuqkJE9T61Xvpvuy8F9CveybOppdCVjcNojHYwmvh0LxqWNSmbmQmBCGi/qgwB
         JdOvxQnfFjOEqmwaOzrZ+UJW5tIM8YXEjkzVJUVxTpeWGamD7hkYcgTXDTj9TM7a1M1G
         vvYMIp1aUnO3/hlXWAG9zaXYOaGO8lasuIDFziGssyOjc3NXGtIc+xfyPAQ+loytJILS
         kK5yqM0n/b8OAP1wJrO9Ac9uJBiD+TS02z239XOmZAe+WfQZPNL+be1DxpVo/4lfE9I7
         XvEg==
X-Forwarded-Encrypted: i=1; AKwUvBzh8nbJVDdyrBu6hvFYY0l5PTZZc2e+OwemEz6k/rS5TghdIhceLQIuQdrjwJJBYU5f2v1ipimOP0svq6vn@lists.linux.dev
X-Gm-Message-State: AFq9FYL3zAYfNbE2jlM8Qx+J+EZxge1jGp2FBQ+bmzqYOnqgaK4/iSD0
	gsQdi1qb/ocQcYxUra/PqW92AHNeLsECn0fw04C3NRIITbaTBuK9plQM
X-Gm-Gg: AYBFou3i4gYp2MCvizxpr8zvTfw0d1Cli5BrYxyi9uForXF4Z1GPO0g9TgptWTNw55c
	YnqAW3Zo59bJndvGtLaP/zVFnWCM5kMw/abdwc7alarCQoyUWJqI7ye7ka/Xsh53Tc8cleTRXzm
	/cFzIfsNVMd240ZCyjcEfB1e2n17BDtHBLsRwRfiU+TFMIEpso4ePPx/k07aBoCgMHCKjTzvObY
	bxdXfdGc1Kso98QgilqTJcQhXi8OQf8SXJQq8K2YJBnDXQ47NbwXCTIJvm+E5CvtL5l1QdKhkeK
	jm4bziW7wMWYe/8DDOgK7i4LQUR0+CQykrw3disFqHbskveU6/d+WSPnYRsjBEEzgWWcsPRn83Q
	9lUSjm4mMy0tfRrfoyet+WNOZxSN9Qe/92qMXBYVl9bZ42Sn5JE6MZuLgRQbKayPXfMtOinyRXB
	F+xfxXTEamXZM1g5Wd1lO1giN67VLnSwtUiJuvPW+hHLIQFjN6yLsGD+hzk2VeE3cDeBwYiLP0q
	buR0wzJxLFo3nDZVY4flCWz2qj+QBDCSOPFF9rEWXqFbOeDSDhIpRM2RykkYTO2ZlWHPKRLFA==
X-Received: by 2002:a05:600c:c8c:b0:4a1:e489:f8a1 with SMTP id 5b1f17b1804b1-4a1fd89d90cmr15704905e9.2.1792562372261;
        Tue, 20 Oct 2026 22:59:32 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm134642305e9.13.2026.10.20.22.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:59:31 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:59:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: use scnprintf for fixed-size text buffers
Message-ID: <athUwPFnbEJ0p-0s@stanley.mountain>
References: <tencent_FFC8FA1142CEF600BDEBE1EDF4EC27C39005@qq.com>
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
In-Reply-To: <tencent_FFC8FA1142CEF600BDEBE1EDF4EC27C39005@qq.com>

On Wed, Oct 21, 2026 at 11:22:08AM +0800, LiuJunyuan wrote:
> Replace sprintf() with scnprintf() when formatting the framebuffer
> description strings into fixed-size buffers.

In commits like this, I want some analysis of if this change matters
or not.  I would still support a change like this even if it didn't
fix a bug but the commit message needs to say if it's a cleanup or
a fix.

regards,
dan carpenter

