Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ED8301026
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403607; cv=none; b=VEFCtVB9R6ms1HXgrVLZTreR/6QeyBuKJiI3tgI4lLqIRSrOuz/b0CeqtbZDR7v6Q/Xs8qQ9cgbkZrAlHsdco0eYoc1E4XLVmsRKetodLO+YF5J1ARsV59mvCxH+0EiHaLUzeJ1NIgf6hHYgZzAHLwygH5j64G5SI4xQ7yQDoFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403607; c=relaxed/simple;
	bh=MVi9gjCqAZTMXsNPh9vEf+rIvyewSLFV7r8/l+OFv/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjKvHJ3MCu2y+V4yfsP3gct5ffpf5tDovn16bcmRtO73b1t6rgA1Mozrb4KaAza/1C4JRUkkbJ5GfNu9u3xXsQmV4v5XC3Kg5yctVNYXVhSNSN1YOc7ZUC13NdON5EXD0bPhg8ADXdt6Nr872x6b6hzsdfK0WgFWpqBxGa0DQr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzU3hIl8; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzU3hIl8"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297dc3e299bso44996675ad.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403604; x=1764008404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jbISlPzDAWNfOTvkBbk/PYbJ5U3qCGdxmwMMQJcFhA=;
        b=YzU3hIl85NqC0N1pZL9PDazRzssF6596pgWkrqKVMSdhYGmLRgc/JQ6wmv7KoT5tYQ
         MmBuoEQs3D62nZFip4k6bfYEHZFeODv2IN8ZPTsv4z7dkgDwNNIsKkUARFjmE+yMzJLc
         SXmfweKtyWawtAOkOL3StTRWnnvtbvhLBSaFIE3gx/Ts1EXzpN3WnzRtSuqm1p34W4lt
         5D4YHAiicxH1SXWqnohf/HyIZKJqs8ESbsmSTFRl9Y5YMAF9/sGAWUtpg5ZyId4Hb6iE
         +AYodjyNf/uNRPpo6zyh4b/6lHhoVrB+Gwfu2GMs/xHFK2ZAvA4aLCo3o74No1eKewaZ
         thsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403604; x=1764008404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jbISlPzDAWNfOTvkBbk/PYbJ5U3qCGdxmwMMQJcFhA=;
        b=CLHOFt2PdyvLXISDyka9j98tUp2JmsKUr4gV5wfJzMjKI1LIXbZUxKnLU7HVuqGvey
         5h0BfT8uLHztNmQIhBe/+IpqmXemoTitVGi7EwXvRpr8rqW6rD9vLFMP4S8vuLGFgLbq
         IBgu1wbMiGePM7yRUIcn0bC0E/ajy+fjDDqMaIf4qQAA+Z47IRnMJlMC/fXGxqn2X+L9
         dPuDYkQN2/lBCPI4awyYG2Fu22c30f23oAoFgN35VtV0QbvSaF5uc/UJW127kDn4M2dO
         YGl0yJR1eXebmx1fGfmxVqYDu7PgIEJi4HpM4XA9omCLJ+RUU66Z/A4gq3xJuCiaCJML
         C91g==
X-Forwarded-Encrypted: i=1; AJvYcCXgHsGMZm68pAnOeGeiU0fBsKMvp3CBe7y0xH5ZZNo7Gq3WJqOsW4rlNL3SgTYZZU8Ci4055Rw3IUUOWqjd@lists.linux.dev
X-Gm-Message-State: AOJu0YxCyaS68ojOuU5hCB28dFB5x6izVmdr2gxk48W4LmT+G8P8+Oo6
	U0VALM+jr24XQkKjznQKlYd/KQpbqh/8rKwbH11hfyaIibnONFzdjIUHWxOF0A==
X-Gm-Gg: ASbGncu97XWhA4Lxz3BOcRLrC7DDt+n7rDZBjjzbaG9OUl0adOdkMG6fw5ascpHdyHm
	48lezFYAi3FeWdVJfg9rXZKiwEXwkUE6hM7/8XgmaKFnxVSzcRAania2FKHeDsS+0GURk2V7MuJ
	XWDWRT+bpQwlkKRC5ToPpa86gnDt04eNIHQiIKuHpMZH/IlP5RZDiAa9ZE8z+aXMD/Q3cKFNPv2
	I4kcsOMi6z8wN3JIriOuhDwoTEmA/PEr1IQvlTcahO4lQdqykbLAtl+TJ3aiQjOLmBKOV+tWVZ8
	t5wHDDQajE/m87VTyAPoPHQphIRo5FbmzI3YsNE6AdTtrDjZaw9Jy+CY8L77R9kjW2nOCq7xIBt
	l91On+8PBiEiOCz+OCwODjFlxdOMwjHacUOqle1168/ORjHBoT9E6Kf7L3iqOHq4uENzfvHJhLi
	5vxFQ1gu2ZMFuqmSrxybQV1Z2ANW9jIpkzU64dghzwR0YGroc=
X-Google-Smtp-Source: AGHT+IHBJUVG9uMdf0kiAeRM6dBSDpiq8MIFpokOGuV99yhq+uO5lWD7lWVxnjC1qKSdHG85rGWk3Q==
X-Received: by 2002:a17:902:e950:b0:297:d4c4:4d99 with SMTP id d9443c01a7336-2986a6b5680mr161298825ad.6.1763403603799;
        Mon, 17 Nov 2025 10:20:03 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:03 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 03/13] staging: greybus: remove empty TODO file
Date: Mon, 17 Nov 2025 23:48:08 +0530
Message-ID: <20251117181818.118139-4-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Greybus TODO file listed two remaining cleanup items:
 - conversion to the GPIO descriptor API
 - conversion of pwm.c to pwm_ops.apply()

Both have now been completed, leaving the TODO file empty.
Remove it as it no longer serves a purpose.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/TODO | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 drivers/staging/greybus/TODO

diff --git a/drivers/staging/greybus/TODO b/drivers/staging/greybus/TODO
deleted file mode 100644
index 43fb6dc3dff0..000000000000
--- a/drivers/staging/greybus/TODO
+++ /dev/null
@@ -1,2 +0,0 @@
-* Make pwm.c use the struct pwm_ops::apply instead of ::config, ::set_polarity,
-  ::enable and ::disable.
-- 
2.51.0

