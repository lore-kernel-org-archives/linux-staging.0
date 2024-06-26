Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C3E2AF1A;
	Wed, 26 Jun 2024 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719437841; cv=none; b=aoTBANXZPAiNAh/eHUMsKiKKlQ49wbfd5FMgTRZ5/9cd2YuPBVLoNawDIQ+ChkOsSfMIZtuqkoO/HEXoJEAKhP3PpUGlHfP6sG+wdP2NPcR5Q3Asr12M0mrsomGmYDP2uNI3Bbo0CpXZHh1gztk0UWS0X8qOXjFIElR7irBsiVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719437841; c=relaxed/simple;
	bh=wm8IOjSy0IazMs+GqeoJgo5DdVy+HlV5n4Xf3NJQpYw=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=Gx9F4/fzVwJPc1v1EdsRFNerlc1KEZUxyYDvmxVzA6r5qBTbNbCDKcig1yHwJbP3Kpb7/M2gkSd3mjBmN1ozL+oU8ZG6jF5OHXqjZAbYjWo2ZsMxVkvOPILximxDax7Xe48tRLPZJNwkyWg/yVTxJng2kbGJXFuHOibZ24oxxVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoeLKAJW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoeLKAJW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso58420735e9.3;
        Wed, 26 Jun 2024 14:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719437837; x=1720042637; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnGnPkXUd1aUtrN7P0KReA3W4+M4jw6ycApaJIjtT8M=;
        b=KoeLKAJWmAcC6r6vFy5e6RM8KSjfAMzKT7dbCXyDb5hFFwnLNz6qRDsPExp8N+ZXgp
         AsZgg+TUCQgwVy1vBqrpICaQt7AE7lr2I2Ux/CDw5JcZUGXKm/xASHIsu5t+ujKp1u/6
         a4I9boySNHK+1RSyJmEuyD3Df6kYH95cm0eOKbfoSghJ3DuM5PKnKZxDVAJj3w8cnPuO
         XxNs2jb+9lLV/rId8ta/90sRPhZEnNAiGeNw8WZIWoxB1ZC4qKplcwFwKsDdlhrZVaEr
         Xqlyjrfw+RnJVkoSWBZUzqJX0exXi3DFHD0/3b1kJwaNIPBMO2y78+t3gHQZo7LQdKnQ
         g3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719437837; x=1720042637;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnGnPkXUd1aUtrN7P0KReA3W4+M4jw6ycApaJIjtT8M=;
        b=H4Rt3UNv4h0cigyi4veNAgoEEBqeDKqdA9V1IPRvGexIWxnxWpzsu/YNvu9R/8V2Qg
         UsJUXFtTjTRgMXtv+zYjpt6VtOkz0HysLnSYnYcBNFZ/S8eUO+iH587SwZkwc7JDCFV6
         32XTgD0dpOL/WYXh8aWXgrKBIlQ+RlWhhMqw4hqcpGaXB2bm1wG5yt72ya0mjHAIu9Mk
         rqvlYN1usf/+D1FEdqz/T1T29UxDVCDY9hThqxI8+Cunp6NtdMTlT0FbUiOesvhGwIT4
         y7TTgDGeFPjVOpEatezX0eopNmWDvjEr8bM7LZnZzU9cO7rkJVQsDJsF37H7HTozarS9
         WAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVOmvRtAd4enN+yNaHf83kg2sVVr0kQawlcax7+TvKbnnGbuSidmgy1T9oYWdedzaqcXbcP2/OEWAQ56fdbHhXMLTnMAgIS6Oy7VNHVhkJtAc1kT9M219GW6gSAfeTyomCYDpkjiNNUg==
X-Gm-Message-State: AOJu0YxgrHyHjUmKzFSGDMBRuIBCJDgNkLe8gaNcHTYHv/rycyI19Uyq
	oxOgl35ozoHpVcpAo0dkxjl4iDRPrGqSRfEWgsfQTOTtxOoz1dSli+eljdTp
X-Google-Smtp-Source: AGHT+IF8ZxfDkoY7tQaMlIFw8ibDYc8+OnII82pa9zKj7EIAs2ieSt1GO9QKjuGhzrBLqEfni8Xosg==
X-Received: by 2002:a05:600c:1ca2:b0:424:8e12:9ef3 with SMTP id 5b1f17b1804b1-4248e129f6fmr82029245e9.0.1719437836861;
        Wed, 26 Jun 2024 14:37:16 -0700 (PDT)
Received: from laptom (88-121-55-84.subs.proxad.net. [88.121.55.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424a2abc265sm44536785e9.1.2024.06.26.14.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 14:37:16 -0700 (PDT)
Message-ID: <667c8a0c.050a0220.9e3d5.3b80@mx.google.com>
X-Google-Original-Message-ID: <ZnyKCpE2tbvWD8Xm@laptom.>
Date: Wed, 26 Jun 2024 23:37:14 +0200
From: Tom Mounet <tommounet@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] staging: nvec: Use x instead of x != NULL to improve
 readability.
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Issue identified by checkpatch.

Signed-off-by: Tom Mounet <tommounet@gmail.com>
---
 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e5ca78e57..814eb121c 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 {
 	mutex_lock(&nvec->sync_write_mutex);
 
-	if (msg != NULL)
+	if (msg)
 		*msg = NULL;
 
 	nvec->sync_write_pending = (data[1] << 8) + data[0];
@@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 
 	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
 
-	if (msg != NULL)
+	if (msg)
 		*msg = nvec->last_sync_msg;
 	else
 		nvec_msg_free(nvec, nvec->last_sync_msg);
-- 
2.39.2

