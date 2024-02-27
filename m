Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BE1552FD
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071932; cv=none; b=qXVvGvvR1QlKjJvqiYhPu6lEXBMJY52ADU6N8rS3TxL63irkSsxA5GX72pqDtFItLB3NVbxDy30W1MQnhLlo6X0TVBF/lUlYXpNMID7XPrld/0AfZ1F46v9I2jQGX4nEiYav7MPa4+Pb8Oydg0xPOXi3cNYH5rFgFyj98e+Gqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071932; c=relaxed/simple;
	bh=fmnSLnIUWlgp5ur85n+HDFL+jupuhUG/KRlYbWXGjS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gujgkEbEvDQ2u13Zrw91SwBFCU5x4fBhPdqGl+prd0Ld9lxM4uy34wMa/5QRmLeANbdBs6gEymhd3tH80cOe0KaJgWNcNP9NjDYuqT6XY09KgGII726vkPsIvArbSyNvrXjst1sdaCuS5OJmQYMDuQ1Totdli+xTjV9+Hu2xDhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0WZAMTF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0WZAMTF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-412a882bd4eso16227885e9.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071929; x=1709676729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByFJ4T1AQt6fR81lqN9Fb0sA+BvqHSN66dpmEs3Guqc=;
        b=a0WZAMTFRq6JfjiLYBTSezIZuOqhJB2nItrh5DCuSeraWd8Ytrr4RxcTi8F28k/cLW
         QrVBgkEVxgVWkL1hnecI7BU6TmSFnSfheh73VO/iqv0BnSfgZHStfSuZPW9z+5xi5Dtw
         tEzkxsQDk84qKYWqGI/RRkb1bwmB6y3N0u9rRmvarEnizj5J99PdPLIBABZcJF3LBOEz
         +zyRgDwIhZOvg8VasXApwUbpThKFmo3PnrdBu+KfAqGVoEpzlcxq3I6ijvwD6rv8A+mG
         OW97lZJ0ttFS6Lp+qSkfJNj7Hm/8JvFfAi9cUeHApn2wrouvrnHmvxy6M58xPanJszHw
         kpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071929; x=1709676729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByFJ4T1AQt6fR81lqN9Fb0sA+BvqHSN66dpmEs3Guqc=;
        b=tmSVG+8LVywvEeE+NeDO2ZLiyK1zW/ecnX6v/vSaEDIib1dx58q0c45SjuVzl47Mhl
         0VeMVjHUOFBNnhWeHRNh8iTzxogPBZHt0X0/ysZ2q1JraLh33JLI89RiWfWfk/OVC74m
         77GCnsZkaYXXOXbeKxKHQlv9ByNDnyar7L8IeYf7NOL/7YRhJG8EWbCFg5azBERQC2e2
         jKQ1wEM3ktEtC5dpMkeoMRR9tjzDL20rR4PFBNqZX/XuiojU0YmBv22dO+f91y6tVnbK
         OEohwRUXmmtAq9nLthRkTPdPUuKcAIznWIBNjv+USbqd9kBPg6GNF4BU3OH2qLh9v+Ir
         kSpA==
X-Gm-Message-State: AOJu0Yw6S9Vizn7nSAWhuR/CHd+T6ludWtapcg0q2qXR6QSiyu8u1zZJ
	qzPQtC/j6C1In9BWLMCDkjTvc8S5iNqZW31nz5cRBOsgYNFY1j3x
X-Google-Smtp-Source: AGHT+IHMmJVD4LN67PcarP83AwzBhWjbWB/PCHvqO5lApmrXQwqa2moqO0MgtL0r6vTnezo7LI9m1w==
X-Received: by 2002:adf:c6c8:0:b0:33d:f3c5:c793 with SMTP id c8-20020adfc6c8000000b0033df3c5c793mr1801355wrh.16.1709071929418;
        Tue, 27 Feb 2024 14:12:09 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id o8-20020a056000010800b0033d202abf01sm12415560wrx.28.2024.02.27.14.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:12:08 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] staging: pi433: Remove a duplicated F_OSC define
Date: Wed, 28 Feb 2024 00:12:01 +0200
Message-Id: <20240227221204.534131-3-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227221204.534131-1-ikobh7@gmail.com>
References: <20240227221204.534131-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

F_OSC is already defined & only used by rf69.c source file.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/rf69.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index 78fa0b8bab8b..52e43a909b03 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -12,7 +12,6 @@
 #include "rf69_registers.h"
 
 /* NOTE: Modifying FREQUENCY value impacts CE certification */
-#define F_OSC		32000000	/* Hz */
 #define FREQUENCY	433920000	/* Hz */
 #define FIFO_SIZE	66		/* bytes */
 #define FIFO_THRESHOLD	15		/* bytes */
-- 
2.34.1

