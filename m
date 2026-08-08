Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AEF35C68F
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 17:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786209203; cv=none; b=qDumMAUWz00WGvyRDgU3wYA3hDtIf/823KDhOEIDyswRgJOFPcIR2A99xBi64cSjrumYSExvzHfrWuRBKKD5NOKTwgO31m93BCpgGnlNZBfxGwbokxfSOhQISBSE9NuXLM+y+7pH99q1pxD9eGnhDtwJSeen45Z1v+a8tPOEcQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786209203; c=relaxed/simple;
	bh=pBwq3z3BHT8AWEiwJrfn2159aekzAL7GE1Rsw0423wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4tuFS0pY6hzx/wvGIFwnS7o1cbUZ+uAEYrOuKruCQrlmoZ5j1RphNBCsopNIhHAtZ0mKO25eZ6v55yENKBBLrUC4L2mKQ/zEW5YJJN/uMtdyyLgtE2S6ll2Bruf7jGUnoyL7UjcggWTN5G0OgJDHWGyv/VvxWTB7dYnGob0ypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFGzX7nI; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFGzX7nI"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so388724a12.2
        for <linux-staging@lists.linux.dev>; Sat, 08 Aug 2026 10:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786209202; x=1786814002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbv8vbeQ/dPx02vOemWEfUHWsL9q2YkCKVscJeRKh68=;
        b=DFGzX7nIGXT+sC7C45UUG59l1xZq3gHgOxFUlJaLUsY0yFpw34kM13QpMFVOzvMBJ/
         KIH9l9k5y95Q6HSW+F6L7CuFLwdfGrWs01KsHp0TQfePnImNox4sQ89wh2CyLFsqqc5A
         u52jAhHFcHWSo/ZXN7Nn8Fg8tTWc4etcZS8lfDzJGePQpPT2B3sYRL3HiAceapA3nYhx
         a5IW1hSmGLsRxK7q4sYVMM6NypVJGTl0yEFPUxtEC0AeZdWKQ9NRSC0730itYHmLyZU0
         L2I9MRS43ouQiK2ewZZI6hnwj65TJpWf0yVrpanrrqyPZMpv28UVQGouc+71kX40U/Lu
         ynsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786209202; x=1786814002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbv8vbeQ/dPx02vOemWEfUHWsL9q2YkCKVscJeRKh68=;
        b=XlPFaR7ot1Fu4yi64AWpVSP11g4UOWEkZeY/oEzoVKdHo1VMBPSshI12qmLPc0Lugn
         BgLmRq66z2poxPSTJjjrdWbw6SCfsohXh8HnnPZpzhli1x/WSuasvQ0+8hkt7feKxvlk
         C+Rargm0tvI+LykBpw2yjvNnUVxgTH9bwYOugS4hraL4tngYyW87auMFcEWUAQNbIMHH
         vCNOOCkcf09LNBwS/liwLlB0INoKPXfg4kbiofUmUiYYcaVXZJ30zDlg1sYQFIi4qVih
         9AX/Cacd9LPMQLlHWjAeSsHTcvJsfXe5ryAsak3BNMW5aQDAZ09gZOzKz3dOK/ZA6uIq
         BAfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqtra9L4anpGxcdnWLxNavT/6Luh8xIW+TUjOfFJN3swVXI1LQ172fXtkDSLq6kG2JZfbP6kgFI9kF+pVb3@lists.linux.dev
X-Gm-Message-State: AOJu0YxIbmOSfCxXmOwwhnPGteXrGhKz1aXK/NMQXkTb94odnxN0tAAS
	c1Zx7aiUWczBj0xcuUBkknmRjAgUDxE17sSKU04uGTQDOupc4Iilr49Xwn2ZrQD4
X-Gm-Gg: AR+sD13KWwOGqFU8POS+c/eP6XPlnZnQIfDum/f18jaaJ5L3r8IeO5poH4KzBBcWI6B
	9yLu/uhWmxcecYFEjANCr6g6mbrgB1QjvS3MoVGS2jpV47ioHajmSn9qv6ypADaZLnVGOxC9OVp
	cZTosLODWyFbsoBZAK9Y2RtmAwEtMPQYAx2JR9Mu92JJ0E472QwjNVyQVskVI4DCh+JzLS/FYF1
	s08rBdy2rhWcqs0LSW9CVfFWzKG+7dsMpVrsLbAxo2mUax3zvlSazxXHZQF5aFqJR8synTxZtoG
	SHT8fL+wucIf1u4zS448cB+kVVwEhHrKplqpCAvbc2Dzu+hg4IS15OGbAcVPG3h+Ug+MTnR5L/O
	APT0Tdc590BThL8WzTLQSPvuJ40PNwav1op6aLCS6NC+DVGT8czmJZP+Rs04xS/zLv2tD6iczMb
	AT0jz9TxJBWEgbyOlPbUxQ/M9P8dFTS5q0KLiWF+5pEdVLBfvCIVd9t7FoJa7IJmlN6h2sovQ=
X-Received: by 2002:a05:6a20:918c:b0:3c3:89cf:f3a with SMTP id adf61e73a8af0-3cbce6cb365mr8859960637.5.1786209201916;
        Sat, 08 Aug 2026 10:13:21 -0700 (PDT)
Received: from PC.. ([103.172.209.59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebee8d0sm20733635eec.24.2026.08.08.10.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 10:13:21 -0700 (PDT)
From: Mohit Mishra <mishraloopmohit@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohit Mishra <mishraloopmohit@gmail.com>
Subject: [PATCH] staging: greybus: gbphy: use sysfs_emit() instead of sprintf()
Date: Sat,  8 Aug 2026 22:43:02 +0530
Message-ID: <20260808171302.72231-1-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

protocol_id_show() uses sprintf() to format sysfs output into the page
buffer. Convert it to sysfs_emit(), which is the preferred helper for
sysfs show() callbacks as it enforces page boundary checks.

Similar conversions have already been made elsewhere in this subsystem
(e.g. loopback.c, arche-platform.c).

Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
---
 drivers/staging/greybus/gbphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index bdb0f5164a6f..bb9a5b538e6e 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 
-- 
2.43.0

