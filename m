Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A751AEEB
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790114342; cv=none; b=Fp+TrSNVyboNplApBz9AB1X06pjTY5xNHJ+ANKiVlmhhyx4xvHMYg5ByjmAV3SHz97gO8CwacKrPEwulJifR0jxtZIP46J4n/pE8lfjAGNXsEMVP6sscmA18z0XKyFZWsyEopKlwBZAagV39qhRgd+RXCCTKIa7L9YGWOVSvoUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790114342; c=relaxed/simple;
	bh=GDLSwIlcQiBPIYZW7mwXqbHREJdT2u8UXhgtTj5jkiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R+ybSHMuKJCio00z1aPZWKGp/9NhtB50fZLuCBbh7F1ksb4BuJ38OxZcqpbqq3+bFyzM9v2LAtzfgFLjG5khR2YcNGjatJJ2ZpHdl610oroDfGzigvsUQ3fLqd3289hEi4dXXnRnWWOHAkemVRy+8sRqrhQWDV203lWq5Blkzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOOuUxzX; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOOuUxzX"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5eso2177401fa.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 14:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790114333; x=1790719133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7q1/TXtAUbCspe1fPBPxnd3YpWlWRbOHARWf7oPjbO4=;
        b=gOOuUxzXw3c6q6I6mxoHTKZj6+HG0faq9LMn8v08C8p1zV9rFayiKRahfYoDrzLtYj
         jS3fA4QBW+GfjSWkxkeEJZ/Ko1WaYQOgXCRoJNrp4+4VWJ24v9C1XMLIHn+MtVvzOcAt
         T5TdDNVu/5gv44W/7/MCjB5TmB4FnlRmF1c2MYVDOOY0jMZEqLSIFJVmLPIY43sdMUd5
         DkShMSBGAqi53OZx7DkwLtZ+GUjdAK6mIzKOEH3gISB+6K4vdeEbPQrJMG+O0+qJwMfX
         EozQqW5I0CKSFVrYQeinwRabeo3I/bAjSAc01BcyaxFazKbY1dylg7QRKrzRg6j4NCIK
         1qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790114333; x=1790719133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7q1/TXtAUbCspe1fPBPxnd3YpWlWRbOHARWf7oPjbO4=;
        b=STHydyx9VtYr8mlBaGT0frydb2FNzEvCgD/0DK19jK/FszbPvaYsXl/dwP1SbG9I+P
         JVFDQ/f6uZqkBdJ37F5+qsORLyq9xOClcc7DvGkpHfT7xMBtnTMO4fMOlsx/nLK4Yixc
         9Zxbh/4eMj/JcUKU9XDVK7d3tOOLlk/anRApsqyLLyHn51KT0x0qnl17QW5s7TrU1prL
         3EIFSiNBe/NN7CBDb4odgD76hz2MhWIkrkg+9HTlCQzzaZ7eYGZzQ6jN0chk7gtaTcVj
         4yHTVWOoTdttxZLiQOmzyD6q8fC+S7RtJ5y+aEAizAiuBs3W5CqUhqVgGo3vvaTRIK8t
         mB+w==
X-Forwarded-Encrypted: i=1; AKwUvByMyxyI1IwnK98J06DjYpAjBaMGxf1iC+xHGINAxffuKNzEuf2zA4KHfmq9jbDboL+3pEV3y65j7aRgZge3@lists.linux.dev
X-Gm-Message-State: AFuF++lokq6dUi+XH/56E6pP7CdupBAtl4w0uqvvmEtoHhVSLz8+Awow
	Xbd0AjgNO0Uc7Z2jfK8RISiT3onzRWV31/MES4CD5O/jTqMXCIoQ3WTe
X-Gm-Gg: AYBFou1nYjMCEqKkwHDUKTQIQ2RylwrIZf/8Gf8s6zB4a7Wdc6Vv2+ykc01XMugM19c
	zgPScT41KLpgr4IE59h/J2aysrMpW8OdF8l3EVnM98FwjDLsARgLkamTORHLvJiUFuqXBN2jfyu
	T9P2Mi56cQkPqqkCipfxLXA/4Zq7Fhmt+KK3kzKxVh5N/RJQ24LE+qCtRiRlTcYdoRsXcawcVxA
	wKz+J5cHBJCmyJ/VStOoYHYXWdTvwxatPwT7tKviua+Vrz7BucQcQoxYM/+2QyxdMfAFmfjY2Uh
	PtFssfnZsqXNNZBr6w65zvAjDdDVMIjERrFW8TdCKnIpwrKK5ErWunaACUSicsc3f0mDgCwmC16
	jJ0J0fwN0pJhSyWvKAi6mzDAX4EF9jmgWAyWnK0ZID4/Bov26jLxoV7seY7NIkX81UmtdpQ2/eO
	OO8zHwHzJOtRCCDBBvQBWr2iV2UKi0Je8o++3FQnsuy1YF16Rv50yH+rsvoeZZXUrLeqSjbwSgl
	K2M6ZDXuvYo+fE=
X-Received: by 2002:a05:651c:2119:b0:3a5:df43:7628 with SMTP id 38308e7fff4ca-3a63057cf2emr1261361fa.0.1790114333042;
        Tue, 22 Sep 2026 14:58:53 -0700 (PDT)
Received: from localhost.localdomain ([109.195.90.36])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f53b3d5sm1974651fa.40.2026.09.22.14.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:58:52 -0700 (PDT)
From: Vladan Kalaba <vladan.kalaba@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gustavopiazdasilva2102@gmail.com,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vladan Kalaba <vladan.kalaba@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: axis-fifo: fix integer underflow in tx_fifo_depth
Date: Tue, 22 Sep 2026 23:58:48 +0200
Message-ID: <20260922215849.16739-1-vladan.kalaba@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix integer underflow if tx_fifo_depth < 4 in axis-fifo.c due
to check in axis_fifo_write() subtracting 4.

Fixes: 52ff2b840bc7 ("staging: axis-fifo: fix maximum TX packet length check")
Cc: stable@vger.kernel.org
Signed-off-by: Vladan Kalaba <vladan.kalaba@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7bb35e11d1dd..066124122caa 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -413,6 +413,11 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret)
 		return ret;
 
+	if (fifo->tx_fifo_depth < 4) {
+		dev_err(fifo->dt_device, "tx_fifo_depth must be >= 4\n");
+		return -EINVAL;
+	}
+
 	ret = of_property_read_u32(node, "xlnx,use-rx-data",
 				   &fifo->has_rx_fifo);
 	if (ret)
-- 
2.53.0

