Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18DC379C23
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846790; cv=none; b=IK8s0+uX5ILV4z7KFDq/8Xy7A+6XrMJt2oLKqO8buIVjdnqUPLOK05vo9/n13vcAxw8JTWNLCvze4+rJRVxIDTcvOMSGBu4x+0Nr53a1/JW9mzK7A4X56XqAzfEOAtqKzdzlsS/nOqy2ve6eRCtQFl9sr5nt2etfX9yeZHGWyp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846790; c=relaxed/simple;
	bh=FZ+vh45FdzWetnSRY5ztLgsOXG+Hhy6YHaTAO5DJqMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJw/gDbIcC2gs/gNTTAuCuDAQKr21EUhqTzlzPh0OzdcS0YQS5u3rAGfVlvqP/J3Wemb55mTaB5EaSfxIHGbj/8hAdZOPwj0IAHd6C2qzppPr8e6UcQlxh5reQDZQuS+V50RvL2qT5LwrtkuMTiYezZAvBUANRHqpa2QrL5KHr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ6S6ogw; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ6S6ogw"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-848479c9bd5so3837620b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785846786; x=1786451586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQHEEeMDlCSa1qpDZlttvg4JIv6bdBp6ulGJkKMxgRY=;
        b=kZ6S6ogwDQ7zBBCQH7298AW9LQ/aOVXHcrx2Dc3wTR+JAZO/zCq8YYKzDvhumAqJGv
         MbqxLW7MomrtzZIJBuwLRuPAOVaSemuCkCRq02HpNUvXRqAV2RXusGvAXaPzGFTVTVeT
         6DDRmfIYb55WYm13w/GbL3CyYFpzL2g+gs1HuMs5QEz82omG+9rfqOaQ9TxwrTfJj/+F
         xiiDWJ0inWmdoUxZ6Qxxk6ue42OBHZ/5EFDL8Ox1nUZ8tQY32bCTWFIHXEgvlaAi52zx
         9gF67F+snr9svSsR75wB0F9LcAh++ePBZ/La/1MpAmCoIK2GuiOE2TtCSpoEkI/3U/Lt
         +BDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846786; x=1786451586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OQHEEeMDlCSa1qpDZlttvg4JIv6bdBp6ulGJkKMxgRY=;
        b=XsIupAdScgUyny6q65byAi/Ofr8ekcw//DwpYld3VDOuMR5qpkFSPf0XctM3y1hef/
         NwPuwIDApZSNhV8DXGn7SjaX0yfIQmYfOipDRXLDUbjds2EuctqrA0fsZkMc9sjni+BC
         4icLBe6tO57soDU5BWS4/dHbGqF3Lhhy8PXWqUS6ijl8IaaLfhHIfNKB6H56bn4h5sut
         kHMTkBCbp4831CkBjW+VCfP+DuJEMNrO6BXS6xLWYNgDJXVtLSG8rZi8zbW8WNCb/+dx
         841sUl4JpkfGKwMfrR2cWdpGvgcXUlA+uO/WXgtA9HntPjXjO5gJrg4n3w4WovGRqkQF
         k2hw==
X-Forwarded-Encrypted: i=1; AHgh+RrGSsVbQSvbSa1rYrq9MBzh1MvT1rQYhEW5W6yE6/uzRwpuqGQFVbYIk3EOd9puI0L3QwOQDSGOmRiEbI/o@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt+BFCSOxWEkEeajHDOQY6z0agY12tvH3AHO+qqmAfV+65GP4q
	46XmZQaC0D55w5tZ11iEYv0Alqxi10KapblBgGZ3gyRXfZzEhbGPtbTDZMB8E4ejWzE=
X-Gm-Gg: AR+sD10si33h5xCv/u5FkAeZBTfxeIFyZZSp/aqCD4nPgoVIGHchQLh89ZQNWVRCDs/
	K3xz8ZTJ09Vru6C0RX2sNdL4sdxnfrAbAJwPzMVh0zz4gWDWIfMUvrPRz7OMNjjODmYGVtC4h6T
	pOZ4U9B9O6GORhdBnpFoEUzmb53Z430f3Z96e0stE6NgOt9oQHoDic+1l802KK9Rp2gWQxTX90v
	xaqJg+nKc4D3rGKHXpddwZNKeDizxiuu/2MnoR8TESYri+zKPzjFd80rPMrl/JM2YME7gVOeXxM
	FsubyOOKPhk+h8j/6JDbvux4skIAjyOaSL45C52+DAz7GTxxjUD/5JCfD1nKgFi33LCYJOYvHNP
	W86ULiLicBBksGyCPiGknWEr8Ze3wIZ/4VajrIf1AtXkQ5qG5rLrj2wW+mNwwnoQrdQ61VlHzQf
	//CfSr9OQcVeQ5y+lJe5s0xLxrYA9e542mkgreMyAxthPNxlPqTTmLWpXB9JJ1YgjkG70CNDCQe
	w==
X-Received: by 2002:a05:6a00:430b:b0:845:d285:3b6e with SMTP id d2e1a72fcca58-84ee48f431bmr13018700b3a.58.1785846786266;
        Tue, 04 Aug 2026 05:33:06 -0700 (PDT)
Received: from fedora ([2804:d59:8b31:f700:e09d:f90b:1a15:729c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29fac3sm5088074b3a.31.2026.08.04.05.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:33:05 -0700 (PDT)
From: Pedro Amorim <pedro.aml.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pedro Amorim <pedro.aml.dev@gmail.com>
Subject: [PATCH v2] staging: greybus: fix checkpatch alignment warnings in loopback.c
Date: Tue,  4 Aug 2026 08:31:32 -0400
Message-ID: <20260804123132.24986-1-pedro.aml.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026080404-paging-runt-f506@gregkh>
References: <2026080404-paging-runt-f506@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two alignment warnings reported by checkpatch.pl: the wrapped
function declaration for gb_loopback_async_transfer_complete(), and
the continuation line in the gb_operation_response_alloc() call.

Signed-off-by: Pedro Amorim <pedro.aml.dev@gmail.com>
---
v2: Fix remaining checkpatch alignment warnings in the file

 drivers/staging/greybus/loopback.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index ea57b1f5d156..87fbeaf0eeb9 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -588,8 +588,7 @@ static int gb_loopback_async_sink(struct gb_loopback *gb, u32 len)
 	return retval;
 }
 
-static int gb_loopback_async_transfer_complete(
-				struct gb_loopback_async_operation *op_async)
+static int gb_loopback_async_transfer_complete(struct gb_loopback_async_operation *op_async)
 {
 	struct gb_loopback *gb;
 	struct gb_operation *operation;
@@ -679,7 +678,7 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
 		}
 
 		if (!gb_operation_response_alloc(operation,
-				len + sizeof(*response), GFP_KERNEL)) {
+						 len + sizeof(*response), GFP_KERNEL)) {
 			dev_err(dev, "error allocating response\n");
 			return -ENOMEM;
 		}
-- 
2.55.0

