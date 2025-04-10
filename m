Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5903228C5BC;
	Thu, 10 Apr 2025 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290402; cv=none; b=lOj4b1kJTHPydQNzwAoUMn1gHxPd3+8h+gmcqOP94Wm88/lQlX39hqm9tLGBluBF7kSfQ4BWXXl2ukNhuay9xCnexKJpnsMfgaWs1ir7VDje8JRNw/le1al80DyJ0UMVDwT+rsp0feorrwRybxycSOJkLHfJLBpS9ZSwM3KKHIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290402; c=relaxed/simple;
	bh=RLvJY6k0Ft/kKNsXLWv6b9OSzSANCOtlQC0MOioBDnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lR4W06fnokIf5Z9/MRkiSmYfJRw5zx7xc2qa32pE1Jd2ixhmOg+mpuXqHf2jTWGHnb3qv9HpffGPZ+YwD/66dYd+vfW48wgkqc3oxXlngaxDQum7/sdagbwDFh8PnFcOz9YjsQbMyOdOlVDWih+2uUaM4IyOjK6JYhuuKwvGumM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNJrJ4pg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNJrJ4pg"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3914a5def6bso409024f8f.1;
        Thu, 10 Apr 2025 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290398; x=1744895198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PezLJb+uiQj2Xf3u6GMrlRt9kEp7QeWIW2xH7iXqTd4=;
        b=CNJrJ4pgRHiAhGl2zsHv8THplptab3O7aMnrn9kH0voIo4ekE3xXbIyT+W1k3PVuNp
         smRbf0Wj0zFnuYyQupP2NCx3hI59Ph9vUbVUUuTQ03zUeBJfOiqOF6Wp52wRHveVTH2d
         k+aKDpQ1c9tqbqi/BmvAw1oJ7JZwuNrdHB6hOM7ey2jKjOLaV5QCuSBfnoUClZlPJRzM
         pdTGaaTbDfMtvg6eHQGccYrwiuOxyjL2RDeSMxXP+E3kV224g71ofGOhbTrCrgzXPUWS
         YjMmINRgtbOo/9CSGLOFjrkFVbrEZCpnqIFOT9kVzyRE6N4Fng27VM8/BBfKdAmr22N8
         olqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290398; x=1744895198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PezLJb+uiQj2Xf3u6GMrlRt9kEp7QeWIW2xH7iXqTd4=;
        b=ZpDxS8P/rey6sGjqHOgqJq+lx+xm9LKMyfmY2ZPwP2/zRuNFJ8VVMir+6B3LVVqDdl
         6ZCoOgDvKaUoHN9nd5V4hbAn5jcHB0S40+PceYd87kkdp2y5jbEFAXgqByqUZ5yn1NSn
         qLDIdOF0AHeSVnNfXMS4FbXYu3w2pemUhtXnMI5uQcWktDJniEwaFW78mvhVfY75DH3+
         IPnykEmhvKRQO6wfVKCbi0vUAnLxM8Byg73OkumB+0FESoEO+MJkBesPULBiS4l+HOjB
         M528xsbumJgqAwRbPmxAXu/Ue/9xY5iW/lrzJgg6w2smOOrgOf2gq9luYT36eEl/TjUP
         2u6g==
X-Forwarded-Encrypted: i=1; AJvYcCUWx9T5g5WjhWXHTi4/PbO6DVJA69y6eNmdbJw1U9LxzcA7sEKpPfodnS3ZEPQHeU36owWvI3KRJNJT@lists.linux.dev, AJvYcCXQDcHY3drDGQIW10zSgObYIsf6renU3yvRUrXB7QEI7SkZJOvblzlYKyskp0fyHIQiZ/VEYt/LTsGY45la@lists.linux.dev
X-Gm-Message-State: AOJu0YxpXOgo74BFpupscXl+0MKNQDjTd2OgRixRlxzxnVKS7MuAOTuS
	ejP5caJdu9uI59/9IE6Awf70IJUnBwSSj8rwwjmFnhMaGZeY+wSD
X-Gm-Gg: ASbGncsNyOnXpH1+wXOYT3PnOmFP1OeeJF2QEfetFEO0QwBFLfRHubtwqF4To75sJrA
	4EeLJLAtCRDzZdN+ae5hkcTWezD3Zagyjxe7noDC8+j0O+dwpt16P/OjdroJLfmV0no4t8kvSyI
	br2sGGjhCH9jo9ccV2Ut3b+2R6pmC0SaM58YdLDunYRK3BF7PVQApCMugXRSy9GrOeBAZDymszY
	EDImbmoXLRtx227zaFDCzCdDSwiGbwgJ65dPUmVopaVng/MgLG9jnk44+5CVvDhAMrXvn6KxLRL
	1gUgR90gw32La//xb4rf+oy18VorNwO05PkWYQ==
X-Google-Smtp-Source: AGHT+IEFxQsQgNXoIR59o+LR0OueEaW4XDtVPn2M5POGD1JPeTBqWJbinPc88qOx1zjcpAFrQNdTuA==
X-Received: by 2002:a05:6000:240d:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-39d8f46566cmr2497110f8f.5.1744290397361;
        Thu, 10 Apr 2025 06:06:37 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:06:36 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] staging: rtl8723bs: Initialize variables at declaration in odm_HWConfig.c
Date: Thu, 10 Apr 2025 16:06:07 +0300
Message-ID: <f8fd7b9ec1a1fc1a65be5e7735b37c42032e9715.1744285781.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744285781.git.karanja99erick@gmail.com>
References: <cover.1744285781.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more concise and readable by integrating the initialization
directly into the variable declaration in cases where the initialization
is simple and doesn't depend on other variables or complex expressions.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 994b8c578e7a..85cda5c3a5b5 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -52,9 +52,8 @@ static u8 odm_evm_db_to_percentage(s8 value)
 	/*  */
 	/*  -33dB~0dB to 0%~99% */
 	/*  */
-	s8 ret_val;
+	s8 ret_val = value;
 
-	ret_val = value;
 	ret_val /= 2;
 
 	if (ret_val >= 0)
-- 
2.43.0

