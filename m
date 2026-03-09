Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1FA33F8BC
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 21:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090493; cv=none; b=b9CqNAbgr4EADhfaeQdbYU9p4/pR6ndXeAKiIF4hUfPuHkn5h4NOTio+oWbBkX6aUR/dDNeeA+eVmGlDZT1cZhDTDelQ6xWxDV1KbSFu5qFDjIiX8TU/u20zBlJ4BxTSDRtn/Wx20LfJZj1FxrqB9FYI99ZxBeKJKScQQThtF8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090493; c=relaxed/simple;
	bh=nA4O3X3WVlEsyHGhYULanMa/vngrh/dYZhVoNGh0ssQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yoh8ByqFYcUht5OlGshlSxPmb3ayM+BfHnje+FDsMg1cFMSK+Za3MaLbiGUcQ+dffHmybqLDQsiYnKBPjyvyJhkQnPhaoCcWdUAd/JDw57eWCHBcuzyl4qFh+pzkAs70Eop3qsD4jxrYFDra6hkF2mz2CAgwNyAECjcLyrPUG+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKoeYGO9; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKoeYGO9"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59dea72099eso6792674e87.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 14:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773090490; x=1773695290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6FDQ2lzRwRtDD7rhw35ZpmWvjtDI30Atm0ubx6HUMWo=;
        b=kKoeYGO9Ek6d+noMvKMqdKAlCEDuaEq61n+mw93y2pPwtTLIBZh3SN4SvvzpbH75lh
         aSrrSXm0oVKfnI7wjSbnNjYZisEDi5VytPpphSuAlNmRu5Q94weNqMvuxR9v+a6s0sYX
         U0d71eNHsUc74lu7DiV+lJasCZp0UyxUOIBVDlpZ1ZeggiD3pg/7a9lBTxLfdPCEh0X7
         tPzSHDh4pd6ER56e1bBAs1anjP2r/wISLK0tR5fie+A2TFR57j5podtgWlYhgfiLy+Xf
         iXJkQZRM0KvovX/CmTOhRhffhNzyXDStuIB99OG/5zG/t+xU9o0UtlwxqPhOOknZX+hs
         S9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773090490; x=1773695290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FDQ2lzRwRtDD7rhw35ZpmWvjtDI30Atm0ubx6HUMWo=;
        b=OXIrnCapM5yXTw/FGVwJYbdxOqWD42mloVwg/9OHBwIYcwrstr922VQQ+DjU4AJmYG
         Nu6JxdYs9Qk1lpvDBTmavoxDYBZL3bSVK7buZ91B8Sl/Q/iOkTTJjWvQ4wMrTHTxnoGf
         jqNcvDgAormkAThvZn5Rm96OmXgEW++w4fsiAZhSqC5SrEDsymGEjE4796+f7jglCDP2
         TXlU15u1ZzV4biG9RXX7hsA0ONz4mHTlVudoVBR3GkKV5kHkQ2zSGZCSAjPrLI7TZr9h
         Ou/9b+aHGkqnffdJHdB//FZRxiKvBDMqXEUvKvXcJppHu6XoSO5J0lpL2+Pjr5r3iUAH
         2Skw==
X-Gm-Message-State: AOJu0YxHyxKMVZIp7wdxKZFDNhfnfAJ+BllupTJkwfv1R2bNPHTpgOGG
	N8EHXTjkkqp79vAR/bGCzzNUGSorwuaCE2WIShiavVxnGWYIILYgP2o6
X-Gm-Gg: ATEYQzxuxzJmQM8rj3IH0Zh+Xi1FedNv/gxN77PoT+TCkaPaLnmv+ZRVV6gbwuE07TK
	skblxGYBqHR9dBdtSMeCRXwNkWLbQFA/twPCVP9HM+2pxOCTiejJ2YT/Fz/T9d5bE//wAbZcFkG
	4VySi5a9KE4YgmI6QJssIvJwmKa/bSOo6Dv1hxWbZE1N/husgm5Hu7ut09hMqMdBkCGL+sPw/Iz
	ECrow7GktmUKuF/LUkmgPX5QZpMznXk+ZHenjfvn/unU5Sm2iv6uAGCnPmT840xRMtpkrjYPSz2
	DUYDqjCocrAXX64/6N2OpWLzfmxhM0PHgpJfGRuw/QvGOC+2YGmQmVNHr5ntfjrA/f31xs61zFp
	TgWJ6X9Qu0IftbgSmSXa07NSoYXDZSNhyeTgXs+uZk7p/iEP8De0BcRzdBvvPYY1aGMRf8yXAxx
	9ZUPlFTrs1q0c22B1QAos8QUkAGiP5zab88OUmwLZBRw12aVkiAKR5x+aA4qY+ZXJjd4gJfQVch
	g==
X-Received: by 2002:a05:6512:3409:b0:5a1:23fe:b04c with SMTP id 2adb3069b0e04-5a13ccb9aa1mr3943918e87.18.1773090490223;
        Mon, 09 Mar 2026 14:08:10 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d02b7f0sm2323362e87.31.2026.03.09.14.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:08:09 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v2] staging: nvec: fix block comment style in nvec.c
Date: Mon,  9 Mar 2026 22:07:49 +0100
Message-ID: <20260309210749.4557-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment formatting to use * on subsequent lines
and */ on a separate line as required by kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
Changes in v2:
- Remove unintentional capitalization change in case comment
 drivers/staging/nvec/nvec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..e70fafc095f2 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,9 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/* Delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0

