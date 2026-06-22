Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA9363C7F
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782122228; cv=none; b=tAk/Q+YKafBF9Xhli5gMTos3HrgMUoMjSUg1LOAPYwVBfsWMXLYlc0VdYccPmiWeOvkf+Avq8KrFJJUXvJjeTrQ+jhZK2DCyGN8cZkw9ISOCtVmDlxmSaCbv+fpAhHdH+XfWgLQZvmybwY/+14A0kkLfhtTssD9nPOKKq/Mwrqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782122228; c=relaxed/simple;
	bh=mdzVDIRhUQKBLk9vhKk6TTtyPx4AavaS33O0MMPcrj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L0Rprz0jCc9PKCGID8eOrw1oJrrZCFNJYTmiZ0eJ2c1HGEeOPvvNECRkUoehULOW2mvQZezX+qaornNNytsPV+fNI+4X142p0hFZfpJESX9R5ljlm/Dqd4bBURA7iy+tAY7wXOyVMnq5yiEt0RRbhL0M/Rj5k3QdMYLXfzce9xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWZp1G68; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWZp1G68"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-8423f236418so2057570b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782122225; x=1782727025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4MAr6k1es3NgXplGwowYu1xcM56uRuzE0U4pWPBeuqs=;
        b=BWZp1G68bZGmzd3OufzO0LmWkbyUVMGmYcFD+R23UCJxkHUByICTqdXYllsMpv/ys0
         eUHSUp+dvZ4DBwUiVY+JrQp5H+KYXh/Tj9Nm4ZMc6F99WWhFMnYB7lVNrqMBTRDDrMtg
         /7qvk21xF0nxQ2z6ymq5lvq3FcQDVFYWEGzIuKKy0iSn8HPhS7TcvJu9n2SnY5X6yBiS
         iow/AWkOjWY8zJVQQ576PCf47PSJZhUgiZHrCCWtsoCcblu+gfuWase81+dW8xii38go
         49xYxFX4W9cJ8/+XByasMnQmWerJ9sQNOWRooxjicQSETGlladhcze38Pn7PsmYk/5Zc
         +3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782122225; x=1782727025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MAr6k1es3NgXplGwowYu1xcM56uRuzE0U4pWPBeuqs=;
        b=ZspQm4Xy6guee8t/M25M72ABn7oQ/4Sx9ngJapQWmRlP/8Na4tCLACAvqsKn212wHy
         wzkPydrycGQrY4RV06f3vdADuQ0VnGwE4eTWhDdfDLHNDnbgXa1BTieSSBGwhT5qRFh0
         AYD43WrD9HOIkptKMbVlBb00hDlmKmvYeoTPu0piA3a3qB0JReSwSD6gJDBdYkEcgSuL
         +NMi5W8BHRGlDKKMRhaPsYehEtOZ0b3pY0avsB6ZPFj3QVO/srd91iyP3BZfmhS28iZY
         ecis02fAxP0D0UsFZbsS5l0LVpDWGHhiKbzU6OKxZRXWXFir3Jcmc9JmTUXUwomrLfJL
         mGpQ==
X-Gm-Message-State: AOJu0Yy5BObbFHg7meXyu8eDS/D7obP+m/Vhc9odcEw+qmKGsUuPKF15
	xwI50T6DU4QB7/YYISnUogv3zmvvtxAQf5GEpcIrwjU3EgwHFZl+EY37
X-Gm-Gg: AfdE7cmnKx8rNOmCfYwhQaOPiICaTb+nJVZdfO3PoBhDkL0KLyhGbkbNcZmgDBsF5AU
	1qM5TnXer5mY+lZFrtKO2Gh1ESm971INi4DgSt+oOZT0GsS4MIO/yWnl5Mk7xKyq3/pFDXbkeUh
	RYSkeYmzS1e1phmV9IkdhJ7eER+F0XF2XOVee2BUrFfpiesqDbW7f+JGAfzffRoD6FJNTzPDv/F
	jBjExoq68Msa1f5hjR5OKL6wpPN2R0ikGqgabGJNVQLTbwcAt9/BgQZhTQ84qbhtoWyc1bAHAj2
	LCgEE7RvAtqvnYUzVdwu8smaSi1ZvO93HP3oN9UQOTW1A8bu+dOTaM5NelZfyRn1iTJix/geqSy
	XY2aYp2NoNhgCHDowP6nCt8Kts3/wjbBjLKhWOprEA+7MYbEj1b9+u3X/ooJSs01t2MAtmG4Bgs
	Yp0WHUyk6IcM+D3LlKr1Bh4jNMlDx5B1vGEfsuzlTNLT8BcRlmfs77KThCu6f29YI=
X-Received: by 2002:a05:6a00:1889:b0:842:732c:5687 with SMTP id d2e1a72fcca58-8455088dc90mr14297744b3a.22.1782122225237;
        Mon, 22 Jun 2026 02:57:05 -0700 (PDT)
Received: from localhost.localdomain ([2408:8362:1ec6:4980:1a3c:b7ff:fef1:8b0f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8d13dsm6990118b3a.23.2026.06.22.02.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:57:04 -0700 (PDT)
From: Bruce Ou <oubruce1234@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruce Ou <oubruce1234@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix CamelCase warning for bAllow
Date: Mon, 22 Jun 2026 17:52:36 +0800
Message-ID: <20260622095236.10932-1-oubruce1234@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25e..c23cf4216 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -299,12 +299,12 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
-	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
+	u8 allow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
 
 	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
-		bAllow = true;
+		allow = true;
 
-	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
+	if ((!pcmdpriv->padapter->hw_init_completed && !allow) ||
 	    !atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
 		return _FAIL;
 
-- 
2.43.0

