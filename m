Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CF32F39B5
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 05:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773985205; cv=none; b=gd4WodFjKqbWgC/mXn+LFhQvKuZjkdBqEGa8g/knAbIfoVYU1MeeVAOFnqtZgGk7sD7CIYIBsg/CRrDCb0rdOuoZ/smm4RL72nR64Dn/oubsVioNkOL04CEp1J7b6+5nuivj34E7M2hjPQPJRR7rR+2TPkRKDygC919hrzX+6fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773985205; c=relaxed/simple;
	bh=Ae22RPic1YEH5csFBH6HCV3HSnfo+KfeW0NO5YO2dJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aaoHGCPRtmWc6lOu6anpXQv6iKrrlW4tPHhLSgw5FzrUIk933R0UnAa3UMsZLAWta3xS0okxOfUVeFXRwXp2bjO+nKr5j07Y37SCVwio/yEo95wXCnN9BCz6ij2L7Y0mZyS1GG+xmrM2QskJmJ3w8Jm0Mw9qIlR0q9mmhQhTcjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Cx6i9tjP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Cx6i9tjP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486b96760easo17781145e9.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 22:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773985202; x=1774590002; darn=lists.linux.dev;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BPHK7nGCZz/oSDUy2MClP0uGtGGKcCDrTU26qey0lE0=;
        b=Cx6i9tjPpVNqmrcNHX0XOzm3ZCHT6N33+rPhaHNqQq72vRN70OZTY0/9XXopVS2uBL
         /zPavnMYXU/Se/tphJnZUriDXQbuak4HJUOj7q5ng2vW9KTlHVnQrdj1VdgvrAtNpgxC
         fWw3mXHFPiyDBuq844vtPhvYJbyJFgUBWvuwKKQWjpUFH2zqcSE2CFEjwKCp4N7K79AE
         LK9AEPG8ckcLMg5oxeaqU/m7K/mVkjVC/DXHthexz3yZYbifLqoCFDeLoEH2gEo5BrQX
         /e6B7ImSw+Jsvte6hOcY5cf+JzlyfFQZpUyRKBE2u7nljNbRFLVXO7bRAn6IUQI0qyu3
         EH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773985202; x=1774590002;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPHK7nGCZz/oSDUy2MClP0uGtGGKcCDrTU26qey0lE0=;
        b=lcR2AQs18/XOWmcBDcaTV0dr++3BrhLVitrL1aKLosxT345e2FgM3coo1lOtlMRt7s
         1wMV4lB4xqYqq1frh6AwyK6/4eZ5ZZB/OvDEWWUxsso2dDe6pbWXDUBeWPdJ7rq/nkas
         O8fvkIPssrYPT2kfkM8Ql9k7HzTP48gNJ1Xz8rGtnoGVosSGfzuFxdqLoDQwuCLSwkH+
         g3tkKv9UQo0yuP3ALvRF/+Ap86RTfMHFkLOGlPs8z3MOIsxLFbYBSqTNcdH56BI+35Q7
         lbva3NWqOwHZ5tr1qcHPWMgIDmIc3igV6eqvgqSv1h3RPaRULYFiv+Bb3+fz1IpiGJP/
         yaWA==
X-Forwarded-Encrypted: i=1; AJvYcCUmRtgzN4kl74U6KyWe5BkT1bLu5BFdTjv7D5g5TMAIL6+bKbi3VaKuEEUJewOCxNB9QyI481qszcK/lmtL@lists.linux.dev
X-Gm-Message-State: AOJu0YxLtl2PF8tb7FxCewYw/g+rXWFt6FbcCbl/G+CzFadaGlTpCWOW
	0i+u9dFvInkDaiCMqdEBB6xQ3UTORnKfd9W4R+Iy6+mNgZzgDbnnIB1v4EzJ6BkYsCE=
X-Gm-Gg: ATEYQzy5RsUlOUFbrXdi8NmF+4nk/WEaRtvkm1JoNOKJ7O1YgAoiI2Ri0FcpGp8NO7k
	cfP/trSX3TIK1oUFhUbf/2QABLvxaxkcNyDGOU3l4hYzW34J8RIXIY3BrF84hcus+NSA2A1q/Xs
	ZbU3gyt6lkzdT3xJkTqpvUrTqS6fN0aYO3hGHVojXxNtUe7i5ZPYbN8ngV6nNIze6OSFOKbuFtY
	dOPXIrK3/rh8Exv7NyFd2AUlgeruGabi9h4UAILTndeTaj1Lu44ARDB/P/VQ+wLQ+J1o7XpGk7p
	eKEl4pgDJBEcMbKQ0n0fZg+RWV8AEtengbliTT/G8mQAURfeIE+EUs9SoRwayA84TYiLQkB4J9x
	utS0L5TDdqi0p16IQvFn2Rr9hkumqp+6xwaxb0T+bj13SKud+SP00mhnBIE28b/TAj1DJbBPSD1
	KiId8a2183cXGvuX5ze5SxaLXEesisxsrWh8Gvuu3WIIrIVIVvsg==
X-Received: by 2002:a05:600c:83c8:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-486fedbd0a5mr21577325e9.10.1773985202413;
        Thu, 19 Mar 2026 22:40:02 -0700 (PDT)
Received: from r1chard (1-164-68-48.dynamic-ip.hinet.net. [1.164.68.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd410e7b8sm785693a91.14.2026.03.19.22.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 22:40:01 -0700 (PDT)
Date: Fri, 20 Mar 2026 13:39:57 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH RESEND v2] media: staging: ipu3: img-mmu: fix
 sign-to-unsigned conversion
Message-ID: <20260320053914.52916-2-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.13 (2024-03-09)

imgu_mmu_unmap() returns size_t (unsigned), representing the number of
bytes successfully unmapped. However, when the alignment check fails,
it currently returns -EINVAL.

On 64-bit systems, this negative error code is implicitly converted
to a very large unsigned value (18446744073709551594). The same happens
on 32-bit systems as well, although the resulting value is smaller.

Return 0 when the alignment check fails to correctly indicate that
no bytes were unmapped while resolving the following
-Wsign-conversion warning:

drivers/staging/media/ipu3/ipu3-mmu.c:393:24: warning: unsigned
conversion from 'int' to 'size_t' {aka 'long unsigned int'} changes
value from '-22' to '18446744073709551594' [-Wsign-conversion]
  393 |         return -EINVAL;

All callers ignore the return value, so this change does not affect
existing behavior.

Fixes: 26f5689592e2 ("media: staging/intel-ipu3: mmu: Implement driver")
Signed-off-by: Richard Lyu <richard.lyu@suse.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index b196a5815903..fcea125e5935 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -390,7 +390,7 @@ size_t imgu_mmu_unmap(struct imgu_mmu_info *info, unsigned long iova,
 	if (!IS_ALIGNED(iova | size, IPU3_PAGE_SIZE)) {
 		dev_err(mmu->dev, "unaligned: iova 0x%lx size 0x%zx\n",
 			iova, size);
-		return -EINVAL;
+		return 0;
 	}
 
 	dev_dbg(mmu->dev, "unmap this: iova 0x%lx size 0x%zx\n", iova, size);
-- 
2.51.0

