Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693AA42089E
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410038; cv=none; b=FpPMHO0w98gkwECLiyWIRvbVwDJ9jakzaSWbzpIJC/btUrBQplK3dONrPZCcSsdTb/RuEFKGHbmQhRia/KdSSZSB0QDW6HfJFbDeQA6fPds9OlThiCzUO+F6CTjKhQ7VxQ64QUjzBpfL7ZWxFUTNKMXFdC6QRzRtuexdco7EV5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410038; c=relaxed/simple;
	bh=DSEChP9kAsmk2HrXfSdbcWaNkWfX3idepBBcxxyGuF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMaKjm6h4/nEyxNiFlYx4xyw/AQxxKAVpg14dTr6Lsd3xfEmcJNnl9igN4URZd8OXyx67yvReCqBNXZ2jFiuelVi5bkxj3N5RYCyVzoSg7un7ibajIn2TDWbizhZOLuNt8ukCLP3//Tgv+3r0YFzq74U/+zbYrdNhG5iXRbXQvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+xHkvT8; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+xHkvT8"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15b509c323so16943366b.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410036; x=1784014836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K6AeqTPAcZ4JrA+Qd1cNlOBTaQ+fwvnS/cXYGctMis0=;
        b=X+xHkvT8UTFD5DgufW0iXb+sMNX2HRMrMYVBeQaq6i80QovH3rmfle7MBmjEIdkSdN
         eRqKeUpHqbqlygEV8/U+5v0UFQIoFSI+Lw+/fvCYn0uTLFssDApP0LHe+SGdcaqwcGEu
         WbCckgXlVo0FfTEXUfia+PubtMFABtePcChsM96a7tCzDWjgwbekup2ngGBtRpiI8Y1D
         4imDwgQgm0WIna7Du/6jLCAFauT8BqIndqrQDqrTW4UXwF3i8kQH55OPHuJ3ZPt5hMXb
         z/6srlTyWBdIRiUPRvUx+5qAoRvfhMJtu7h4G7jmfaZBzC6R75cBADrEMfZwSLkYHZ2Q
         U7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410036; x=1784014836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6AeqTPAcZ4JrA+Qd1cNlOBTaQ+fwvnS/cXYGctMis0=;
        b=NNja+S6ZdlhRYEJnBOsVlj7Pl1bAUDJZg9aF7OkAvNLX1aCXYybQnuvoZ9jE6LBK2Z
         C65ckiLB+qQWwV2lk1ks8uVEZkcbDJdfXnrTvYFtxM4BP4Eh9U+o/DwXj8QkJuStxZ1A
         qxpDw/j959DOQOkseFLOHm9ho3RsjpR2bsC+DJODwPulZ3yKqiUxp+Mn/YyW7Ddx0fQu
         bZiCrKu7KGwjkiYky4DmLhTDrTOl2QShGyCGGDW7ssTc/oiOYLeIqFEET3aZIJpU3ro6
         7djJXLSPFnNJWGPge7a5u8MQZ2IOY14x1pNSDZZs5+ArMCkaUX+0fINtnURUbhZFJsgY
         /EVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjeCHWUqhekdop+W/6u0iAT0QXTJv7oUqDbUZuHYvseLAOumL981EI+SKNiZyGnR140Z2rYWR7T3IO+xrz@lists.linux.dev
X-Gm-Message-State: AOJu0YwZWB6akz92150Wj26E9lBKjdSKU+0Kxg2nBrRs5W7QnlXOyOoK
	U7CspdTuwlQm1PJ/lX/bFTOhwLgHECBQQPtSwveFYKlaCkDeRzzMLibP
X-Gm-Gg: AfdE7cmYEiu8BZQPz8r1aug2e+mUWjhkWG7e/btG1wjMnzEWyu6N9AjqPFA4fOwT7v4
	RGe9Hl3vDoA/ci8VNJqI2q/p2HX2TANYhN4JNj4aBpxsqmJdlodys8vwVjZHMplcb+6zLDVVR8Z
	/8j3fd4dO7CIt0ZPrzZeuFUBfoOeeT5nk70zK0udpFDBy4OxNu0cX/deU8XYKz42agDBdScMjsX
	7NW1TrxMsGrp57tcfADIHEjvC94n+3YcBiujTSFcy3YhfG2RT6pC7Xgr3pqN5CnV2juWOKiwPw5
	gBkHiT9NWtp2cjtIcA7zWOTsMbeSnQdnMZNGSk4pUQVfgonyOCxJvgNiJCkAOI64PnaaPHxqUsY
	FvDKv3BPV+wAZcTnxRAQHC7v1NYmpY/TvFvGFA3lrnkxFAAuf9+HRJg/49SHlQWpltNwWrZQ2Jv
	zJkf35aA==
X-Received: by 2002:a17:907:e14e:10b0:c12:696a:b217 with SMTP id a640c23a62f3a-c15a6823e54mr192470966b.25.1783410035532;
        Tue, 07 Jul 2026 00:40:35 -0700 (PDT)
Received: from fedora ([156.203.68.153])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad882342sm72125866b.28.2026.07.07.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:40:35 -0700 (PDT)
From: Ziad Ali <zalshemy9@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ziad Ali <zalshemy9@gmail.com>
Subject: [PATCH] staging: atomisp: fix typo in atomisp_tables.h
Date: Tue,  7 Jul 2026 10:40:20 +0300
Message-ID: <20260707074020.12332-1-zalshemy9@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ziad Ali <zalshemy9@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_tables.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_tables.h b/drivers/staging/media/atomisp/pci/atomisp_tables.h
index 33e6079aa..59730ce32 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_tables.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_tables.h
@@ -93,7 +93,7 @@ static struct ia_css_macc_table skin_high_macc_table = {
 	}
 };
 
-/*Blue enhencement image effect table*/
+/*Blue enhancement image effect table*/
 static struct ia_css_macc_table blue_macc_table = {
 	.data = {
 		9728, -3072, 0, 8192,
@@ -115,7 +115,7 @@ static struct ia_css_macc_table blue_macc_table = {
 	}
 };
 
-/*Green enhencement image effect table*/
+/*Green enhancement image effect table*/
 static struct ia_css_macc_table green_macc_table = {
 	.data = {
 		8192, 0, 0, 8192,
-- 
2.55.0

