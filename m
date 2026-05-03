Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DC5D531
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 00:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777768910; cv=none; b=iTSbfX/eJCkMP1Ghx6TN1GO+mhkeW/aOYVuKNBuXH5LoWUtH74KmqM3Vb0k6Ae3R3d2PLJ5cHeDBRw9cGchw3ggEgi/eX2Gj0o/lH/U3SJ6Fa9cvn504QGIlYzD0kgJZnnJSXzdYAi/6Mj9B43Ze6MCaTyUgCF+HpRxItd+emEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777768910; c=relaxed/simple;
	bh=adMz23+f4UNba44m11Rs5Aa9KaMHy2XPwuE3opRayVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GI2jhZNXdo4uQl69KThIsqLz/sZ4PjprNeGHnkhgkuTR/UpL64kA7Z3mY2vQNTQnYxT5BY5unQKky1NtWsMX6CLOjkDDSEX2/Sr0f4fkBvnW3+HFLbhx57QHOktZX64fLCQMfK2stNnNLuwqTG48S19jMRWESbVdOisPJ23GTQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com; spf=pass smtp.mailfrom=maestretorreblanca.com; dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b=ChKH5Aqq; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b="ChKH5Aqq"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso2022273241.0
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 17:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maestretorreblanca.com; s=google; t=1777768908; x=1778373708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/F8bXbgGOM8tevmwPesJRPikwJcjSh3UPiudh1R8Jo=;
        b=ChKH5Aqqz9LntvKPa+zISrYnPUChGOCEpt4Y2mpI1ImavU5VHKIYFxYAsY4P6VpcRU
         YzduanIsHzUhGHXRG3ZHhmQje09RQqWy4xoHdaKjbHWjK54N0xtAhrAa6DajssQDCt80
         rmtCqS+jT0YObSdqh1sImRT9bGVvxGOvaE95wQindt81C0P4a6qlhMjjCrZlVNx2+q8/
         Tg2vWF4ppiZODZ8UVmo6NszKru1M0RGXy7dhCg9VsFrbKUB6vprDIqHWiOjuDYQ4Bkm0
         HC5hk0lg6BTS5OXAjrZ+3zK8qtAMJv3y464N2mtfgtb3NCDbr6AATz34YawI+FcHf1q2
         PWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777768908; x=1778373708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/F8bXbgGOM8tevmwPesJRPikwJcjSh3UPiudh1R8Jo=;
        b=deWj4Si66CvbVbYsvajM5VM/yT1jFApW7SMaj/7z5+Mb9cygo6wHxppUCN7VrGTsQG
         5vb9EamcT2SVvw3jD3ee1CPIh+fgLrASUc49LQhWNm+PNuiiDtc98KupaeYiIp+4RPdP
         rfQdLH4Suzuwx7rObJgG3C/lcAjrAfdDCjE5Q+eq6XWwRKamM4PGlaPa/5JwoVqUipZe
         O3CPyAKXTLH0f+u/pOdbknT763y695KUzdAVFhcxdFIA3yFZiTo3U5Mfbu9ib+4a8o9Y
         jL7P8tSP2NrRdha2aQFf8xsd9G9JtU2UDSDpiL0rH6U5m8t8PZ33/+p8iNiGwWvZFMGw
         Mn5A==
X-Gm-Message-State: AOJu0YwYqCo0Kf+AQ+auIqgVIslLjcZ//RqFAt/IYnStaXGDJ1xn5R4w
	VA7vHv2zZxc/yPcVRXWI5s/lI4OhaVry7jaM8AdyRrxKVxRiZMneRUCbL696USWxNTV5Y6IWkCv
	v7RJtWg12qw==
X-Gm-Gg: AeBDieuA2Rr5iTggCQYA7wcnkSKNT3neDvDd5GLDctQoM8/xUuN0AR90h/uow+OmKgI
	H6wIb6HK9buQHf+1N0ej7wTu7WzN7KITtP29bkoyfbeB0MGixvJBALDQo1O3J1xOQ3jS7hJa8QN
	7ziNdr9W5+nAzzAQtKpp6LwJOtfc2AMFqF78gs6kSNP5/fYdbkuI59w0z/GhdSOhqGGAfdEkkdJ
	9rpgTrhuM1AQsG/UTgUjYR3a8fnJ3B3nGTsn7VMmnCWzgefhS1t9bbhwvlqTNyYqFcXT0tOXWRP
	EuKWXfNPa4nD8IrJA+Iv2ksCMpqVKQ39wtPDX4nzCWZDXox47rRLfxRFTuuoysQPUZkEYEZfsjS
	b/XDB9o49TFN5YJQRT42rL1MSC03K64kK8k7+d0znFtElPKUbuY1PLzC+SFV+odHl1kO5MCOEXl
	Yd7/Q3VXeqXsOk0fsUj5MnDK9faXlJ4/odWX4iDW1FodG4EvoOtn/JoChdkRMYiewm560d//NjN
	uNGgMrkitb1bswA8gRwkBzl5pNaG7PA2MfG1Q==
X-Received: by 2002:a05:6122:896:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-5750c5b2c39mr2290390e0c.6.1777768908203;
        Sat, 02 May 2026 17:41:48 -0700 (PDT)
Received: from localhost.localdomain ([95.214.114.12])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af57f6sm3511233241.8.2026.05.02.17.41.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 02 May 2026 17:41:47 -0700 (PDT)
From: Francisco Maestre <francisco@maestretorreblanca.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francisco Maestre <francisco@maestretorreblanca.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove unnecessary braces in sdio_intf.c
Date: Sat,  2 May 2026 19:41:44 -0500
Message-ID: <20260503004144.66733-1-francisco@maestretorreblanca.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces around a single-statement block in the SDIO
disconnect path, as per kernel coding style guidelines.

This fixes the following checkpatch.pl warning:
  WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..a86252ccac76 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
-- 
2.50.1 (Apple Git-155)

