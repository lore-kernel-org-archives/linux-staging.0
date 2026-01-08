Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728431EA7CC
	for <linux-staging@lists.linux.dev>; Thu,  8 Jan 2026 11:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870251; cv=none; b=bYJUUnZIMfXtt4TKPiF4naf3BFf9FVIKFTnPDXivXQuZAUKqMhdKhWTSG1r+r1mpwMafehoj8HintzdCJAw3PujijIJBxKj/ANswSbB9WFafhDqtQw+Qo6W3kS8RLZ5i/JlA+RcGLoBatcgWxUp0aMMQtu3wtUUsNH5V2a34wzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870251; c=relaxed/simple;
	bh=ZEwqFCYVc4HimN+6rRHZCUw7Ywe13otDm1hjQ3A0GI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKsSCpV5FJuw9bnnHbDO7L4kbmfuUI1ztkVuJaQlzaXWxOfyngIfR4N8PcCfILdHx3FENt9t3axK9lk/Xm/B+Lc9fc7AueAHIphPcG9cm1cr97Obp5GptVERgf+FciT0vrquu1oBqyzRWhB6O8Ooms2j4CVmSCHIYgjWyxpfKWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCo2Efyz; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCo2Efyz"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so1852121b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 03:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767870237; x=1768475037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvJ1hD9P95fDY1XrAy912Nuk9aMYe060/j6X9Zcdrnk=;
        b=bCo2EfyzSFe1qHPOve8Kyf2ip+posQ+lFZilZbPFPebspOh0posspfMr/5BQ7UCoen
         A3vC3G8UDcN4C+p4U0j72CNRgnSo6OAFI4hnkY2LT0yeUfPZQD0P5xNrTtU3rCgKO+am
         kFWh1AMG3EPUI0H+LzFNnuVdJorPFESVptlcxqnVXizUmyhAgzKn+AVVQQK3UfVvtn35
         n5FA+NO54xf/ab1T9fwcXEJVcDzn5Kbo5Pkqwmc23/Koda3IW9I5p3wmCr1jtbPxEx/x
         hGQvqlVzLWA7ceoknbjnyLQ6fWV2QFgvmo9Im8kSytRDOEr+hJBDJAJl3GnTNs7b4Z4Y
         pAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870237; x=1768475037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvJ1hD9P95fDY1XrAy912Nuk9aMYe060/j6X9Zcdrnk=;
        b=FVQ7iAdy9Yy6znS/liXQK6zAxaLu7w5k8mkptaXHYHE34q9JJS5Ji47Eph3D5ni86O
         eJ8ID88E6h4BZSfRU4I0MOF+bKdCe7REHp2YRnpFmLbJiNj+QDHmKXe9pHIHO4l5aR7c
         gY7aW/qqODN7rm9NaHqilZV6x+hGRiSXTZxMSAJLmUuQjbSoR3aJmgcy4d3BFTEMBxat
         HG58BlHUsVWnaRCKgfQbG3SL27+M6UV7nlbYQQIfjyHn/MTcEBGWlQDF7/r50EBmD3+J
         3ypEsYs4QfhQChhTYQE27zgjG+ch8O3tURSqWXhq9u1D3fAb22lWNLSGYCZNiMAuHkfw
         XPag==
X-Forwarded-Encrypted: i=1; AJvYcCUdzNo3E8z0TJu9vVmCt5LoOYoeia6ebJiTGKPhQH7jSqz+k5eakMzY7y0Ihxv81MTlMuMU+ZrtIQP6pHAD@lists.linux.dev
X-Gm-Message-State: AOJu0YwJb9GO6Bmcr2UETTnCRd+WR9fO/Hn0uL/69feELaRk4JUlvSik
	icn3AXHIX3aTP7po9Yq9eX8rpus2xxAqPc6WYv7waSMMQ0L8k59oBcBq
X-Gm-Gg: AY/fxX5x29FHSxatRYQv3N/r7v4J/2qCNKsqB3hjym4Q3Ltzcp7Dqvq6Jp4ijrdSjVc
	f34Z6HE1xHlQ7n/0uDR1pmTcJhjaV5tfPALRfLAmarWDTyaqm/iTNI/vxUAs/e0wqpadTgEZrWy
	1lms2JILbO69Pyxqna9X3IkOoM7oMXAdG96nQoz4LlyHF2shhCDcPxcSSHbMJgXGRbzNEaCHs66
	LWVHU9bjCQRb8zXpC/eDovdoEDCpGjx6mE0Mb5jgCabhNSee6Mo6Gu+RX8zi/VD8DJ24YuAcyDr
	KaQM+byAl28FoGnDnxvYdN5CxUbKPWFRReEZqUaMHPzjch6dSWD5/ic0Uwt+7BjBFpnPV4BPeXS
	XsUaz0C2UgP9cLT/rRPlSQkjvZX/ASHfIgdNiBBLMz/qpG2BsAY7Fwos4kwY6fSHOuYC6pd64x6
	dhQrkKNiXWntXaefu4K7Uul+UmNC7ymSYcIjex3KFbgktn5cZ7SMqOjNrwZRI=
X-Google-Smtp-Source: AGHT+IEl8ADB2W9MKNjoK4jVTQCoZOQcVP/hdfKRsU+zAzuxw0OHlz0HKnR0pyLR55pljnit86/3xQ==
X-Received: by 2002:a05:6a00:400e:b0:7e8:450c:61c1 with SMTP id d2e1a72fcca58-81b80ac599fmr4687647b3a.49.1767870237503;
        Thu, 08 Jan 2026 03:03:57 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e8010sm7616172b3a.52.2026.01.08.03.03.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 03:03:57 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chaitanyamishra.ai@gmail.com
Subject: Re: [PATCH v2] staging: greybus: lights: avoid NULL deref
Date: Thu,  8 Jan 2026 16:33:51 +0530
Message-ID: <20260108110351.27771-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
References: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Found by manual code review while walking the error paths in
Gb_lights_light_config(): channels_count is set before channels
allocation, but cleanup uses channels_count to iterate and dereference
light->channels. If kcalloc() fails, that becomes a NULL deref.

Fix is simply deferring channels_count publication until after the
allocation succeeds; v2 includes the requested comment.

Tested with:
  ./scripts/checkpatch.pl --strict -g HEAD
  ./scripts/checkpatch.pl outgoing/0001-staging-greybus-lights-avoid-NULL-deref.patch

I couldn't build-test locally on macOS due to missing <elf.h> for
kernel host tools.

Thanks,
Chaitanya
