Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FCC3074A9
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870920; cv=none; b=XfIO/JCnCTLzVFUv98X2ncY5E5URu2ILDSWwcjSQ8l6fpicxvRA5JK2fy6iisj40DR+mxcByWJyd0EV5rozmiyDiRmx2kV4t6cVqVnARN49P+HxRiRYXCuVpFf3XivA6Dj6fTJ00LEg5UVvcWJpFhA3vdbS2NbX/4VV89vSFftI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870920; c=relaxed/simple;
	bh=IpB9cvK5kSt7dw+GGmoQNb8wx+qNNv0Enrmgu4f1kkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/ZvmXZEzTBFq8Ebs94BR2ReXvZn4YAyoeC5VPM6JAx92fanZutZQ6JNefWdHdnLgvd00OqA7VNsfgzCYvHi4z5jcwTnCGPm91nkPeEC4foErUT7VbG8uALUFEUZkD0TbLa1FxvTxyuexgUBU7ZaRF5ZgKTT3ZdrtoSqlFUhMcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce/zShzd; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce/zShzd"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb6856dfbso383994266b.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870916; x=1756475716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhtnvBKwGmstz40ZlcV+VAZTltaTKGtbvDCCJ8E5i60=;
        b=ce/zShzd1TYmOt6GhBixkaJCd0sgneQ39gdJljieFOgtrX1SHrZPdjhrLid+DnOiDZ
         lOV5YAbgEqvJJrC99lf+8nWdaJcLqj+sZgIQWb+wijBTuPDdTonlkkRtkQQG3f8l4d7t
         r/VUG5qe7rURfg3T6I7QP3FrVMklxOMhmASCO0t/5qr5F+L2SZSUBq4GsIpJWW8M0pqP
         vdvp6se68QHBGSj4ia3B1meW7JiLbBdvAbu2GMq/3vxwsS2FsMCvoaUqXMvdwEywiRvm
         ld8k3eBU4ihgFHL3WjYGFOSURIiBYDc8a7fjlLYIPdM9shZuFxJG+5AOEFrBBYD0BzOV
         EDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870916; x=1756475716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhtnvBKwGmstz40ZlcV+VAZTltaTKGtbvDCCJ8E5i60=;
        b=p+vLbhQhuDDCXIQPg1bQFs3HqOme8zzkax6Dw/Emf8Br0XTQWD26K8+4dc5kToO7GV
         tp9Af7Ic2a4/bT/eEmRFLNdSmQ18HOr7Afnis18EA2kU2ZNDFTgK+EVyebB4+cCH/ZxL
         r4quI+v4cEcrIgb0CBgLjNnyfklRZz1KbWd93KU4oeBBCdxfGUxU6ztDt6I6oSnGqJRB
         xPdf5iiGXi6sJ5GqRxbFRtq55+Gy9fPWEHI7p+T1/p14jNfiDRSV6JSxRXW7cM9J4d9C
         AxUeJHcFYTpmvUkuhYY81NgoKkaTGwbG/4ABHvq3mNvIAAmOwvpS+nQ/pINMc+1O+7c/
         W3qA==
X-Forwarded-Encrypted: i=1; AJvYcCWqOYmDXayR/c1YPO0oC6fKflqUmlLcAlmALzj+rCBvA5tkk5QHjEO9XgC+aAZXmI4/0APyys5jaAtENcIS@lists.linux.dev
X-Gm-Message-State: AOJu0YwjGMxhE70QD21i7+OHVCbtVkGXHYnDHWMNAvuJOHo1k2f9eOKS
	CErZWicQ8zbLTpjSy6+WBlQm2RhJp9XrZOMzr9OHz0DXlbnLHFy75L7i
X-Gm-Gg: ASbGncvxNd9Ta5O4AcwN920U1wiTTFr/0KQLlmTZWnZrXS0+qpUt3PBS3l2104PfI5+
	Ta/egCYPYSTAlwPltpZ7m15CwT+jj0aLxF/uw6538cKQahIQ4zefPtTgU14zSeTZCHDsW3KDZt1
	zNUYjU9kJzLgNcwcWMaQpUA7Nh6530c9YBDkzgGlydyI0XgBt7Lnae1y1rN8FWxlBArX2hHWAi8
	JQX8m3gkqiAGpOFQqMS8Y4kuhWE/cnG48Yg4yiQL+I7Hc+iPOWbyVVltVKAZvpxP8u5h6MQAc+j
	B6BHXIfGCvp/ZrId7d11Vk1YCt9xEzcXQafALDFQhABF9O8jHXyiihENXYMGTu4wPVQj7EkTlv1
	iRLU5QjK6vxFVgDbH2ULuW2u45Q==
X-Google-Smtp-Source: AGHT+IHT7+T8WawmQGKLOfrCxwkolKFWqCzlOiIQiq3BB7UaJMLgc8Dx0GdNjecGWbrJC7emLM3BWQ==
X-Received: by 2002:a17:907:98a:b0:ae0:e1ed:d1a0 with SMTP id a640c23a62f3a-afe29018bbamr297028266b.8.1755870915954;
        Fri, 22 Aug 2025 06:55:15 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/13] staging: rtl8723bs: rename rtw_os_alloc_msdu_pkt
Date: Fri, 22 Aug 2025 15:54:14 +0200
Message-ID: <20250822135418.118115-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822135418.118115-1-straube.linux@gmail.com>
References: <20250822135418.118115-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename rtw_os_alloc_msdu_pkt to rtw_alloc_msdu_pkt as the _os_
indicates operating system dependent code which is unnecessary
for in-tree linux kernel code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 4947099d8595..a8b388822719 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1622,7 +1622,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	return _SUCCESS;
 }
 
-static struct sk_buff *rtw_os_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata)
+static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata)
 {
 	u16 eth_type;
 	struct sk_buff *sub_skb;
@@ -1691,7 +1691,7 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 		if (a_len < ETH_HLEN + nSubframe_Length)
 			break;
 
-		sub_pkt = rtw_os_alloc_msdu_pkt(prframe, nSubframe_Length, pdata);
+		sub_pkt = rtw_alloc_msdu_pkt(prframe, nSubframe_Length, pdata);
 		if (!sub_pkt)
 			break;
 
-- 
2.51.0

