Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F41E274B3B
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 18:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612002; cv=none; b=tqcd4GmZtdjInzq7Gwk5FxLLjfkNqh84TInhXmRWNsvIN7l8t8UrvieX4Xj2TehIBJgzuce6VdcbdNE1s0F6GUGM6BXVBVn4C5XNuYFI3THU68IiqoqR/ZmYEYBUG0oGhI9DOruwQF7BbkpOWRKIlFrQ8eofBv86x1nBf5yu/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612002; c=relaxed/simple;
	bh=JZvqZubwLOYzis14+yASh+pcktrK5ameuGuu/7WUC+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b5AdBJLw71XzqdOBNkTedVZ2XTGU8vTGC1Vh+t2bH46NsteUZKOkZX5doUpQJccxjxt/mkxbwjVJro8pDcAuXXaEC/eJDkzRE4QcOgeJotKySe6IDUo7w7E1UP8GYTpsfvTw9jkY+bGIpPbXzKOUUVv2O5B60baFFKfPQWBKLms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5TyIqFS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5TyIqFS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bcf48850c4so12705285ad.1
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 11:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778611999; x=1779216799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F52DhFoNmNcK/+26jdAcoomuvkzxmLPPP/SUUIK+rJA=;
        b=W5TyIqFSMhP7UJ4AY4HaXrZF3oIy7ZaNGFg6PD59S2iJnNEorlEqE0iNow/GTRcpXs
         YJcDkfzgGxZTP+H5MSLMtgSNaHmXspkImOoqQVxD4GhJddk0qhvvCEPIbdsQYUH/Bx/8
         DzxCllaUuK4Wf2chto055ACRbs+lZQv+u3Q6CxfGSoPTWJ33TeiTCTVLK2sTL3cHvmkO
         gFAJkZ+PH80o+HsKqeJlaFp0DfyrfYlMU4ubB/oWDjL7VIfHvVW1IevI5KHSVVjJ0XcE
         ifRTri7uOjgp4vnhue2m5YBXHc9QCAidoci1SPVjU6T8EU2qMjD3kkJZcJ0NeZKWNzlc
         L/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778611999; x=1779216799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F52DhFoNmNcK/+26jdAcoomuvkzxmLPPP/SUUIK+rJA=;
        b=Sm3RJ5apxX82V6ChG8XfSy45gJVi3Y9p8bmu06q0KpHl7ehbIlaZHd0UyNKzi8cmaX
         tZxL4JUr7+Zv/SrEB03g54PLMYoiweZkwd9FSRiNosvG9+4pDddcLFprI7UYDrTy0kUx
         4iaKeYKSr5uD/JLeIVwLk3Kf6/YRTXvEANl+ettI4EyyPcDKCaXfhYox9q3K05cx/e9C
         xSjom86AIWJB6EaOJ9qavmHd195x1M7p2/fyrIh/b1RvM6s0expuZj5lmeyUrkJXytPq
         pg9muAt+pLP+a8zDWCrdfBL6msh1s6GXQ+3bgVmcSqoAV6/GrVS9q/uYnHqGSL0MnyyE
         HuFA==
X-Gm-Message-State: AOJu0YzDJcgVMsG9x+EapR3kpZApSDwXBlOwUl20PaIZ1/YEckuVXpuU
	yyWcwxMrVCM5AHZF8jWbznGUepKt7f+RP0l8/gladLBwmX3RpXcr70ZB
X-Gm-Gg: Acq92OFVImMTl6tCHTh5nUcdfFjyoXHRQTA61LyN8PVLC++p8c52YsA5IZcdbsP3Wx9
	0QnzwXZ/YRxNqUXlTfacdlVT+SsfpfsAvXldOu+ycOy9GJ8p7SP4WbYbWwnk8PKYF0cNORtN0rP
	moeoUYrpUCArXEuGrmd+xW3SAggaSnkZucNuIzwoRZXAPtbS2rxj5DeIubUC0drwQb+0kmDXfEX
	PJfHeDAqt3paV75HIm8uw5svVcSnhl2uNpOCXg07w6qF5PfDtkA0Rmw9zKfFyzhWaXGZ5un/4tj
	nm55yz6g1jYpbkUsnb/7vl9r484ddhzf1cYOdEZCE52H/lR48UGedzxjQd7eH6018hWSH4eS74u
	hf3YoPlJ9NboGVy48VkgWymuTlKSozXG8SpcNtYvfGehu94xBxMpgfI4OyjdJcQjN+3UfNZK6xI
	3eU17j5dGcFCTZ7hkPnb13b6Ezrs3pyCVlPmBGSAoXZNqbRXgH6dY=
X-Received: by 2002:a17:903:120a:b0:2b9:fb0b:b727 with SMTP id d9443c01a7336-2bd27714d46mr2720015ad.39.1778611999267;
        Tue, 12 May 2026 11:53:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27062sm144887205ad.3.2026.05.12.11.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:53:18 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andriy.shevchenko@intel.com,
	pramod.nexgen@gmail.com
Subject: [PATCH 0/1] staging: rtl8723bs: Fix checkpatch line length warnings in xmit_linux.c
Date: Tue, 12 May 2026 14:52:53 -0400
Message-ID: <20260512185254.604090-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes line length violations in the rtl8723bs staging driver
reported by checkpatch.pl. The two function signatures
rtw_os_xmit_resource_alloc() and rtw_os_xmit_resource_free() each exceeded
the 100 column limit. A long N_BYTE_ALIGMENT() expression was also wrapped
to comply with the limit.

Pramod Maurya (1):
  staging: rtl8723bs: Fix line length in xmit_linux.c

 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.52.0

