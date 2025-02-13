Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B722D20DD52
	for <linux-staging@lists.linux.dev>; Thu, 13 Feb 2025 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739442698; cv=none; b=F5UWLzSKvGUZsw0VgnF+hfOBDeLIIwToD/4EAc4Eu/K6rNQcEbkSP3ULL1YJ1gh1bpOfueZg6FfuYBMHPpV2Q20lZ+AzEuW8amlGoGingvCvTrgL63S9g0ogkdS/ig1HykZcwlNIOBbOVNGk9waBnZWv5ZhqJ3fkPcEhotfgchQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739442698; c=relaxed/simple;
	bh=EMHWCfcGdBNxqYWkfC34XIyDNIoSqseONRJzl/P926w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fWRNPVudaeZt6wTn4ybkNbzW3ppzLNBMq8qodq36bnCdeMHd55qyH98Xg9eEMNSnyCU8CJ2dDiJIBXNMu6RwQwLhaCR4Q+C/l6ihJDZ/2qD15PB3gs6FgfWQAgxM5QbfBShE6KAP2JUrzsOblIn7YqON7QCC4zLWcFQiIpH/7BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Od5wZEKz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Od5wZEKz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f265c6cb0so226577f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Feb 2025 02:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739442695; x=1740047495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5v6y/RGLou6n//Ox/p9DubvRBsDa4+/GRuy0MzgkNg8=;
        b=Od5wZEKzqYXpSCFHXXf206vXMv0PVisob2oHwX7m3s8K/CAREVnO8DB6PumsAuxKH2
         JADG9fcPJvMNY9ELce/Z4GCxrlJf/K3CdqoynYv4zhHHP1nuS3cTzoRoOzc4B+KO0Z9o
         lrBobcZwuOlcBzfCmhRXZvVXa+v+fQh+v5tb2rj5Mm/tTpTursnV08TKpvr/iYlSlRKx
         CswgPz/sLv8XauQBlBdeyObSUZWTGe6WQgyPll1h1Fmn38/zjSvNrsL8WQDZ+RYQaaWJ
         w7dd0m3rP9ZFiY3a0UMEmcXkS+LHRWd/nlWyf3a8BOy0tpSV1zo4mOasWSc89C74JOb3
         9MWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739442695; x=1740047495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5v6y/RGLou6n//Ox/p9DubvRBsDa4+/GRuy0MzgkNg8=;
        b=oUan1BS6LYGHIVP6MuzDRkPyjpUD9PEgvs5rWFt8gYrm82qWe5ycFcKQnCWCE7Q3gk
         M0lZ0LFf/omwtl3wrpESHRX1G8cH4WhRNneDZy2gJ6GqSkmtIp7aeysL6ula3v14aoTE
         jAzlzvmA2zvOIbvLQqk7l0f51szmRhcnx1US95T0RKXtX962UR7ODZTyeQ6E+r2Sm2w9
         blEIFZ1GLYiILdxzBb69zo4h8X4SRjMcSoubbXzjE8+KvaxeKssN57VAlFHRKspRnjdB
         05htKbH/zLxOaIfNUGrs/3nPWdSCBmGrW79AlCRVFvQFPPgkAz45B6OZxxBFzB7b2WEz
         ZDNg==
X-Forwarded-Encrypted: i=1; AJvYcCUvTa5jqte3/6XNzcllDl6v6jq5lGRwMBOXz4SlXYsjqtR9TwnNNlqvwf1Pcy/2C407/slTDvTZ/4yhU1Bu@lists.linux.dev
X-Gm-Message-State: AOJu0YzGGbePLYiHG0qGN0DZaY5ELEBxwCMEpKJu1sTrrq92rRCGsDHz
	nEWFwO8Yg9/diP447gBNCP+epld7kaxa7mC7bA//Lt9hBR6of5NYjVrZJsB1
X-Gm-Gg: ASbGncue1UTb28W8wJ1RizNxlIb3DaNYyMRsLBMaMkVtQNTYNPXwBQFXUoEDucngUl7
	Sl91DRpKREQQGSO6wtDTITsJ5EW8cSlMBvyv4DZwRnRH1d4MOvyPirXcVFWlaLjqpDn7G9RJCnv
	KrZE1Q03CL4v9w32UjsNwoYNRTjcO+Zqb4zBtrAZ7f36cfZ2HLyQgbQo80sw3v1at8BNTH9VH4i
	scf4Sq9U91m0n7BExjC3slWfemfP+e1jwDwx49041mnbatHFAR3v8mjGQy0JAhyUJhvUn9nTe00
	v9bLzLgLOsC37Hk++Z/IoPsoaiSdXmckL8b8xWBD3Xv9HTOhQcc=
X-Google-Smtp-Source: AGHT+IF/H6NTFcN+gTu1zGXAcHdCzcnS1GE6g8RlW5NNRLaMhFR6h3Gx0RipALbA1xBd66s+r0UWJg==
X-Received: by 2002:a5d:584e:0:b0:38d:ddf2:aff5 with SMTP id ffacd0b85a97d-38dea256daemr6642693f8f.3.1739442694719;
        Thu, 13 Feb 2025 02:31:34 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b434fsm1509540f8f.16.2025.02.13.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 02:31:33 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	kernel test robot <oliver.sang@intel.com>
Subject: [PATCH] staging: gpib: Fix cb7210 pcmcia Oops
Date: Thu, 13 Feb 2025 11:31:12 +0100
Message-ID: <20250213103112.4415-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The  pcmcia_driver struct was still only using the old .name
initialization in the drv field. This led to a NULL pointer
deref Oops in strcmp called from pcmcia_register_driver.

Initialize the pcmcia_driver struct name field.

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202502131453.cb6d2e4a-lkp@intel.com
Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 7785d674f397..cb0d8a721687 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1347,8 +1347,8 @@ static struct pcmcia_device_id cb_pcmcia_ids[] = {
 MODULE_DEVICE_TABLE(pcmcia, cb_pcmcia_ids);
 
 static struct pcmcia_driver cb_gpib_cs_driver = {
+	.name           = "cb_gpib_cs",
 	.owner		= THIS_MODULE,
-	.drv = { .name = "cb_gpib_cs", },
 	.id_table	= cb_pcmcia_ids,
 	.probe		= cb_gpib_probe,
 	.remove		= cb_gpib_remove,
-- 
2.48.1

