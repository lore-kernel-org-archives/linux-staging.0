Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A82421254
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829889; cv=none; b=Bir6mOaO3doNA3+9PLgolCZIHlB1Vb6EcvzD9OOx5zg8ByADhUopSYED1Ge7N6zPiHJlcoCpLP3DspNYXHmIPIOi3XEA9iCZ1xRUtAY8Q9pT5BJOpVUwcVgnsbQ7hWAQsD9lb9GTX1lhbA1MS3M+qxFqNhoq4p06PpPL3ZE5V1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829889; c=relaxed/simple;
	bh=fSr1rgwn1r3t5l/b8GH2ft43ZdtOXELqfGPNorUfjz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LjjBATJ/PgoAKsHK1HqtvWOJtLzrqAwxOqyaxWnA0cUu4haePfOg9FYo1tlEzbK1Hxdaekyq4onZLorm/ukDxPw1cctOmp0dZb4XxOWiz8UlC1z1NhCPXFgRAVfjlD/2wNjkHzsGAAIzXvCq9im6X+CBw2CnktPkkpC7DWHW6Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DejMrU7a; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DejMrU7a"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1751812a91.1
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785829888; x=1786434688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9uEU/0gVr5vf0fte1b3bzS5Fgv0F3rU/mjXt1k0U88=;
        b=DejMrU7af2G5otc/FQhYtYU8K5O6b8TGarDGq6vQA6CrgoxZWHBhrwVYA63Xw2kjgG
         efKxvDqX2vEU/xnpl1IORwCp5OTlMEJm+EpGwlDDb4sLr+hTdGmDmdNyxVIdH4kobdtE
         gcj1NozTqLtZHNl1dgTfRFzYxYil4d8VRQasljV6sPHWt00IoMkH0obnYgyFN6FUutvU
         X9NHvQYghMhtFnFqMSNFlpqpBRu6PdNnRsxmu54BzLhUSjqXHcKV83cVNxFFCjxNA/1H
         bjIxNh+ppfuYOgLEkIG/gMeQGvQWZ4XcjuLtbbaLfhFD/iIC9sxAqSzq5O3eQEkL0u5C
         Ursw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785829888; x=1786434688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9uEU/0gVr5vf0fte1b3bzS5Fgv0F3rU/mjXt1k0U88=;
        b=F3uaFo9/bem1FHV8ecUsfdyybC5MbLXfkRHhjG8NuYFsCoYzJxHXR3JKTnkw7CzMyQ
         I9jr4scMLzQsX61OE1O9G4E7pfd3r8zeMlG/73hph+kjlImnkZVrsRRjfD9RwJhLP3mx
         gXUyeYfv4UkB9j1QoVHRi6ChtaqBlDxd0tzPg00X2R4/q2x4SIqt1ORQj9IO1bDauAoW
         BHbq7ua2nH5vSBgaw8tfSIDFaPBT8ov4gm8/323nNJZiqfdxG/hQg+mpLk5vrAd2yAvI
         toAArLYhqxEEAJJ9QoghSKLQyASSFKEgrR5DC3pUvNJpuGdVINq4UaakJPiFB0qXwJvV
         B/aA==
X-Gm-Message-State: AOJu0Ywudfq1r+ULkVc+4cK/waGwVpkNeHSrp8iAvvWG8PFquCE4OyUq
	iN4q9RLilP0RedsoDjIdrsh3gvgDZdKzBHVIzuSx8GalxxvFflEMII7D3nKvS+pL
X-Gm-Gg: AR+sD12jqmDwvDAoL/WsB6tp61aD0ujryqXOtsoSkL3AfKQrIK8KMRIoZgkqK1QQNr7
	d7MqhDsO5VTdTP8lgu1JCSVOAnWAXLMZMhS8GNazsme6GNcAGwst97nupuOd6376WJWl/BSxLz0
	7dMsFlOk4fMrEnL2IllZ2/030HmzN41F1/+l+K0xpR/yMkZRNmz1eWrzB1fSFYi/HdhuvykY3oq
	3GOUNMUVo2GmVi3FSjV0AgaMkK0vYFoIWyj7dvXBAWPFPJH41tfDs9eY2K/qC2nH/Yg2jaVRyU2
	v9ERbC+CpN/osee+PiLYv9+0L9r13OdJsqBrC2e5yTdmyWiyY5yOYs6+dJbURwSFPIvauU3dyuP
	F7SfuvnhFM2BHjsQoFlPdi1298rEWEdnGAPTRyEf4z3aWlu4CaWDqvL1TMM/It7lL6Uk7q4dnbc
	/KkwQ9jW8+LPxVoPDQAl5EZ8zt0/yRHvSSU2LoqSfM6XwPsHvuNIYvAGF4akFItojyidDj+peeR
	zj4U2o=
X-Received: by 2002:a17:90b:2e06:b0:38e:ab33:9551 with SMTP id 98e67ed59e1d1-38fbc60a11emr11424230a91.42.1785829887990;
        Tue, 04 Aug 2026 00:51:27 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm2389828eec.21.2026.08.04.00.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:51:27 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v2] staging: media: ipu3: remove unnecessary parentheses from return
Date: Tue,  4 Aug 2026 07:51:12 +0000
Message-ID: <20260804075112.15695-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 8063401246f..84fc98dd352 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1400,7 +1400,7 @@ bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe)
 		if (!list_empty(&css_pipe->queue[q].bufs))
 			break;
 	spin_unlock(&css_pipe->qlock);
-	return (q == IPU3_CSS_QUEUES);
+	return q == IPU3_CSS_QUEUES;
 }
 
 bool imgu_css_queue_empty(struct imgu_css *css)
-- 
2.51.0.windows.1

