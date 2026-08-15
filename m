Received: from mail-wr2-f0.google.com (mail-wr2-f0.google.com [74.125.225.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3713D374169
	for <linux-staging@lists.linux.dev>; Sat, 15 Aug 2026 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786793902; cv=none; b=i4em0kvHreACCZhMLcDBbxqUTjE1SNbondyQwjKOIlkOvEg+PezDUSVkU5mUsz84rwpYJREYbS1TeBqYSX7g4EnVtaplputrFoahkCzMyjung1MZIqxCNIUvvQf6zNHKgASJ0ufrtmfGoiUyZrl8OuwAaPWWfg/0h7MG0Rw8YiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786793902; c=relaxed/simple;
	bh=pc5zSK4fV/YfSvOVtwjzBL1c5Pg5UxXYrp0Msx3zr/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f92qYI2cRptopHbdUX4sxCKG0bzLJgLuktpJJyqv+ghxzSGi0o2RekljdoBlQha72GTBawFZgX4RLtbo5+Z9J6hoJPHSNAAur+8Ecu/gXgMM6GYYavZmbj3npEqApMXaYOSriR6vvF/vFLrr9+7EPCscA60WuS7VFMbyAPz0O8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+xKvWe1; arc=none smtp.client-ip=74.125.225.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+xKvWe1"
Received: by mail-wr2-f0.google.com with SMTP id ffacd0b85a97d-4784b41f3aeso434183f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 15 Aug 2026 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786793899; x=1787398699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Gk0F4z/DVg0q+/rHeu9EZN0JYpqsup+4pZqfG/Sapw=;
        b=b+xKvWe1kswsIG9OUXSVImMtydi5k54c4b6oJrVfZ6l5m8TlToxsRzlZj7FIdlt0Dk
         zVdkMSB2Xim+d/4c/6OIqEsQuKqNyDjmn2M/F3Ufkh9QVIgCEIgkhZBQ1x0qrDuPRt1E
         zUX2nZOSZJsfu4pfYc4d3LUB4swvrxvFIebDOgSd49UH7jSdcD96ULF0/r7bjZSHSPXW
         FSuwKOqfH+YusrA/fSCZSdgzwJWD2txzNM68jIkzExwO88ec9rMvFtGwKqzplzO2Z+Mk
         FhCOGfhQ4GU3ikkafbWbsHd8RLjrEAG9tOf1iAeKoBmIOkEfwuPgG1rNXjUSEvxkYXGA
         AJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786793899; x=1787398699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Gk0F4z/DVg0q+/rHeu9EZN0JYpqsup+4pZqfG/Sapw=;
        b=MlJ1quzO6zuPqivvEytBGmr4Ar/lNI23IaQIMtGsi+YCdGO2ADdcUzHGDR9CrI3RIZ
         PlFE865lOK/+CbtG0h+jbOKhjr/Q46JsuauoMDf+dpdcn0HCyVwC8rqGm3dey0aUTz/1
         Ism2GtKQzD/Zu2kZ9qmeRERVizepkMDwfcBxMInjcHSivJuv5qlKxJn+9FOQlMd8vbX6
         WSh5l2lQ9ZFWFfu1spoOfoN+zFCVb+r/uyARbu351onrwxbE5sx60vv7Br9hH7CC+gsV
         ZgUjRX2z8oYrUfbnrT5cHO3ylSRd+CIBZbfcZykyfRbJlnXTPN1GWIkdXCUEZZeiz+58
         XjYg==
X-Gm-Message-State: AOJu0Yw5eWYF55ud+fNJB99Nm+CHMiGxR+jM8mGXzyOfmZxfMokgXNyt
	SxMdNShP8w/xtgl34eyEihyFsHGy31YBmePDwkKg7rKI6YfcGV5deA/v
X-Gm-Gg: AR+sD11GBw56esPuSTGs/S8IcGEXDOVLL7xqmMeSRFs0VwBZH39GY94FSxzcMisWn0S
	deZXylxFrhOwxmC5jI2x17yfe/9BTdplb/ZE3JdSAevKL1VZ/2XVtZ/KkMUGmlxteGKkyOEOuB/
	qf+AVBJ7eQgBMhBEVhOsFs8/X0Bkts+Yu8MgsD7Xf5ygHJyOjgcsXdTFZa/fU2VGov6ikf4mEP6
	Vda3HFDMBfKhESceB/t0kJ+oF2jbWoxepcfi9N+T9KU1DRG00+2OBeNjwC0+7q36zny03QPaWlx
	EfF4EN9/tfBsWIkRVMLw7K7wPacZYXH29HvzaK4V7zKE4Ci1b9kHLvIETg2DTTnBWuMHm3e9ZOw
	Hpy+r90OoB2ss706espyKCRSsOOtITVya5GJNGMo+wiSL0GueN1npIvQHeUV9suvJfL/Cu89gCY
	4nPwHLe1rgnrIZSDERlmrIlDFU7CcNupPxtR1OFr6UoRpImLBB5JfjR8L0kVp4PJRcrGlM/c3ct
	pivVTAJWbxs8Z/HmAN84jlS4fvqTydThAm2fyaV2tCvXjetkSjeK0nwohdWv2w8iUj0daooNUCG
	aCkMYXnOvvSprgO3NPmei+NGHRmaNvEZsQRdw1wTNntixVeN/OWO2Ip9piv73RROPUuGf0isSrb
	HCEQ=
X-Received: by 2002:a05:600c:1988:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-4998798dc17mr168824335e9.15.1786793899342;
        Sat, 15 Aug 2026 04:38:19 -0700 (PDT)
Received: from arch-btw (2a02-8428-96eb-1901-000a-d617-f7a9-40b4.rev.sfr.net. [2a02:8428:96eb:1901:a:d617:f7a9:40b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b27bfsm16880472f8f.23.2026.08.15.04.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:38:18 -0700 (PDT)
From: Nawar Alsafadi <nawaralsafadi1@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nawar Alsafadi <nawaralsafadi1@gmail.com>
Subject: [PATCH] staging: most: video: Remove unnecessary blank line
Date: Sat, 15 Aug 2026 13:38:03 +0200
Message-ID: <20260815113803.23727-1-nawaralsafadi1@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unnecessary blank line before a close brace '}'
to adhere to the Linux kernel coding style.
This formatting issue was detected by checkpatch.pl.

Signed-off-by: Nawar Alsafadi <nawaralsafadi1@gmail.com>
---
 drivers/staging/most/video/video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 78234620d48d..5c34f93a0774 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -439,7 +439,6 @@ static int comp_register_videodev(struct most_video_dev *mdev)
 	mdev->vdev->release = video_device_release;
 
 	return 0;
-
 }
 
 static void comp_unregister_videodev(struct most_video_dev *mdev)
-- 
2.55.0

