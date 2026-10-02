Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9C2448BAB
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931102; cv=none; b=B2OcJgfsy3sshdO6sol1dgLznE1WTO0dPxCE7U+Dk+dTqohqPPvXyTCZLgba/Z01NXxod2XAvmuwFddLyghHGbAQOkm5IrVNWpcSaTl2EEJAhcTk3yPXha160RyvloI1NNGFauBaIdzUXha3I03YAZh8+u8k9dt8KF85XHry+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931102; c=relaxed/simple;
	bh=fm/X9EW1BssQMdacZe2HgeoRuFblXb6/mQSRUp0Gmtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBZ9AEs+oj2goFKzwwF3UVVz7n0+YqvEo/dSqI8vWwiNt0ZR5MDPIMVFhNAXa8UIKwNQVOMizadWToz55RD8a+nFJQm6u8OvD/+IoLlGDTx1cDIwlVS+NP9t7gXI8NeNZ5Fod+SnEkGsgK8UQqUmorm9u8TiLtw1OBt3KhS7DOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJXulahX; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJXulahX"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so2979510f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790931098; x=1791535898; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fm/X9EW1BssQMdacZe2HgeoRuFblXb6/mQSRUp0Gmtc=;
        b=KJXulahXI3xpfM3ZoIXcf2MMhTa1Ke1Wg648ul59LzQJ1QRiZw4a4A8uMl3om4t6DY
         sxPldRjAKomP46eqN4WeArQYbAfklIZVjr1sfrPcQeyEosP+paImdjHPdNL96wrDOoQP
         Yvtl6vbfQZCctCOYBHdsYiI3E96N5PeTDr8R1RGXLJmJ41ROIznVhKvr55KxopI/KEN9
         07G6hsZ6u0Wd8Hj7lgABV3ubgC8IB7IBWrfZLEKj5CDkwhCsR0UTGr7pij8J6/SMHmBr
         hhiqTDRB5qvlAk4bY5Hc/pUam2Hp/FyQEDEh7qAjVO1/n8UX9gxBE162x4ciS7D9GOhB
         yEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931098; x=1791535898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fm/X9EW1BssQMdacZe2HgeoRuFblXb6/mQSRUp0Gmtc=;
        b=ROmUbG2sIB7JOTmlCMAZ8Mq5XG/N+0JS7Ky8Sh8SywhiNXE8906M4+j5rst906Vw1Y
         f6DHXihlnoBC8Yh62mjAPG6jfIpSUpb5wOGKPbO5qDPZ3bTL7dO8sgi8YFt4aoglM93Z
         lbSgNoOMOBymXu+ATBzgwkMzQDmaX2XW4z3j0HZ5uWmGm2IB+PfBzMvsHmbYWq3lZXgr
         zbCB4GJ7E6ngGn7DWZqMOeGRaNof6DVt4zwMTKk35qL0elc18xBAHKaModQC/9ZnNf87
         9uxnsK0xUk/HCf3QxmgqjQ6UGuc4WWOahToquqSWD7nctL5VrjKbI9YscU8Itop33ALK
         GK7g==
X-Forwarded-Encrypted: i=1; AKwUvBxE+CTmckuCVKCpK5D5B0N66QH2iGptUFmRPkBN5jHN8/9dCdtGw3K7kRe9ujJlH0A5h4A2hAGtBxQiWu+C@lists.linux.dev
X-Gm-Message-State: AFq9FYLuRSh0oRvNbGdq0O/6bqk+zOMQgFsENnt63oUrOUjCF1iAT9dk
	prDoYQ1cCpzeltf8e35rJ4SLcAt7TE3cgt6b99vH4nP+intgoETR1AGq
X-Gm-Gg: AYBFou1fp0BSfuuadl5Rykf59NC3+uEEobSKJoW3XKkRlZqBYi9LHgfqgIgMa2nB5eF
	K6lFAb/dHeu5I6RViIjDpDLzH9727OznbgifRiYMs8ege39dhAP4BcxD260n9/wFSRP1HuRg5t0
	+4zjXGSlr1F7MPWXXkqHw/Et7b1ddPuD+eXPfFdzA5u7ILwaCNCLxIsSRu9hOrbDxh8wshHp+sg
	js86JuYzXWETIyHy9f20Ve+zErFVAQxGFQS+/IuVhP6iHyel6Dq2ez5ZiF8dEFPb9G+n4PHO2yR
	9H38C4ldutUWuS8jdzD+cl88yoB7ZIcCQ4fQTadTOyUbABGCg6j+rA96kN/6Riv+x3f3ISptORQ
	opVOFDGqXYG+Gj1Ut8HxC42sqKAO2jmjYN1eliuPpkS/gA+I7hqMwuUJbheYZXg6VF9tOdZqxa6
	REXV1MmDJG7aObW+ml2UmVIjZy68WcQZHj02xJBDIi8l2rmoM7lOqiZKRyMUqHV7PDg/0=
X-Received: by 2002:a05:6000:469a:b0:48a:fd90:f254 with SMTP id ffacd0b85a97d-48b1272a07amr1928001f8f.28.1790931098356;
        Fri, 02 Oct 2026 01:51:38 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fab11sm4165684f8f.16.2026.10.02.01.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:51:37 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:51:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/15] media: Add Lenovo Yoga Book camera support
Message-ID: <ar9wlk34f_aNlIyz@stanley.mountain>
References: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>

Please, wait a day between resends...

regards,
dan carpenter

