Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80761366DA6
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770038247; cv=none; b=U4ibpiI4xSWvKbvMLwLM+Bu3W0JCSCv0hn+FObplwQzK1zlcP/5zD3mYFz/sqCPTmppDzLVI47kKB7ozeQSoyDMC5Monxao+NZYHEWCiCCMyG+Wpwh3yS65u+IZlTLFtLS7yd3dgFSkGzTBgB7NyHdOkHPVJMrNAiixZVhqw3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770038247; c=relaxed/simple;
	bh=4SZDf0ZeYft3LxyO/PxZHuns19rSAziRQNsoK+0iSnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lAdRZkx9VfxniBh5QWZvNg8RxtNOnRBActvGP4Cjajqtk4jk/DyzZtgaiQohVusLN+JTQuX5tdwsDSQ7KusaJL7bReGbSb04WTWSr/mf7UYvWt42NFnLPfKClpkb+eNhpRqlzqtOiyNVBipV3uIkiLeCwPGmVZR5uANJZ5QREVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc9HaSSg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc9HaSSg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432c0b8f114so234168f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 05:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770038244; x=1770643044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/gjeZwPb0UdH3DCjlOGCqxpBYFi1NQ2o7QLH8x5O0E=;
        b=Zc9HaSSgJd38FDI7SBTaTUajZ1pI3gwREwG7ldtrSSLTxMbWUN2SrLDdgwiuav2INt
         GxIgKxtEyyAxzGuXdMQZlqVXM4D9+tZfDqKSvPzfIj6n6ZO683CkOazdsBTTQeVS3Z9+
         iS+qcehvRpG5gJHajDNHOJ5Hn0ZmZ5wxXyDKFL9t/3DJio9rc8Stpf8dFN80JC3aeHB0
         qCvw5jNGETS2+ycZe+qL+AP/kR4s7tUasOpNlHIefpo78MDUDSQqOZ9TmqqfQPQDK19s
         OWkOiZmBflavixtT1rj0KfH+nl28KM8TO6i4NViKAyoYbikgjDA8g42JJikWY5GnLH5V
         W78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770038244; x=1770643044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/gjeZwPb0UdH3DCjlOGCqxpBYFi1NQ2o7QLH8x5O0E=;
        b=jlV8PfSijGZpqXTpKe+SO3rGNCTQwntBIEGu/JIT78U8gLCZ85vwNecLJb3e22f5zW
         dc3PUx2+76dVd+zJXUX0sFjZUgx3zU1Uh9svDjv5cW/+PjXF6pE5SrKzF1It1MubXvfq
         WyrS6PcLgcrXV+nZd5GbWb+lmWlj3j47HLmT3QGg4t5FGEsaA1lhByszm6ztLrHnYbR1
         w3ALgoA9wRfRNzHiH05pX489FEH2XHelx0DLuhny6usSR1S06/4csI11tArnqzof4kU+
         l4sQAt6Dt2t9FeVMXhLGW2mLicehzOzfDgwifCwWdRfIC84/Rav6yuARpUwQDOmbEWNn
         pSug==
X-Forwarded-Encrypted: i=1; AJvYcCVvEJJHaVlIW9QbqQ4OMUHYUoC26rJOh6I7DhsOie+DK18hELi4xbSTYGtyh2kDvpn+tX/9iT4fde4MTZJa@lists.linux.dev
X-Gm-Message-State: AOJu0YzgzwmJ63slFnOp0HlZrj02yk5on3fI4h0JJ6KYm1agiqIpWuAf
	kXQREDY+9WKTKPX8m5B2/jwt2boMkVLhx/wDDYia8vdM4dqX4LTl+mkY
X-Gm-Gg: AZuq6aIeJax0icBiMSHV5OQE1PzpVv4EdT6Jhhiv1bFDD54vdFlNMxryqLEHGOkboE7
	yrO0sZIwScvCT0BUwtAyZcyrmFMzQCnJzFvhqoZf5G+ECxKBPzFQuxVR+jHIpkn2DT4t8GkBpAE
	WFduUPocYUVFoY6sv6SFvL0Tvqbh1uiwgurmfOXuFUqblgUABj+8KcuHhgGlut3d+iXaMRutegm
	SsKpdfIbYcmQoUS7SG17bbWghOQI72f4faSEffpnCbj0B3rw37IL6VUH4UX5igZqPbJFZ3F3NZ6
	oZdXtoVCbcJEO3W0scjn83uOweqQ252wm6H+pOQsmMaXkQ8mcbLxaIAExUyh0mFqRYCLslNjt/9
	T5oXz1ZLmMDsCABPa2rSpDIhuIFKGYOFN+h6dpyhVFNMiZkqQkW843D2e/PAHrDOL85IqY5GL7/
	rreS5R+IBrXgte8koBroh+t31LjRJnQ9N9r1TJC+pmSHJPKvoMIro=
X-Received: by 2002:a05:600c:a00a:b0:477:a6f1:499d with SMTP id 5b1f17b1804b1-482db4938dcmr81702865e9.3.1770038243499;
        Mon, 02 Feb 2026 05:17:23 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c515sm379609095e9.11.2026.02.02.05.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:17:23 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: make _action_public_str const 
Date: Mon,  2 Feb 2026 17:16:50 +0400
Message-ID: <20260202131649.161215-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _action_public_str array is never modified at runtime and 
serves as a lookup table. Mark it 'static const char * const' 
to allow the compiler to put it in the read-only data section.

This fixes a checkpatch warning:
WARNING: static const char * array should probably be static const char * const

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
v2: add blank line before Signed-off-by (suggested by Dan Carpenter)

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 8fdeeda88a6d..4de0875904eb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1139,7 +1139,7 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
 	return true;
 }
 
-static const char *_action_public_str[] = {
+static const char * const _action_public_str[] = {
 	"ACT_PUB_BSSCOEXIST",
 	"ACT_PUB_DSE_ENABLE",
 	"ACT_PUB_DSE_DEENABLE",
-- 
2.52.0

