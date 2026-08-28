Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2C5380FE5
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933711; cv=none; b=O5iqa2LdJtt+O1+DUxLuxjX8vuCS3HnCHSxKawJQtz0JTVHFGhAmnnPyQFcACIt4hIiNAT3GD4k4e+pKtWw3jQdBO5WcYWfj9Rsl0cCP6sibIO/5dGBg8wF3FxZaKNWQpmrPcS0+Mkonk3EtHHyu3uDvPmo5MzJU9vhoVJhDGis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933711; c=relaxed/simple;
	bh=P2vAhkjwfZLpGHwPw59L73KMSOIBIbwxnRr5PopVIrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GflOaSU3rdjm3nnuFT24UwoMq5HRNRTPr6TWUJUOthfIi765ZLkIF/C3T7dYjmUZ+x4Nn0lRcMeAfSxhTTki0NfjokJbGxfYpP65VQ3ioa0/K9cmMdJxMTyD639/nz8olE6MZQ0ZZFKSyzz4emy62WtAoOqb75K6SsLfdSMZFmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1otklbE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1otklbE"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fe89fb333so719775f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933708; x=1788538508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=g1otklbEV6e8Y+/mH3xiaVrXqBr1QXbcEkAspsQ92No8o1Slhi5oKuY5E4yDpoLX6E
         QFENw26l8a5JbeTCB4SaVtt7rT2MpzDWZnTIjfSp56JYXExQ4Ngrrror7CplE30UijXE
         F9VDYufUZhHT+AzbQGuVjQfymimIb2JBIAa1W+xuTrKgosanReMle+mxrRF6PBzm64/m
         445us/266REVd5DkYEfdcSlBS6f/VTacvSURSyNrGVZkSIwznf5Bs/S5RsG5r2513ZL4
         1MUk4a2+j2rlGreH7/dqegVFPRgJOJh2ev9tTOkgNeC7IcNqYcYPRIMufLsAA0pus+E7
         FAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933708; x=1788538508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=mTdeSMoFSiXK/DLkGTe+p4dFwEsxQaM/c9eEUa2bWiRoIPs+gDESvBwky6hYOvABiy
         hbKFPKMJWoZRTprzWmYTGf8beWZCFXdx9LOjfKNcjxNubmsm2gEhOmzrwi25hWze/zj8
         DPBM6KsSgxIYnbLrzpOHBWo3drGiWm5WES1wQCl74GWhMfH1tmVsqs5HBAnYiu++Jx+Q
         9HbNsF03jFxObACYmTSexK2JF9KklDnSUmX0Fh35oSITZfhAgJ7WtjwTnmxbcbXYH59a
         8oDX2DZJPx5vLId2LVGQisAwW+nE3bVMTiTzxrrlIJEJ04QI8PISWg2kWL7WoHk4RdX4
         bJGw==
X-Forwarded-Encrypted: i=1; AHgh+RqlcUHaKp3/dL8Jq22vaH3cw9H9B5KVL5D1kwun337hv4U/9rx/4IlZ4E5p9yJNwqnBC8WXBLewQSMSeBQr@lists.linux.dev
X-Gm-Message-State: AFuF++mlbz97JeVgObBGcNeNiVunz7mFLbN4D5W6md7/8+dk2Y5vHC+O
	CjDK5PkSOD04u2ySutwQZUL7SaP1Pzm0EfMSjOk8uScQEZOzBN8b+jYv
X-Gm-Gg: AR+sD11qbl3p4VP2cl+dl340h6x/4O7dzu0m7GKSZymhCqyGqt4qTMLaYHhpclFdyMl
	59rPakcW3n4FJm3BAjxkOfg2Jr8RphXQ5WU3YKiK8yKvnh7ZmQNwJmO4H9fUtl0vK0eRXsCbGRL
	EPyv5CutLvOkXn0KtTi2lWI/MJDJCYM0PY+yzMir3lOOHzm0rZFwFfA0hTIAZG13B3RuL4FlGrF
	19wZ03qM0gOCzc3EpAkf8efeaPI5phiDiWw1VDcSpYDYLpf6vdmJaSwSYv6CzERJ/uu9PZBGWyJ
	F21VIjjY4MwD2X19weRBVgJjAnAl8kPW7+szNWznnVEahlABSDWOMGArQGzSpDZTuKyRiFQvT+L
	zpwBl9Qotlo59Gnefjwo4/fwrvA9pfmRF7Kbr8pZ2x+LMBe1WTBiHx8ngVF6T9BBrzuYAP8hrEX
	JPhOt16pJhHbWGo2zS/sd8KMiPM8mPUInIqRC2lui8BTRwpK2hsoRURVaBAwbJpWmCImKdFqhi7
	zVWPFm0xx7CnDIXT/tZWpU9+NvQeGl0j9sdtqRyNw==
X-Received: by 2002:a05:6000:41d1:b0:47f:b51d:f0ec with SMTP id ffacd0b85a97d-482f79cd0d2mr14102631f8f.15.1787933708396;
        Fri, 28 Aug 2026 09:15:08 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:07 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 03/15] media: ov2740: Use C99 initializers for ACPI IDs
Date: Fri, 28 Aug 2026 18:14:45 +0200
Message-ID: <938b7c91985b4bf4b20dc9722453c44a4917a31f.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0

