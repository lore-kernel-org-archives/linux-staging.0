Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7395F87E
	for <linux-staging@lists.linux.dev>; Sat,  3 Feb 2024 18:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706983874; cv=none; b=fotTs+OrQLvyumwy9TPXaoHRd3Heg9KqRyqEzzrbbobrGhK+u9V91EuK/Spy9uJU8iQTPVyR/NUA1GeOq1H1XGoSmxeqftanWPOOHXHj33wU6ks9FFFZmoFUIQcD8+gdbpkeGxnhuNaGgNdxoKw2MTwFdVTx7jDytaXqVk8a8W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706983874; c=relaxed/simple;
	bh=glbLL8EL4+pQU5yzebgHSIEG+b0YUIxOGOXAvOU2dEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SssY1kSth82BNScubG6QU2cMviPmsNnzwOkpzB2w1Zzc/sBEcxZma7wqaye+n6V2fzvC4xpO5duDV143GPDsTMHJnBRE2Kfjj6SBtlORfuEw49oo9GpkjuXPpjyvEvAix925b5S/mk4JnSMqZj3Bg/WHrHf6QdabWUFAd1pbbds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=fail (0-bit key) header.d=marliere.net header.i=@marliere.net header.b=XhVgF4gm reason="key not found in DNS"; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marliere.net header.i=@marliere.net header.b="XhVgF4gm"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bfd27f6dc0so172877b6e.1
        for <linux-staging@lists.linux.dev>; Sat, 03 Feb 2024 10:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706983871; x=1707588671;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoyPUoipn7ey0SlHCwsHjtnIsvdsV+9itDAd6m+uAEg=;
        b=GJlE7qI7iljtnGycpoh0QqLF4OQnfVbNFyazN1Ffln+aFKdOE1zJ1jo7DRhFj6KlES
         ltpSiI6oT5DxHNX6ZhE/CwyqY0L1FPvWP1W82/pqcu+oXDi4omGfJIQl8iP8F+fla4pO
         RQ5FELqFtcnE9lMy/7RxgQEySvIzj9+ycGESncHSpzaCr6DunTYz615FLr+o4cwvI560
         Zqe/IeVg4L27xLs+1QQw5+s9CBQnnkryAmXod0y268amVRpC028hMapLAfxPTGU9HBC4
         OUZrNBTyXIFIUO/0dNzvnXwGbtH8IWRZLu+1l4KomAeTI4BB3IYorFTO/jZyAecIPQ6Q
         C0Bg==
X-Gm-Message-State: AOJu0YyrXoM6KFL5DK6+T+BXyUupTlNAwYWiaX3Wa/HE64uo0EaJUUos
	AQ0bSQL0qK5oMbvDAztNCP6wUw9V8VnRC4Y+ypwwNE7g+liJxBQBEmZW+PJhpB0mww==
X-Google-Smtp-Source: AGHT+IF6N2vbcgNG4vdEtTyGPYxDXIVJAbLPN7imwepSJoYr/Tv9ZGCF/mF66MfXdASfXetRnzNZXg==
X-Received: by 2002:a05:6359:3112:b0:178:7fc9:3991 with SMTP id rh18-20020a056359311200b001787fc93991mr9281323rwb.23.1706983871507;
        Sat, 03 Feb 2024 10:11:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXx09d0jYVMhokGkrysdycIvLWqnaN4pJVfDwvw8nPsmiTHGoHFgnvMyTQcdsw5EwQQPzV/5CePz5pEpqbnuunx4Vou7P+5722MRDc0+ZY31mddtcBMnXJc4077CKDd17PIjBeGNFvSHw==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id s22-20020a634516000000b005d8fdbbd5edsm3859753pga.65.2024.02.03.10.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 10:11:10 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1706983869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MoyPUoipn7ey0SlHCwsHjtnIsvdsV+9itDAd6m+uAEg=;
	b=XhVgF4gmbd6fu21tDB+5iFPTNdGr1nB/GOyowmO7k3uT2vqBjWfp70UU3951qRCry99QJZ
	J6mITpSZb1NwoUd5fuhc4LW+O0jBMRBIKKVqmTTSozwshfroBmuqZm0tA1bJPCy0Co6uwH
	BW8EAv6cz0ce47fmAa96QnhQNrYjqMGNZbkk9R0OsEd7n+cNV4LCxxe0xoj7P55DTfaHtL
	+WiINotXUiiYCl873ZbcWfiYKagaGCWtDcUiKTU0XQjtVMgp5xgaq8N9q//AZCSi7vWzhR
	Lhy+8QfW/iVoouOQvmxy8QOLAvVmXMqTdJu1x/EUmvmXX0C+e2ZFu9tJvC/0oA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Sat, 03 Feb 2024 15:11:35 -0300
Subject: [PATCH] staging: fieldbus: make anybus_bus const
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240203-bus_cleanup-staging-v1-1-a13448ddb4c7@marliere.net>
X-B4-Tracking: v=1; b=H4sIANaBvmUC/x3M0QpAQBBA0V/RPNsai5RfkTTWWFNa2kFK/t3m8
 Tzc+4ByFFZoswciX6KyhYQiz8AtFDwbmZLBoq3QYmnGUwe3MoVzN3qQl+ANuokKqqlBriCVe+R
 Z7v/a9e/7AUGd3xNlAAAA
To: Sven Van Asbroeck <TheSven73@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=glbLL8EL4+pQU5yzebgHSIEG+b0YUIxOGOXAvOU2dEU=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlvoHZa6ZhAsTE22JNZ5X/tq7An4MsA3IQrkUqy
 3Awqc3273SJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb6B2QAKCRDJC4p8Y4ZY
 po+NEACM64mUg5Bka3AlD1tZwRSLViOCKUBgXWCSOOymV051aOQHAHVnYflBLIs5pTFDFbAC3CH
 QdMW6N/5H+fDNVgfeZ05k8DQa1CAbutnjTkKV8ti0ZT9ughK8lUbLvI5Goo8S2QaMpASLK1a8TE
 fHDHUgb2iIqGokdOgAtiDQ6xm7zFnJVzY9ZpXeaLRDr5FGKbUtqoUEuSiASdbpJ+cyYpDdZ2Dmv
 5Kg+UePyRckMxEAW2WhSbY/X7LVEDRKZVBREOKyv1eggoUgBvU7/tRbHKGxbRHb7P9htm++8M77
 LXucVKRbiCJl0qXIDHZm+OtCjAaLmR7mKJQYaJpzyaldE6IPbRh/7y6evMbFysBByQVWQVRUM8t
 wGTh3EGW5V72UzVgYgoFr+SS+fShbOerSp5SMCk4zFADS0cAl3qMVvgpv66JbgP1BqOQ2zfKVYg
 8UUYiizSn5mupw91+5+ipFkaMXvT9Zrt8kHGftehT16jo3kJn14/nQG0+qoRDSScPJY0B4Fhg2K
 rXfiPD9HpDGfddYEBCWfcMKxNPKy9VzBtj6FUiYmhBvt5jgD7bI0GUEQGL0oYpzGNPQTRx/GOZw
 uyau1xB9kcLT6GWdXPs/WIGntdGQOVDA+YZvRGJbdqSPMNLEPJhjcL4Bd3DN099wU5MWP325Ba4
 LvakuTcKP3VHFzQ==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6

Now that the driver core can properly handle constant struct bus_type,
move the anybus_bus variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/staging/fieldbus/anybuss/host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fieldbus/anybuss/host.c b/drivers/staging/fieldbus/anybuss/host.c
index cd86b9c9e345..410e6f8073c0 100644
--- a/drivers/staging/fieldbus/anybuss/host.c
+++ b/drivers/staging/fieldbus/anybuss/host.c
@@ -1195,7 +1195,7 @@ static void anybus_bus_remove(struct device *dev)
 		adrv->remove(to_anybuss_client(dev));
 }
 
-static struct bus_type anybus_bus = {
+static const struct bus_type anybus_bus = {
 	.name		= "anybuss",
 	.match		= anybus_bus_match,
 	.probe		= anybus_bus_probe,

---
base-commit: ce54e9342124ededf0a00ed4e8a8aee535bfbf00
change-id: 20240203-bus_cleanup-staging-0cda1a5a70e4

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

