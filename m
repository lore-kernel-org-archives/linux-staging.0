Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26231436367
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786065; cv=none; b=d5mBFb5A4lPKRx+TVyK+meI83Nyk9LKBAoaNPj4PpYUgSGtPvrdJKrQUlLcOgTi3mtNGm1WqLsKzesRp3bGzBSQn/FqujfWEi5UyT0ElLL/zzCWeJPT3Xpd9DMs7pFWP0OQkccvQ9QoiYa2lypQsejGLErq2Fx447q10JptIWU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786065; c=relaxed/simple;
	bh=bGTJxYUhkdMuFVT0Yepk3qvMo6KRIoF5A1Hk9B3qPvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clDWbroBypm8VZANC+FZjcQ0Y1TANkf+AXdOvZ3Lh3vgOvj4Ph8Y8xbRBcHckYfK+FLkP8MafNbXkMHb/NqtDINUY6OzBCi5/BqaUgYzhKjG95iaiq0ZBgRH9nBEdaZPWLi64msi7G/pOyxklW/MP34mGE5TWfOuMaydHnG16So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2IYm8Qm; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2IYm8Qm"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so2865995a12.1
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 12:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785786062; x=1786390862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lb+dMcWMfms0fNLLWQ3HZFsBohDm1qBxYxzySJh/Nno=;
        b=c2IYm8Qm921sf4u/bsXJ8sVOSZQw/ktunjgium+a900iKSfKC9O9/BRJ1JBBao6LLM
         cH8BhWgakLaox/OUL32QhHNkQd3N6GhpqZ/b50XHssMbR+UTBSaN6PFRjvUEzXAIrMoc
         uFa1Cp4XZeC040zWuZNGi/NAEPxvybSi5rpZIe8HT65M9z/O44O4ZU3wB3XI8z3qtpjp
         xtbZZQt08n6Rzuek8X3fOXRbUk3lOTC3zVAYXQoJGCh2Pk67IStwZY3LwyMuFMtifPHS
         QRbFq+w73ziVHUyQFlXHgrSprGJP+He/nb537rzszMYOHFUwQiusuXYcHd/1pmL6khIT
         3QlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785786062; x=1786390862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lb+dMcWMfms0fNLLWQ3HZFsBohDm1qBxYxzySJh/Nno=;
        b=rCrhp9x/om9hoMpy1MaANKibBn+u63B6qusiKqv5Bl9Md+J6azze/6hacWRYAbSTFt
         /0qztfzafhj2j2ZaVLQqY1ghyyrIJsVFj4P17yIrhnYvA6vMz61Wj2ZpahRCmYgrbj9Y
         SUpJGUfRjkyjnvUE6KhIlgoRaO4Iw3zGw8kS5kw/U31CwmR30Zx/rxFDo0EiGp6U+34a
         +Usi+5i0jMYapz/pP+/xsMxokAlbv1YhWFfh8vatJ0ARAIuKbU2sTwafB7jmYdEkp35w
         XVOPpypXdeM2WuzmZP1BQw2S30xGUvqYY7hPyaI97KOvhzu8PXQAq+TDIuVR3GcDXCWT
         eghg==
X-Gm-Message-State: AOJu0YwLuoLkSclw0hIzPEN3t4KgojmaWx7vnnaHqG1HKjJyhlWQVqJa
	Z8pAIF0QuWGMX5BQzsb3FbTP5bxZrYquJIifvegJ91jlsix+CC8IpVlb
X-Gm-Gg: AR+sD1117jvUw7roui8Ck+UakNOeYDIhvJVl9Ur5qxbj7fUB2QYHAO0AJQI7URl1LcJ
	tL7RdpufJr/dRPgVqrsXewC74hGmH28awfW3Gyt+CmVqOpilEPyEAy4/rwXsx9h0ThzwC0vX6HQ
	QP58qh6Nc8fW1CXXo4B8UnyTWbYWSwMW9Uq8OyApUT79fU6eHqp+RGxTuRToRhCb0yMjCfDvaO/
	OojJ6Tpp5FGLo3hfaBdfgGqy5MAnNXMaXnnKtnO7npT9GoP5UIwzPFC+O0gdm6T3j/fWNnQp5aO
	u+jaw4g1yl8GLD3Ilwj80uxBnZ+FLXlp3WxQvXJ0Vij834rB8j6BIxL6sjyBlfKSOh+1mI2N5hV
	RoqY87aviIIfyV4sfZ6M7bCzXutdix/baoshOTCX0oBrPXtEJV9zc/xTfiGWn96tW/TQC89NRC3
	9m02e4F1mRIEsnTGZ5ctoUwiFiF8Nf41VKFnPtG6+Oaji595cqiHUKT4ZvT2ZafkFU+JUDAnExz
	z7CfUnX
X-Received: by 2002:a05:6a21:7d0c:b0:3bf:e24e:3afe with SMTP id adf61e73a8af0-3c92a836be3mr11724275637.43.1785786062228;
        Mon, 03 Aug 2026 12:41:02 -0700 (PDT)
Received: from Vicious.localdomain ([106.211.56.189])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm40835326eec.8.2026.08.03.12.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:41:00 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 2/3] staging: media: av7110: remove unnecessary parentheses from return
Date: Mon,  3 Aug 2026 19:40:43 +0000
Message-ID: <20260803194043.11554-1-work.ashmitkumar@gmail.com>
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
 drivers/staging/media/av7110/sp8870.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c03..83c6ee305d6 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -92,7 +92,7 @@ static int sp8870_readreg(struct sp8870_state *state, u16 reg)
 		return -1;
 	}
 
-	return (b1[0] << 8 | b1[1]);
+	return b1[0] << 8 | b1[1];
 }
 
 static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmware *fw)
@@ -167,7 +167,7 @@ static void sp8870_microcontroller_start(struct sp8870_state *state)
 
 static int sp8870_read_data_valid_signal(struct sp8870_state *state)
 {
-	return (sp8870_readreg(state, 0x0D02) > 0);
+	return sp8870_readreg(state, 0x0D02) > 0;
 }
 
 static int configure_reg0xc05(struct dtv_frontend_properties *p, u16 *reg0xc05)
-- 
2.43.0

