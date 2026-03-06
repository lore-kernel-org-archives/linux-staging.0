Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277EB1DB34C
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808210; cv=none; b=WDXxnPv/a5S1k9j0X5CWDZOrv3yPTGo3x0kvKkYtTqFlxq/reMJHtaidO5Yo4sBwK3irNKoPFKhPuwbHHhOwfEFsikkDkmJW1fLcKwcKHj9xWdWNWuGanDFQVSB5apzGBU+qK44Gz/hKeOV3xna/5f+FkMqRzQ/YpqAZ0tIazI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808210; c=relaxed/simple;
	bh=8tkDEwM2asPohBzdRdZz2Gu73uJ0yd4QUYX/86HGjpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILco0ZrZJSYr9bRgGck3+9++PgZ9sZScP84+4IMC64/fub60/hJav/0SEDqf4Cx0SwcNh3AmPM1VGqh9SZdx/uMK9mDnEFyXCS8gIbXBPwsTCIEzaiTuHTIpLKEyYhPgrX2A6CrbSD2p8OR1euuu1P4vFXxdyfIPaS2MfpgBHEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZMbYAgAj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZMbYAgAj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48371119eacso110532675e9.2
        for <linux-staging@lists.linux.dev>; Fri, 06 Mar 2026 06:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772808206; x=1773413006; darn=lists.linux.dev;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mnkBKbiAwsVbbilQBNTs5Gb2aWXP6aakLa1Sqz5ipyw=;
        b=ZMbYAgAjSL51J6pBrE3Pi5kiyL5Z1GTiOLoL6pT0gxuDYsV2E/vO60NVAXRdYQfOHV
         iq4gkudo/nCpDDK9Fq6eGZBkS7bF5EzIzYIf3Sf+t5E9trZzJC9qZgvc+YfnmMmhuXYo
         a0DotIaCuDPdMiY9Sd1po/9ldXEcnk19s7M3XylHdEfltxTz/7EEn/RyK0OOuykGWos0
         FokcfA3CMsyqicDs2bvml7F7j87p3qsZGHih8oa2NRfYoAnG+EEV2IQcNkscEGrWVZDD
         B9USc/lFn6vpN5L4IdE0UqB6jbXA5Mx7bAGIqrVHHIhyrSZ1l/6Ieu3jUWBYc4/BN7Bp
         X4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772808206; x=1773413006;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnkBKbiAwsVbbilQBNTs5Gb2aWXP6aakLa1Sqz5ipyw=;
        b=sRmjbdLTXrQchOJUSoYDdOzdIxpsyIMK25MzjYIIjseW1q+rpPfcuH6m6drVMA0GDi
         tkmLE0/Gbw4fYxlAIwPF6Pztn7omKTqUqYbNG9aB/iZeYnIRjo2dAKfDgoIAL7ceAffd
         8x1EosnHkv/csV7AzM04vWQbpfhdTRkMJOFyXIlaJzeGamlDFOGvAxtIzrN8h9HUuDrA
         wnVaBCWybXeJWiOVCDP8AI+jxqC3kZrNiiIAtuz6SvGdFclaLVtIriAlTS2KRKRvntcH
         z61bNCObJVDhwJUCOWqxExtGaiCpOIYBOD4F4amfXlebYAE5MoW++JpOmFdfsfgjehrR
         saag==
X-Forwarded-Encrypted: i=1; AJvYcCXf+R0yrAr9xYKBbqcmIhTn1OHatAIDwOXAwpeEqaX/rRPGXBZNoZ3o1qO3lwM+iQ9KXwou9htlGKIMNeF9@lists.linux.dev
X-Gm-Message-State: AOJu0YylpYskhLkx841hXHjtpClqm+fMGXQMPZWbBVEZicxBQyS67sb+
	knpmHMbLkNKpaX+Rx9aoFkl0JLdeQ1Nvh8ES8R2ee0zJZ10+6e2EHqrEYUNVvE/Wduc=
X-Gm-Gg: ATEYQzy19dof1sNzSdPuaDcFFWu8FejUUxEp18TU5FF/GWxpEXxVDGy/za3M6rTyl/4
	quu2hjBaN8UHCP/I+g0v3jaTQQicwwhq9Pf35TWh6C94nux3/iDmrmXBcgFckYa38aH1U+imLZb
	rPNyjuzo0NlhbZSkw6pcN4SanLbytDubPFkotUoGM7Qxdd12cxItKiVKQEr5Tw2UjjqonHqn0V1
	UZ2geIvTZJAJSkA3mgTJKkTZJMM7UQOo65CUf38AAvR4LqrNqfvr5AU9nfSMdkK5HHuUkXAaQcj
	ZQgIsHiVxx/0aIQNLSbLakRfHqXd6kvNCDyEq5yXsmuhFp5cdfq46eBVx2eV/GYLQcp3OXfMR3W
	UBDK89xDFqnDiXyyQGbyCmy3aStAMKP+f4BtalHTVfizljHE809QD19edRNd8awG8i2UKhxUrLo
	IgjJ4ZvDRAX/+FoqnC5+ZFJwX4U4nB6FMP3ZPAllANYxZzk2c70A==
X-Received: by 2002:a05:600c:474f:b0:477:af8d:203a with SMTP id 5b1f17b1804b1-48526964c79mr39805115e9.27.1772808206465;
        Fri, 06 Mar 2026 06:43:26 -0800 (PST)
Received: from r1chard (1-164-74-26.dynamic-ip.hinet.net. [1.164.74.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ad894sm32276145ad.80.2026.03.06.06.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:43:25 -0800 (PST)
Date: Fri, 6 Mar 2026 22:43:20 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH v2] media: staging: ipu3: img-mmu: fix sign-to-unsigned
 conversion
Message-ID: <20260306144307.670648-1-richard.lyu@suse.com>
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
---
v2:
- Added note that this affects 32-bit systems as well.
- Clarified that all callers ignore the return value.
- Added Fixes tag.
- Link: https://lore.kernel.org/all/aarQeHfQuq20gXH0@stanley.mountain/
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

