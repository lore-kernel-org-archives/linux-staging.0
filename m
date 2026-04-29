Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A33377EBC
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476401; cv=none; b=qfPyTJT3RUc4xoRtUeX/IqcmoOp6MpZe4Bco5Xlm0uftLNY7QSYwBduqqKRZ7elRM7sIdITjWoGNZA3Nf+FIOs/R+qDZ9ACtxkofADRCm4Ct69vu71I9KLqaJUEluCqxNHD/KS+CeOaIpCZg+PszW5WoWZ1hrkaVYHgLVxIl/qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476401; c=relaxed/simple;
	bh=TNbU8+MjC7fg+gzsTlY9VKgO7+m4Z/JOjzFMK6wCecQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AkBk8cLt3GeKm0fUCPR9uXN00PSxBTgxjWR6EUwpu8zyUG0oPq8/DgKRJxj3qqXTMr2c5AM5iIY2YwjciJRgy37KsM5MbgVJTs76CF5dIrwn3XtbF9KlvfECZ/c6Ml8zn8QbB5vMvhgNGcde2CiNN0ey5eEEuqGqzjFRTAQRCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPgJRAJp; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPgJRAJp"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8eae9229110so143589285a.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777476399; x=1778081199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XS3dtDxzU2kxeMHxbKYApVqMr2WXis7MX2GRKVmVEqQ=;
        b=HPgJRAJpO+YwASFasChIjmPeGK+gs0+OFRea1Eq6HP1Ts9wdKdpqkNcH5Y7/40OFQB
         PTKnSXqLe98aJvv6ZtaZSOiFvfjqSibzduoF+y0YFhK7uHe9ufUYy7824wGkz+KKHxSc
         JZrVcjZkKWsFSAFmn5FuYcQwu5A817zrvbFMt8U2RglkeAuIzp7p8syOvG2nQr9s5IDK
         PxDBjDoYH3VzaZWbGwjBx6qC/TIvZwa1TzAYWZHQ9WnEOJNCehyNO7odS75s75LhGFJH
         TZ5ie50PP4iIhKe6G63O5ieRr+y3cdog3Yaffak3Pl/xznlwRPN8v9fbquY8mUqc6cBb
         0Egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476399; x=1778081199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS3dtDxzU2kxeMHxbKYApVqMr2WXis7MX2GRKVmVEqQ=;
        b=d0L5Ud+8IrImM2cC6l44QVlR4+ZoVPTgAh8pag0lMXfV6lH+RLNYf/9FpxEnIYDr3+
         hkMPKPZdZD8ZBswXcLuK+OH/FEaOpPhiiMPEuoq1gCS7NTj/srUflTlfHwFBYU+B9OT4
         28xzSVLiWYDTuz4yoIKxMnXyNbGwxOK4O9KGv2PYd/qt1RlsVZcaChPpUTBPbmIYPnND
         G6AEF7jb/EVybU6Gb5FvbFqNSz/ygrRT7KN06Ta4yqFLzIhQooBqSmxBRbgrz6UZf6QJ
         mNiJAChZgN41ygb/X+31IwMVIJNikmxU6FIMddp5N4/29G0jY2VO5NTZ9yOAAxrGUS/j
         frpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xXbMZ0VHQmP2oFyNd2Rfm6slf2P/7ajY6oMn3bdU36MYKjXNuy1Z9oDnOX2jqOq6gx94BUWuaYNcNFVU9@lists.linux.dev
X-Gm-Message-State: AOJu0YxoiAXVoG1HkrB3AIjT0gB9N98RudjeZSe9eDhlrzBvnO6o2/EH
	0vXJm2DDFGy5nXO4LQJ+nj738vcxBOUCIhrR1hTT9VhvpB5CZ6UG64IPSJR2AotZ3zk=
X-Gm-Gg: AeBDieu5bNob0l7qDOWuJ9T6LIskWV/vAOvgdgWbg0BTEfBxaUpI+lO2JYdWA7CKdon
	Ptch1JqoyMXrBooAfbW2GGGCOHnM8AyI+1O5WsgcHSOAjS3lPoUc1dWdCZGgJKVOKgQnoZ5zpfr
	QFYzh8hhgjfKjfGU0R56MhWyq6UJpxlzA/Sk5tY4ohKuFcAw2ICFq0JJvVv9QHXKN2m7ErdI0UC
	ghNM/5jcSkcKmmRcCJNkfbooK9hObS/+2G9f2go2E6BvNhxyG8HY7oL49YL0OQtLh+4JOcKjUBQ
	z/D3zJ4EbTUdErsvlAyEFOysuRieV1T5Z69XVXLBZJARzaQ4mhZ9j80LiKe53zivlqdR1tVsAhD
	izR5T0bzctia84BNlCQyLfSVK2H6glISaVR+JPWTKl56r3wDCuskPyGy3JiNCpiR1K04wlCghYZ
	gQ7RIx2JRtPK0F4E9yQhyYfrLX/hqJe/xo/bSw3jnSG72nHasRg9OLDU387I6Fa7sCzVYT
X-Received: by 2002:a05:620a:4081:b0:8eb:73f6:b5a5 with SMTP id af79cd13be357-8f7d950233cmr1109929485a.44.1777476399131;
        Wed, 29 Apr 2026 08:26:39 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:84bc:8954:e2b9:d27d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93f583408sm202219285a.23.2026.04.29.08.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:26:38 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Wed, 29 Apr 2026 11:25:32 -0400
Message-Id: <20260429152532.29302-1-mahamaryamjavaid@gmail.com>
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
 drivers/staging/media/meson/vdec/codec_h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index 89e0f8624e5b..a6074de15118 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -16,7 +16,7 @@
 #define SIZE_SEI	(8 * SZ_1K)
 
 /*
- * Offset added by the firmware which must be substracted
+ * Offset added by the firmware which must be subtracted
  * from the workspace phyaddr
  */
 #define WORKSPACE_BUF_OFFSET	0x1000000
-- 
2.34.1

