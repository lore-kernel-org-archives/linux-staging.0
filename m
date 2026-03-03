Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3030A386548
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527674; cv=none; b=tvJWZI2/rohGLaM33JsVR1G11+ZJjP2NvlDNqvRgjXjKL0xwKVtL5JzJu2LPcOdGmf6F68Pf/ltO55yiyFBUJYX7TR0nc9fYNUGqfq8wKdQYv6IyA+Y5+05zG+VMz1di8n5ubQQZzvMnZ5hIi/jcvwqAiIFSDMbhs2FQFs6iGBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527674; c=relaxed/simple;
	bh=ZJcVn3C6ajbkQ18xjOrLxHr3n+ME/clg9gWr+4YsvxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FwmxzcKN8nYIc6vQvHdNT7JBO61aG8QXxhE0Q5CGFLfrXgz5Q4B2fCKXV+diOb/aDBoWtj737E9WtXNjTa0b8qkKfpWF3FFOIMTexG8pN/k1V4g2mk3SlO6DVFv++t2aLD+AWjbKYhah8YIVnHLGMmQ9776WXsj0IhUT/H9VhoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhKmR0Tj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhKmR0Tj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-827546f228aso3447014b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527672; x=1773132472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSEdtfABtakYASjTdF9LEOBTWeKyAZVgi5djHFasJss=;
        b=bhKmR0Tjq21QHrwEeN7GrYBIgY97aDxfiRK6aCEQQBRnb9eawTFU+Vs9mM0Raysuoa
         9KgkLo8bAZGk33aQN8/4njMUCG8N4qOFkuZdt9fBHFWlvrf0tKdsMN5n6+IP0FwHnrsb
         AQDYIimFuffkH0uTP/FnuJsnxBDCZQXxPnFpNh/49jlB5UUAel0gl0Jc3EyvrDpO1HpW
         KHb7iKZDzItZsbZG4Wn8Jj7dJHmhDmqe1GeBqiLQs6mCz9MAYt/r79J+9UxbUzLbwM98
         lwEKBFVk5qZjDlLGvjm6J3vwtNluRC5f/DkrpP6WSbKCdXI+N6lA60s766cNe/arBMnY
         dcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527672; x=1773132472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSEdtfABtakYASjTdF9LEOBTWeKyAZVgi5djHFasJss=;
        b=gr+b3WanrZ7yEHxMv8BkFungOD51OsEzl2/WxDQaCo994QjTdcQfIgNQrxYhxLcKmE
         4A0F0T6lBXcj8Lmqvfmk5EnxGqViPTAtMSOUXncIAcpXKbVph28GyxJBtor/OssOdLyU
         WOEehyWZRpQgVtStFoOGJqpN5gb4P244Grx7u2b15HhnKMuOr8W7rEz3hhJ7WEc2OLZy
         ZndApQk22EEObmekssZ3UQuIlbSim+KEZLiJH0XuaFM5VHHDjrvtw2drppjRjvGQz1YT
         PCOTr4toM4xpsVtoHaYKJ/6T1Y39d4TH7YNNHW45Kzh73W8VpaHAvUsh5e6GY2bxtMV7
         g3SQ==
X-Gm-Message-State: AOJu0YyLafd7N6qvOAnY/EzJOB15S8lqhoEBkdaijlCp09SKVFXKnoF9
	7cNsCKUbS1JZkB9oILCCY7aUyYKmTu0JwBuxePy3T5cKqCLsNaJG/H9Z
X-Gm-Gg: ATEYQzwl4spEJnFRlu3HGgvnhv/kIH9KArNOD69exW4YXkw5ZkEQBsIT/xXB4JidqbY
	GwWQe6/c1WNVMFbJ/BfJRdnN+9IoEfXr62xpnvbh+h2gdahLDzEjJosPp7SDbMDHubCwm1lJZAF
	qw693Zrer3dBbJLUreLQUtgX8T7SphKMn0QeiKfx4p+smu12Ob6mQPCvBJodfYb+kVgApyPh+xj
	+cz3pLiY9L13hBV9SCYmz5LKlFR9UyMjGattQffjd94gZH+GZyP++O0h1MctE0KmMx5Kh2XEouY
	zynVn/a60A8HuqJOMyJZOVVpih6aHQ6MGcNi7msLOQhgYmG6LlklIU4UE1N9CYzyN5KKko2Ps6w
	Ou8cDA0+5yafpOMQS/gfjbZ+DAij5E8Ypn6h/+IoWQ2tr3Pw42F+mCGIOF3XqXBEXJhbSdDpHNe
	+Zc/18afckzOAKgln6Iud7l3otK4NozjXdbjJ4Zua4L255uw==
X-Received: by 2002:a05:6a00:1885:b0:824:374a:140d with SMTP id d2e1a72fcca58-8274d9401a4mr14536761b3a.4.1772527672486;
        Tue, 03 Mar 2026 00:47:52 -0800 (PST)
Received: from mx-instance-int ([47.15.229.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8293c29add8sm8365893b3a.19.2026.03.03.00.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:47:51 -0800 (PST)
From: Yash Mehla <yashmehla688@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yash Mehla <yashmehla688@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: replace msleep(10) with usleep_range()
Date: Tue,  3 Mar 2026 14:15:41 +0530
Message-ID: <20260303084541.29279-1-yashmehla688@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msleep() should not be used for delays shorter than 20 ms.
Replace msleep(10) with usleep_range(10000, 20000) and add
<linux/delay.h> for the declaration.

Signed-off-by: Yash Mehla <yashmehla688@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8ae..93a9e9672 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
+#include <linux/delay.h>
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
 #include <linux/align.h>
@@ -214,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 20000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.53.0

