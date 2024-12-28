Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7690678289
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367174; cv=none; b=DrjwqHHmKihH02iW6qgJ6lzE7GkMv858pTGh5w1q2uc7/mZZgvgyVVrlRj3p73FaSi93SJH4qtBIdlCyqc6uKlZrljRCfIFsIza7KTf2Gw92LWfcITCfqIaj6IjJyfPNQc130zLgK59xGyr8mM8XrQpcEiC70MuUXMj/Aye/bIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367174; c=relaxed/simple;
	bh=lr1AwV+7ytQ+p13PvcJ10i/P67gCpy/yiNxZKQ3zv2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gQr3+UYRqc8B+jR878zdBRotGnklXUiFTmqN1i2XsJnS0uv2ZtOv7vUXQJLqOpA9hp2oEautnONjQDXbbvS84FpZXyn1D706K9b1a4QDYXhRyOSdzXIU+YUIcnzzFcHVOgacxIsbAHjWg1auPi/+TOeFRvGlOvZSkALHwiC7Wr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fICZP7//; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fICZP7//"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2efdaa02378so1545619a91.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367173; x=1735971973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqyLbhN32nQLTtGJ7VORBdyPFF/pEaWIZ7FPx+DyLKc=;
        b=fICZP7//fpS/LMrE0lgkLMi0e5qxnp9XneEmgy9GRh42dxBx30Zc8WDXft2f753TiY
         mdKoDgcj2v94HufpRk5eLwNJwO+vE6G7fqHAgAyQ7ar3ygDbUvYGzSbz9nIu5YCUsgaZ
         jru8nUXWdy3wBxHzGIP0p8Pmxuc1gUdk5CESizmwe90oM/ARZ8Q++ophTyOlluyMpTqk
         QrTHwVjS1aZ4yPL55UKjXxgNfBdX8SCbXLqjDiPS2bAbEeBAlQBdqi0YaKsERgC/nHoN
         yiN6WeVICu1W2kJqFeziI327zh/F8GmKSt43Nm8/i6zs998cVEhceVWAtVcB8q6cq6pH
         al7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367173; x=1735971973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqyLbhN32nQLTtGJ7VORBdyPFF/pEaWIZ7FPx+DyLKc=;
        b=bGdPU0Mc3y9/utWfQpx+Cm2MkiVRyd9Eiidw4eChnivelrwfWzgDW6IgWF3hwV7mg4
         c1x8Wo/w59qL0V8B7xJvSrDFnalMNwunQ3oXm66YU0GpOl3a++WQRaNqh0ONl1PMKLqM
         S84a3WuQkyQvWvG+DGA+yfD+fGsJiY0rSx3yfB6CHOhGm0fzAD2wD1z/AY5WKe+0GYKg
         +kuTVUNtYP35f7IqQQFglrT4ARjqFyCYXYBRMHbRGssQOORSAIBStAsUAavKl7ORCHEV
         iebu7wlqcVVzTC/tyZNEdebrCOZw58loa3w1PRgMO8flvijsba5lWzVyekL9Kr7PJzUY
         YcCw==
X-Forwarded-Encrypted: i=1; AJvYcCXonoyLDmZJglljQk+g5XmzsP+s8yJjSjR/p3gMZo5cl6S2GcwBBsWWyC47PYZOkuGK7GA9QnYOPEFfcoMB@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7K+y5V+ozM937ELa0BO45PY5Z8eoQ2DV1iDc5M7vkGoYqh+K+
	ciFMnO7kjy9hVhwqXgeZjOQ3XCv8czIR9pHdZXy0fcVKog/9tRAK
X-Gm-Gg: ASbGncu7nOCkzgVFtQv3EdZCRnjtVZoGNqbMLgbdmzOuRN6HuoQecAatRQvLDZuic9+
	kmwC98zsLTWF/sLO6/62gQxT257vnzdorghh9t3cSnMa13sPUvfcHeT2C754+qtCsjkRLJbVY1f
	KYwFbcp4poV35v7tPdrPRDr3sMrYA1nqpDMN/SixPuWQL47/jPmjeEHr2xe+4IC660nGZ5gKSnk
	UaQIw5ooc+o2++D0gtnigxmoFj9dGUQF8R2lUlijRLdjxQ3T26bm0c=
X-Google-Smtp-Source: AGHT+IEIE8ByWvqP1tW47xaUPQySLKKN79YMSCGqMjqOaa9ryA4Thj/5iuLHj+xqUYu9x6pwfCtEYQ==
X-Received: by 2002:a17:90b:2cc7:b0:2ef:93:154e with SMTP id 98e67ed59e1d1-2f452eac183mr16440875a91.5.1735367172856;
        Fri, 27 Dec 2024 22:26:12 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:26:12 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 12/15] staging: gpib: lpvo_usb: Return error value from gpib_register_driver()
Date: Sat, 28 Dec 2024 11:38:00 +0530
Message-Id: <20241228060800.107653-13-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241228060800.107653-1-niharchaithanya@gmail.com>
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail and does not return an
error value if it fails.

Return the error value if gpib_register_driver() fails.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 796c3a5be545..839e89615214 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1181,7 +1181,11 @@ static int usb_gpib_init_module(struct usb_interface *interface)
 		return rv;
 
 	if (!assigned_usb_minors) {
-		gpib_register_driver(&usb_gpib_interface, THIS_MODULE);
+		rv = gpib_register_driver(&usb_gpib_interface, THIS_MODULE);
+		if (rv) {
+			pr_err("lpvo_usb_gpib: gpib_register_driver failed\n");
+			goto exit;
+		}
 	} else {
 		/* check if minor is already registered - maybe useless, but if
 		 *  it happens the code is inconsistent somewhere
-- 
2.34.1

