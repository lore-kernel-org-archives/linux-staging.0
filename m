Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72FD2063C2
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849987; cv=none; b=Z8/glLkGWoreF6ZPafABRbYvZq+vgUYdTdU7eZXC0eZxREAM1ZA766dYou2GAsunb373R4+zD7o3v8ezTomjwRUKvqcYzkxwf/L+4hu20JooGoXXHBS7Y202FCzFy6yV35XmMHhYLN1NlUeT08DYKL6qAQBuj7DVznmwxHdt7lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849987; c=relaxed/simple;
	bh=7nOnj/t3IWRKRJuUCHCZoJzmMsnxpf6ffPgcSoWr688=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSXgIapogPnMjyltiOltVp7doF37lpRLh0UY7gfhkQnDPTUDw/ZDYVJ53bvEseStM/UlSgIuEib7qXxJZzVbeORBAX3jdeQwKBO0Eu2BLm1kXskZsJCRxG5wqcI9lVsTcQAZoH1yomoGnu8EqGFuTIFIU1G8HYcNis98IGv9n3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=k6zgdGGs; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="k6zgdGGs"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224019ad9edso3828045ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849985; x=1745454785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akTpKyJqwtY/MzR6JYTv6U/YQl7Z23JU2ZL/gi1Jfw0=;
        b=k6zgdGGs+lwDnXxDemnL2DMd64+k6OK96NaqWPC5fv9eUrZ+fCf+t9lsJs7kIhjMkE
         YkPfzdjzYcv9nj+NaC3RYTF8lxfes9/Ughdrsq3l6AKZ54AQuiEyXFOp6ezT4ZYvWuda
         b0vF+SmafkNdXuapg8J1Xj7liiiObjs5IYWfNfAdwAYXRaGEiANOzSBpHNOmp6NMq5Fh
         DbpGtyV2C1oQnNKrbt2gUCcZ9pUhTmHNy4VR2dUHT0hlsTW5c1cVU4+O/5yUvnUtOJQT
         WkOLwjghDPwVpnoA8dk1wIVg0nHxJ6GEsbbzP72lGEhpmNTv8xJNp9xT8IXAj7egk5ok
         9e6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849985; x=1745454785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akTpKyJqwtY/MzR6JYTv6U/YQl7Z23JU2ZL/gi1Jfw0=;
        b=fKBntrluAi2kXA6iyGJ6UXgZlpUiabwjWrefJmWth+Hc4lO5lkx78m4Nb65Xp3gwpZ
         AG7pRrc4Y4DpcpG5r+tLFvHGQ7srbCiwqI+Mqvvs27Zu3QMtXejVeI8zW4KXMnZde8A8
         0nblfHnPahDP8vzw9Yn3gfASfs0hM//uj/PXAVWAYGPWxaGgPVzvqlF25WZ3O+lpEczb
         bHh968ZvBIrpQ8ZHofezD/Qx5PWqESKE97+k4kkzsx6E58oSh3yzDXSsBLflgiZ3XzFN
         Zd1bL2Cd1HK2MIqsHTgPbN2QOefSTZV1jaYZGTvjgwOTPnZZy1tudMrT2FJOviQILxs+
         Qcuw==
X-Gm-Message-State: AOJu0YxetORmze2atU8aPgDGIebTjehXM835IxPi8rMpTh8Ccvy8QNIu
	Z1hRoKEMJrTtWAnDbqLyVHxNocf9/IyNDXwYGhQgeQVkf/yrbfKVhB93QwMlRwj75b3HOJLWPSI
	=
X-Gm-Gg: ASbGncvhuW5aoCRf8nZARM+dApAjjpSiqAdlix4kuR8ehvfBPZxZL8C4U4EcWKpNAx0
	6U1Xw4qRKQI0jNI2OazIbN2QrvxK40/oyZ9scTK44C0zUYEBWCpGpKiD5AAhx4FY2o+o9wvm3GX
	NiaAIfpsf0Ddv/QcTuhwTSAZQRPTNuPoznYZgzN6p80jU+mm6dggD5cvWaR99166eUpAdkbnV2k
	v8zbTwkcjF32VPWiwOlXJZWOb2M68kYJ3jwrsDaF/lsNejpm2NJopgXMhLFLJeEYOMPKUqrCUch
	Poj5xmltEuI8XlWuZiC/0KCmFwW6BBdtdfubhU6OMBND7Afg4dhFzOL0PHUdrVOlXj2+85icxRs
	4nh5oAA==
X-Google-Smtp-Source: AGHT+IGYB5rRMTCrYcBvWx1oyo91M+PvsefiAz/0PmFW3/rXiYio3aV9UdJnictE+VBfEQe0SmaEQQ==
X-Received: by 2002:a17:903:2a8e:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-22c358db5edmr51881165ad.20.1744849985214;
        Wed, 16 Apr 2025 17:33:05 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe7219sm20767075ad.245.2025.04.16.17.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:04 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 14/18] staging: gpib: lpvo_usb: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:42 +0000
Message-ID: <20250417003246.84445-15-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 47f56fea28a6..494cfa21b938 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1055,7 +1055,7 @@ static int usb_gpib_t1_delay(struct gpib_board *board, unsigned int nano_sec)
  *   ***  module dispatch table and init/exit functions	 ***
  */
 
-static gpib_interface_t usb_gpib_interface = {
+static struct gpib_interface usb_gpib_interface = {
 	.name = NAME,
 	.attach = usb_gpib_attach,
 	.detach = usb_gpib_detach,
-- 
2.43.0

