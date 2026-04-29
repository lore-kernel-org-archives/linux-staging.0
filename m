Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ECF362151
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 15:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476014; cv=none; b=ayjlVHOoTi44EmsgELoeQ66IGIdYZ3QCcxgtt1nkBZ0AWzMZ/CEaFerL8TKHHTGJpRVmBqwP3SiXz2IP0CYn9596S2Iu1iVTwhXQWjqIcGK58/fTXFMxxEvMxpcWWPoNYLdsFYcgZrQzAhPqZJXL1gBPFQkmk7F5Y0PccWSqJQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476014; c=relaxed/simple;
	bh=Ew9ubal5x9KS9bq3vi1DJ0S0IiFanwbXoxQj4zEyPqw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U2SUnU4Io5d/EDD6qoHFu1MJpW4Ug+7YfehvnouCC1wCzQCYcWBR+5chjQteyPAKVX3Odp74p43scxgjIb6a7n1/at9TNolUOmWSrazHhkgMRQvyOVCxsqgex67QhBVQ1moJRecU10tL37YKreDxxesHgKyCltThC/0n7uRYZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJ12MQal; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJ12MQal"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50e5bea4045so89058581cf.3
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 08:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777476012; x=1778080812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9LoV5LvB5TeOBPAogjEhvUJRmTuyIhJKQITrSyrp0dE=;
        b=eJ12MQalrA85JC3kkHtS3NBusB+2QovSO+mgzsHzNmsiKre1M64lwDWd5umpQs8bFi
         AxJtray4AEjQKTs/yHciEN69ws0lnQN54ua25Lh3a++AMjuRkofjAFuK3QRAucYIwNJF
         znY4kmYgu50kmSi1SgeTd5TEiObe+HoTcxXr9reuY5Jl4cxIj/Y9E2GbCxVEeDwgJZ6g
         Zu3n/ZSn7OQY0m/oiUC/BbGHJkgfjq6TasD3V+hJp5zvj/bLkTH6lceumOHuzvylinkc
         GdOSpS1VTW9txgKi1mylB+2MTbiykhQeep7x3Hlia7KIMy9eU/XJTd5vJm19OwgCsLGN
         Vpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476012; x=1778080812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LoV5LvB5TeOBPAogjEhvUJRmTuyIhJKQITrSyrp0dE=;
        b=O9kiNqhnLjKRHADQT0eil7tf+nsRA8C3BwkW+PySYOW2G0HuNHMkCZe5J6G1I9LKO2
         IUw7QLCBwwEynTIpQnn32B9T3GM/RdUTZdhzQrrpxfYddOgFFabCklyT4CdxgPW5w5Jn
         FVdnRqWvrz1X7WazQarEd64YvhqapRppxaqE5Ab9l4UMVPM+/ZRge2jAdY5F/Cbp2o5b
         OvOvah5P0UB/dARgdj8/jFWA4XuGrk66UglooeRVbOrBWb0uheMR1/mcpCRJBc6d+eR5
         TK8HxBXYj53ECpggy+O6f1gXw30X35QCb6CuTh0j+aQ5yYJABRrRV056CDTRnP/0gphm
         yxGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8azBGMfGTfEQ71MNpXpddlXrkL7CZux+uzXJWugXFE2mPtriy7L1otxtHa+1HuZDnNKyUxMl2q5yBJHQE3@lists.linux.dev
X-Gm-Message-State: AOJu0YyW6w26BzKaLsmDUsDfKy7KAFtUSoUOGP73rEXMdZon4pcv+g9d
	5KMvxp41l4TyV73ejh74xGsx0BUikPb0ez9xYFE0m4qncA6Zao5zDxwX
X-Gm-Gg: AeBDieu94WFQ5w3b0paExL/mASE1NP1VuoHCF2p99xDEv6jQGWmYy+jfjpn30rSoVr9
	TYQvGmj+Epsth7goDuTmukCAkqb88lRIWAkB3yvq70wY2Jb3jlYPxWEE25OwRSs2JnUexQ9tNQF
	wJ3IrSdZbgpcqXTX5EIs1TrMvPuYMywAeJ0p81a68exZrJf3BOOANhnr5wAu+MI+TecFOXaGu2V
	jaaJq+awHj0FkruOGn9sUjnipVLOdAXDrjJ+lUSZnun9tNAIYNgub1HSHHbm4cBIEmXMkXCsYs2
	jAtZP/GhMn11DgN9s2/jrC+lWt2J+JfKQPO28rYNW0uO3rvqJNx/Ze+CQ0UTTlqvy/UjMTxHEBb
	HTFLTG8JBFYrOOYN2SBrHX04aYB3p0un5HSuOPWZ5d1Ww+sK5MwmGN8Os/d00atHbPF9vTpD7La
	gnxjQil/7k16ROHSDJJwa0EWIodgVb6K2pGBcpHCQ16IjEyL1Q2oQ0XQKiZrCVI43jtvs4
X-Received: by 2002:a05:622a:4a89:b0:50e:5fe2:83a9 with SMTP id d75a77b69052e-5100e101278mr117552321cf.5.1777476012272;
        Wed, 29 Apr 2026 08:20:12 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:84bc:8954:e2b9:d27d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101aeb58desm21712421cf.29.2026.04.29.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:20:11 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Wed, 29 Apr 2026 11:18:58 -0400
Message-Id: <20260429151858.28761-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 76e9ca7191ab..ab4374e3b2ef 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -12,7 +12,7 @@
 #include "vdec_helpers.h"
 
 #define SIZE_WORKSPACE		SZ_128K
-/* Offset substracted by the firmware from the workspace paddr */
+/* Offset subtracted by the firmware from the workspace paddr */
 #define WORKSPACE_OFFSET	(5 * SZ_1K)
 
 /* map firmware registers to known MPEG1/2 functions */
-- 
2.34.1

