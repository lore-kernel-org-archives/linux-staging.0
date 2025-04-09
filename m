Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA320297F
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178368; cv=none; b=WBN6l0k6tqynl1BNJBhP/9GiKxvDvnoJGMSC/MR+UtoYvDf+l/Eqe3PQhP5lwfb5c0+kui346dUy8Hg7ZcUd8GAgDaFsZ+bflDSI+5QDw0tlJePJUW3a2UHT1lyTjGmo9QJWG46w/OfisgUoALxWRZgbEn/Uw97Z4t547uLtvMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178368; c=relaxed/simple;
	bh=ccn7QRhDw+EYEW/P1wa8yWPi9uhOx/Hha/iN87ywVSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aai9FMc1c1y1f5UMQ7UiGpUkuyLWxDyVJgY8kGSoIfCBl8gph8h0udsALQjh7S1qgzozWzJ1p+fL9WoxWNJ7kFzYUV1voxw+LsVsGycKsmQrUbgxUM2DktGKCElXTNwHs8nvFWhHTy2Zb1JwZenvayWvpCnokA+LTLBRQ3ihgyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=bldJj1N8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="bldJj1N8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227aaa82fafso54707885ad.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178366; x=1744783166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6aph6kY1Q0JnGg/8+NqO1BgZ3KPQfNwkBZFJNtVp08=;
        b=bldJj1N8gBppyUDwnJHcxnbnrQsohKFpiPig9lzbrFdL7Dp6kTTrM4pOMyBundTWys
         3RSM65r2CmkNKHfTkbl/Cu+f5/zM02Bv12Ett5dlnh/VM7cjTGcQz3Bk8ggDn9Z21u+b
         pA7sKGCI9yTx5bSSUy2Ai+DefiJxZ1HXvimE1QDJB4LXF4H5fBpptCVYCQOmppoVfpNr
         9o645U1Ym5ziMoTbuVyeYxj1M+izq61juh0CDBfW62gL+QxEssAxI6ozSUGZTdzdxBTB
         cS3OaoaxV7EVHLKYO/AroEix/S8YTToixW7jnHnE4zsti7uVGd2rJygeDraB4XjIhpAD
         QDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178366; x=1744783166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6aph6kY1Q0JnGg/8+NqO1BgZ3KPQfNwkBZFJNtVp08=;
        b=L5XGApD+VlG7E9OqfiEEjYhY48k5P8Eh+3094Ob/RzU5GEDR3HqRV9UC9GTxZF9qz2
         73bi4rL6eAq2QfbJMMcf2Hn4zBzTIIUOb7Xnuw9J7zdGacpKz3dX6ZGxNTrxYoNYjQpt
         QM/CfMxUnMhp7VJkbxIXLr94METGxafqfo8R6Nf4qQ3uT9XZrTeWtwDsIfwqkoWfJOPR
         k48hAc2yojjpvp217vmg82Nc6tN4r3LRZ3nScTZNbdPG6PtLEv7NbCdlZFl6B0ckuWWd
         VleZPyLuvxGpWrIRlTAS/DqrksMQ4ipXc4WKgKvg6JiLu/MhHA8HiT+DqrF7wjLZ5CYO
         /+TQ==
X-Gm-Message-State: AOJu0YwAnS15YGB6dor+CvT+/5rblQR42RU/Vca2rBcxl0dlCekkHeNv
	x6YcPp1FWLQkkSAKVqyJwxvbzM1WYRGUlkmlnsX2kJzajO1KA6+TwZlRDogdVw==
X-Gm-Gg: ASbGncs56MJAP8w8ALzZSkyrO/PCWh61Or+yW1OBDKBNQNNnI2qxHZw8Tv0HA1VvMMi
	nJiR8w75xXLOP0fcXdfeJQsTxnTWcP2h9fEZFC+5y0cgUwPS7ozz60TmuCt+0K30BLK/LsfODPF
	c1nRjdJeO18N49qujBkiXD04GfXVFBlfyEpp6OCN69wBiNTm4hybUqDdpRd/aa0JIc4aq14jWpj
	rbdcKIEDaLk/BsNQ8WWPzCH77uduo2W5cfLWsImjeeROONcRn/c8sEfqZgyJkwUw1hXqwPR1Ylu
	JzsScjiCiwiZFlYE7PgOtjFFqFANFxgLhpzsLudAKfwHZILRBcOaLqU+dCdpqLUcMbwHkZFYRvW
	9v+eI7wbdYT+lzcyX
X-Google-Smtp-Source: AGHT+IGGch8yL1pVWBFhHfO0hEOL9qHn2F0AElXSWwJ2Ijm2w1ytVe0bvHcbM1ZTM3Yu+6dAMy4qwg==
X-Received: by 2002:a17:902:fc4f:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-22ac3fee048mr21606935ad.39.1744178366661;
        Tue, 08 Apr 2025 22:59:26 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccafa4sm3372725ad.235.2025.04.08.22.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:26 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 17/21] staging: gpib: event_ioctl_t now short
Date: Wed,  9 Apr 2025 05:58:59 +0000
Message-ID: <20250409055903.321438-18-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style to replace typedef event_ioctl_t with type short.

Adhering to Linux code style.

Reported by checkpatch.pl

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 446827701399..72a9b660f124 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1951,7 +1951,7 @@ int pop_gpib_event(struct gpib_board *board, struct gpib_event_queue *queue, sho
 
 static int event_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	event_ioctl_t user_event;
+	short user_event;
 	int retval;
 	short event;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index eea169a0ba40..e9baa6724fb4 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -107,7 +107,6 @@ struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
 };
 
-typedef short event_ioctl_t;
 typedef int rsc_ioctl_t;
 typedef unsigned int t1_delay_ioctl_t;
 typedef short autospoll_ioctl_t;
@@ -152,7 +151,7 @@ enum gpib_ioctl {
 
 	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, int),
 	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, struct gpib_select_pci_ioctl),
-	IBEVENT = _IOR(GPIB_CODE, 33, event_ioctl_t),
+	IBEVENT = _IOR(GPIB_CODE, 33, short),
 	IBRSC = _IOW(GPIB_CODE, 34, rsc_ioctl_t),
 	IB_T1_DELAY = _IOW(GPIB_CODE, 35, t1_delay_ioctl_t),
 	IBLOC = _IO(GPIB_CODE, 36),
-- 
2.43.0

