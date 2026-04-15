Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36B135E92F
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776262680; cv=none; b=m+mrk6U6ZCeGsawMxl2ZiHO3g5wYoBOH4WcMZOO5AmV339nWSCxfwzxWMfWr9F/NrKKl1i95s8UpOET6P7ihkGmdZTErbZNGDKDHseI2jRJF4mxyTlOZop7oDj7lMbV2N5VNmAzeaow0oAhFpiKuJcImxGZ9Sawj2Z8u1XmBGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776262680; c=relaxed/simple;
	bh=DbwPAjuzgcYKMgYknMMYLE6/2dJXLcBvek6pHyXOJ7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GXA8pNLsN77ZSVxJ3Lye/iFR1SA2QxDCb/pJca9ZrkqXrET3lECaVOBWpq9zFN6z+O14JCNYiGWfoQJbKip6Y+7iQXxVxCtmxYqvM7bUjeGeri1iIDMxSXbBSG3PIxggzYc+H7ofbCDYRVWyfquiHOQx2XugYS126B5hJ1/1Qe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGoUeysa; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGoUeysa"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c1a170a50so7169719c88.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776262678; x=1776867478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bw1VCi5nYgeb6iMtGug92GHg2lfm+h8hDV/KGM1mT+w=;
        b=dGoUeysabLKF3VVCXMU9XeqMzdeab1v2bkTVaB/bMu0FP/HlGwg3h2CafBP7+2V7Dn
         8EK4aP978pIQHWf90wcUxqtMLhUP7W384H04dynfQkegzt06beY/vgrTFYwPe3gcPaUt
         JjE2WihohBi07WUTV6qzmq5OBfT3HNecctLbO0oaJ1V0EW4KfIf9gZUVUH1k6DahcqPz
         KMYNmsc0p1gKIRFzVMIHfvReD7SORePKsvuEUnCT5ZqIMEEmvPXCJZCskrdhQvw3vEx+
         ygRq99vk1WZtMYXTXSDranzIFGlKdOVvh4CvORAcRrORA+T6EKoYICqfVVU63S6n0tMz
         q68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776262678; x=1776867478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bw1VCi5nYgeb6iMtGug92GHg2lfm+h8hDV/KGM1mT+w=;
        b=CMbSZKFfhzKOQTuIcqYj22dayXuqwD7Hh/ebtmhNqDXVgDi0nkt2xVcKIE8thphd2z
         FZalWFUQVudU4Cl9WMQJ7OP/GCIaB54+1rmsV38bfqJtC/TZW0Bcpfk2bc7VstQYqlib
         6oj7zYEUT2x/lsmnEBnwyzsZhskVoCNMwHYm1Po6+gmtyAxpB6ycK4a7ry9uKBEZCRO8
         n7Nk/XrZi9M7WuJmd08xl7+SrhXWcT6bjvnPOQtGRunW0HCWNJeQ2+lCaJH9c5FEGq7v
         YRgCF4E9Bks6JJumX00VF6XzCxtba0Q0QdJmoZQBjOSqZpRysNmprjpIMwWrVps4Qq4h
         6SJg==
X-Forwarded-Encrypted: i=1; AFNElJ+MQPi4JyTaCcDMKuNOZ2D2Je6LZ147xR1s/zW88wMHECeOPGeyCaHOmEI3h2xp7TUBIw6ONkoL1xuzvos/@lists.linux.dev
X-Gm-Message-State: AOJu0YxcTzakoRuPe/kvaas8bG56xaOjjaCAuLUwjyhoDkxpmHf9lLwB
	rEgGdWooafmSpCzX0l1bawsvRv1WW3Mv6kfjLsT+x0rXZ5vzj25ke2Q=
X-Gm-Gg: AeBDievvBwArjTwoMqP4ciNbQe8ILJmulvFcdThxOUptrKt/TOwt0W7S6KrYQj+YKXM
	7evMCWaA/pDg3UXTg9CsLsC+P3JbpB9h1lZT6uGCinuRCE2R6sEsEQig6/YSQy9ByFj4yXVvMgH
	v2vqYtCRUU3m25i1xaJ68DidToZ+9QzUPDCp341NWHXabQiCJoepTAFpPmg+a1yQR3EV7exHomc
	agb6oqyEJKw0NCln6G6H2bVCjgmR3bUHncMdzXASwc7vBDT7cBk6kTRp+ytlI+s8c5GiPNg/zLb
	9tAXLZLKGaZKPeAqhUBzdg8YTCsmmJWIoGr5yjHsIKDvCVfklOC0xzpdxgifailShAiaIEEaZQ7
	WwNXVs8Myu9XGzUIZ4yBFt2+i7bLdSTF1RcmDuK6z2W7N/Ycy+nkdKVRv3x4+6yq7cFKwccPeZx
	asRaT4Jo0XoB3uvJi+JbzZgaiLzEoBIR/Ru/yIboTdQMlJdJfEBVA/OUDEgZCkCIYzbZnZxwlRp
	btGXMDJYA==
X-Received: by 2002:a05:7022:6189:b0:128:d450:bc76 with SMTP id a92af1059eb24-12c34eead86mr12476394c88.26.1776262677904;
        Wed, 15 Apr 2026 07:17:57 -0700 (PDT)
Received: from vilarmanjaro ([2804:29b8:50e0:3432:1ab7:b7ed:546a:3e8f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5f3f3d93sm1308436c88.15.2026.04.15.07.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 07:17:57 -0700 (PDT)
From: Ramon Watson Vilar <watsonvilar@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ramon Watson Vilar <watsonvilar@gmail.com>
Subject: [PATCH] staging: atomisp: use usleep_range instead of msleep for short delays
Date: Wed, 15 Apr 2026 11:17:39 -0300
Message-ID: <20260415141739.109259-1-watsonvilar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ramon Watson Vilar <watsonvilar@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..e0b0f09a5c26 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	usleep_range(5000, 10000);
 	return 0;
 
 fail_clk:
-- 
2.53.0

