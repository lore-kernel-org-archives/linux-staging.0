Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9104F3E5ECF
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773251646; cv=none; b=WFpAMRjYAIHGTbj0IfIQ41wupAC0QVpXU53yGtTrXbUlqETxAnP1207Mi6HIDbOUvhtxVnAthBDmFXG8X/S2DBcD37eZmcZ5JvTEIMTWrMIBOGLDdXcM6syFStz5qJiYrxKwdDVPMmwMY9mTTdo/wJWvefuYGQYeQdbjNFJl4kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773251646; c=relaxed/simple;
	bh=Ut75sK2roXSZ1235WPNwYOjLiUxuGNO1AJO95KR57es=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R90SDE0mJCkejdul6N3GyxDQzbI5WGPF3T6GSFbBdnnQk0ZIqTbrFYnht6JFrNjVNzcoreh4jFBbUe5oojOGnR0mgUBze0qYRJkAUfcE6Esi59zqujLChFMDacjLuwnI66iMoPN9DGd0hO1HtKkwkH7Zem82/L7xcwta05+eYPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSzsfTfx; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSzsfTfx"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35691a231a7so55170a91.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 10:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773251645; x=1773856445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eSZEw1oaxRjt1VgILiCFj/G1OOBannvK8EXRAOhSmrs=;
        b=gSzsfTfx+OAq6lnWtzEMzK3V6JGeNALzMfxG3mQkI/4VIdM+LhVWIvxjm9ADKCB0Ex
         VlkyUA7Qsl3k3k4t2ZbMX5EHCrPv9e4RnRQKbS1gwTfV5Fxjtt7biNu7S2zRHwUG5KAk
         Vym9/XnD5vSEJMxzSROE7lfVnsYCrGS972AbXzZ9HI3AbDxmsqpYxx9nZdBQjONXj2v4
         gzE3x94CUDOGasaNk13ZxonDHYXG9vIpEaRlOGHndPnFFZVDW7v3fzWbBCBhG/vy1uhY
         8CcGWeWJT3sLOH9azyCGK69llGt/SLgErYc2TZeck8+BOQhX7eOIsoj7zvH8O5/s/+va
         Jdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773251645; x=1773856445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSZEw1oaxRjt1VgILiCFj/G1OOBannvK8EXRAOhSmrs=;
        b=UzgGVa0ZBneQER7PlehIa0iYIuOgHDQSw5dWLx8GZ9yDwLrXjb/3Xr4goPfhxw9zg+
         TV7sFreCGp+d81W5MSlWXLRFcPOC8L66tSJ4qPRX/Cv5vU5NzsHOPNESZT3lOd1/AWjb
         HQ4ZZMsfaoFn89TkUCoFulOeLs79GluE5TYWF2mH4HMM0rw3fOC5St1bPpCqVL91dfmk
         Sm4VbVJOg8IyBZi8RiksRab6bcMy8Yp23kBtccDudxromaMpcuaksUcCPTz2+rh4tXDF
         9iP9a0IezD3J8Gvg5BdRMcqUkmbFcNrL3zwUiSgTM2Q7nOgRklgC6najDPEW7SqkojkC
         7iYA==
X-Forwarded-Encrypted: i=1; AJvYcCWRHUJsa8Q1XFUBx/12+YRrHmH2Ec4JynWwNoir53qJcYR166pZ1yEJjTP5AkX7N7aelBnsKgyP4o1DiwWT@lists.linux.dev
X-Gm-Message-State: AOJu0YwM4o2+9rGqlrRLEMQa/GEgPtwvG8MME+wMvs2WqQ4g1kdJzEPs
	qRm3/tjSZEEbSuvGcUpyEf1pg/RKqLXNNJbR3hY/EwFj08uCBzlO8/Ca
X-Gm-Gg: ATEYQzxv0gDBNiwKRc6YhZJ5/BSBxuHdtUlZGrDagwTmoFCLLumunppdmGaolIUWnku
	Z+KeDmo0P8HIq1as/mOD7GgYBbChswojovogDT2whsnGvZIUJa4Fch9tb1CLXDMLH0CmUp7z22z
	z5gIRE0IfNtEr7p/5wg0/0sXGHcXY3GEHoV0vzCmHyQp5X/fQ1YH2OhtOIRwP4WFsKWtC5l7SNq
	8dRv8xD/kiiW4dR5FRkuAxAZdgLdawMIIwv2k/HjvDl0Nk8VOoLiZwLBhmnErowxGOcfJHSuOPJ
	GwewusOfGBGsQHcbc1nXIcsPiBHMHvhW5qu5wIO7D6IMk+7qrQSFV1uj+zqD5VIfqCef/6UYRqY
	3lEVyCD52H6gwApTX0Lu47+j1fTPrViOPv4hEeq9racY9VrXzIn2QriAiu7YF2BrIUgUAhUjvCv
	7WjAOma12JvadwgySysLIcWZRFfGH8jusFcnqy7vQd4Wve
X-Received: by 2002:a17:90a:d60e:b0:34e:630c:616c with SMTP id 98e67ed59e1d1-35a01a5ae28mr3144333a91.31.1773251644843;
        Wed, 11 Mar 2026 10:54:04 -0700 (PDT)
Received: from hyd-e160-a08-1-06.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a0bc58b44sm1420658a91.3.2026.03.11.10.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:54:04 -0700 (PDT)
From: Rahul Joshi <rj5547884@gmail.com>
To: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rahul Joshi <rj5547884@gmail.com>
Subject: [PATCH] staging: greybus: gpio: add comment to mutex definition
Date: Wed, 11 Mar 2026 23:23:34 +0530
Message-Id: <20260311175334.464391-1-rj5547884@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The irq_lock mutex is missing a comment describing what it protects,
which is required by kernel coding style. Add a comment clarifying
that it serializes IRQ bus lock/unlock operations used to defer and
sync pending IRQ type and mask changes to hardware.

Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
---
 drivers/staging/greybus/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 12185f7a982c..89c15b804b2a 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -39,7 +39,7 @@ struct gb_gpio_controller {
 
 	struct gpio_chip	chip;
 	struct irq_chip		irqc;
-	struct mutex		irq_lock;
+	struct mutex		irq_lock;	/* protects irq bus operations */
 };
 
 static struct gpio_chip *irq_data_to_gpio_chip(struct irq_data *d)
-- 
2.34.1

