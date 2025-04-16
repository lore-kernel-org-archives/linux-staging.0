Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D3424A05C
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836139; cv=none; b=img4yiZMwj5AOxRJ2exigP13q171Ny+VUdXch3+QqEnvvvBeX7pkQ0bPsHdpaVTgpEveT+XvHPjGLxLsK5M3t9Pt+vPkOn3l4uxGvbELkNDpQhgREQDNT7aIcjDzsZDX5ZU2c/hCgKlh7yZn+r5ANiS28xUJw1MIxuxlBDcAVSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836139; c=relaxed/simple;
	bh=Hs92UuHoYvzQoi8J9GCbjuZUp+OKv64K/u74xz89GFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8G3G/7zWRJ9UjoEXJIsrRReuF1uO7d0k7hBBlbFqTtANifMieovD1k4ro/7OTZyvhIAjRX50oKlppNwwKnvgkwSgibh3lvFTWw8DyB8Fxx0ksPaw9e1mV5lTWpNJUnChp9+H3fEOgAa1cfMtUw19mlzSF0Q6FuinFsgeK4ZUyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=iWJ7oplH; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="iWJ7oplH"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30828fc17adso25036a91.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836137; x=1745440937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PC19z9s7DGRWg7r1KoqgXBtiHi+mWDJPXbJcIe1syY=;
        b=iWJ7oplHF897aAkHswmxAD5WidUCci9pzo3BUkNBnQurMVUSjjPu246sPKPKbBUKuP
         JCJ5iVWAwOvfF5mE0Rf0ecgiTveGIHjbD/8w+Uv6OoYVw+TnxS6DowNIF6+1Kk92uqbV
         xZz2s6XwNoE17gKpgqK3zF6UDlguzzlbxmCkLU6NxQJy0Mpj2ySMH83BQN80PWVfWrBR
         6AT8hXE9pthMUsoIf2FFbai71w54r1/vyTcsMm/gkuetFMGVUPK40M0JXyMILZ65aelc
         F9JFeQ/W18YZ1PJBabaFRoOzRkorDWfVSnb4CCGhzBJ5s5JKvsLzNq59+Xl98OZFrKxa
         KQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836137; x=1745440937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/PC19z9s7DGRWg7r1KoqgXBtiHi+mWDJPXbJcIe1syY=;
        b=K6w0gp/4T4hgq9o0Glj/0OFV5/wsIzOtVv7hzrkINKJmxwCua5xo/arjGODdNw8K3T
         4Z3LbumbqzAEklMnXmlQ+2O8KZuPES+OVRxJtudjv+6LKAGp8EQ0unvM6/u/rjcd35Ci
         8NxFqnH0luoPK5i0ISg3CT5Eg9gDExRQ1G4EHy2JU8aK7xph8rZyxTyjYvcpMj7yisIw
         VCRtAVii8mT4ijfpsFuXkz7JN0QmChONJHGeWhJa1CJwKMAkCaN4QLH/vPAlDCK6vboV
         yMBiXbJmX3n1nTa33TQHKq4FIxQNcwSohKfAva6YPWvsJX2PvpQQMyAq7+G4stwtQN8t
         MPAA==
X-Gm-Message-State: AOJu0YxWBtBL8bYM021NImu3U8B7xWVhRZbA8RN63iGRhGnCVtBqbGoX
	i49Qb8xN/xwllvgWHkqrVOcagHyfouqqtbqrMIcWE6X01zI1BboWsCx+Ej05Yw==
X-Gm-Gg: ASbGncuy0gjY2OruSbXkzu3S4fXkGUzcRgjbXgpUFOKBSitsfFF4JVJug9HQPqbsf/Y
	jxiSCA7JQqpAnxuiAWbwjCUkNI7TMqDuNjVi4GbpPgSxgrkOgWCqT9NNwQRXEY37TcvIPHSTZUa
	hSlJ0gI1KX21H9MQl5GqFhA55RNKLi1Cdj6E6I+QPdV7DJXIXW7/Ksd+qCCfc48c7YD0P9Lb8vu
	2YyPZdxopXJDhTEV9xx4HDZaC+HP2Y12sGcnzTBTw7HyZTyNKPvz/YQ9qob39pDvZuf/tZg+FtR
	Q1CK83e1PdunFm04YbkOa7A4uYmLMhRBpWxHU/ZCvaw13m3Yaol33SAnvN0UWc5b63GoKTJ6N17
	4Qw+Cp/xn74X0PiEw
X-Google-Smtp-Source: AGHT+IHBteJH2v20V1lmTQzL8B1zGnM5GZM9eoxGCjBQbuzUCZysUXj11FDjtxFQ/yxjkH5moF7Phg==
X-Received: by 2002:a17:90b:2549:b0:2ff:64c3:3bd9 with SMTP id 98e67ed59e1d1-30864167fb0mr4020279a91.23.1744836136888;
        Wed, 16 Apr 2025 13:42:16 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b383csm2319913a91.37.2025.04.16.13.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:16 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 08/18] staging: gpib: fmh: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:54 +0000
Message-ID: <20250416204204.8009-9-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index a7be878bd3e4..ca07e6ecb0a8 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1031,7 +1031,7 @@ static int fmh_gpib_fifo_read(struct gpib_board *board, u8 *buffer, size_t lengt
 	return retval;
 }
 
-static gpib_interface_t fmh_gpib_unaccel_interface = {
+static struct gpib_interface fmh_gpib_unaccel_interface = {
 	.name = "fmh_gpib_unaccel",
 	.attach = fmh_gpib_attach_holdoff_all,
 	.detach = fmh_gpib_detach,
@@ -1059,7 +1059,7 @@ static gpib_interface_t fmh_gpib_unaccel_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_interface = {
+static struct gpib_interface fmh_gpib_interface = {
 	.name = "fmh_gpib",
 	.attach = fmh_gpib_attach_holdoff_end,
 	.detach = fmh_gpib_detach,
@@ -1087,7 +1087,7 @@ static gpib_interface_t fmh_gpib_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_interface = {
+static struct gpib_interface fmh_gpib_pci_interface = {
 	.name = "fmh_gpib_pci",
 	.attach = fmh_gpib_pci_attach_holdoff_end,
 	.detach = fmh_gpib_pci_detach,
@@ -1115,7 +1115,7 @@ static gpib_interface_t fmh_gpib_pci_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_unaccel_interface = {
+static struct gpib_interface fmh_gpib_pci_unaccel_interface = {
 	.name = "fmh_gpib_pci_unaccel",
 	.attach = fmh_gpib_pci_attach_holdoff_all,
 	.detach = fmh_gpib_pci_detach,
-- 
2.43.0

