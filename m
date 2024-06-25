Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F158A16D302;
	Tue, 25 Jun 2024 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719348970; cv=none; b=VK+JS8VfIdvT5B/vB1R6hFlXtksphkv7kF9/GR0G4mxcP+FUr5ha7Gw+kzg07mVc9nf+DNGB8vspfgmP3QVYF2XXgvL7HD0771rZVLcPRkuYDhUoo7+fJi3+jDaYkIAvB/12DL4n8HHaid5/vgXuPsQczmI3qlaDoAhG4xg4sao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719348970; c=relaxed/simple;
	bh=4TZx/NfkObkpzkc/APTFna1AeS4OYt2PJPB+5fHGxJA=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=O7IoVaJ9I+cGsGM1lzriK5DK7gF1q4dbTAllu7Jgi2OpMbc0fVTMsUGQuYnDvTn8Jqbm3IyQJY2Vhm4vqwGNRVa3bzGcHyy3QrXEVMUQu7VvsnDtl+xqN2qyqk0/6OM5c2WIqGNa2TLzY8IlGqDBrHURx3MXtFNkPqzg0OguT7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBBKeNQd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBBKeNQd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-36701e6c6e8so536856f8f.1;
        Tue, 25 Jun 2024 13:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719348967; x=1719953767; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1+Ls/mue/yKH5kT6gkdnCfSWbjbKMTHc7IBMS9nMVyE=;
        b=ZBBKeNQdpGiezuXAZnxbGfqaE6O5ctZEZmRn/+27sPUSZ2bGZ0PJtXWlo6AZimzbif
         CuqNmnGQykUGeetXatRenwvLADO2NCYJkoS+CGBeTKJDxHbMKPP+eA/QvjjUYXUASicJ
         YHF0l642eTK+fJrIKXwYzmENbIcqwVOpqdxIzIZAFELcM8qJDXSmPdkz/05XNHQP3y8f
         gvdY78B1ke3hfJ1vrtOzVcmhApTxIY50LVDerPbzcfnxeKBNx4Rjmcp5xn/sxmsZMzvZ
         EYt2Oq1HGXV6/V0yXXBE0ChRbPdRHGCQ/K7LS/i1+sFCl3oNkl4QTEq1Wh1Bu/CDjYk2
         4Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719348967; x=1719953767;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+Ls/mue/yKH5kT6gkdnCfSWbjbKMTHc7IBMS9nMVyE=;
        b=WfWCqe1mf25Q1gq3eZ8T8CtAZzq4Jj6S20BCNTK85WVYvbUAOD4UMwpdxB3nSofv30
         gGqaz9hAlq3DtW7nD04Fxasef6yVmLSHuX6yPBy4iZ7qMH3gJTt7gplANf3psBUsVrAU
         CfE9/P/Sc2K6qMS3AtuaHrw+sQ+MSuu5+ND5+i71FDSI1I2UOR2LxlRlY3Xlx9SqyHhi
         +JVWCCpFhyh5dJ634JXIi3coczKwqawqgVqoWGX36a3ue5r11wnUJ2OBkbbgyl1Csgj9
         PZPIlesisRMw2kZfnyTyHZGRPUt3Feri+gF5F0GZSzk+16eHuIxdjuNFQXV2EBrrMk/c
         nJPw==
X-Forwarded-Encrypted: i=1; AJvYcCX4EkzH0TfF6QgHvnWpqR+PKnAXCqgKUZ6yh5OOgbyHp6Xcfv8izwBAZXWvQEGeQgIt5MHqoM2fjj73H9qM+kCNdZmQxXghMSK7sjwqWDX0FYG3HYu25ZJ1SlmpPJTz2Ib4NkTn/s9dlw==
X-Gm-Message-State: AOJu0YwAODoCKeBbDhuW0Y3ySYnkENLDclqtDLHFG3+dMCcMWbznsqB1
	m09YCJ/gF1HZg4oZj96nZFophZ+YGaHr6asoLRE+u3ttkGwodVg96q9AKbFa
X-Google-Smtp-Source: AGHT+IHw9TipA593kOXWiJMUeI5WtU1PYeHcpZuyczazsGbDyEnBHO3M4WOBMwEhgG/AgFK/9XRE6Q==
X-Received: by 2002:a5d:5f48:0:b0:366:e90f:3758 with SMTP id ffacd0b85a97d-366e90f38b2mr7658299f8f.10.1719348967222;
        Tue, 25 Jun 2024 13:56:07 -0700 (PDT)
Received: from laptom (88-121-55-84.subs.proxad.net. [88.121.55.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366fa9f612fsm4334598f8f.106.2024.06.25.13.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 13:56:06 -0700 (PDT)
Message-ID: <667b2ee6.050a0220.f9c1.5426@mx.google.com>
X-Google-Original-Message-ID: <Znsu5ZeV539ZdT8x@laptom.>
Date: Tue, 25 Jun 2024 22:56:05 +0200
From: Tom Mounet <tommounet@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: nvec: use x instead of x != NULL
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Comply with coding rules defined in checkpatch

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

