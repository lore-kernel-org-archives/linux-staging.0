Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C953AEF24
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 08:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521851; cv=none; b=kJDFW+2o4c5zqFN/Tw40qJQR6yGzIUtQm867+I2a1P78wWfjjoF9xrq8QoHrLQ+qIBnS8H9kUImSZtddPwe3rCqlaBzkfb1VXtYe0UWZEnJTnKCJFzHgHuPFXZSz8zbbRt6yFqzCtjixI9X+Xhqq9CSpINqMA8j2YEvcVqz13bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521851; c=relaxed/simple;
	bh=khQFn/M+XgS9a8N1qSY1pJGuy+IdF5OHeG2gMwqhlxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q2vviothMNozstiPi1+EnpXd9PLjK+vZ8gtNJydUxDRpR90rIL/BpgJNijd7g8LHVuVf2jQhjLA++WzEFYC82NxnBUrcChMjvRUDKUCYVu7bqhZuXRQ8P8xF2c6Ywt3VEpdLwDSRkTtFh2H+emofDBfTrdSKGbJqDD0OeQESy78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6GNfKcM; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6GNfKcM"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so594699a91.0
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786521850; x=1787126650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iSsiifabx+BVDymHMj6dCPD6stegn8pqeMhOORHYas=;
        b=V6GNfKcM2PBX8fE/ErDowB9IafCZg9rfIcZSM+8qP3ZqYIDnV8mHWTIBBaDMWZUiXN
         y2a/yKYuEpIaHVx3SETT+lUjqGlyW/ZYcPRuL60D284lEPckyNyMiD0vbLJMq8ejhnQb
         1oa3JS/qBkQfChRxzuL+rT3/DHTeSpyjqYzl1CVhbI+etvnsUMMdv+onzr+H2JoDSN8K
         OjBY1HFvP+WzNzARFfED1ZuPlF/mOsuf/XKMMtzT5NWku0VFEtlP9mrxBZKls/kBdg/V
         XS+Ap9IVygX/VpR1BrcarXhqMYKF2lDzZUsTt7nHN2Zv0w+HjEE568Em+cS7U6TfziNP
         +hdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786521850; x=1787126650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iSsiifabx+BVDymHMj6dCPD6stegn8pqeMhOORHYas=;
        b=NxJroWhxCg9jjtJqcEv+nrZtnlN/jjnUxVqII3u23SVr5NAn6ZVOAdc31eXuQ5hB3n
         6G0mqUsxy3tEA+KWOtFa5TWzcq+jfP+UEqoaF8hIIrRyz9125arDwgUF1aisci3TZ3Sm
         AJVy2L2hSBfsV1ORzTkojQBQy91BQLr3WO8qT3vHT2zLnZR8fX/WKgMjywYtjr3s/VLh
         YTtZQ1bFd/MMk53bLhh+rZCc+lAscIm1WhoW+RVrsAhT59+mEqRjlosVfQKMEb+YL9k4
         Tm+Q5rlEDo+HHE1qvTI7Ya5GGZXaXGlS7mSrW8683y6YkarblU0kIso8qNlNe2mu7tBc
         L0gA==
X-Forwarded-Encrypted: i=1; AHgh+RrdOuUhRZqR36luIDrFzHQHuJans8EeNk0w+zsEZV7tFLJ0dIME8I6jmvG3aWatwaOg1c3ijwhX34LIa1qt@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsu0VpCNPYrDF1n5payYcA7qA9Nv0Phek7syEvRPO7oLZ1hkHk
	ryvjhmPXwm5vhAlnD/g4UXAjiNAHcC55EX6nXaBWIFOpFDePqtY5YdPO
X-Gm-Gg: AR+sD129MAghjz3HYYXKEpvjW2rrHOylU2cX9XYTAogKm3UkqFBWL52n1VJPmBwpbmt
	I8ZtKC54MsU57KzbiiZ83RW8KNqxnU/QL+yAOP5YrThbu/N4fGmMo18Hk+dsEU5OCeRhG3p/+83
	1l4IKMq7+54+nypM8uQOr+6LBC5lBb2nD3zfz31nBsyaqTv26VUM8VofijIhZ4Z9WAA3SGJ5Y5z
	30OEC0pWJlnpeVbXbD1B/bzR1pQkMyVucZZFyp6FBiXYgIshLvvgLBgmtt1y/LlMTbAP8fvSrw0
	jwb0srP/hOvU+384O7ibXus6zHTmVrjwi8kLeJxvzgdwd+atqQv8+NWAm8A6SFh0IHOh7BhhLJg
	TnzsbfrTXUMqgDbDYdvuNdYCib6LYg1lAvs/11Jvv3Fn1x0dYdlj4w2MfJ2dbXIeAx3tD2Fc/iu
	oWXDnuOU2lOUK6FY/0PgvkhxTXrq4WkMzHj4V0sLUbU8RjHV5uDOUYNhHCwUcEpAll1Pg=
X-Received: by 2002:a17:90b:58e8:b0:38e:7e9b:5fbc with SMTP id 98e67ed59e1d1-392f3f529e8mr3913753a91.7.1786521849448;
        Wed, 12 Aug 2026 01:04:09 -0700 (PDT)
Received: from localhost ([2401:4900:83a9:ec61:7129:9a57:4b26:1066])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d79bd6sm8803496eec.28.2026.08.12.01.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:04:08 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH] staging: media: atomisp: make pmic_name array const
Date: Wed, 12 Aug 2026 13:33:29 +0530
Message-ID: <20260812080329.87668-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmic_name is a fixed lookup table that is only ever read, never
reassigned. Mark it as an array of const pointers so the compiler
enforces this and the array can be placed in read-only memory,
as flagged by checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index a1d3a16921ea..d628fe4dca6d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -109,7 +109,7 @@ static enum {
 	PMIC_CRYSTALCOVE
 } pmic_id;
 
-static const char *pmic_name[] = {
+static const char * const pmic_name[] = {
 	[PMIC_UNSET]		= "ACPI device PM",
 	[PMIC_REGULATOR]	= "regulator driver",
 	[PMIC_AXP]		= "XPower AXP288 PMIC",
-- 
2.55.0

