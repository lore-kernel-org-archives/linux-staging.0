Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3124C2EC541
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403619; cv=none; b=AIRxdZSR3gaLBUoWKGYnPLY/qYFqMwU2hKwkG4Y+ofbxfsY+jpiCiIVJ79+kF4sOaStowrKH34cRMi1siTd5q6eA2IIPYEEJ89+1kVpxinomuqc9ZEf/g0G6E0EHmkSOGwjIJva/bG0CDDYwX5/0/4J5jQmfkLnlEQHJukDl1yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403619; c=relaxed/simple;
	bh=Tz0G8f6U3mXx0H3UAVJw3wBVN8HxmQhInzFl2xn00D4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxHmlA26F8IMnEgBuHgpM92gbRR4/zuRxMlNOxOJU0tYC2lxEehIaSY4EqzP1Hb4JusW7Bn4EbUXSppi1kbTcFlSjR5opSLDeRDGXQDAy6HRwxoAuGb1RyMSL1ekFhSluG2x+/qcllUbUHHleVdn5uMHmVPxCiBDl7DrZ7hDAms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b24wqyu2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b24wqyu2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297ec50477aso33494945ad.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403616; x=1764008416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjqzAiWwrsjclt01pIzrstO3S2VH3ET/FvdQWeF1I34=;
        b=b24wqyu26p5q0Gg9mbZYy+92knQU3b9ZQjh29pv4z23Ere70Xqk+EvybtFTduQ2plW
         8OIUlfLmzHPcFUJbaFX3V9H+bNqaMqiWq6zwHXa0x8E0tCH0p8QvrWbtyjGA/dcxD/QV
         aWC8jRSDKavCoEBocG5CLOcmoHW3VQOfs5XnM+7qFCysTsdXM27yLfF0gxEj8S48BQJC
         LPOyiBrBBHjmD0cvzemn4GrszIbRPTLHk5BinwdPjMr7MnRxVZHkhEw7hhQvjDf4w/zL
         KWPsmkRV4SJyY3SyieBNhRkhU42gzniRlBLwl0JLKfCjod9CgUMRas6JduZajzQIurU2
         ezig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403616; x=1764008416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjqzAiWwrsjclt01pIzrstO3S2VH3ET/FvdQWeF1I34=;
        b=kWtS4tG7mwVaGcIKIpNkVPJfdwcLMsZyRrUuhGzrtJ1ZZXaztJPCCT2eZUR3swo/Kx
         YL7XCMWji5/x31npoasEijGF7jqVbeO9B2BETKadsFkqpMzEs949u9+rOnMlt54kIovi
         NTnENdyxvE25S+Nk5PQ8s/ILY04UwTEmmnk0ioQ2sv2IU5usnDJbGtOcJEs+A4/nqz0x
         eHcNazfoImSbPrW2jQ4Iv5FI0Uqi2IJCHpADcMHCgi0cpyu0mqHmYTT7JcPktbPSguq/
         h7pGNljirdw3Nky70aTAxhC3SYjiIfevHF0YRuty/qJtewHIaPIzcUjjN1O/jUPl8tOf
         +cbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYrnxEfU1dTqySSzAIcpi8mmkJYjC8ZQLysZ743IDvp+8ksO3T+l1c1MPilq5h5dJSRLTM2UUhENPUnn91@lists.linux.dev
X-Gm-Message-State: AOJu0Yxxfo0DwGP/DTWrNdPW0eTtITcKoG5wAasWnOm/tNmU9zEQuWrg
	Pi9YOqm4icZ5UrfP4U/cY48or/heOhTs1B65EfnP89VyDRqEp1i+X1oijOX56g==
X-Gm-Gg: ASbGnctq10egcXwiFfhNQRcZRFka8daRj07x0fPnlRXCGvjCRJwfMX/C+BQxhJGhq3r
	cZM3mZwu2X6CqeAq/lmldgK9C/a7qlFSS7s2lHBxOKM7eTwK93+DuyeswNNJVj58DdRg18MDyNf
	0Di1CWENbrHFlY/GA1a8/lSaS7bkm7tfUqqnG/jUovK6w+9+6tq3ia8YWfFDZc9uqMcR5yRw0dR
	0bdGCWMtbrGdxjEbJXwKEvM0iwTHE5JqF4wZgma0nQUg1hdQFljckuW0dXta1tHZlpVYeuMtZ16
	l5KOADJIvJjShlpKiMc0nJje0gDG11dk2wEkE4XeccWSHTX1/9jYeq4TPFVfnYhTNWI5scro+kr
	vimp1tBFWKf/8lPt5hHW+wviW7eqrmHEUHsnPb0lItpCj1Ustglsn3wnfo2cZQqBUs4G6wy8sNC
	ZWxYsSAjj1bwhpmsN/pGODcdu2e35wNB1w8fg+MHra3QyrFXo=
X-Google-Smtp-Source: AGHT+IGNimAp9gYrPl/7sxgvmOA2TeakVUZuDDuPhX4tty8w/qcb119YFa07lwgYOGmZvI04rl3s+w==
X-Received: by 2002:a17:903:2990:b0:295:6117:c597 with SMTP id d9443c01a7336-299f54f6849mr3201775ad.5.1763403616359;
        Mon, 17 Nov 2025 10:20:16 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:16 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 07/13] staging: greybus: bootrom: remove obsolete FIXME around firmware filename logging
Date: Mon, 17 Nov 2025 23:48:12 +0530
Message-ID: <20251117181818.118139-8-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A historical FIXME suggested converting a dev_info() message to dev_dbg()
after all Greybus modules reported valid IDs. Greybus hardware is stable
today and the firmware filename is still useful to log at info level, so
remove the obsolete FIXME and keep the existing behaviour. Replace it with
a concise descriptive comment.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 156212301d58..8665be86dae6 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -165,10 +165,7 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
 		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
 		 intf->vendor_id, intf->product_id);
 
-	// FIXME:
-	// Turn to dev_dbg later after everyone has valid bootloaders with good
-	// ids, but leave this as dev_info for now to make it easier to track
-	// down "empty" vid/pid modules.
+	/* Log the firmware filename being requested */
 	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
 		 firmware_name);
 
-- 
2.51.0

