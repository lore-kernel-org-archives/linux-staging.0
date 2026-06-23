Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B363C1F45
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252639; cv=none; b=puX8gBEuFbeXGrfPZjPofBUkLx9HaojG+8UD8hMdVBTc3iht9OUVsr1Pu09mAHlD+KBKgZImpOvKpmDDysYZMHoLAdismkHcdwNBBS9+tT4F5ovK8tDz3UiypcGGjJwRjtVXAUIHFbS8vkEWhNH17/cMGG0S003NWaJu8Zk5sGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252639; c=relaxed/simple;
	bh=2ZmnH69X9i6LOFCWhM4qK/TDF+q7CGkCI6G71ROtLpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NNM38pxvVylRIwWUb4jIVMVgfm9czvydHDgCkmXs52pJQu7HmcYFSiCTD23guyu3Ii62iCMmcC+OLLxpgFE7LWn2zoa40+HBGC51B4d9KeiHm97VlgwlV9ZH0fpjE8gWhYbqqB6YjAI5X5CmJ/bAHvlJDbQ/WQusCWVxOall/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFRxpD8D; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFRxpD8D"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30b9e755555so731990eec.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252637; x=1782857437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zef6035xk0sI/Vr1UN1WS9r7Ogg1PRDClgF390fpwy0=;
        b=iFRxpD8Df2yPnkHtfvcImwN+8vupZ4cIVArfxytdyjLtnmJHzh/UqO8U4CmGu6EZx7
         cAk3DAOXZl42zMxyjrmFXfn5YmAC+MFJn0pBn2E76FFaXqDKAk/BoVbU42Iv5omhJVxu
         NdgDQ/NwRE1+B5ntQK6ECATFB3OKUAjDxv/YmMDbgGQsc63AFbWxRfuh84Ira3P+GiG/
         MOue7bRTeH2b27Nzs9RLdx+oYBnmk7oRkv3PNWxPZOBgDhzgO4g7A2oPbK7dTUKPk77g
         omXLFNBwkt9aZL8dyoF4Ht3Dum4rBawcroo64Y+sTFmtTSeZYqAbIeoTDOP6HgeNYe2F
         abeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252637; x=1782857437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zef6035xk0sI/Vr1UN1WS9r7Ogg1PRDClgF390fpwy0=;
        b=bu0l7KU9xnBbUlC+S+4iUsAEc/v4N6RpXDl4kjUbffjY07cts0iQCfj1QNghqRzscc
         ylyJxOX9g+UEsxZcYjFhZSFSUBHz4qOPj5wk01/7LNoh75O11TYMW2kTkb5IXIFpEII6
         hphx6VCho1I/YKLlpVxYC0E/ILssKejnTtsKeQZWdI7Ubs69xP05lw6U/s3eQxlNB6ye
         WpTgEBfV8pN39L3dn/EbTvP6+cGX6NY8JFKwjAI9buQSfdwmSDcvOOn2rcEyF7oLj6b2
         ZLO4MVlW1absjs3mPDdlDPCzjpL4g0NinNrnwlRCkFGbtIM9RGOrtNqYObssAa6kWuQT
         /Gew==
X-Forwarded-Encrypted: i=1; AHgh+RrXqNSF7BaXeo1Dmd6idk7IEuaoqs3CfbvrH3fib1nldUEv1TdI6aa6ITn7WKKfi76sNijrCGo4oWoE0MLw@lists.linux.dev
X-Gm-Message-State: AOJu0YxwwAXf9HXT1aQq41H8B338p5cez3bpEjcLsy2xeEXkiAivxDUK
	0/aZYtLCeqMFE8mqdrG2mTz9eUPLPbS8wWGdE2He5drq9q3/hKMur45r
X-Gm-Gg: AfdE7ckqv7v09tfoeQMs043n8VvHbZutHRXugfE+kCgIUCta8wAcymfVB79UPLNzdm6
	B0/7iOJTffd2MnsWQQfRHFlckK0erd5y0Ku4X3kkVJGmTfkCn8/6HDy5nn1vbGb8oCpkXBNbXP2
	zjygFSq3U4WCV+HFLbcyIsWBdNl0JOxtKm6b8MliaQ7X4bkpFX+inauSBl1Ktxi2jlvK9C5DgbB
	9HZmtGQLpnmj7cbCFI0WlFbRSKXTvuZEPLSC3Q0HbpWe4cpu16p/Q5w31TsbSb3toeDSoVSQhMA
	0tP20AZXc8pe9hvHFHDqo/qvttxly01TFntqSY2JlwQtzkGh1vqV1LlEQwrEsuFUB8poCSo3Ti2
	7o/jgahoDoCgOVfxpHWmHU+gdsG2whHrD5F+o+l+YSjJiqU08swl3rI+nmlB9q/dCQJUSj6Rlb/
	8Tb6LrCUxRtzUp1GFzWEyIBElS9EiT3CdtX+m/7zePdaJ+YqNEaxc9ixz2Oovd8KY/6fI=
X-Received: by 2002:a05:7300:b918:b0:304:de8e:17b with SMTP id 5a478bee46e88-30c68c4219amr1110911eec.5.1782252636568;
        Tue, 23 Jun 2026 15:10:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:c10d:2699:12a0:58d6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5178a68dsm9059903eec.22.2026.06.23.15.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:10:36 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 0/3] staging: media: atomisp: use kvmalloc_objs() and drop redundant OOM messages
Date: Tue, 23 Jun 2026 19:09:25 -0300
Message-ID: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several allocations in the atomisp driver still size their buffers with
open-coded multiplication, e.g. width * height * sizeof(*p). When the
dimensions are large the product can silently wrap, causing kvmalloc()
to allocate an undersized buffer.

Convert the remaining sites to kvmalloc_objs() with array_size(), which
saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
allocating too few bytes.

This continues the work started in commit [2], and picks up the stalled
sites from [1], unifying with [3].

While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
the touched allocation paths: the memory management core already emits a
far more detailed warning on allocation failure as raised at [1].

[1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
[2] https://github.com/torvalds/linux/commit/d178c7ca8fefc28115d35b94c3b1f4d653e34182
[3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Changelog:
v3: keep original author chain/tags at v2 and v3; minor cnt usage at v2 for readability;
v2: https://lore.kernel.org/all/20260622224402.34001-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Feng Ning (1):
  staging: media: atomisp: use kvmalloc_objs() for overflow-safe
    allocation

Rodrigo Gobbi (2):
  staging: media: atomisp: use kvmalloc_objs() in make_histogram()
  staging: media: atomisp: drop redundant out-of-memory messages

 .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
 .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 3 files changed, 41 insertions(+), 76 deletions(-)

-- 
2.48.1

