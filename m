Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A333438F
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693285; cv=none; b=UCvxmyxW2ksOrTJ3urzriEiMm7GFsJS/bGZHxqpjiyBSbLYU4gIbL8FvWjGnh1Cdq0PZ21WQHDg0c7UVasAt+KAXAUwxQ0CCRrk5Ea9RhkcySpGLvV5p7OTwMKbxEWKwHc/T2GWeRyRcgcd9KJRrF9IpV8GTgm6JimjmiQWsLMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693285; c=relaxed/simple;
	bh=X/sCA35vFOvvORX04tkckmfa9UgTGg8SVbzaASPtIpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tz4egRr6uIB5d13C6UG137+r2DxCIip9gdelPjNL27fCV/nRC4zJaxn4TqxnYk56PAtxTIxSMpyxQxhWnjvwzDTDjLspoZXuEdGP0Qt/RRb2+J3LnD4HzPTntX74t0zKCe9hd+YDHMemmGvTvgITGQX5WbWjkD12yJa9f39wcOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9N9Ijfb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9N9Ijfb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso42447105e9.3
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776693282; x=1777298082; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hm2ZrQCDBXbvG0flA6wLHxmfqP2GwLTFudbVpMDZjZc=;
        b=d9N9IjfbCxrkg8OeaPaMsPWF7f6MSLARpO9fuKCJsAQiqueaFSGXIOHsFwgInl7XGs
         YIyGqVZaDSH7Fzug+546QGCSYG884XgRoLNQuD/fiS+crkClgU+jPTcr6Xqi3YKaT5eT
         faZ+xl/qf9Pdqoq80lRFWRCmaGFGC8GwbPVAcJAcmmzYbCc5gDZUfR42fx4baLQa/yvX
         fKnAvQ0xcMetuSnaAKcpS02IoZiFle+kufBKVYR2o2daoCtj78ECSiV3olOy0DW1pk0p
         jbHvslH/OV6EsvDkpUb3zhkv1/u++LADUXBlT9vB1/wkDr0EUTxHqr7Hadpkf0fj7zAy
         T7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693282; x=1777298082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hm2ZrQCDBXbvG0flA6wLHxmfqP2GwLTFudbVpMDZjZc=;
        b=MSP4oYxxWnckuW/jbZonER1UaLxKqa7PrwKRdGfobPOmy7vnSvadHcOLed7pi19z3K
         eFGBVG7kVfh7CtoLLQUr6tRcTtzcQohB0b500MpvG7dBBMfzsO1oFAYiw0hUngATy8E8
         BBl3gt/oyCkIptvXgGuHST0qfHoKP/hVbF74SKqcfUPxicA2YKSo1kAQHuU7/8VjFodm
         YOu0N8y7TfTaQyi9MZ5YWO7menK+kuDjjByVbmULD8mJywVNTqvRE12B4VYzj+rREEAj
         8NHg9PSjyYgozbO0vuAUo+xwHsFSpl97zhW7p5eptw3BgGC/Blgn1Yb7saZ3j9uSlBMf
         eybg==
X-Forwarded-Encrypted: i=1; AFNElJ9Z5PqIwjFoS24iTftwoU9PqMyaxGQ2xk/oDn6fJp/8sUvh0PkkjlUlqCDIqMhxftxbNulacWvR8bUIpM33@lists.linux.dev
X-Gm-Message-State: AOJu0YyqEs3tzpH3vgSSWky6rUxXzOl7TeGo7s9lDLfL6CclmqnTxedK
	rVfb6d9sEPxs+WRbFUNJnVln8sTfpRD1QoMHChBCijHKZcJ5VHnvSV30
X-Gm-Gg: AeBDietPMfF0Hv5PNv75zr3dLtSDxKYPyLVxCiOTDpmRyfpHF6vdmeVeusS728YC8hJ
	4pkbB1hbMlw8euAX+1nHrFGgw5YB7/Fr75yEg+esyq1OfJExapWOz0Zvw8p6kIsSJRY85dmseZy
	QZoB4GyezcjK1oXATXBromunqClwPNKRyJJPrzGNwA/u9HEyL+jWtHpj2B1+OjhDK0tDLdC2+9V
	IReEJyMS6iQCdErKP0CrQ/LDSLRfl+XuVuhGIi4url/631IQp65U2q8qo9GvLbF90etcihFTKir
	pqZswyX+0f0YqzrQsiqmQ837q1McyBRZrJnPxg6G3ppM9JGLG62cY2qhlGaaTFF/me3eKS/9o77
	Xrmaff3utHdby4bEGWaKMT/O2c8HXT2IhPTv4YJJjQ5g8CcbV5Eijl5mulSlaHbuXC/19L9Z30n
	kc17UgJaAT2zWgrMZ26vI6m3LKZNcuxA==
X-Received: by 2002:a05:600c:4f13:b0:489:1a65:dd6e with SMTP id 5b1f17b1804b1-4891a65de3emr80115755e9.8.1776693282087;
        Mon, 20 Apr 2026 06:54:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm49978285e9.3.2026.04.20.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:54:41 -0700 (PDT)
Date: Mon, 20 Apr 2026 16:54:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: adc: ad7816: replace sprintf with
 sysfs_emit
Message-ID: <aeYwHbngIdVRLqpQ@stanley.mountain>
References: <20260419010537.116002-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419010537.116002-1-m32285159@gmail.com>

On Sat, Apr 18, 2026 at 08:05:37PM -0500, Maxwell Doose wrote:
> This patch replaces sprintf calls in ad7816.c with sysfs_emit to help
> modernize the driver, ensure bounds checking, and to increase stability.

This says that changing to sysfs_emit() will increase the stability of
the driver, but actually that's not true.  I am fine with these sorts of
hardening patches but I want the commit message to say that "The original
code is fine as is" instead of implying it is unstable.

If the commit did fix a real issue, then we would need a Fixes tag.

regards,
dan carpenter

