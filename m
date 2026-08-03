Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B10430314
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780389; cv=none; b=EBFWrBwMD2MPhu+X4/BbaL3ftsOSIqrzndMkKdgswB8LdC/FMAiNR/ywKlwnBtUdKbXy1Kjx0NBQVXo/V2zBobHt3FOnnb/TmZ5oTJnK2Krdh4rN1FmFNq5dw5o6kQhVbNWmAFAZuP3q1SQX6UpPWf2xF/htIQgE8ipJ1b3+XLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780389; c=relaxed/simple;
	bh=e2fsRyF9PgOHKaKium3ajIhvRG8GyTllj2qpeQ4T2s0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tJ2KdKq6OLNEYpgqXpCSzLrZopo0FljJf/Rw6MSbr2B67bJAz3rU2c/zhujAro30s17zZzkXm3mDo7MszqDZzTXlNVLcTypC+HPJHbX0mScfbA8ZL+H2/vV/Dxa5bVg++yP40zKzUic+pnBV2y77UGZ8SNGiTtZ/IguEKd80Oeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rl60EfBW; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rl60EfBW"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso130186a12.1
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780388; x=1786385188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eJdGE//JoKHL+VtG1AwkmosMz+TfYF4UWkKEufKl2Q8=;
        b=rl60EfBWQZpIlO87zlP2Njhdg42XsA7LVq4bGMhKve1xwjwfheWR3y5r+LbdaqCNrV
         QWiOK1guc1VDoweKdv2ubFRBSGHsXsMK9cUKnL9w7F7cwbZ/9EtZojSWsS0VEXQBjL5O
         RaKa2oRZguBJc7al4Enhfkqi3JDs4OFebCkHA+IzYgxeAuggNl0EzgoUKmNGkQUvtH2f
         HjiVdABMru9FF7ZhyAOgKZNaWJsT8gls9tUTgCTOYliRsnfEoBC0eTOFIoGpYU7B8YZi
         tInf94yF1ZR9zq4R7MJ2k6Rh7kvY2yDGUhO/vewCeB4D/jFxkO0tMZG8d1koakyVZ3ok
         lZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780388; x=1786385188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJdGE//JoKHL+VtG1AwkmosMz+TfYF4UWkKEufKl2Q8=;
        b=LkbfanViQM0OKAAozhEcJkobNXAx5BuSBoSAmm3RCVaZuhuukvdBVF9Lo0oENrGPSI
         kOHipnfYwZNYg9/I6FhMruP8mGSk//Yp1oKgPVlh4zJ25HX1S0RKVBipLvQaTS+5qTYn
         nKdK5NCXHkHFDpb4y+6Q6AZgPnrlnt3Jui/pAGNEd/SyLMT4CZ321yVqu3YFESXL6F83
         UNhHzmSCcqp0n8vhbST6tDqbPFp0IdzpFr4yO6V6wB343t7pK5gO6x/+MrJH6bqaLznk
         2YOqQ1Q1Bc086LcIKvUcYpHWFMJwkHDBqpYZm8k6k9Zien+lJBnRIsZFvM6MXs3nF5n9
         A6YQ==
X-Gm-Message-State: AOJu0YxAfM8v37cjB5kO0zKcyOblAe+8xPwc6ZsCeBZwZN89ZzYudW5q
	C3MACVYtxfVj690gqyZ2lcGSWhx9eN9m/XLokj7g3IMcQ/ZwYBEBQxbb
X-Gm-Gg: AR+sD10ef3OdeNcfIwrI8LKBSFi88CWSMmVd0J8+wjZGOI+8B1seK+VyeEybW7/4ShB
	bWYJwMA5WHOSX9kK/vCsz8y332aiY6l4aJd9xxD1wAiHKeYaWrjB/oKUYZkttDGhnS+SZfmDW4Y
	UpoU4F8DrDDl7ALKzpLikKj6gR4MURE5WouIMlGpscTdy/YFO648PPy02vbVszSgQkRyKUBmfKm
	OSaI6At5Uy57Nb+0c1y2qubQ+yofA8iRMqved6mTEjiDlEcPrOvQkPniNRXaIpmq/ZRfIR+mMG9
	BdVVc7BdGWoWNHUOEcwgFOzBmVWCFb+EeO9P7TZCsx9v5NePtCqN+gD250sYpLvYly+ZerxApu4
	TrO8o750/ZH9cm0099LkQ54Jy221W7om83MrW9PXTuvcEys2YTMEer5KR2JgYlpzAj2V12tVWAK
	3Imgjz7gI9pYkRaATP9JDbmFr5AC2idHvPnAAsby9OplsderIJqrV1kwuF7awWAYKR5uSAcprNe
	J7ivw3Z
X-Received: by 2002:a17:90a:c2cd:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-38fecd3893bmr469361a91.13.1785780387875;
        Mon, 03 Aug 2026 11:06:27 -0700 (PDT)
Received: from Vicious.localdomain ([223.228.81.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab050d8csm54988418c88.0.2026.08.03.11.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:06:26 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary parentheses from return
Date: Mon,  3 Aug 2026 18:06:04 +0000
Message-ID: <20260803180605.430-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c       | 2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea..ed09be2fed4 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3..40793aa58d6 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -843,7 +843,7 @@ static int _netdev_open(struct net_device *pnetdev)
 	netif_carrier_off(pnetdev);
 	rtw_netif_stop_queue(pnetdev);
 
-	return (-1);
+	return -1;
 }
 
 int netdev_open(struct net_device *pnetdev)
-- 
2.43.0

