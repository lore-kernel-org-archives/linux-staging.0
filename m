Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8974E153509
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071852; cv=none; b=TmhXEJLtfdEJgk0xrIRwChiGJt72NOFbhtP8HTlWyue7JHjn1dlaMLS0XB4DukU9qU33nGgceFrWj4gOXhmb7T1cQY801EtZEnTVA5h8rX6jO9TQeDbDC8JBV1KI+wl8/Dl4B3ASKMe6CzUovJS0bOtjuizHd5wkrW1quJWVQcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071852; c=relaxed/simple;
	bh=fmnSLnIUWlgp5ur85n+HDFL+jupuhUG/KRlYbWXGjS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SDLN08ObuFcdt4rkBqO2hx1RNE3x0ygz/2gDpPRapZuCA4Ps02DDpqziZnTgPmvtpLE1FIM8v6dbOx6aKp/ALsJemCKxOCCf78pZo36EEaz0ewS/9Hb55OgBdB9EbwT6vIaadIdecZH8SgNGiHt+9VFb6LkOIJ9XEtF05RCsoVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWm5Hrdo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWm5Hrdo"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33d8739ddd4so3560576f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071849; x=1709676649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByFJ4T1AQt6fR81lqN9Fb0sA+BvqHSN66dpmEs3Guqc=;
        b=DWm5Hrdo5ErGw5HNxP0wxa3vFcMFbN/agBYLETj1RGhhYDaJ/Qof3k+FKB9DdznJCu
         t5XTQbq3OHxKRaYvijPIPKth1Plu5P1Gkhasi8IRF/1iQ3hsFH2jefceT8PfkVEgOT8F
         aefTgK7v0tIGaukAPmW+ojWIf+skiUoXLlsRTnpZyi2yjv1LJpO5Kuk+0R5po3QISUs1
         uLKpUeX8trNd60BwAxMwPbwu14fqu6Ab7UYqDkLRuKCfwXKRZPeZXjyQkVV3VlJrasEM
         cazeLtT3hctV9DCvEECfd0Qogwfu57DqQOSrrSNq2x/Su/cmDTChmF9+GorKrZQo6zEI
         xBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071849; x=1709676649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByFJ4T1AQt6fR81lqN9Fb0sA+BvqHSN66dpmEs3Guqc=;
        b=FtqPB0ObnVcYOhpfQgoJcMJ5fvNfwMuH+PhDupaPIlG3MaBjEWhgsNLfsjNLXTM+yY
         yP333SZ1c/y1rnUBn2ApcbjmA6Ya1v22t8PZ0BfoZNS36CcFuiNulJ16tN1gwETWoKhE
         3Y7Z0Lqh53jleSMSOJkwPxLNSVpgmu3BfxDRg4q81w6NvgJs7E7CiIZzUJm2oR+m6mTX
         OHgsBhLSS+xUrnUr7eeDUCuJUnGNxNCYZw3W7VLp27tmfyZJqxy8zKG1NUQY4ZG8r8vw
         IJj2OrI5ZtyJ1vm1YSXixXS41PoQCgw5uwPz2C79PdjOT8iVyMZe3WWkV+nxH2J3vSDJ
         ZZ5A==
X-Gm-Message-State: AOJu0YyItuFHwhxzanCFZPl4hhCJy4gJZpuCzhSY9T3xiCPzWI/HnkmB
	ja8NWJhZkiiyukfu4GsItFQ2l7y3Iy4ZLNtRCJwIMkB1dp9b79Qf
X-Google-Smtp-Source: AGHT+IHhgG30hZUhtNXvT7fOr/dUFPR5xQlfvSn7RcabUJUOBunmKVm/n++2BRnYv86YNiIeupq5gg==
X-Received: by 2002:adf:e7c1:0:b0:33d:4c3d:2975 with SMTP id e1-20020adfe7c1000000b0033d4c3d2975mr8642928wrn.32.1709071848925;
        Tue, 27 Feb 2024 14:10:48 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id q2-20020adfab02000000b0033cf5094fcesm12562384wrc.36.2024.02.27.14.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:10:48 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] staging: pi433: Remove a duplicated F_OSC define
Date: Wed, 28 Feb 2024 00:10:40 +0200
Message-Id: <20240227221043.532938-3-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227221043.532938-1-ikobh7@gmail.com>
References: <20240227221043.532938-1-ikobh7@gmail.com>
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

