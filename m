Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F48E3B6C05
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 08:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513119; cv=none; b=j3do/eTzKGBjJOG7L7K8sF65xkBntYmCZ2Ao+08rbhIoyCpbbIIlitJo0AYBLDsR4zDQ02ZEn1jzwg6t1vHyGO96vaGBm2pKqjhvMZ5KYzkKcpfGe9lwCe9N9VwzphxQATMYEKA20fRiaU5uxv5U6Mhm5iv2nJAXaib7pvNPa4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513119; c=relaxed/simple;
	bh=MxPsp8s+hkkaqO9oaOaJywPlY2kic8FP8cMpRg6+G3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TwreMGxk3hLxqHRSJ7IRi6KVuUZsk49r1Ot9GiUGznlDWoyKC2ysEoIkTGpgQSGGYq9NSRvK2HDPLJCb/hZ8wfXxDpABbXAU7f/q2U8xykd1DTAVRVDJKjo3WN42jvmf/+CmD847+y+0k2OH371F1t/JfI0gRtM+rOVl51hZ1PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SG1sQP2j; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SG1sQP2j"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48538c5956bso5470825e9.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774513116; x=1775117916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAbYppiZpmge0WeV6Gd5Zu+YQlF0WZiCB4L+XT8hXWQ=;
        b=SG1sQP2jBjkKhvta8+j5U7IyqWiI3AqlEXQHgc+Vjw7q6eUj0zAwV0TPLyQjsZKjOT
         CeVM39MDARzbmwsKcw17kHnMDNou7ypqy/i9Dw0JMjmfPWEACQ8h4b+u3Wlyo97VsiMO
         24tUWhO2AAQ5oTm6Q09mndZIdTWUIffv7BJNymWCi8GVlZd7P/2PCPpaJjyRUGC5c26P
         rCO2mx3WvQ83YM7k6yVL1WmpildLP4xswx+pprHzKgtVnWjksyQ0EvwG3DSzKtjedMKO
         LFJRWtDo7SvWV3d75igCZtEb61JIxtele5osD4Pv9VAfmt8z2FVY0LgrOL1EK5nuPQaY
         XlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513116; x=1775117916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oAbYppiZpmge0WeV6Gd5Zu+YQlF0WZiCB4L+XT8hXWQ=;
        b=k4X5utlh4Cpk5wZ0N2TBsYjEfmA/eyxzz3B2Nrssvnk5dIWSy/bOFZHVbufSFv8jcJ
         UsIDevcLSWSYitkwKwdEzy87DaIGuACZ0SgoIiU0RJy7QLSFD7FC2WqghU3HHi/3M/vr
         fomrHXgH/nRkWmtvxMeT4skNKIjFgDun1/kX0tm4UmnCfese23lLMZ7xKqvl7jLPRSww
         GKB03sfi0nMkU+nxfG4gb1R9qqgQQcD3YvCCTsC4Y+euUQV92GKmITo5HBVqPoRsiaGj
         syoP4rVdlmkYzG9mjl9hE2k7C5rVWoMaQqcBTLBw4sDQiIu+GtDAe0mrHwYzwCH4Cw6y
         HjNQ==
X-Gm-Message-State: AOJu0YzcIIePt1JBJAjGp8a4nHjOmJSqYvfHvvwFGNhR0L+KPi7HBnhh
	zFOQ+uB4zSV6NoZ/OQrzzUj3GgafT2nDpr4QjMQHzhzRHWqEVk9t+uLbmjFkbp04
X-Gm-Gg: ATEYQzzTAchQoW7Sqcx76LIA3wutwTB8h8OKCYCt4S+arsq66A/qYWLwNzNMK4j256r
	GmcMTlWtRkMoVtG5JxvGH9vH7ArE/zrFEZeruUOB8rdyWTSPIn9WdO7Zfr2AWQBBWloQpBoJyUw
	wMMmNtcw05ga+TtLFnN5iZeaF4NyDXAQcDhssT2I2FfCr48iHCraHHbHe8xnZeE8TS2X+0IIyu9
	k+76Z8WrYfZztFMnReUuSAQs+n6W+8RXSJPbdYth6ovPVpOanJgyOCwgqEnviNgQOD99e2HuhbT
	YA7WO7gBV70WWV674urscQT16W7gUcVmy3m3Z2iVOVuaROVCVa7nN1jrTx+md/SRFDI7ysrr6wr
	UUmFdOcnjltKRg+dvEtwVusH5oeaR1E1zqzEP3dpcPriK3IgcPmOSSVr5I6Ml6iRgBvN+Hkbf6X
	mSjfnHesNGqh4wJ94Ex756U9U=
X-Received: by 2002:a05:600c:19d3:b0:486:fbc4:8fdb with SMTP id 5b1f17b1804b1-48722be4732mr12013465e9.11.1774513115608;
        Thu, 26 Mar 2026 01:18:35 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cefd7sm6130521f8f.17.2026.03.26.01.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:18:35 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v3 0/4] clean up error handling
Date: Thu, 26 Mar 2026 09:18:24 +0100
Message-ID: <20260326081828.6314-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series lets sdio_init() propagate standard kernel error codes 
instead of returning _SUCCESS/_FAIL.  There are two callers for this
function.  rtw_resume_process_normal() already returns negative values 
but the caller doesn't check for errors so changing this doesn't
affect anything.  sdio_dvobj_init() returns NULL on
error so leave that as-is.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
v3:
- Add one commit that lets sdio_dvobj_init() use more readable error
  handling
- Add v3 and v2 tags

v2:
- Add one commit that lets rtw_resume_process_normal cleanly check
  errors and return errno instead of using vendor-defined slop

v1:
- Use direct returns in sdio_dvobj_init()
- Cleanup return in sdio_init()

Omer El Idrissi (4):
  staging: rtl8723bs: use direct returns in sdio_dvobj_init()
  staging: rtl8723bs: cleanup return in sdio_init()
  staging: rtl8723bs: clean up callees for sdio_init function
  staging: rtl8723bs: Choose slightly more readable error check

 drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  8 +++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 25 ++++++++------------
 2 files changed, 14 insertions(+), 19 deletions(-)

-- 
2.51.0

