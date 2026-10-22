Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700707;
	b=UHybtNELcbZoxnwA3W0ea9CAwlJ6njRgix2uyx8+gGF9FICp4Wp5cBl9Bko9AaTQvVhn
	 Z3AhnPUwKcaLUyE7/P2Nb3Xpcj6GnW+fWW+jhJosWFo7QgnwFmzBF1NRFWjvZ2JC1bSME
	 touI3TvUXl1nziZ2Pp7wXirZzE0OBU6Kqc83UGblkQ/NWkbpzndYSJMm8RZ8sJsd3M7OS
	 i/5kZjPan9ClC1NEcN26T4/6Tu8VDE15ysbqaRvl/MpQfuuhT/95E+xQyfxYupXw6nkvQ
	 b6MErO5XnXHGSRY8dUNlk8jBaVWTcaXNWJVnNzkVV/33kznfR34fXWYtHW6L5J8lZkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YlblYhcykHoL947/Q/nvx+AeatTsVJAcpdiRSXriyMw=;
	b=3FypKp+0RM2vYJgF01KFXgg6hh5xBHU6qz1rbUA/qscTCoNc3MymfYWct6dnqoAZd/XO
	 jnd34MKnGhgf5xtmsWJURFwr4HVU5ufMeeEdKN4J+cDtyPpIm0IcFAwzpsgK6E9N0ERuu
	 PBDMaFYyLGQMb8pCOjhS2YUZ1cY5roaY+yJqNZcuC5ivw/6fd4+9kGiu3jFJ4Kr4FbDd4
	 PAcPeuor4Up/2oosX9RDD19YI15ub0htbm+NYPkHJdU+PCL1K8SAMfjuGXAiUtOZparVR
	 Qrn1GT2tdXr12qQJbLW76SPzOCdSiLN8fuSdv6dJLhdd3aA8t4fgXlrnYm9sJJQt2eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="cb/sJzCJ";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646AC606A31B
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 20:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646AC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cb/sJzCJ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f036b17easo568293eec.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 13:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792700706; x=1793305506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YlblYhcykHoL947/Q/nvx+AeatTsVJAcpdiRSXriyMw=;
        b=cb/sJzCJ1ikCZ5Me6mqMTd/K2S/CDiOZ2EMRFXfEcIvoNdRPhPmz22A7Xtp8hhViBL
         J2qevdgnQBAlb1LupW0pr/sa5Q8d+ZUWIpaIxBn0X3m81HRf7TQfa4q90UhQJH1PCJ8f
         Z5dhEEUtsuyYD1T/qZTUsetEPxYr3hiJCLw+oMWHkL/A60WPjIwknf3TLHUAFUk307DY
         j056fuwDXO49PnippAMcums/JM4jS+b8XPWFhahY266zD+JPOTYIcP72MXR9nkA/30v3
         EIrJFhLn8d3cdLB1f59+xtXC0+lis8XD4RUS42Xt75qfzv73o0bNV0sYVavwVoGo8x4d
         X1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700706; x=1793305506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlblYhcykHoL947/Q/nvx+AeatTsVJAcpdiRSXriyMw=;
        b=jwRLYiQaPTxamyB+4VhuVOu47H+9V3C2f0rFxHdhMLzOtZvPOX/mHAgUkCzTXrKWn5
         x3NbQ4F6uUC930B92jrIjnb9IRxtRkQ52ai7vYwcC9Hfvfxixe3L9hOU6rbiXtI/wSwm
         BgxCVA0bh9y1J2C7nsEPkcDqWpqdjoqOGQ7iG6pwdjcX57xJJkpqtSE48y+yEgFy2rnI
         I3xRnLTpxMIDEi6fKSHz4IwHX9ILpOa8KKoZr7+EZsqElorwwst134pqxyL7427ZUWBQ
         34xpTLT0FeIKaDCqHaSkZNhm08K0b2gAJsvDnxgxrTk42fjzhl2WMPGLo/4dnymAmQ59
         G0Tg==
X-Forwarded-Encrypted: i=1; AKwUvByEZhF7ItMvvCgY0fboeVnkNFe2gwp0H+4danMl8VS/SK+qoq+taPwX9kZGnJkeMTfzK6L2oyF1tdPQZKm4@lists.linux.dev
X-Gm-Message-State: AFq9FYKARokV7ZQgQViBFGSOYWbK1rQs3g+K3iWowmNj5+y1nZMCZiRG
	9o/8HYyqLzHNBqjZmYF2BCA/wmjrDtPAUSn4h9RrI7snwN1YhjmREZdl
X-Gm-Gg: AYBFou0asLV8hNLoN0YPFiGuNHSATJh/qAZRrz1jjK4RBMQBsOO4xu8SqzlRluqeJ1H
	rD07cZ/340WOIaZ2CEh/0+v5tKuUXDmHAShOwtV/9rGaADZsAtZNUl6o3rFlo46BXUcD4MmdkGE
	71tavWy51qulgaoeORRp6BUVi//pGHZ4PpeBFA5Zke4O5SmJUwe7PVc5XMzWPsMN+WbKMyfbGap
	AkQ6Zir+Uju9ZHr0c0nWiHk+BNdnsBGUwdqEGQbVNfDNIinHW68etHr3avdpoiUHMEKv4VAww+i
	XhRSDuveW3sWxvHC0JX06XauECCs/ZqtKIaZYtpBVCbCCEHu4KddoNOVjnKv6zxN9TlLUHowt0p
	Vr9uQSpjYgcwPEK2p51uo9bnPyT5GlAz4eEJsnlDYKckSynvPIipofVqMtdPYOeFeVFHqB8ptNm
	3pN8aa4EoeE/mV0MUED3yypbezJjFqrYweTJFoYjQS5nKMaT8OIXDOh1rOydXbs1EMS2p9RJ1Ki
	op4iMTrSCOD8VwxIHe1eQf18xtJszqg0x4acrSE6mM30QCayIu1i7F9pjnkewuh
X-Received: by 2002:a05:7300:e9cf:20b0:365:f73b:510b with SMTP id 5a478bee46e88-369d971f2a0mr324415eec.13.1792700706330;
        Thu, 22 Oct 2026 13:25:06 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:5e95:3be4:ff57:f0a5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c0e60dsm331332eec.2.2026.10.22.13.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:25:04 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: greybus-dev@lists.linaro.org,
	outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v2] staging: greybus: loopback: Use fsleep() for delay
Date: Fri, 23 Oct 2026 01:54:55 +0530
Message-ID: <20261022202455.104142-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

In the loopback function, usleep_range() is used for short delays
and msleep() for longer delays. This requires choosing the delay
function based on the requested time and converting microseconds
to milliseconds when using msleep().

Replace both functions with fsleep(), which chooses a delay
delay method based on the requested time. For short delays,
fsleep() allows up to 25% extra time instead of the fixed 100
microseconds. For longer delays, the old code rounds the
requested time down to whole milliseconds, while fsleep() rounds
it up when using msleep().

These changes may affect time between loopback operations and
the reported performance.

Suggested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
v2:
- Add more details about how fsleep() affects delays.
- Update the subject to include the loopback module.

v1: https://lore.kernel.org/outreachy/c482704b-903e-413d-ba7b-5bf31c0a6104@riscstar.com/T/#t
---
 drivers/staging/greybus/loopback.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..2fe845eaef29 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
 		gb->send_count++;
 		mutex_unlock(&gb->mutex);
 
-		if (us_wait) {
-			if (us_wait < 20000)
-				usleep_range(us_wait, us_wait + 100);
-			else
-				msleep(us_wait / 1000);
-		}
+		if (us_wait)
+			fsleep(us_wait);
 	}
 
 	gb_pm_runtime_put_autosuspend(bundle);
-- 
2.43.0

