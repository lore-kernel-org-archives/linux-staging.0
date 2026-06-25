Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141133AA4EB
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385372; cv=none; b=rwjgO5JgFKoKYpZHn/U9XJPwMNI126w37Da9sTrWSfapWf8n64OHuiWs8p0DiRlFny7BY1l7/mUq/8BFNzLgN/Sov9epJzbJFTmCPvxpnR9C/fO/DGlgv/sluYSr2k8B5siUXo1bik5z0wYNJbZH+ytLka/EmGZYFsCLu4iL6x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385372; c=relaxed/simple;
	bh=NR4F+ieQeaovMU2nyAUcUaMtGH8xlJq5lhLjB9nQPQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLliEar2DHoiAkiWcg3QUfvFwVZo0uuB/1+bT9a1ah+kNY9AuezJTjqMqAMrdMuKB5jnTWsOZbbLZdV/nzzxQXwq6LWyyXd2wlFPo5Ob/UFmKGy0kTTcNsktvWwVjuFCdzPd6n+msrovq9d8NnP8y/rcLVMDhmrFK/EA3En60Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rB7G1O0G; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rB7G1O0G"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bc806fcf8so2590971eec.1
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 04:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782385369; x=1782990169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzVXIO2M/zZGRMQrA3as78zSud+6/fQ7nehrf8i6Zh4=;
        b=rB7G1O0GXkKfajmd4prjxM+bSWou044d6Mk9DCM78veiGse1pc1ACrNlVg5lDA6qIt
         E9XaQ3YRa64UWotm04cAUlGgu088gX7uqAsZbnDClEzGW8YgnS6oCAccW0CiglKkHDV+
         0E8KyqIpkGDR5mfRF5tFQbjSu9CA8dee5boHmN5RaR1ndTofAAP+j9KfI/1jjA63qbnf
         +uTGA4+PY5kLd8en4fyqje51np7Ixleas1qZ36L6iowgu9SUt/YfqNACHm2SCOyXZt6k
         WXgvb4YmxaqJejsvRf4p23bS30qFXt5uTN5TL0Sus6zaTPTmwb0/ETk50lpCOIU43Ja4
         KQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782385369; x=1782990169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dzVXIO2M/zZGRMQrA3as78zSud+6/fQ7nehrf8i6Zh4=;
        b=LP7gTEZCNRsyUgmbDCL0gly1oYc0c7DtMRe+o7oMADJmAhvksbF8OEWi/vOhzN5V0y
         wxyxMW0DXKGsx1/Zq/cblSME9BvMbuWjJdZyHSS9ubF1DlTI1wCxYUU9hUOWOI4gF9sr
         EggtrKCIYT01v8XZ8/sRQ8x9sJtsZjloKsedg7QWkh5vjlgBOUg+ScTY8bFkrUOfdLUE
         J/uy9t/yRyVrQcH0YUFvpjM3S68b0njqUopueDMBQw2Pqi1L3f9tHNaP+KzYto6dUHXk
         JWnMNEzIkty6WwAZHrZdOcGRjeRqkZn+V7rJ/MXWQpRbxSWIVixV4IaqrMzgAh+seuxo
         G/sA==
X-Forwarded-Encrypted: i=1; AHgh+RrNW4J7p571lLDnFoBIrRq9HakrGMq3rVDeC+Zdqfnd7rQrhbrO9mMu2gxHtFa4wvsXsqU/FOYmvK2q76na@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9FE7gYTiME/bZknloV3EQFpdoYz9+GVxzNlMw2vbg9mAW0lE7
	qWfphlh7IsqS3+ZAZiYDWlCgvj61TNucpq74xZp4UvhgDZjasrmUDEjV
X-Gm-Gg: AfdE7cnEa5rsdxsYUNwaGtIvVrmt1frI8iQGxBhD9dqg2RoYLKWtARVoIiw8PmLPvUp
	OizgW2koyk9eJiWPl8hKcmKGv1pJ8SeBHrVtq39Jlqgt6V/WEiyCYGwThxoPXsX9OaLJkvOKJVw
	lGPY4WUZZFH5SDxSxPuwe3jQt/LQYFr9RD0SQpNKFgy0xkJ1fHKKBFT9KoiH7wulRY+e0qGY+ev
	Hc6jJhXAbTFDHLw+f12sQx/8TihPje9GDLw36jrGY2VbgsEj4y8YX0Q156QKa5pbdRjFKBHTzOM
	SoSe9ZrAFVB8/UH3PKTZMeoq2PEwSh/I5XYulBhQG0Fc7ZH/XPippywKysVQ8LafCC/yLC8IiFS
	6qn9IsWwN9S82fTwrwMjkWXNaNsBT7FBL6kqc4m7SU0tLv/hjU5tK87vo0UDXs2szkQ5hNkRgpP
	lhrA32lGwwPKq6ehW6pEqDCTXEA74CjusPNPu3RDtNTZoz
X-Received: by 2002:a05:7300:8606:b0:30c:5807:abc7 with SMTP id 5a478bee46e88-30c84cac264mr2452317eec.17.1782385368531;
        Thu, 25 Jun 2026 04:02:48 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca87caasm7229314eec.27.2026.06.25.04.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:02:48 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] staging: fbtft: fix unaligned vmem writes when txbuf is byte-offset
Date: Thu, 25 Jun 2026 19:02:37 +0800
Message-ID: <20260625110237.304435-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260625104220.21E5A1F00A3D@smtp.kernel.org>
References: <20260625104220.21E5A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fbtft_write_vmem16_bus8() and fb_ra8875's write_vmem16_bus8() offset
txbuf16 by one byte for a command/start prefix, then store 16-bit pixel
data via txbuf16[i]. On strict-alignment architectures this can fault
the same way as the write_reg path fixed in the previous patch.

Use put_unaligned() for these stores.

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 3 ++-
 drivers/staging/fbtft/fbtft-bus.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de664..5b95b0095 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 
 #include <linux/gpio/consumer.h>
+#include <linux/unaligned.h>
 #include "fbtft.h"
 
 #define DRVNAME "fb_ra8875"
@@ -262,7 +263,7 @@ static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 			to_copy, remain - to_copy);
 
 		for (i = 0; i < to_copy; i++)
-			txbuf16[i] = cpu_to_be16(vmem16[i]);
+			put_unaligned(cpu_to_be16(vmem16[i]), &txbuf16[i]);
 
 		vmem16 = vmem16 + to_copy;
 		ret = par->fbtftops.write(par, par->txbuf.buf,
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index cfcf4d7e7..fc3faab7d 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -158,7 +158,7 @@ int fbtft_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 			to_copy, remain - to_copy);
 
 		for (i = 0; i < to_copy; i++)
-			txbuf16[i] = cpu_to_be16(vmem16[i]);
+			put_unaligned(cpu_to_be16(vmem16[i]), &txbuf16[i]);
 
 		vmem16 = vmem16 + to_copy;
 		ret = par->fbtftops.write(par, par->txbuf.buf,
-- 
2.47.3

