Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C041523AB8D
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629563; cv=none; b=NS0PAhYXpcyGDJ+5Tb2v2TPFv6LzEYH6XsYpfGeFdV0rwsbMm/wfuvZ/RLJAcT4oNmezyeKrKMge9nmDQGXAItq9UKNNT8bMsx6uiycBI2Gmd9/LnGRx4xm+HBZMlsHlkFwL7zWtl4/4SGvE1zBYfEvgN/AYSB/+5nsoKB6DPkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629563; c=relaxed/simple;
	bh=ZM0UeGckLgWfb8A9LZDrdGuBcoOBBI4fXdeLoyxc1d8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qvYJ11Xf5VGZ4er0qlzUN9k+aNx1EkLXNZhEmqqkLWQb1SFJBxQ8X7M8DT1cJPeyAnT1qoU6u7kjzOzAZT671uzIPpolj3lmFbbXyPpvjZUmvRqN0XH+0gWjBIziFmEtEeKU8AZj8LDDBaIYnbU7RW7cBoYYI0CLCsXpeDjCceE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qs1WGLjn; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qs1WGLjn"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b886fc047d5so1120339066b.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 05:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772629560; x=1773234360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=veByMjsGeeA2OCIj+ldV0X1YxNMqgif+fScGvqauuiw=;
        b=Qs1WGLjnH28xMCJW5e7N0LaMYGw5LmlzjcfUOyau3isEl//pOTqmLXj8MLATTys1Yi
         sQdFO5pNste4Zi5Cd/n/t/uurfrt7jAaMgNJoA7O5xPpx+/dPdRsN/20IrIcbhIDjNS/
         GgspRyFLD2R8lFC4zlyTDg/eFuo0atJAf0jQxRxIkhrBbFINnLdjsKi8EzjtoHB6E7vX
         wqAnEnaxHD7AZRTCIFayh3A0deJKqZdFQELJBVqCqnt8jNfDGE7NOuRsYqi8vY7i20Ou
         6NQoYOblJw3uA5922ZfWVkmWHWVq0PCVFERKzu1TOJggIsn6Wo7/FtZxe3SfqTNwz4Lg
         mQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629560; x=1773234360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veByMjsGeeA2OCIj+ldV0X1YxNMqgif+fScGvqauuiw=;
        b=VKFSU/PsUsg8Lam2x/bwyJkQZZteoSDvhv2rWq9f+XIqlH9NUDyKZKtLE365lw0v9b
         VLOhRVHGo3jy+VtShK+adTQHaATAUmESYfDf6Q+j9klu7s7pQaLJu1FdbWeRpiAPbYmB
         +9bkcIb2YjtuVolq7M5/pXkCrPK3f+o4ne5uaM+zgdkts8wlDJu2OrLPzaFmLbN+SIFo
         hnfp5tomWUzl4E6owtJge009z+sFEIpiYcwaWcMPEpGLq800OJhlBLExiBcp8L/kG1I9
         cZC+EgtDH9xLrF5w281PO7CaeS9Sr3K0vbOEWjNaPxQYD9niO9Vn0YwaGz6Pj7E17XqQ
         b5dw==
X-Forwarded-Encrypted: i=1; AJvYcCXnzdihTjExr/SWT4l9vfobBUwlEaioABiELO54HiVE3OppGEvwDCb4FQJ4iDhDOB6DDkI3UFoTZVgrUEMo@lists.linux.dev
X-Gm-Message-State: AOJu0YywBLLjjemHf165VM1+Li/d8j6NYLtzsH7zLt6XKxFKld/0NiFz
	PfXTLRnmwIiCLbNKwF+VE+FdabWi3G57u+PNiKX5dw1+OjwJxtCcVYom
X-Gm-Gg: ATEYQzxIusbt/tFKu7/VX0vvHvw6onTlL5NSKCWq4RMk5ClKvQ3+TZGA7soTmRPnYfI
	9e6Dn5+/uReNiDQEbrYdS7RQioFD9VqLw9WAciwMCstcEGKPPCuvWrY3kvf8jYcoToiR9LH6hiW
	oJDNqnMGkthgzyauc14DdWaRJZp3VhYxsAbiJqf8lr24RcheWiBLzl/m8NIZ460M/57lRc2rhcY
	RWg4ar9LBhEel+dcX26rzSlyHZkT7fWkNL04tYJvLmEXUp31IvXJCgdjOEQiI7A5uPWl+e6EXpR
	kvD/1PE8vJBQmtFktlUFPJoZMX9Gu8BSoBpIkkMZlYRAsNlhVsGsbl3Gnm5niRMfxUmUHN6YSPP
	sjuVuOvftQQIxIOYjDATjECL1T20gRz0U1Po/TnCHy2Peh0k7y4zdCe2pswHP3Otf7hqIzlVacI
	X7nZtC9SQ+gtamBDY+vA2c68vKFfKnD/b4evthqxs3XX+QCAEQQkcs9pt1zJg8KEdjwo2o3jEYv
	ZEk/JZhne29l+6VSoclRQi21hxQeRBf3AV7cEPg2ubnGB8BRKcgPP8BqWnhKDpuVpmSWeZCjJlV
	QQEV0JhcH3zzEDJlanwgP3OcJyk=
X-Received: by 2002:a17:907:d16:b0:b8e:2a8a:4312 with SMTP id a640c23a62f3a-b93f14b31b9mr131153766b.28.1772629559982;
        Wed, 04 Mar 2026 05:05:59 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae613ddsm739559266b.33.2026.03.04.05.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:05:59 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v3] dt-bindings: misc: xlnx,axi-fifo-mm-s: fix interrupt-parent property
Date: Wed,  4 Mar 2026 14:05:56 +0100
Message-ID: <20260304130556.37311-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 .../devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml   | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
index 6d1cd651e..cdc295f2d 100644
--- a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -31,8 +31,6 @@ properties:
     items:
       - const: interrupt
 
-  interrupt-parent: true
-
   xlnx,use-rx-data:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1]
@@ -56,7 +54,6 @@ required:
   - reg
   - interrupts
   - interrupt-names
-  - interrupt-parent
   - xlnx,use-rx-data
   - xlnx,use-tx-data
 
@@ -64,11 +61,16 @@ additionalProperties: true
 
 examples:
   - |
+    intc: interrupt-controller {
+      interrupt-controller;
+      #interrupt-cells = <1>;
+    };
+
     axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
       compatible = "xlnx,axi-fifo-mm-s-4.1";
       interrupt-names = "interrupt";
       interrupt-parent = <&intc>;
-      interrupts = <0 29 4>;
+      interrupts = <29>;
       reg = <0x43c00000 0x10000>;
       xlnx,use-rx-data = <0x0>;
       xlnx,use-tx-data = <0x1>;
-- 
2.43.0

