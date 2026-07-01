Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA58348C44
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922612; cv=none; b=aGJdY8epxBKJU1swDNFggDuIISg1/jULbPSoz8FtyVzoPwyW6J1Fs2aL7MvoV+Kv7iM4zPvsqJOPj4fqh4mMqmtFzywcEwPX/T6gXTOyBPBjdQ6OlmqA9rG0B7Js3xV3qiskQ8nsaJuQINuCPhHGXaNLceU9amfM+3djE/gFcm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922612; c=relaxed/simple;
	bh=k30cR6h+RPW1gcNU1BwUBkaFYa5qObX1UgigfxmYQ58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rCn4le6W758ub0LAyD8tpJ/r/NRYWlwbTScW47dK3yN3jSyZ02jUbjRcdX5A0Gr8FlL+xLsUNglaRbYHBJGLzu2v2VTEnjtRiA+j3R4HnhNTfDmTWdBgz7+sR3beODn9Pc4xZNKcWdwJ00yg1dNiG8TpuyG8xBZ/WkrwdoOxfgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyT94PzA; arc=none smtp.client-ip=74.125.230.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyT94PzA"
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-39afb1ae131so1650131fa.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Jul 2026 09:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782922610; x=1783527410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg/4RBwTmkTv5jzQw0tnWKVvJ1Hf1WuMBjrfFGp6Qy0=;
        b=PyT94PzAwR34//qEvHxCbLG4TeXzI5+0c9QKP+ivoED6qyFAkaVlQPBUABZ3GR9bVz
         pHP39bwk6iROucDyKs/hU2P3DYmEnGAFMRE37TnKhUxOkcW4seTXNl/mXCAG+X+Ytzd+
         ADPDKjVCHLH/R02Ja6GsO0/NxplRffogdjQqp8h46BRTRaEch13PlQEeyeWXI+vNZLNs
         zZ9VW+u0Wq07wsmUCS1bg9QuV0FYHhO6mZK5iS4b3gT5rs5FqVXEvUl4CIi8nc1d7QI3
         zXZ2IHgd5crM2uPIlo5lii/tBRu7NAeKAXEAYjHCSIblk146tTx8B45V0RINconGEs8u
         UFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922610; x=1783527410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg/4RBwTmkTv5jzQw0tnWKVvJ1Hf1WuMBjrfFGp6Qy0=;
        b=AZVMnkwwKh/mXnNB+3L1G3o8yZY1Pfk6Q+RgaiU89OvGDPyt5kec9FAHtYK2ZW1FSe
         I4wBXIL48BuqJyD3663bDlCUPuDZBCloEXl49f3FL+N7OTFkGsJmnuhzf1WMi/UAE3xC
         93fpC5VRrIorWrY4T7HLe5yS6ybBeK0bQ7BaCAIrXI6jjl/QXbRcT6+7AONWbyzF1/u7
         8fRc+ASVNZMg37mL7YtUZPRv0mCC0X5tU6p5AIhXDbqsuY7mSLJ1spg19fGNTkPu1CGU
         IoAXvMEAqvGl11r4niZ/eI5Hpz1+vpU6cu6IEl0K9poxP5AxzcYDOaNXfypfo+NvVJA+
         OXiw==
X-Forwarded-Encrypted: i=1; AHgh+RpycIMEw/rwLIb7OF9pR/gemhNmndIlyTZBnebLi4ATX99PiVWdjRKgfo8dkawfLYB1vf3qt6jRnbkgG0tl@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy+bVveRDgKJu+SM4Ng2wxuFxw9vJ3KVgHbypro7wwIYbRELIW
	9zPl3mdwsNPIMqCLtKyE9nzBk06R6F6yi4NeWNeLzsEbMmT3vsKswBmi
X-Gm-Gg: AfdE7clzz5K9JvDfjHxW3+9Q+s1Vqaf/Jf17dD8no5gK2Nn9yhHsRVgLDiN1F2aeSz0
	EALt0yDFQCG2DfLAIX35uzxQ9csHfR1sAbKC5E+SPkVAAtDV/oYiIoDhEB1WOBEY9jJwxlY7LnU
	HkM45IS85MgE4Lp/7B4ruvtSqo5QiEUcvKlySha2OXr82kA/edurZjqxsfuNwpwugW1Fbh7NXQG
	cm1QQ+9uoVxDB5Uvlr8obDPjYb0+zfPpQYAqlzoeHeicdaFby7LyYIE0DcSHfjLCzGBnf5LLZ+o
	maAYsxFWuWvvc7ZtiuMoym1npdoNx7zkBBVeFOkFY3uZ3NWzb/Wlt3klo6iIWKzVJ5o7lJzwWcO
	jwCMWAIk4hGqrnecNzHvsL3O9fZShdRmrNJ6phJcSTiMRXGn5ydqbRXhmDdbL4wQgONs/OA==
X-Received: by 2002:a05:651c:1516:b0:39a:e29b:78f8 with SMTP id 38308e7fff4ca-39b3705c516mr3385071fa.36.1782922609467;
        Wed, 01 Jul 2026 09:16:49 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37ff0449sm964191fa.38.2026.07.01.09.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:16:48 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH v4] media: atomisp: fix block comment formatting style
Date: Wed,  1 Jul 2026 19:14:51 +0300
Message-ID: <20260701161451.5442-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a block comment formatting warning reported by
checkpatch.pl in atomisp_cmd.c to conform to the
Linux kernel coding style.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
Changes in v4:
  - Fixed code indentation (removed excessive tabs) as requested by Dan Carpenter

Changes in v3:
  - Fixed commit description line wrap to be under 75 chars per line

Changes in v2:
  - Fixed author name and Signed-off-by email mismatch

 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..d4c823f18cab 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2520,9 +2520,12 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/*
+			 * If the grid info in the argument differs
+			 * from the current grid info, we tell the
+			 * caller to reset the grid size and try
+			 * again.
+			 */
 			return -EAGAIN;
 		}
 
-- 
2.55.0

