Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB25303CAF
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870915; cv=none; b=M9A93UTmTK3PfOyFj+WTTe1v4keEoUvv6EF3eBYvLaXZBCqlhonEaUNgdi2Z2yKDGRX+q/xgCC21CFhiYGx6zTfb3GJC/1nqDffxMehGYBHbgeDH1SrFtSUISeYoAmP/ecGjnIw1jZpA5NJrwYqgN1Uqn1nQYXq/QFbAOK5/eMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870915; c=relaxed/simple;
	bh=X1AqrYiDlVBIXj3hu70zjXFgy/CPWMahbDfE1UFj7e8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OqLRydNl2yCbM1siPuV+/iEL5ILdKK3nozQxzuqjWS2agNDyRtY9e0RcvRSOt3ZJNe5f+LBYHHi9VYrzAJTWJ/rHXr2f1oKOGR6w4COQWhxAPcIMFgbFvX64rY4DrftAmkkhS0l+67ianHwIhymZvZEPDiSDDTqIRB+GibDRXbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWmCEBfC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWmCEBfC"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb72d51dcso286606166b.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870910; x=1756475710; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj+HgtxduluJorTLjvqhqXUN+0cIHtQzCLrC7EzM7J0=;
        b=XWmCEBfCqpYbI9O5/WK/otcHDSXQomU4YMLjuEXp9/C1es7XfjjbKQFBgXm4fnDj+W
         ZgVOvnq727ViyiQoRUBQIXzo3xEOY9owWdBJH1di4o2kjvx+dly60X2ISs1nYi2k7L65
         hm9SGnXj5zNTvJwP8nzVUdV930llFtsQtT3sUf400RJBfT8zyvSWilYs0GgppcyoJRWh
         CFxLFG1iTIQoyphQmpWw+Wmcvf2AomKcynuML+O9bTUPPkLMnkdvL/hSLJMa9WcsWvIq
         EdthF6HUA48FVSO/BG4Pr5hq/RvpspYpszERMlCD9H043Kxyn1v6lbwgxsQmor5DRRDp
         hyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870910; x=1756475710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rj+HgtxduluJorTLjvqhqXUN+0cIHtQzCLrC7EzM7J0=;
        b=eX4FjsWBNa0ccqoRzSRvtaZF3YtkBe8dAWpfTGeqVyEkU1y6kkJgyLDf68dOl0glTd
         HOdAtrY1n6/kmUejJlbjVB6JfRLl5afxYjRjhtAK35kI9BI6zwXGwmcqSLut69xmUG3U
         yHt4lDmNy6rdvCg77JpkBKpNSzQ5NiAXEnA5M0F923fVA32syJsDhlj8XQTIIu0e96yT
         zOlmoCmkrQoNQbAA4VwLLHdH5/xT8bHPHbJLg4OChIFQKSOLOced9D1xFfFn+RcKM0oV
         oKijlmnsosVXC+/RX55IdfCRUqbbK6YZgNnyGrQcFYrV1pxqEtQMurF5MLUZnkAhjyOY
         w26A==
X-Forwarded-Encrypted: i=1; AJvYcCVegL611oOx27c400CEwOIEgKti275kNK8D+qh5xkHfPoure/NylYLY89yjPoRZAKlRgEKTpWWyocyHZEVH@lists.linux.dev
X-Gm-Message-State: AOJu0YxcFzZ20SJqB7wGK3G74D72WzW3IwQKx5Vg+2VxCE9Uf6K42CYZ
	CBefF+AZyN3N9BQZl603kmIPUekuT9GotBGGCcgzur5DYFAHi3/QBP2l
X-Gm-Gg: ASbGnctuAT/SOGLnn2Roa7w9f1s1roi6lBSKZl5p7sx3zX/oHA54NrY9gKJzNYvOIZU
	E5dlD+kd+ybRQbQKSpNnUGzmqk4uLfpJru/R3T0XdcFsCXH6iURegZTmgEvXFMSNYeJpIsCcYUK
	OItiqffukKp5b9NLsgmLKpX84p8vZd7TxJqsdDcguSomljl6lyl+Fdmuq8P+2WUqFLfEJrh5+Lc
	/yUmDufWt8nWDSi2gwyRmPQjg8P3DJSk+wXfOp1YZixuqH7iNI7ifC+s2wRSdwrn34fg7zlp4Gv
	cY+k1uvUWG976XOSfnyBXUOsoOvJ9jy3xE0YG45D7CeDMUD6PEIJqjg556x8SckB4gw0Dh/mKh7
	F0iI3ORs+5kyFRZCRnZ36OaXWEg==
X-Google-Smtp-Source: AGHT+IGViA0WcJpMqUWyH0PlxyeUQx7RR2prGZEhfZG1uikO48f6AeQtIov1nSstrlCfYu3rGvzfQA==
X-Received: by 2002:a17:907:86ab:b0:af4:11e1:f877 with SMTP id a640c23a62f3a-afe28f162a8mr287292266b.21.1755870910341;
        Fri, 22 Aug 2025 06:55:10 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/13] staging: rtl8723bs: get rid of os_dep/recv_linux.c
Date: Fri, 22 Aug 2025 15:54:05 +0200
Message-ID: <20250822135418.118115-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves/merges the functions/functionality of os_dep/recv_linux.c
into the corresponding parts of the driver in the core directory to reduce
"os dependent" code.

The patches have been compile-tested only due to lack of hardware.

Michael Straube (13):
  staging: rtl8723bs: remove wrapper rtw_init_recv_timer
  staging: rtl8723bs: move rtw_recv_indicatepkt to rtw_recv.c
  staging: rtl8723bs: move rtw_handle_tkip_mic_err to rtw_recv.c
  staging: rtl8723bs: merge rtw_os_free_recvframe into rtw_recv.c
  staging: rtl8723bs: merge rtw_os_recv_resource_alloc into rtw_recv.c
  staging: rtl8723bs: merge rtw_os_recv_resource_free into rtw_recv.c
  staging: rtl8723bs: merge rtw_os_recvbuf_resource_free into
    rtl8723bs_recv.c
  staging: rtl8723bs: move rtw_os_alloc_msdu_pkt to rtw_recv.c
  staging: rtl8723bs: rename rtw_os_alloc_msdu_pkt
  staging: rtl8723bs: move rtw_os_recv_indicate_pkt to rtw_recv.c
  staging: rtl8723bs: rename rtw_os_recv_indicate_pkt
  staging: rtl8723bs: remove os_dep/recv_linux.c
  staging: rtl8723bs: remove include/recv_osdep.h

 drivers/staging/rtl8723bs/Makefile            |   1 -
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 194 ++++++++++++++-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |   4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   6 +-
 drivers/staging/rtl8723bs/include/drv_types.h |   1 -
 .../staging/rtl8723bs/include/recv_osdep.h    |  40 ----
 drivers/staging/rtl8723bs/include/rtw_recv.h  |   4 +
 drivers/staging/rtl8723bs/os_dep/recv_linux.c | 225 ------------------
 8 files changed, 199 insertions(+), 276 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/recv_osdep.h
 delete mode 100644 drivers/staging/rtl8723bs/os_dep/recv_linux.c

-- 
2.51.0

