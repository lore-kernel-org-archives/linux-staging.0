Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D267A14
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748774; cv=none; b=DAcTeZWUK1ksx5QpL6mOSA7MgtH6ZFToGuFkdBaKkFkLufYB6OF5AO/tJqbis3SSj4KjNM/DbPRtZc/6x64WidBUxuG6l4SUWcz16Ua9ajUPU21hbqxj5ZGJGsP4bB6NAX5zYJ5YJRaTG23QFUvsU9iX8BRk6tUAuu9fCUKDe/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748774; c=relaxed/simple;
	bh=pn9UPQbZxIB+0mfraO2Vc6bruKjkA6qjq/C8H1vwwQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CuSPLmDdqHhg7Ko3niCAncdW1iQYnL7VHknja6x8ztNJp6qa7VRpfXZnV+z9zeKs4e3898yh9KM2IrOxpBHX+5mnawrZcJb5F4OkKQ0UHl4Sxnm9ds1b6OhQfIHNvKEoMbHaeOEC7tkn7mpl6IaEPxW8KMStz1ALCI20QrJWmww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ZBjrssFc; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ZBjrssFc"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6f1016f41e2so1749032a34.1
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748772; x=1716353572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzLjZ0CTnzp8KIwZswEZEQ23XT8p+OmhE8BLAKBFIrE=;
        b=ZBjrssFciE9E7wOlAt+Z1FjjNVaMeEOlnHxwUwkvkogNkn2fHs9R21rJKoURvI2cYF
         xoaPOrTyMomr6XHn0pKo2QgfqRnMCgz7BN3484PxFII0mdc0JsRBTYTtwOS3Jqu8vTMw
         8J37cnRQIFyFKLN+z8E8EerbEoG6Em3QLV/XhUMJ2edqZrVFcKrbg8TzYubvcZ3zUzlF
         cDeqYKhEOtDPUJyXKzZVFp60qTfI58Ak1Fu8iEXX5WrULubBM+RNiWrjeoTl1lqrEyQX
         Z78nUMkP4gAkj9XK28kebPSWU6GWcSDJuU24HDozeC2I3z9UuVtEsqFKHVkcRo3YFqPb
         /oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748772; x=1716353572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzLjZ0CTnzp8KIwZswEZEQ23XT8p+OmhE8BLAKBFIrE=;
        b=E0CPdbJJhMGJ1Agqss8b1cTEW7TTV0/JJmQeeDs9ZkS0lUTmBdxjLVlUg7C09VH+yB
         FiKmTq3DS2E9l578cIJSeIxfDqbsy+WuMCx5SsEQSKygOA/H/vb3zevRwJF+PD5k9atB
         4xIvxu0QMj8AOfJaCWwtbixsdr+fu82L4ZQwF+0jVVzOL1uiyjtdEla6QPXHbvmhRove
         DW4qEgSsL5xO+mXp2qdhfb2B59NLKQJTkI+IXtDwhwmfOeAQRMF2mJyz910Vbag6DWr2
         oG46WCuV6YemOTXZqxnL/io2ZyXwUuVvjx1+oF1lonpMoQWorwSMNS689qfi1xPvqelZ
         1i3g==
X-Gm-Message-State: AOJu0YzCnmaVsf1AzWdWHTHi/sEuzE7VEL8laY1lHV+C0FhR6L/WCHFU
	8XvLsuXu7Me75GE3+lsim7JhBZM6veSyYHqZZdaeEqeLr2G5WNMO01tqVc2mgbir6wsvkfef6ia
	O
X-Google-Smtp-Source: AGHT+IGgGIqQpaWOD1x7rd9UdYrZ542fTUvXzZxBfrO3UqFFntK9QJhNklFUC6uXbx5H391dJ5Cz3g==
X-Received: by 2002:a05:6808:358:b0:3c9:91b7:e7f9 with SMTP id 5614622812f47-3c9970bd1e1mr14790266b6e.42.1715748771975;
        Tue, 14 May 2024 21:52:51 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:51 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 25/31] Staging: rtl8192e: Rename variable bWithCcxVerNum
Date: Tue, 14 May 2024 21:52:22 -0700
Message-Id: <20240515045228.35928-26-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bWithCcxVerNum to with_ccx_ver_num
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 91164a3b01aa..4fec36cfa2fc 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -917,7 +917,7 @@ struct rtllib_network {
 	bool	mb_ssid_valid;
 	u8	mb_ssid_mask;
 	u8	mb_ssid[ETH_ALEN];
-	bool	bWithCcxVerNum;
+	bool	with_ccx_ver_num;
 	u8	bss_ccx_ver_number;
 	/* These are network statistics */
 	struct rtllib_rx_stats stats;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d662a12bf437..328972cfd7a7 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1839,10 +1839,10 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 	    info_element->data[2] == 0x96 &&
 	    info_element->data[3] == 0x03) {
 		if (info_element->len == 5) {
-			network->bWithCcxVerNum = true;
+			network->with_ccx_ver_num = true;
 			network->bss_ccx_ver_number = info_element->data[4];
 		} else {
-			network->bWithCcxVerNum = false;
+			network->with_ccx_ver_num = false;
 			network->bss_ccx_ver_number = 0;
 		}
 	}
@@ -2352,7 +2352,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->mb_ssid_mask = src->mb_ssid_mask;
 	dst->mb_ssid_valid = src->mb_ssid_valid;
 	memcpy(dst->mb_ssid, src->mb_ssid, 6);
-	dst->bWithCcxVerNum = src->bWithCcxVerNum;
+	dst->with_ccx_ver_num = src->with_ccx_ver_num;
 	dst->bss_ccx_ver_number = src->bss_ccx_ver_number;
 }
 
-- 
2.30.2

