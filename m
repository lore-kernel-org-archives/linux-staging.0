Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BD0382360
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 10:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815723; cv=none; b=tCMHkuhZdrbhPr6mmddRQUBIJv8FMO7+udnrx1vQanafgMw7e7ez2rQXg67VtaNeB+caphNtJxOUwIx2VQKe8HyzgQ0n1k4eL+D6/fKh/X/XQL9sPEOF2H02TnzkI75o+RZ55+k42Uqtf4qCa4wD8yLVwITl5Y6fm61CoLvKaWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815723; c=relaxed/simple;
	bh=WxRfsyEZRYxDHjtGXo4YWmG7XMdrD37sqEHH7ZWIcYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMs1jbVmt/BxrHpqsBG0M6VN159zCEIANC9Mi3igz5GYSsqKk6X1raXLBbSBmJsnNRfZoVifnxS94oIw67GsmKm5iQMY5Yk7VcLkJ3eG5dKZT6vzGabISkUsqOkoS4HHb9xJeWmGlm/E4MhJWCsu54A0C6A9LU8ChKFBgFDybrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc5gjdep; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc5gjdep"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so2633020a12.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815720; x=1776420520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwqkVEN1x6/hRKrMN3cHJmOvoK903oMVODNQt0I4fO0=;
        b=Dc5gjdeppgS9ldmRbMnHOhziFwlJwuHv3+v8k41vZECNuCBWFOb2ZB/FAYPPm70HIh
         EEQ78MP2r4Og8SyuTUpiC5E4EAkmx75nUYzwpTW3F9ujzqumBG1lYfbwMqYhwIhBVJqB
         90ss02NC5id+RRO7z9qiZ7JDid+2A1SCa+3ImbxNI1kLd2aJ2ZrmqN9ftGWEUkC1KCPw
         8Q7zozdsT1KpoR3bUWnSJFMQ5vDoNefP+UczsV7a7dJX187owKGLEv3Q8QpUPcmB5dbK
         zLDi1GkP67z/tP30ALZw/4wRCW3NCG9NjhVX5CglBVqim6jOHhYw0rXw3cDzvA/wBh66
         YYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815720; x=1776420520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CwqkVEN1x6/hRKrMN3cHJmOvoK903oMVODNQt0I4fO0=;
        b=qU+IbYXP7Wy9ZTY8goF5vll/JcY98qc5uce2ncyzEHcEX6SZ18Kb4a/vVwaBULFzaw
         1x5yBOUrEpNyoxeRu5me5/GhnEa+ZGcZHmhzSWSj2U3i9mlPYWqPpcNUtVVa8eZLPQXn
         3MQfuxxndxuy9hvRXrMcMbS6ETT87B6giBxg4gtrc2DrfS342z8uTJf9jbPKc6Nr0IQ/
         NetKd82Vs3Wzlp5T5FxvSKcUNXDu8ci16FQOS+jRZgoGumtCXtjxJeFVAVGnMvQmM8WY
         ZCBS45InaYmNa89Y6uYEJgySOu1dzsVoiwWfH/dKXNW4jMwEF29Cgn38IXoZ1Kw80gci
         27LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMqJDr0VhACt3417GGLDraPFvihzIk2SSakGeOZHPa20w2wbPMqP5UcPdR/0ZNijttvnXWwSNNMnEReH6G@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7BLOonJy0rFII2Kq1/BoIhOrx/3W6RSGbYD2ZNKI0fh9tMiCx
	JZRan+xYIgQ9QDfisFw5neTe2834T0eQp/LgZ7LhaDXIObu1dbwB7L2nM8IHpaZc8Lo=
X-Gm-Gg: AeBDiev2Ps+Vf/ZyjBOnOStDjdAEozmUFarUYGwiL0uLPgmqqlu5oaV+Jfo8JuA496F
	wN3Ato/seJxbbd2vCnyjWyhbCpwZMvXbbSPjbyJZO1DE7C7Vw62VBGh6/AiTHk9szbp098+B66J
	igO2yOV/7h8tuuu++ZfLIuK5HxWTi4H2Q0/pyXkkrbN5vSWEvNPewR/CEV2lRpvaTIm/JAmdSF+
	IGX5PYzl8Sy8tgv2g7rXdhxraKRewqg4Hi3UN0pJ5pVb0rJVvQrrHt4yJQ7ORUtKy8gGf3kLevp
	FR+XZH+udanUUZnpbJJ6hNUN4TJr31gFXBy7W1WAcQDdao2VwFNQ4/8qSMUYha2KJpFU87C7wI4
	yG/pcn+Er3ezCUT5HXzqZ3iUSqk705mVV1xRbTFSk20T526JH3TIns4ffT4f36oEd/mCwWuZ9NO
	rQZK0I5WXGg6y8lfsfLrIEiFj8SJEGJy1Um9EYd11UlOsu3SfJa1FTIiwP2ubuG8mfu/O3UAhdO
	LxL6e8pj/h8BykPbae+MsWXeGfTFtui+Bcjr8G4sFgbyMZu9EfpaYZAiCk76f1jOnqjnkZgg+M3
	9u9nvXSAXY/v3ZNMTbtq+jcT8eUt1swnoRjeXGwUgToRM2cL079qnm8ua41pawrumiYji8pE33v
	RQHvXJdtCvGIdzeI7FMI=
X-Received: by 2002:a05:6402:a0db:b0:66e:5622:a2e with SMTP id 4fb4d7f45d1cf-670798f065bmr1077332a12.22.1775815720029;
        Fri, 10 Apr 2026 03:08:40 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (216.153.158.34.bc.googleusercontent.com. [34.158.153.216])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670703f1340sm433488a12.10.2026.04.10.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:08:39 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
Date: Fri, 10 Apr 2026 10:08:31 +0000
Message-ID: <20260410100832.1388-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410100832.1388-1-joshua.crofts1@gmail.com>
References: <20260410100832.1388-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove kernel.h proxy header and add bitops.h for
better dependency control and code clarity.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index b87ea1781b..1f6ece79b8 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -8,11 +8,11 @@
 #include <asm/div64.h>
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-- 
2.47.3

