Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966261DF25F
	for <linux-staging@lists.linux.dev>; Sat, 10 Jan 2026 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768077893; cv=none; b=cdR3y5Wka3vjAI96EsjVReg01gipN44kUGMUJREySlBeqrpjjU6dwJSiiiuR71CNLlX8EkzYlhsD8aR6iadHv9e2eLNigsu1tIq0psvetOIXX7p/uUlsUeINwc4HqjiMJy98YzgMs7KnxkQt6S3cT0Bbh/dIe6bYTHR9jNqPFKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768077893; c=relaxed/simple;
	bh=KsUCQ1bG75QeFB62diHGm6d7KuFcTKXGjoLTyKleix0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s3OGYRAgpRzxiGEuQ93bc7Ro1ibCFUW7LMd5/kjlV8CRqi2xEijsFw58B9Ge7G19cl+gl+lNgzf1sgTK76j+LTMfI3+L4BUcirxcVGgjcexpjcZUhB1JdDYSfWeyda9PM4C/c6o0N5Oeb1y9sRdrPU57V5+ijHk0fnc9y+jiLs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0GFOcI7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0GFOcI7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso47835705e9.3
        for <linux-staging@lists.linux.dev>; Sat, 10 Jan 2026 12:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768077891; x=1768682691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2YqNY1RoLEuIqEnXS5mkFxo7nluNq9znwUtvM0NY4IY=;
        b=L0GFOcI74voD6E5fXoqgY8T3xY/35I+/8btmmok0J2Buv333xW9crWTBSeinuMzJ5v
         hzSh0ahV0mtIjNfPhfohFWNszcgZ7UvbYoGvheFJ6TnfzY/sbmI4j38E8e2+KHM6XJwm
         B1+LLbIgN7MNG88YSRJt68z27eYjGlcLSTsHh596p3lLQs+Dch+miGO1o/QwvCYZqpYR
         2EGJcJqlte0CF3X7cI9w3qwaTwnvfxJnf9vBcOUpe0iStBOW+j6D04eAcSHEtqUFFE7E
         PuWZnVqHNwsJb6HF6oo42WmjbARo2K7DNuzM7SlmMdLGlYmttTBdolAPAXw5zMchNN+y
         icVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768077891; x=1768682691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YqNY1RoLEuIqEnXS5mkFxo7nluNq9znwUtvM0NY4IY=;
        b=AgnNlPyAbDjpb+zoubps5eOqn1FfjatyOaPPcbr+QdkpOxYfinreZkOjxK6u0pdsxX
         y5A8keTAs5gVk1QXPpCiXOYvv44I75PBnk5tbYV+2Z3VI92ayT0b8BXTfb0j+lLGSie3
         6X3j63ddhcW0vIJXYxjr73Ips9W8Ayui7hcZjxSlgyCcBFOebIh1Ab3s1ryJkEjV6prn
         h4HVkvoYXGM7FMdF1mYJ8nQ8cFPDuXu7RG/c0pqRBYWuZPKvWMz03MHe5Csq5Oi3edAa
         EqSGrgK6gU8MgO3TTkHSgjlugI434mH46Vp5ktUzhh8eLr4wmkor8uwcxm+2SdJ3Qwx9
         2JfQ==
X-Gm-Message-State: AOJu0YwivQp/DmgSN0xFciFTan3npNWadf/EQ29w8qhqp/SfH37pM9QZ
	v5BB57DzBV53R0r3Kyk5vQTQQuhhBmxfGXWswPJs6DCqSg0cWb/W/9Du
X-Gm-Gg: AY/fxX5kBRFLuZFhbzhCnqMTmnVh6R43KB60/plEpHgv3hQQuqygjdhkA8auQ1Whz32
	nTNSBdvn6uT/ZMMT3zLSDMjSRo4Qw5H49gmxgQAeaypnmezebMZeHdMuT5g0n95ai5unvi9yyLU
	+Sukj8hDrac2GnnIxGql1IpNMY25CI4DM25F/PFumBVcLFclXgDS+EdmKb26Xvrdou4MLHWnSX6
	1P/ClQErLEMVucR7enm4qTQEtVPTtoCMSDt+Wuc1ykgLR+U99VFJMBb5IWFIjS2C1aCpCgOamGZ
	wmyTC7XgpbPLLVnlN5AcC8DP1gP/5NLL9DfqkHKWG8GKr8VHP2TxIqkMMRyY8EPjHZqkjQ0X+3x
	R4hd5KSh1zPBKNnhcOls/vClg88J4LkMuTGKiPrFKn1f/4T3UoNr9XT5BVyJkEfZG9tSaHeYDi3
	b0Eel9
X-Google-Smtp-Source: AGHT+IG0S8YVjZ1QSlr/1udK/0Q5cDLV0pVDe8hLmikYGpeNcdLyNucQfaa+oLlv7nSBJJR6n0wNow==
X-Received: by 2002:a05:600c:3555:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-47d84b3b692mr180225635e9.31.1768077890841;
        Sat, 10 Jan 2026 12:44:50 -0800 (PST)
Received: from Victus ([45.11.200.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d86372c92sm102703555e9.0.2026.01.10.12.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 12:44:50 -0800 (PST)
From: =?UTF-8?q?I=C5=9F=C4=B1khan=20I=C5=9EIK?= <isikhan2005@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?I=C5=9F=C4=B1khan=20I=C5=9EIK?= <isikhan2005@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Date: Sat, 10 Jan 2026 23:44:45 +0300
Message-ID: <20260110204445.15571-1-isikhan2005@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The checkpatch script flags a warning that msleep < 20ms can sleep
for longer than expected.

Replace msleep(10) with usleep_range(10000, 11000) to ensure
more precise delay handling.

Signed-off-by: Işıkhan IŞIK <isikhan2005@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..97c923015279 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -215,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 11000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.52.0

