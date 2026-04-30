Received: from mail-yx1-f67.google.com (mail-yx1-f67.google.com [74.125.224.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2FE4A3E
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 00:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777508546; cv=none; b=bwNefyFDe/PfLSwXj92PFRNF5fz+OAf+KJZBfOBNhOafJPY4b+TeRKWAQ68Butc2lAC1uYtTim9YvvZ1Rli4TOegKNTJE8bfLXHgGlFYwJpNVuN0fnnyWdLYz966d5kAuZNlw3MeDcT9PO3a77LKl8T2M77lsVl3/YBG19CjDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777508546; c=relaxed/simple;
	bh=Ei+yusGr1waT5D5MmKA+mppSGTTxd9CTBPqJxfbgUtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8SUuwWc6SaVNS8s0bfXMk9gjNpsaFs40DJaW0l4jK7t6/jtDMMmu3P9O59d+R6qxfzzo56DSMFUPDX/cg+g3/dBTD/1KrmDobPdgiDuXM6Tu0wzhyUyPmXQB60+d1eM+Xr5HtMr96i1/en6YmtJekkRlok7e3+YN255UvdnMzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fianKiUG; arc=none smtp.client-ip=74.125.224.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fianKiUG"
Received: by mail-yx1-f67.google.com with SMTP id 956f58d0204a3-652f220595fso325539d50.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 17:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777508544; x=1778113344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCJerECtiCXIBCz7zgU9qCjidNXdZcf6eEV/QCLYq+A=;
        b=fianKiUGQfxzc+8OPBH6RlwGX7vsusTiHWw0X3zA7qOakfMj6OyvzJ++E9cstGLAc3
         MGJZ2+rUYGzNoCqrGYd9o5CLRHD4tLcV/w74WHXAoCRocLWLEd7RHAlG5lDC9Uy4vHBG
         Gx/Kajfaun/UdlfRP2dS1eUdEYc/ar4TH2kAmX7sULNtRrzlsozGL1LJU9EoOiqHTKoZ
         O22AqdjrjolIeGXJdEJ/B4sg3JFBxyQFgZ5558rhzjVYqQLcQQfGCBHMx4EcmjW85KnD
         Y1rXhj7S0XfeV033lbSox8pULxVnfovy4bmbXsHN2hrl/3QlIc7NU5cDAq6diYMW/GUl
         D/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777508544; x=1778113344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCJerECtiCXIBCz7zgU9qCjidNXdZcf6eEV/QCLYq+A=;
        b=ZHn5FrDB+SHRwPn4Buey7VYtjup1QhY5mR+4jTFZyXrpPDHL4ojalKUzuIL3C0a1hn
         andlSzHgvWvYwrImN9pn22e4rvtbL8fLKb2COks+dqIKgHkfa8+NPcU5ZZ0XMJFm7UGS
         RXEvtcTMjNzweFb3iqAqI6mpaIvZaRyPu5gJxO9XolPSzbMWAqgXFNYUSj2NWnNAgl+7
         tUgrrMJderujJQzToPUZlDElxnAUruq0CK9+6iHydgYnFzdr7WuaWYfVEzqQHaCh12fT
         aijvkxwXWX0e9PvysxJHP4/8gMPUEJE6Oxydb21CY3H/JvtivaHtqfUtfNfIlRmIzPeJ
         6dFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YzOb/T5EM5Mx7SiXi7YfGCjueQ3nQBFYdt52jETbBrs6Gk77bwK1Nr/BIwV3n8rIZW5OOhhgnwL/b18JO@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Txbn0o7KI5DKWRqRHdRdQhZWXX12Ty3qVBc4yhDUAfN0520p
	DHjvgDl2fwYXnxip0QcDkdDQSxNQJY3Fq6ryHU/onIgJid3GnbNAp7JX
X-Gm-Gg: AeBDieuH5CPez1O5dHrsvodDW2Wsu6wg4KQxoLIVVbNznvgF/TMjjUvabyqtZHd86gC
	McHh5YhATI1ObuqXeavanoAD2qX7w1a45U2JpsuBd0qopK2Grc91XTZht8Rw+DiBL+o1AM7Yj+Y
	Z9kc/B2YkveRFdCcEPgIScfETWw88H0O4gYF78ZQKXLFlHHXaCIRv8q1weUSQI8jeKchqaluY5u
	AfQG3+mWnjs1piMUPdy2TrerFVYOMBzQhDKb1ub25S89OVRx1B37G91O0Qq/WoeX0quiIbNw5OF
	8nKVUPAVWRjDtXnUJgxP6tIJEpUvDNOT7V7PkCgW3Q5eAcSSBclL/dP164WA1btdqHr80yIBsJS
	Pn5jlBGoZqhxhroAa81f20QkIWt6ZOsSMDk983FP5s/skEEsXLZHmTdLeASQHXBs7mB7hUU19Sv
	Rpzwn/VbVGTxz+TxEvKR1RTFN3hrrq83v0/CAaOuAbxKMRfj5iRkUvFmHSE52bji4IpeW1w/B9Y
	w==
X-Received: by 2002:a05:690e:128a:b0:65c:1a0f:d89e with SMTP id 956f58d0204a3-65c1a0fe0bamr296688d50.23.1777508543896;
        Wed, 29 Apr 2026 17:22:23 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::d])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff71d4c1sm1940136d50.14.2026.04.29.17.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 17:22:23 -0700 (PDT)
From: kernelcoredev <sonionwhat@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernelcoredev <sonionwhat@gmail.com>
Subject: [PATCH v2] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
Date: Wed, 29 Apr 2026 20:22:20 -0400
Message-ID: <20260430002220.3665-1-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original dev_info call was intentionally temporary, with a FIXME
comment noting it should be downgraded to dev_dbg once modules with
valid VID/PID values were common. Project Ara was cancelled in 2016,
so that time has long passed.

Remove the FIXME comment and downgrade to dev_dbg as originally intended.

Tested via code inspection only, as Project Ara hardware is no longer
available.

Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..058044ba7 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -163,18 +163,13 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
 	 *
 	 * XXX Name it properly..
 	 */
-	snprintf(firmware_name, sizeof(firmware_name),
+snprintf(firmware_name, sizeof(firmware_name),
 		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_s2l.tftf",
 		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
 		 intf->vendor_id, intf->product_id);
 
-	// FIXME:
-	// Turn to dev_dbg later after everyone has valid bootloaders with good
-	// ids, but leave this as dev_info for now to make it easier to track
-	// down "empty" vid/pid modules.
-	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
+	dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
 		 firmware_name);
-
 	rc = request_firmware(&bootrom->fw, firmware_name,
 			      &connection->bundle->dev);
 	if (rc) {
-- 
2.54.0

