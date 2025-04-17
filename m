Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E721E5B7F
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849983; cv=none; b=cVBN/fL4c7OCDzf26lBY0XWHCV+hYUEnbAu2llGLOfTHFVxqeO/xdGrZeZVb9cMrtDTIXNCY94mNf15u5K8IfbOwdZH5K6/3CRUJcON+0MkRKessO7iK0Y2dLMKVXn8RhLLws2V0wNBB1TW9pVdMB8bXbR4hcgFP0BVhL3ttrWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849983; c=relaxed/simple;
	bh=qXuKC8wKMseybKQRKVoj0KYHcQgg1A92iFP+uea8iuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SX3fZUqQwaThPdsElQ86gttLZSs91yItwCXlV1S99xex98I5T2j9pMmtOS2VEE27OtmNTiclPgydJ1vtz3uUY2lLCrZ96+eqM+OBQU1Mg+MULFu/VQSzUO9Xn1T6VBXURr3EDuMaGDjjLsiO4jyWK2funr/VX2uuNnAiFovPOYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=gtm9E5xI; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="gtm9E5xI"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3015001f862so115162a91.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849981; x=1745454781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTuxdgSBH9onldJ0zjeMMUuM1GqYJzLHWyE75BJvR2I=;
        b=gtm9E5xIOHdI6v6NbJ/UF0WzZ1aAyOnHlSTZ1ziyuCiK+07Kq1mmbJ2nvrpS1eBPhR
         vT/QLTwSn/9Hlh2X0GpWaFDxuhdm/BwFFv/INj4e3sLFDntjADyluPMvqY5RD49JiOtm
         rQp1coQLn/cAjTas2bC0A53gruybmT0f6kxIpzWuoqMKUX9X31Y6fNAS6TS8mi5syuIj
         n5gPrY7VmgwS/h5KwqnhXdKGyiYt8RbiqaoEMPDKDDNOaRX2TEn12Or0Lg5tUC05AbIg
         oOquEtcqAsBaZjRusBj2pXZlmHFInns73uq7lZDmVt+YYkPq0e7giGC/WjxVN/rWvR8+
         yL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849981; x=1745454781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTuxdgSBH9onldJ0zjeMMUuM1GqYJzLHWyE75BJvR2I=;
        b=M77Ag4Zd0oq1KY3SOHTCIHpRrKw7UIsZnN6V3XmDQHfoTSu8u9ATV8NR/fClCgkL1M
         SfdCcznCd1WOa9AGVVhp6cHFRVGvKfiVxmI6qgbTG94qoFrDxyXbGAJuw00DvTiDgZc5
         VKHhhrAjoPTfTagKQrpkw0NUafoOmqBBZonv49b7IsXmO97qMueG3EtUivOpAm/7N2lb
         t6W/pOESU9KEfLgjwxODdMpONWz78Nic7abvdE5SL09uPEIDPqTTFC/BDEb2RWN2KLg9
         ZhcFmYqSyw6qWUFvIQS4eDwNen6cLK6iSIQX0pxilckW8Sgppqu4oHLBJp6UQGEmPSv+
         DrWA==
X-Gm-Message-State: AOJu0YzwRDTefLl2B/Xkq6k3p1ZsbsfU/eP8pkILsgffQi3u3YzI/JG5
	tkIe48zas7ueFqrT0XAkiHQKGpkC72ZTeONIr3VJsGqAbZJoUSCaoZYlCUZn3Q==
X-Gm-Gg: ASbGncuwtHNhp3VMABp+bukf+TC1PnUOyZWor8UWmhO7OQ6gZA7dDGkPJC4l/MTJfr4
	ZmVxFQvDdmKpK9Y1EACSPag1M2Ka9qoWGeuRJqDqLVsN6FXgWjpyqUjKsmAb4F+btvj6DCrnmL3
	RL6UNphupgukxUfT/d7RzpoE+ukES91oaPJNfHHwXLaxjUvVD55fxKzocQY+CAu0OSU0TGakEi3
	AegC+15FP4gYzf3iYRwD0y3uNDgJYSBqOujnIFl01sjBRSwz++uwbCRSBQHi1ferBg0W7Rey9lT
	VSYMtpiCG+6+LPWHzf+GcoKd9ZaCKx4Y1DidDwWcwGzVpSasKIeUCJqW3ULuiw0oFb0QDecIxQn
	K+NHH2Q==
X-Google-Smtp-Source: AGHT+IHrKH4GUhouJYD9RBko6R371BDH5NugueM0IYjVJ3b2sL/HyvhyTxhHGmohZ5+Ooym7fHDTgw==
X-Received: by 2002:a17:90a:e187:b0:2fe:8902:9ecd with SMTP id 98e67ed59e1d1-30863d1d97emr5761415a91.1.1744849981572;
        Wed, 16 Apr 2025 17:33:01 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308511d1046sm2909585a91.0.2025.04.16.17.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:01 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 11/18] staging: gpib: hp2341: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:39 +0000
Message-ID: <20250417003246.84445-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 5ca0bd2f1a08..1a32a2cc421e 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -411,7 +411,7 @@ static void hp_82341_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp_82341_unaccel_interface = {
+static struct gpib_interface hp_82341_unaccel_interface = {
 	.name = "hp_82341_unaccel",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
@@ -439,7 +439,7 @@ static gpib_interface_t hp_82341_unaccel_interface = {
 	.return_to_local = hp_82341_return_to_local,
 };
 
-static gpib_interface_t hp_82341_interface = {
+static struct gpib_interface hp_82341_interface = {
 	.name = "hp_82341",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
-- 
2.43.0

