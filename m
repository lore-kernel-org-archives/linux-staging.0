Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAFC1537B9
	for <linux-staging@lists.linux.dev>; Sat,  9 Nov 2024 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731157604; cv=none; b=rpnV0rhOHD2TOy/N7svV6wa8Qnc/sNRbaTQdFBB/YaF4LVS62678YOYJNRnbSvKamv/pPlqD2IKUVtFeEsz7arHiIIR1OSlpoZ0X9oiO/8Qi5c4dnTsWw3ipu7dDL3Q3NzmT3BxBSH2DSvNgA4iwiC34bAR+ylQLnQsTH0KOX4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731157604; c=relaxed/simple;
	bh=mm9K2xz6Oebcgou/IL/b/qlatzpNrubhgk+71MJ3grM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=aLisNHconYS6T9FFCTXTi3IAbTbueN3ytQLO1++0gDcE34cAmev/83Ig3pqfh1cjloYm5mATguUTvlXi8auhY6qBvY9oxfzCWffCcSHITeiyMQZqZSBl0PP4t6y00rC4kuWC37R49H01AkGXWSKcqbP2FRseYC35SnxL3VBF6Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YExqlwu3; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YExqlwu3"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso3735965a12.3
        for <linux-staging@lists.linux.dev>; Sat, 09 Nov 2024 05:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731157601; x=1731762401; darn=lists.linux.dev;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1LH9F4fl/SCwwpRhotRkshccuFBLM0AoD3ZbJEdUKs=;
        b=YExqlwu3/HpGy26cwXDDBztTPB6X3nfY/D6y8yXV4tQnpug5qRA7+Cj4FXYvpP1t4I
         CmgU8hCX6KS4p1MmJDcsOx99carFg+pYcjjKYF1qskjY+EhT8mOzQKcJWWhgZVq2jPQS
         BqAAA9gmH99GSa6z7IL012tSlu3iEVnP+WIqs0i2ofeUUefxYY2fwK++HYWnimuxE/85
         kkraxsBLNufXt9TV7o5bXV8N0lHvEo5J+ujQ2Ta1uTfD0AsjnjdK9tyAzycKcE73KDr1
         s8FZljiq5oq/OcX8DhRBLGwfzYq4WG+MGP+pfdR9OeDc+cN5jlf15uY3L2y+NR9U/Swz
         josw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731157601; x=1731762401;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1LH9F4fl/SCwwpRhotRkshccuFBLM0AoD3ZbJEdUKs=;
        b=TaHMFc/08qa6hbT23FgNaHf0NS0B1Dgz93RKr3t2F9O/dlP+z4iomnbubDDUbaZGcL
         MwWMwTuBkIxtqKbzX3N/mZ+nZ1IvJ5mjiU2/ZzxXzix0Nf0cIMxsWcLEm8lo2ZFoO5oK
         t6qg36ZZ776+XdoPT6RDoWGp/sdEgIIOJpzB2Fak4r2YhJyO9FJRfT2Gjl18mNH0fCPo
         gFiNv7boLrW9oR/iyHjC5kWcy26htCLDKW/7DJl0O2eqjNp15fwJEhdBjXOXr35+K1JJ
         NBl7Bf9G5p6Xzfh+KhtDOj/RlSi4BOhscMZt7eP+7s8Cvu1HNnDtFFberWX1KNQdVjMl
         wcuA==
X-Forwarded-Encrypted: i=1; AJvYcCWEtLKRkjVCxh+XvuIrbeyhNLlwmJszUFeZ1k1ZEloiPJAAW6oMQcHG3BUoPW8Caxs+BfORM4+dQCbVLVhz@lists.linux.dev
X-Gm-Message-State: AOJu0Ywcjvw3IhOrMGh8GKkaR87AWTk+rsvvGMVr+pG8HcYlNtCIPaai
	rsMmFQGsbfeGbBeVbDNJfzrIvJZGiVb1l+8UdLJTGXskaHszD3Yv
X-Google-Smtp-Source: AGHT+IFwskzHVlYtfLNHpgXDc3MAep1lUrE6+lpwhYGiO61NRE1vLY6Sz72u6wFh36h6WeJiN8oRYQ==
X-Received: by 2002:a17:906:4f96:b0:a9f:168:efdf with SMTP id a640c23a62f3a-a9f0169008dmr189961566b.6.1731157601093;
        Sat, 09 Nov 2024 05:06:41 -0800 (PST)
Received: from localhost.localdomain ([2a02:e0:9868:f700:d4f1:16c9:67f3:ed1d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03bb83acsm2972516a12.51.2024.11.09.05.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 05:06:40 -0800 (PST)
From: Omer Faruk BULUT <m.omerfarukbulut@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer Faruk BULUT <m.omerfarukbulut@gmail.com>
Subject: [PATCH v3] Staging: gpib: gpib_os.c - Remove unnecessary OOM message
Date: Sat,  9 Nov 2024 16:05:54 +0300
Message-Id: <20241109130554.3652-1-m.omerfarukbulut@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

It dublicate the MM subsystem generic OOM message. This patch fixes
the following checkpatch warning.

	WARNING: Possible unnecessary 'out of memory' message

Signed-off-by: Omer Faruk BULUT <m.omerfarukbulut@gmail.com>
---
v1->v2:
	Changelog text wrapped at 72 characters
	Unrelated changelog text removed
	Trailing spaces removed
v2->v3:
	v2 patch wasn't about what changelog text specified. That
unintentional mistake is corrected.
---
 drivers/staging/gpib/common/gpib_os.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 6b12404efe7d..6eec8ed79a3a 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2093,10 +2093,9 @@ void gpib_register_driver(gpib_interface_t *interface, struct module *provider_m
 	struct gpib_interface_list_struct *entry;
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
-	if (!entry) {
-		pr_err("gpib: failed register %s interface, out of memory\n", interface->name);
+	if (!entry)
 		return;
-	}
+
 	entry->interface = interface;
 	entry->module = provider_module;
 	list_add(&entry->list, &registered_drivers);
-- 
2.17.1

