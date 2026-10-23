Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766943;
	b=Z7OYcjZ51rl4RiMw3VbPLbfq4TMfHgkJGUUuwJn6IJ2Q2Uulxq768r1/bTIw0TB572uq
	 eZeAN4gnNCXuceZpfQEzO5EuYoR51mdAzc5NJHmXCg7JyabmosEIVcL7xa5gmLgLSAxij
	 84arKf4RoXtxt70kCkj8YRYyMR/m77g2mFfWRvMCLx2H9v8somXhCM1GdUKeYKwtJPlMC
	 fgfr3F22iA1jdph498PAYK7bp7NWz/dGxQGS3dJsM88F2wbepMUFw7eJ7/sJyWhBelBZJ
	 W/LJQOyNmU/4zisqXS4wPhHa7TgeNW46OmNnE70/EcFlGOqYOJuljrOFAvWWE5MvQrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IdkYUYs5y4Iem1sFLDu3Lx/OAa6FaPFzLzgcEXfMeNg=;
	b=kA4Hpn12MaTJgnWu2UQrW1Tlzkp9BWq5S74w2ctZqu4Bpcatyiy72lxH6eutY9pKRE4z
	 Yn0BZ/NcD8ixTdWmcw05jlIps+aELicia8NaMdLDySuSXrBOET3gvVi4FWHL4l4q5FkJv
	 /HCfDBYCZosBWGj9xRMDMY1Ni9MzQovpKpYiE54l8+59/0kWwB+xd3u99rG5i42uRzkFz
	 6xM9ipjBcyb/iJnkgxklKwN452ktLsovUhzKlZ5htmEYO03SMMOh5GC3jvSGfLB5hlo6k
	 7Mv4RVtxIqYbzPBdtmVsmDE2VRC+oO/IW9eIN0oNvGwmxJYDUpF71gLg3NiUqoxA4NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cm11sDsS;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B53606A31D
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 14:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B53606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cm11sDsS
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35ef6b49813so1390134eec.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 07:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792766942; x=1793371742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IdkYUYs5y4Iem1sFLDu3Lx/OAa6FaPFzLzgcEXfMeNg=;
        b=cm11sDsS4sgWBMBhXsM/5+5pswWpyMT1y77kDbvbVfnZE1vdjr4eOzrjYEVfixaeTa
         6cdIFpYb2zeqdBvrIKA9zh/b+pa/IGFYdanXS4AzkfJlJvA/GphGzaVyZoUUAPsHB+ms
         9l5iZqGXiW+sloshxhwJVpsF5yh9l2avHxmWZN57YSfd17ngE9MnhiDhCEUBJHvc62D9
         mgGbyIXAkMTmGGY0YwQERya7Ko3YKFuw/JiD/+YD8DmBSEcPttlZG9vouaiM6MSVXTTS
         YqVXeW7UOe+OtiqERQ5lu5MWd1sLemB9dQ9VePsboZCeCZREuBNnW12u+D1qJJ/xJHeY
         u9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792766942; x=1793371742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdkYUYs5y4Iem1sFLDu3Lx/OAa6FaPFzLzgcEXfMeNg=;
        b=EPhp5Ir1vE5dgFtx1GmaDRA8hzrwnHPccqHuZi9B9tMEAYI+80w1I8iFcOJYO6pV8Z
         A60NP2z1sMms03DuvijOiYyH4bS4SqewwC71S4+FmVySvDRF253/XyC5bAr8vzgzcmUb
         CjHSqgu+RMHStNKD0yDhEuoitN/NRxeA0F6ko1sE+iztydKamOQ1nzkGkXMA3KCN1WXA
         tHH74cEHbOht+NDEOikqflkt06HJfy/RAxrecQ5wMQDuQ84nhufFYGWOY6S0jAkma++/
         UUYyxTZJZeAijTAsjt/WucvisnV2kLWv5txAXQ1WrbZxoZ4br6YOXpRtdIEJwQNvGLO3
         mcoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoyTCuLvDKFQjIBI4loeQJ6Yfwt7qAS0phOBGGHMom5mJPdYK7MB83Lg1bgJJten7StskGMoF5U49H1Kt8@lists.linux.dev
X-Gm-Message-State: AFq9FYKb81KVPNVumwv1Zc6gYSF8kHN5/BDEknVrkQ8zuvxpx4dkV8wL
	AZPkj/F2fI1LDuQk2bOt+u5OYD7Qw5H5Ulc99jTEa8IB6R7OzKY9ryV3
X-Gm-Gg: AYBFou2XV6fHVSdaBt3DWWj1q3jjU7O48gbqJrShZ+nLgW1GG3LDsomIum+4Z5byCon
	M5HCqnswyWMliCUj/ehAIV3tyQTll0svUV48m5NUA1I+lEm1DdO5yeZarQNBWwGwNOhN6inbl7K
	WVOKP5VKDSmyccnST7q25zKMgINP4JNzFV1YhVw3ho4M3Cd186nx/Nh0eLXn7HRLC6NklwKu4mK
	LzssIY7pbk3oxvapuGwFMe665xxldeF/mh6Zid98BwyKuwcbj7W2co6rk/2xCakLUV+Hx7N6GSJ
	RS+qEJe24E6WjzAGGSUaGawPe447RKdM81orNPbR0Px2QFSNy1xER0RYvTyNROgbgw5i5mpRXtn
	wTA6cRHzkjoMIoQG3amfXEKSDUsnPGg1s0GsFjUm8u3IzmUvlWWVtgLnoz4G3XTFPVMHQd/g6Xz
	LNBepugMXtLJ6QdnK5EHHxmVmSWIh0OeOPsIXubr8BBCjseeu7G3P067qqo+fGR8fOy+pSFXAFR
	NoR8YPADcx2qyXlGEiQohg8A5597xO5QpEukoIT6hbPXojlyulMUiZhuto0IBMtyH1XCz2dPlQb
	cbC1kB5FwQ==
X-Received: by 2002:a05:693c:811a:b0:35c:7d45:c6ea with SMTP id 5a478bee46e88-369d973b2cbmr3142150eec.19.1792766942375;
        Fri, 23 Oct 2026 07:49:02 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:4145:da00:43b2:a151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e6db0d87sm338792eec.4.2026.10.23.07.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:49:01 -0700 (PDT)
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
Subject: [PATCH v3] staging: greybus: loopback: Use fsleep() for delay
Date: Fri, 23 Oct 2026 20:18:51 +0530
Message-ID: <20261023144851.51019-1-pavankumaryalagada@gmail.com>
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

Replace the existing usleep_range() and msleep() calls with
a single call to fsleep(), simplifying the code and letting
fsleep() select the appropriate delay method based on the
requested time.

For short delays, fsleep() allows up to 25% extra time instead
of the fixed 100 microseconds. For longer delays, the old code
rounds the requested time down to whole milliseconds, while
fsleep() rounds it up when using msleep().

These changes may affect the time between loopback operations
and the reported performance.

Suggested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
---
v3:
- Clarify the reason for using fsleep() in the commit message

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

