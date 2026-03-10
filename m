Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9615D3E717C
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127662; cv=none; b=LbsOLUHnyrmaVfcD4oLyaiwB5FVo4359qMeSmdLIKU0ADrjXKwTlYFcT4xW6G8BxcKM9Y3RYtlczQ6S5Ww6Yzb1KMdvjlUwOJUveRqXR7qj+ZaeHeSUi1EVdZcmuGtqLjjyhmVf/pTVitBWJqHlCLpcTIdP3xp2fGFQ9NBOK1h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127662; c=relaxed/simple;
	bh=VMXnt0+HqWoqS6DNVW6IYqpkIQ1nB/vR8oqo8odb/Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkm+AGGICFVWYokTLyWY77JqUpO1ycQxnhCuc+D2J77KoJrDWxN6Sjg+6ZYUZKbw74N3MApod3gfkbixVFtx82n3XCtYqEeT7ZHADkTWViK4C+df4FOFHQk7dd85gl/nPnKkRXh7Bn3RTTw1hEh/HauStNPVUcrgAukBegKoRJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pb42ARcH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pb42ARcH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4327790c4e9so9687326f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 00:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773127659; x=1773732459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jacTSd+O0Lj2vj9e7jaMto1a5yY4ztTuC0uUl3yJitE=;
        b=pb42ARcH8wOAD9y9KCzl4Fq66HciTTBDaYzHl7TT3IzfSPfKgEMSqXIC6x/qYlx9jH
         kEBEBng6WjbshYpD6Lq1m5bi5fr9Q+J/zsK/WNAHmWT9n5Dxi1FS80G6Pzgw12RC8lSu
         +dC5ybK/H/7jrUHW6r7N4OZOlgzYs41/fV62jEkPBytzgtU7POiRcr/1PyHcYLTPRhm8
         Fo6hQlqZO3Q4hqckHCZ3XJQnLr8Iulds9JpmBYbU8QvXDbgehj6GW2OUT9/p3YvBpHz+
         0s/ceFMYurQlFv8GzPG/SRaHZCawgD6IvdR6GHGVtGssW3KeULRStZLQakmOoG5M6Qev
         5xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127659; x=1773732459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jacTSd+O0Lj2vj9e7jaMto1a5yY4ztTuC0uUl3yJitE=;
        b=PdCKl2+WN7WPZg0SjF9Qe8W/WHYzifGyCc4qk8mUsegq1UvhMFCHwgGIYMYL0/FKhg
         h7fTqVP105kDz+AtpwL7SKIu8RjAYgWb1WQ9vZ1MRpoFom66CzuDtz/VrMhd69RxLWYH
         05NkRcaB+TI72IwezQs1i71l0zKeLqoivZOyMdMlb78ayj74nt5fQEiBibkGroHIzwWB
         FoDdjNuf+x8xKJmDz+s7cgjUMvRlkNAKnbDi01AKwydOgb9eAilxCFyyNRzJVTqC5zdC
         3WIz8Eak64fgC0+lAXnG9bsgS2PLQBuYDPsBFjiopUrgU5vchd6HVzUIrl55G+Dqvr4O
         /k2g==
X-Forwarded-Encrypted: i=1; AJvYcCUOz+myVL6f6sBWWzlovWp9a9sB6aWSdX3N53d7RuNr0EHuSaNbHscDpSc0osmxzvGGdJGoDWgLJZfwQlFL@lists.linux.dev
X-Gm-Message-State: AOJu0YwKQ3DU8FDa89/IvVaMQKoRgUYvKswmDV/ME+5Za82G2GaFsl6+
	XU+tCm9f4FtJvKGmPZ+aewMKw4SJ+JcfBTj86UmyxbEQHmCrKkD5hccZ5xgsi+wmkl8=
X-Gm-Gg: ATEYQzxVsO9RjwWM8jfAw1nYrdjP/3vQoML6JwnkDdRWXbFnGxvYKK8Lnh662eODKy9
	Rqc68lYn14a0gCujJiM9MTXeiHop0wvuYauxE3334cz4sOYBGdyrqk/CD3MgP94r1Gw93KaDyIu
	7ewqs03IQbxpmrQoR8XPYNUbBUKLHJv7CH5TNMhswRuJhbmEgfE+DeJgSO09Ohi5Ha4y5TYAqPi
	000DGw82ahIHXfvOBvYKFRWrZvG7tR/KxBOcwbOVucZojmLmRdhLQObw1ogJackTrpFlAUrOzIP
	v2Xwl1fxYmgq+JQenqSbCe3gEUyGG5MeVCUAN4gFARqwactb2WLi3zWVuEt8jxoCSGKdocnHOAv
	agtYZaTb1d11sJLkOhYCJnPQOKlP8RkiZ8/GihkEmgYzRx/CwKOORC0n5b550J9GQqCkVRepps/
	eZT32aex87aGEsztktp9KXDgfXNmtM69Z6XMfw2aU=
X-Received: by 2002:a05:6000:2404:b0:439:b1be:819f with SMTP id ffacd0b85a97d-439da55ab06mr25127567f8f.2.1773127658187;
        Tue, 10 Mar 2026 00:27:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae49177sm32341501f8f.35.2026.03.10.00.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:27:37 -0700 (PDT)
Date: Tue, 10 Mar 2026 10:27:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luis Soza Rodriguez <luistermc789@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Soza Rodriguez <contact@sluisr.com>
Subject: Re: [PATCH v2] staging: greybus: loopback: use sysfs_emit in sysfs
 show functions
Message-ID: <aa_H5txp-dOmmqJ-@stanley.mountain>
References: <20260309230507.4931-1-contact@sluisr.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230507.4931-1-contact@sluisr.com>

On Mon, Mar 09, 2026 at 05:05:07PM -0600, Luis Soza Rodriguez wrote:
> As per the kernel's documentation, sysfs_emit() is the preferred way
> to format strings for sysfs attributes. It handles buffer overruns
> safely. Replace sprintf calls with sysfs_emit across all loopback
> sysfs show macros.
> 
> Signed-off-by: Luis Soza Rodriguez <contact@sluisr.com>
> ---
> v2: align backslashes in macros as requested by Dan Carpenter.
> 

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

