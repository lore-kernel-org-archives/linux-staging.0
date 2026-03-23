Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78758394461
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278500; cv=none; b=c3T0t1qTL8+MQ2cyEPQUVnDpXQNcdvoFbHbv04Pgt7seR0oPjcZmgBi/WkOxeveGPaCKwwapPUii/1siHt9IkVPSVsS+Jcr0o348vADibZcUPbyaOwn9/Ks/DvDbjfbyYSHorwS64G6S9FbGdn89yKq6KdBHqe9uWJHaFYbEhaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278500; c=relaxed/simple;
	bh=gulgjqzm+LaSz23P1L6/K/QPtivkPVCGqOulzU0Lg3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRo2QcITGy1QwFNSwqxbwhShleqgWR2OBccWbsy8r/X2Cb/KVaFIJ4x7O/aokuHx0m29rcjIXfW0BujGFO4zf643ENZnhJM/1yfw4W33hRAz8fFuidQEVSJhoyqgXkQzM998diqTYDKFprkDQt4Xs6GoroJxZBRGeeeKDdxTiJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLKlwklk; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLKlwklk"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a46260385so3211037b3.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774278498; x=1774883298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQt34sQ/WL3fGURARKrS4hYobaoxLiHHcmwp45OWpMQ=;
        b=XLKlwklkKfi/XMuHDBJLunnL2d3XKgjLtj6Qq1/fMNP2YFT2vKPkQwIMKTNF6Z2HtU
         /rxoe56wvcSvqtkHUhiIDNdsE//kcWkDRijyb4GgB0Fg1pShhQAavRMFjwb+eI8i6flv
         8KsLSNxSGREj2b8SBCHxysryx0F20/V1nVt2QQfJDEoW/TYXbyf03AX6iM7LZbJbrmz2
         hgc5xj7G2kLhnvMEw/R2G6QSZPBwZKWTAvqwwHIXAbEPev2Ckqk8xXudTh2PsWSbvbzO
         gsUSdVRHfnqwKm7ZSjXgIuC4lhhjWdY1uFlLmZooZhEMAXTl+4Vb9P72ZqhC7Ldl/AI7
         xsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278498; x=1774883298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PQt34sQ/WL3fGURARKrS4hYobaoxLiHHcmwp45OWpMQ=;
        b=JCLSMp2WKgObb0JFI/EBBjDhKSlKaUNiH1Pb9mdZKaN3iX+zf4KNdYDROf4fdGx1bP
         t9TWTCA3EMsFkrD2RAv2dQ+yx0MjLm8a04KOvMeLouWzZ2UCIm9omcONGG9OLB2MCu11
         Lb4by6Vj/ddiUqNaFvuiiEFreTpsFnXdJa9GqcfE9+lwXZy7lCw+nVLD9XH3U/ffJin5
         UEtZeJJPInJfLKdZQe9gbQGcLrPzK6Go4DhWgcxcmmo5byvqct1BtvhAg3B4WhoPQ79U
         IxovHJpnZE0x4LlRdNlcWz0xwAnwa9/QKtE9ObAqm4cFxtBxq/3uVANE0OEhBc4RuMaR
         NbGQ==
X-Gm-Message-State: AOJu0Yxp+z/IVmHBaanIM595vD4JshecUlr+Qpl5JGG3jVvD5ujgLYSx
	0Vaw1AJXOAf/+T82C0Xc9yL5SsGsGWJeLrlVPpir7uOp/RdFzi73sjR3MFazRA==
X-Gm-Gg: ATEYQzzEtd3BCa+4HtQQFc9wUqAAMn1Hra1XyRRZx5k6VM//AMAnwXpIND5wioVv83w
	tcVY1sKy57cW6wBElYTn+vwYfsHCJYp8AP2kuVq3JGb46OQOfdclZVTF379xu/3oeiVetpVR/Jh
	HIUqz5eMsqHfOVkOFPOC/iyQMsbFF9eVX1PsnfycPGQb/glIZBmKrU7p7K+Oi9PdJ+cRm49LmFk
	b5rxQ93hKL09VfrCYWXkbeoutmHKEABZAbpL72VlsB3Z8kvsmzdFGC5hBHlqQuOThQAHD1+BMyE
	8uj6Hb1u5IGcZd2btRsiFWoXH/6acUPuZlRSU/OU2v3OehF9zPwWyHgCkXnvcyWfyDYmDJbbOm1
	ofmiTzB3oUc5UdwKaldE9YxGvgVOfx1y5D/fdJ6OUYU0SQq00voW8hh9f60cQstInReD2gUpH7J
	FY8/BAOpdGdXJsYAn7ssbuUQ==
X-Received: by 2002:a05:690c:1d:b0:79a:b49a:cb22 with SMTP id 00721157ae682-79ab49adabamr37000827b3.49.1774278494648;
        Mon, 23 Mar 2026 08:08:14 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90425d76sm58662227b3.22.2026.03.23.08.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:08:14 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 0/6] replace custom functions with kernel network functions
Date: Mon, 23 Mar 2026 18:06:02 +0300
Message-ID: <20260323150650.7168-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320122119.19563-1-nikolayof23@gmail.com>
References: <20260320122119.19563-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces custom functions for checking mac address type with
standard kernel functions from linux/etherdevice.h designed for this
purpose.

Patches 1 - 3 will fix checkpatch.pl warnings for future patches.

Changes in v2:
	- remove initialization of local pointer as NULL (patch 1/5)
	- add commit to remove dead code in rtw_recv.c (patch 2/5)

Nikolay Kulikov (6):
  staging: rtl8723bs: replace deeply nested if-else with switch-case
  staging: rtl8723bs: remove dead code in validate_recv_mgnt_frame()
  staging: rtl8723bs: move logical operators to end of previous line
  staging: rtl8723bs: remove custom is_zero_mac_addr() function
  staging: rtl8723bs: remove custom is_broadcast_mac_addr() function
  staging: rtl8723bs: remove custom is_multicast_mac_addr() function

 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  8 ++-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 49 +++++++++++--------
 drivers/staging/rtl8723bs/core/rtw_security.c |  4 +-
 drivers/staging/rtl8723bs/include/ieee80211.h | 17 -------
 5 files changed, 34 insertions(+), 46 deletions(-)

-- 
2.53.0

