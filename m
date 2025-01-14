Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CA5236ED6
	for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736857069; cv=none; b=VQVk/4SviLpc922MXu5+YvwtdhkoZ02Y157ODASn/WdGuNizSHzm1eI2/u3yBmVWXoSZAhhM7amZ0rrdj9bHs/iYJhFwi0KTALlPg9VNkdsdR7hWCIMKwz9TcSVGJeXKOzrmwIMzRoixC4eOHMyr9QAUOzKHs9GaeioPImfeAz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736857069; c=relaxed/simple;
	bh=jr7xvBLbTs8AXjBGnW+02Qpzmu2Uy/T5jd3rSX6IdqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgQW0mkPM16FAqzwhGtsuLQrBUf8nTA+YEYEe0uLkZtBId4UgYTkbBG2MEOH4+m2yWM/0TnyBO6he4ohatIn0jdeRttb58P6z+FVS47blzJkJCQLXO0fcagS04ABKgitJuw525B+H44T8dNIsI6UHioebfdtZ1rfhmRgzwmtHZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxKPWtgM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxKPWtgM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21634338cfdso83555735ad.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 04:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736857067; x=1737461867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3pW8jVmS4VFugoY7GZdOibaKGOjCoq74IGX2A2eAmOE=;
        b=fxKPWtgMngHjDnUA6WN/ElUTzCFcqsBTadX29OjVSjDpKhq/E4zI+GeFv9u04IPxTJ
         PnKj1Y6ERtKNy2QVg5zlpsZv2dfl/qtBjlJ6zq4jO1P9l+dPKCcJu1AK7wlREqhSMGZG
         ZYxeBzQFAzCxR+AYaMcquY1VmAK+bDg66TE9BDPX6uX7JZIvXUcyR8GXigDhyIM0BW+J
         h8/srDBcdM+SLdzmV1hsSJzx2SzlZFGFxMLSmhxRQXsNqSdmeUq4+FuG3kBjI202KDWU
         jiwjADc4bIPFzT5o2cGOkDcDtxA20FxIFMc1qRjdVUqwSaL+7E+GBf8sWszd+oqM/F3r
         oiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736857067; x=1737461867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pW8jVmS4VFugoY7GZdOibaKGOjCoq74IGX2A2eAmOE=;
        b=ltJzgMNcACHWmAm6/r9BH+fsG5U60dpzjJZY+edD462y5h63AI5ljKSt+aVOlmR23B
         syVZ0BhNRtIvRmfVyXts8Zixe/lm6F1DQ13sDXIX+gHRbpHJG7slxqvPNI+kLTQR4jUt
         caOPtpTf9DcW5aqk693bjEkhQs4rG9TT1h2EC3gu6zRzbS8NPSXfZtbNVoq0yQkbZagx
         Xpt12bCHq1KfzTBTy0dETtfivOyMpyK7hqcNuA0q3DnBBzhImihew7rw+JSjBW85MP/H
         7upXxqCrFHirMQubDjzCLJYASWnYj+YAmOTJgyDLowYcsEt0l2VwFS6JHTI/K35q2Uie
         BbGw==
X-Gm-Message-State: AOJu0YwyBTZlXnqZWop4Q7PQC9wm8C7DZTUw8Z3MHuUNSOp28xR1YgqG
	RubX/ZWdrkClpz74+4l+MRLhbSN0EH9GAmiPlwtUT3j4/p/LEHey
X-Gm-Gg: ASbGnct3wv6fIRyTWvNjZ63zC/JtehmVFH99A0PGkg+xx161MFfQPbG/RBHqCWxPXZz
	frvjuOWzUvla3EmbWLFXlo1xr8xJCv/r1bvbRKAbBA8I9cTkeqrYz/2dJKBSJ2Qk992s3FxFgzc
	dvE48dmsuqMODucRsbTtbxCqO0X4EQLu21B7cqGE8150NSg5fHKhSdRbPQkHgTDkBgeu+9xB96V
	EB2kSiW92crKFCQ992KrmtjkE28NIg+ZtVAXg4VyW13lEz9lghUvLhW1Vk8RzuH04s=
X-Google-Smtp-Source: AGHT+IEXSVP5JdT0mPrqZQGlS8F2kqeWsIlMbXul9RfUFATL4tYtk0TbUE4IaUit2bl0zOCf6pycgw==
X-Received: by 2002:a17:902:c408:b0:21a:8839:4f4d with SMTP id d9443c01a7336-21a88395835mr283546495ad.6.1736857067443;
        Tue, 14 Jan 2025 04:17:47 -0800 (PST)
Received: from ajithpv-Ubuntu.. ([103.16.71.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f217d56sm66747995ad.141.2025.01.14.04.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:17:47 -0800 (PST)
From: Ajith P V <ajithpv.linux@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ajith P V <ajithpv.linux@gmail.com>
Subject: [PATCH] staging: gpib: fix prefixing 0x with decimal output
Date: Tue, 14 Jan 2025 17:46:56 +0530
Message-ID: <20250114121656.30577-1-ajithpv.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* pr_err() of request_region() in cb7210 uses 0x%u which is defective.
* The config->ibbase is of u32 and correct prefix is 0x%x.
* This error reported by checkpatch with below message:
  ERROR: Prefixing 0x with decimal output is defective

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index e5436f55c630..2e7679511ee9 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1041,7 +1041,7 @@ int cb_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	cb_priv = board->private_data;
 	nec_priv = &cb_priv->nec7210_priv;
 	if (request_region(config->ibbase, cb7210_iosize, "cb7210") == 0) {
-		pr_err("gpib: ioports starting at 0x%u are already in use\n", config->ibbase);
+		pr_err("gpib: ioports starting at 0x%x are already in use\n", config->ibbase);
 		return -EIO;
 	}
 	nec_priv->iobase = config->ibbase;
-- 
2.43.0

