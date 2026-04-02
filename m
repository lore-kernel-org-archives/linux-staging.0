Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDED93806AB
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121543; cv=none; b=HNsZ60aHtrB3dJUbl5aWEnntWOWSqQpYCzO6OAkKXVs4sjGxyfnBVOlbYj1s6ogUVL74/IuyXjCibbNfShnk06JBjzPpSSYhABUxGl/ZZ/ApgKnQik37RgeqlUgglpAeLIVKa7R937ekkMTTyKa+3EyqRM4YhobvbY09KxKllGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121543; c=relaxed/simple;
	bh=9dbv09lg00DQPK1dV+7JZpQUIqSigeiwnk61GGff5A0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W1c1Sq0Lm8Yg17fCeMOBCyExLanBiBiFMOSRK/kAKWCjHUCfxyrd4JDzXVdQmHwQAHb8olppDeLds9u/Az0ABgOdpo6cq5KPa9jF31dOPncyYzW9O9+cas8AjJIIJ9VQWEpXDh+719gIZkfB3p/JUk+CTDmOslv/8ckP5JF2clM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBNvy3gc; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBNvy3gc"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so1274565a12.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 02:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775121540; x=1775726340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eO9T/SGyYhQ9sXyC3ggbEF5VPpGqMQn6RrExsIa5gP0=;
        b=DBNvy3gcsNriw2JD20Kwdo9xs+wRmpbqbfcKQUXwhtc1K1Ksb6zAqakPhwU6utEkZO
         pX7Vcb2L1u8EorQ2mdx41snXwEBqyLDtdyV0pdt55xmux0efMd1qlP8WqrquzKKw0ukD
         iQnCXQHcD8/Wj3UqfbZuYQqLF17MDj1VqJAvzq43rBV5F2Sm0RezbI3TMQkscz+MQE1a
         H6mazHS4QS1QBp+uto/RzqN/UPAt/eCzzTVQ13/4OPjxfnHdf8SAVMwqTOptRHuSWjIX
         OVXIMevc1NfVl+jcRWtcFdMjc6S3rR/HZYs9xvvCAdm11zN0m8040esoq4TovjpW85YW
         qz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775121540; x=1775726340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eO9T/SGyYhQ9sXyC3ggbEF5VPpGqMQn6RrExsIa5gP0=;
        b=ed4G6q5gMkgNYUuIjj0emdeEtqUOZ5kpb6MzX34HlkS6V3HxRVVOEm8oWw/C/CmAV/
         s7MplhyaGZstGt4gmCawwtZL4L5udZBxGMBGHkyDV2XEtEIb8jK460N997c8JRL5rtuB
         CjZtxI0px1cOGoDACkjru6ANXTg2UPmoObh6vOZUVafzU25uOCfT1wO11Pw0UVxjz13s
         0wKRKOk8CxMP7msASsXVlcFnOph2/aLHp6kvaxNPNFAkiJ2Ae605XcCa8zbsZImbZtHW
         IabV1BHx/sVbXrUOzw3kVTSrBg1LDC55EWv+i/K5n8rMXiPG8dxEcw6JgySWLddCCT4N
         fJsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtj2RyJhEKC38EsdC084SOaeaWWlXQXWmr+9mm6ul33YuSVl+6s7O9PVlQft2Bf+TWG2gs6XY395RL3pSY@lists.linux.dev
X-Gm-Message-State: AOJu0YwLOU3Wb2X//huYNkL5z28BP83gmAac0b3iXy2EPza3UzO+UsGy
	iywCbHkYJKy2rf0ibn+bAC3dRQqodmxcLiyGfAKDOU/XbGDMcrsWRK1I
X-Gm-Gg: ATEYQzzuDxUSl0hyhFH1YFNYaD4iL/QwlB1n+L/6/8VqAuy1Bf0icu4l76NbDGO6CPX
	48FxBkRHG/c/DW3Clf9L/IrSV84OAeDfh9CVvlbH1QlEZg1k6EzUrZXmFsN3jMlgw6opwennfVL
	ZVH2wyqLEPG1N8UIVoK6lQaGN2wiEXYPtUzf3V7CmyXSO0Fe9Wtld1IjsaLR46kx/9DsHLNnbFH
	bvLbwpAEWYoqaRLtfxcg0o/4ISD+5Vy/L5Tr61lJrf6Ipx2MOR1yMBaUjh1AKqgwF/F/lsm3/PT
	j6GgVytj+ffqCLXvopMa/vi41ZAsbudLY9ngzfWQ/yBtx/h7UEZDK3ysXFRf22VoTwT4WEjmMox
	bTDSJM4FeuhrX8EgU7MmDFzZ0eCeUh5f6n2T+bs/h9braW6ZFIfXe1VsZG4hseUZg08+o2RMOrN
	tPHw9jzm3r64v8GvlkMIdKrUFJWV4b/hgY4/nieIMXDtsaGH9BnG45z1sd3SP9crdfQiMIdthnI
	jQijbOb75LwlWdEV+0e+p1a/lplK02UPdo/NY5QFQEX2ogU665oTZksWhP+sWxcJnKngZcoRN/U
	t/H3TnpdLrlKw1zO3hmYSf3aRhr2A9OSj4ZpvKzG36mSXocobdkS0FbP/2iCrRXcQQwcLAK5I1r
	5U+dVhPioZLU=
X-Received: by 2002:a05:6402:350f:b0:66b:a9bf:2f with SMTP id 4fb4d7f45d1cf-66dafeb831fmr4176050a12.2.1775121539912;
        Thu, 02 Apr 2026 02:18:59 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.od237066db22328bb-tp.internal (65.161.7.34.bc.googleusercontent.com. [34.7.161.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034c8065sm561809a12.28.2026.04.02.02.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:18:59 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	grondon@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH] staging: atomisp: fix alignment in function signature
Date: Thu,  2 Apr 2026 09:18:27 +0000
Message-ID: <20260402091827.2163-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment checks in function signatures

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f..c51d04af6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -96,8 +96,8 @@ static int atomisp_buf_init(struct vb2_buffer *vb)
 }

 static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
-       enum atomisp_input_stream_id stream_id,
-       enum ia_css_pipe_id css_pipe_id)
+                                        enum atomisp_input_stream_id stream_id,
+                                        enum ia_css_pipe_id css_pipe_id)
 {
        struct atomisp_metadata_buf *metadata_buf;
        enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
--
2.47.3

