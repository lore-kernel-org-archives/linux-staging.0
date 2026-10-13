Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC3235AC24
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 02:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791858257; cv=none; b=cU+fwuaALDg00qx7hAuxx4WrtHHmdI4aJ8mBu1BlQaaHpAw82CYL6/sl0ytdYGokQ+BvO3ZqvLwJ897tDBACiKFEcMvCPh0M9tLAiSNSuCys7WGdidvuqugz0Of5rZfqcS916oIoy0mlC6RcI/q6pVi/1OlC4AJ/LPRLulnQXjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791858257; c=relaxed/simple;
	bh=MoMGSPOqTr4M6F5ZHRoW8h+LRARnD0C9eFYVg3JWUMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XzfnL2sIndsujkvPvPwgSWMCU26MZU02VLz+5LZDclhYXquzZmq4vkSlQQvFBC3tMgL+DL6ODqaOKpQjDGt/oKtpQt9hSkDJXeoqVsAOpUxjXvBsprRBQbqh+OmAdhPtPpazIHJo2NSL2fH3qeVMb4yETdX+ETWJ94IVrQKWWOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JT8lzspH; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT8lzspH"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35c76e9614aso179165eec.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 19:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791858253; x=1792463053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mt3JmLLgHj7BPLHepcEaqLDPCG5DVuA7mfVobinE+s=;
        b=JT8lzspHS/s+C7RVix/+GxLqgG8vwxisll+7a/kGJEif4yPmJtwdWtgGKQyR3EBgcW
         vTOH3g6PcfC0Ukfelr0A7L1XctiMGvPT8/BjZ2QJbbNuWJhCo7qMv62XTSfcEwI9+KFX
         KRD7JaGBaoATpNKyM8HTGvsiC7mkfROzNOt8RuvwzOaBP5OUqAScfTklA3CBBrtn9Tu3
         nj7dFA1i6DlySmvZ3nc2OGJ2zoIFTZDxHvAcbOlCmLSkrUf6a/NqoNPZb7DiiJ6e8l1I
         9XSjD6Fj2zUqGHoLvCP1put+Car62BUXAJo9ygBckWpIfiLxUExCaW0soFLSOV3Uj96w
         dAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791858253; x=1792463053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mt3JmLLgHj7BPLHepcEaqLDPCG5DVuA7mfVobinE+s=;
        b=lhm11DdZlKL4pKLUFIpfjwSRQsLmtwH559gKGAiT12CjWTwRDiXjhiiayMUfWS3VV8
         eyE7+5sKtMH2RpkphxLNAEnFPrN6UyhUyx6kkq8iUin8xWLlEFA4B9ge9AagWWhIOxN9
         i9/N64gJ3DIn+fola+ayWPCD7R43vhhri12Yx740/MKKnOvmJOBnwvj9r1EuV5TH+RTy
         6RURheZIDXHFGn3hqdpVpkC1vNJqJEY9f83/bLie8eD2B83YypF5nA8d+OJcPumOc0Uh
         alBdgnmwDPnuV3XDkimME7fwekz6koTEbAh/j0E/IP4Orj78GiczCHEYEbxgm0HqdSYn
         uERw==
X-Forwarded-Encrypted: i=1; AKwUvBy7XI6MCHM57hJTGiD5jvXm90yyWawolFmMZteC+7f1Hw9gSxwUYVCQp7vBi2wMg8b7jsw943YiEJjvvR9I@lists.linux.dev
X-Gm-Message-State: AFq9FYLuOceiLd8lPQ5iZzjZcICyO7ln9XNLCku6TepuSai6e/No1AbU
	8WuTwEnKwmys2Vn/SlF1z5vLh2kllE6tHBfbmksngACEmUqNeGdgfImc
X-Gm-Gg: AYBFou3PvG/ooB5vIHoI9HsAyX4x8i8s5ChuxiKk9yd2r7eKY5i0iRvZGgrGGaWQuOe
	a1Tu13BXQrt7QC9dILitl/OKCUpQT17aIxKEXeOlxJ2L6TVrynY726vzaBUhIlBLh6572/VczQ2
	JjOTXcaTQTrZyVuywF6eD3EmjXOzbJmAV4UG98r/2FDaSEe19/NhLEuCUr9Lavw3UZfqxDdy9ba
	qD42v8sjYRvcnngRHOxvYlbcmk/7pTtK05ibXFLLrcwAeum2cqu6scbyvkf/dPrr0s/eSLzUXcE
	sx1xjqYUA4Uog6uK/RCTBiicykitMAylR614vvyogqjKmdc8TBSEbEdJk/HlRvTu6LhrQbGz5hj
	llrx2VxjFChS5/Q7sTfjRYi2/987AmhUSYvfVhmgVGoGWpZXD4N0fYn+0vXdg8jPFUrlDx8/NCO
	+2m7t8St5/S4ofJ2VRezL0oKqSvPBFVcx5NdWa0Ug0MSqCr4xgZO0u0NCcKYMqzQ3LMY0lhyiCM
	dno2w==
X-Received: by 2002:a05:693c:620f:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-3537dfc7ddbmr19496412eec.7.1791858253173;
        Mon, 12 Oct 2026 19:24:13 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:d39e:c181:5646:33b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm34777638eec.29.2026.10.12.19.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:24:12 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: vireshk@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	gservice341@gmail.com,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error messages
Date: Tue, 13 Oct 2026 07:54:02 +0530
Message-ID: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Use %pe to print error pointers directly and display their
error names.

Keep the other PTR_ERR() call because its return value is
needed for ret.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
v2:
- Use %pe in the firmware management case, as suggested by Jeremy Clifton,
  to match the other cases.

v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
---
 drivers/staging/greybus/fw-core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 2016a74f137f..78321be80013 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -93,8 +93,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			if (IS_ERR(connection)) {
 				ret = PTR_ERR(connection);
 				dev_err(&bundle->dev,
-					"failed to create management connection (%d)\n",
-					ret);
+					"failed to create management connection (%pe)\n",
+					connection);
 				goto err_destroy_connections;
 			}
 
@@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  gb_fw_download_request_handler);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->download_connection = connection;
 			}
@@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->spi_connection = connection;
 			}
@@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->cap_connection = connection;
 			}
-- 
2.43.0

