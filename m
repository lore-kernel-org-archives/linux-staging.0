Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2363D257444
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151121; cv=none; b=A4U0nD2eJpRY8/28P02SvQ3aAxs7KhV8TNzYrOujtZxzWRZD3Pvfm5Si/CXWFv+hclBlXStpEBAKYyhsEXCQcRQlbfjssAseCw0lar7at0ULdfF8MM9gwyXnVRRO2kIICXGm3YGAUYGkT1ryx50yQ+LzVcBNjyvR/z/xk3l5eR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151121; c=relaxed/simple;
	bh=3NFxLnV/Nr46EF/TSVSMp/zsoWxRG8qXMctW8XQ54xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYvy/ujJU//swxg6RIAZu1kdHI8EA23RfVPxImAuKz9g/WGiIkzGG6hEcokBNHtR0fqDjjR7syiJwYFnAqDFC4dyPZLX9LcMg4zsmEPXsth8NA+Pdozx9hrqfGdJtH+CVo5kJzoaMhXhgh3TZKA8zIuXT/iC22s5p0J16NgXKvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=b0aW/I1V; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="b0aW/I1V"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so4134653a12.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151117; x=1744755917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYR6o/fptDL97JakFYXVuOyKREpmT1G7Kb7stf7FxQc=;
        b=b0aW/I1Vt+MHFM9TyM51nJn9q7tFZMKivG+se1DXgG/ah7kHPsWSCHlRDr9xAKYTPz
         Y6wX0EeuZICZi2m7lALldiYufQGXo7pvCM33m+ZdFxnBy9OirnnAkA534Kvvh5L9MGLZ
         I7Fqh9DqE4+v1CP7SzqKL0j2dFErrounC+u/rSPd03Pbtius7Milfl4ppSJtTF3/33pf
         8nHD5yccqbuUryx7W3yG1XCXzqmBoefx4ztOK44+3fnVKl7TIxi0vMuZWy50B/Vtt/SY
         ZaOp08Gg4lRS7AZFfd6gf/2vzpM2TaFf/SabUhLutGlxSB6Cmsgaqw9S68gnAhsdIOS2
         FfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151117; x=1744755917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYR6o/fptDL97JakFYXVuOyKREpmT1G7Kb7stf7FxQc=;
        b=Jgd97qPFUn3E8yP6M+u0dd2W5UMiwgCVr7jLmxYkCixlLo6qp1+F1wXr30lltJUkT7
         kAQjLBDx0/M/r4sJOiBsYd68Lw3okvZcK7RmhXUDtxGpfILYSYDH3lm0Z/hWQc+o05iL
         5GwPb4jmTY39EYjlGCdxyFtdjT1cnrtT2QdBLfwwMBVdq9CB8iEGVNC6vyfrfHAib+IF
         zDmSGbSk2X7P4zxshGVsxJYtalkt+lnkmmbGoTsVmmiMBZcItkvHfmNuVbsUtDyeYm74
         bXnBIk9Tsd86n+u9oTAWiR0PG9EwJOse/n7vK4Gyw5sCaVT0xR5Wi7WzFKAK1mEJQiUo
         MDng==
X-Forwarded-Encrypted: i=1; AJvYcCXo9raEg8KENjhJuA3orkeieHgUowRk6NQh/bbgOq5SV6CC65YloInseO/WHkAJbUvss5tUw4zWpBVl+SXn@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5DfvebI7o2QjL4Z0NjkNnBVwEngmxSumJGcgMkHr3j/S+38FI
	dtrYTFVDC68QGw7Sh/5E6AVmPBL3YU9bp/7jyNw4NHDQhlYdhbnU5o6wocGOHA==
X-Gm-Gg: ASbGnctA+NjBDvczk3DPnKvfgVZYBke9gu2cZhbhh29McN8M17V5xJOEUWdxWGoiwAN
	6Zl2jZEkcUXPNCyg4MrugIjKs0IHsGR2WxTGaD7g773ZsysMynn6jVBz0NnAWhJ+4zrHQZZOK3X
	O4REPqz0M4bxUguZCWqeilfcRdQZAQ9NOrQRTKIHKNEBwMVBK5/rA03EY5zGDqzM/Ss7dJEgfus
	q9gxY2pheMlL2dQTIGLAxKY6gbInW6adHCNfQals7cNUmoZzkReMpLpX50ssMnPAHkwRpc7sROx
	1Uy1WdcWnnAnvqOFuhdbSTAuc3p4Ar5TIVyK28zEP5eGozjwIul8XeXjsRm/0qRj82gvrJo3WmA
	3JM/SMns+7A==
X-Google-Smtp-Source: AGHT+IFWBmW88BT8r/eam6USK7inexLdwGM3Z31rYrUeQeHbRtEtsiN5hyH6X7Vw4VoTv+K3XMkRSQ==
X-Received: by 2002:a17:90b:2dca:b0:305:2d28:e435 with SMTP id 98e67ed59e1d1-306dbb8e7d2mr1251536a91.7.1744151117487;
        Tue, 08 Apr 2025 15:25:17 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d70a4sm11626033a91.3.2025.04.08.15.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:17 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 07/18] staging: gpib: fluke: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:53 +0000
Message-ID: <20250408222504.186992-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index d289c321c153..68f888a75edc 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -698,7 +698,7 @@ static int fluke_accel_read(struct gpib_board *board, uint8_t *buffer, size_t le
 	return retval;
 }
 
-static gpib_interface_t fluke_unaccel_interface = {
+static struct gpib_interface fluke_unaccel_interface = {
 	.name = "fluke_unaccel",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -733,7 +733,7 @@ static gpib_interface_t fluke_unaccel_interface = {
  * register just as the dma controller is also doing a read.
  */
 
-static gpib_interface_t fluke_hybrid_interface = {
+static struct gpib_interface fluke_hybrid_interface = {
 	.name = "fluke_hybrid",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -760,7 +760,7 @@ static gpib_interface_t fluke_hybrid_interface = {
 	.return_to_local = fluke_return_to_local,
 };
 
-static gpib_interface_t fluke_interface = {
+static struct gpib_interface fluke_interface = {
 	.name = "fluke",
 	.attach = fluke_attach_holdoff_end,
 	.detach = fluke_detach,
-- 
2.43.0

