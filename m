Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06133749FF
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542370; cv=none; b=i1wvGRJ/fMVBBy7GwPXfSR4O2279q4e7UJAMB8DQAy2zeleK3vw5KqtBjOH+6xaS8yDswXIozkrBqoaIO/Ya2I72Rd4ur9k/QumboN85+GEeaat0URbLYWp09MdPN7bJMaZyv3fxb40MQkE9mBVT34tK9M5ojKWyEQGV6WPUqKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542370; c=relaxed/simple;
	bh=wYwuBd5wYmpSA6u09SatfE2n94U60Z1lSj4q1JefrJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9t76uw4FkeYhB3IhXC8RvUFUTeQfjB/61oRD78kpncavA1if7Xf4SJSlbgvFeohiF7eBxMBkCtp/jLE5qb0JBWZhth3kJL8GJIPvE2OIHrJQYcSTH9MW2X+1kvMi1lKUq+a1NIYTJkko6dxYz9yoJaUCfRa76+AwemeKIhbUoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=wUhXrhMy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="wUhXrhMy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso11443545e9.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 23:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782542367; x=1783147167; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=svPkawO2Tk+lD5or+qNr6aHfEaVTgfNd8BRZ65xFdDU=;
        b=wUhXrhMyQrp/ZNeERLeMN83XJKcX9mRnN0/RT49SM6mEy14FfkrhDMmNJR48V6d+cU
         xEK1IjhRWL6U1dPF2jotP3CvtQ9qtI++yFfOP+Si/EH41pf/tqKs9WD8ZiILUXdOf6Ji
         HEt4GFa6zqrDQ9EaxBWYaTE//zJVfsTEWFHESe017/67/htHp+2svkvC8R5YuwZF3x1l
         gIHajt2+CAWdxGQ55n3RzuwaAZr0IFl8JlbigfV8wYa2jJtFNmPD+FnA2G4WoAGUoilY
         SjoBLT+0ni2/5IXYMyuOZYpnqQwwWVYP4N+P0c8hrQnRXrI50hmSF6T2SjRqhw3wB15Z
         zj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542367; x=1783147167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svPkawO2Tk+lD5or+qNr6aHfEaVTgfNd8BRZ65xFdDU=;
        b=bLsZ3xg4VsacHv0LG5OW8wqGKGUbRYjQ6LXwWESFjrM+Av/Wv+QxnEimD0534XmxsL
         fobPA1bRVHu5dvuRunhIP9dGmkJOmqGEiGTQ2ymgyOwj/J6TO2O8POoiJ+TKafj6rjbN
         mvRqPDf5a7bRvCYmEaNLfE++aMqYaZR//g6M5uNnUWjOxnFFi84rsleDkUfY4wx3tRqw
         94r6u6fE6A/SIijVhNxDZpJfktq77vzk7JuZOIuyoJe6y8o4VTxR2eULZnGueU33eT2b
         bKdBw7/XaWHswX8TfSK4U1U/mIyk8LragMhAYwFm6xU8b6Vf9oP2GAARBYxPZ6t7IheW
         CZcg==
X-Forwarded-Encrypted: i=1; AFNElJ+sQCm0UOI/VISAaEZcIYm2nOV5rILcf7KuYCQ0XzR/gNzC05vGF4nXXe7jT41z3rptIPk0E7k+esrqFiki@lists.linux.dev
X-Gm-Message-State: AOJu0YyX5Qq+mNyobcFVlwb01c3CCmbl/rJXwQEPiqct/eTsJv1YxedC
	TMe0Kl/QgNqojcn8rUtbVhvFRCGdCmo7VLsmAQbXSGDZe8Q0KGriJaFGexZQyUtqUEMT
X-Gm-Gg: AfdE7ck86Ab3hmitfxMkbCOrgi+dfP+iZkGHvUIE8RYqRQN824uv07UGyuO7mK6cOU+
	J7f4brTOYe4Q5jOjF/gJLNbbPntsoMbdTSQxUT0XPejsnZEPG3unmlRglcyEZn5V4lORDfSOJ43
	BxDihYHyLccSJ77/el/qSwX4sD0a/GOYY1JyERLTptvdj9t07wY7drZcfQDFd4O9302acYWdtdY
	m8fQK6licKiSpj79Om3TwW9ZxhMYuFV5Oxy6gK2oFPzzhzI0BRF+fm56dK3CFe1qzbeVrIqyyKr
	jMAutWGcqlVzhUJLZpqhyhbojH3K1ChNSMHeDJiT1qM8AZqjOW5ukVJx5bmWXxIiwOzcTq6w45P
	WbbrYlhyatXqy7u9nipUap3nmQlv+WsPhTpBUwWohFQdvvqv0uZwZ1goQDk32hAiaKfKCSCbH4N
	bYukTe4vLXfoA6suwh0worD8nwCxL/yUXO3yh7TVNg2zJZTnZRS5HBXO6+RAIRjnEDJt4XPVgsD
	eeo1lbcH59BPWiBkBU9VnWO5micziiat+I4/684T9f5xg==
X-Received: by 2002:a05:600c:a403:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-4926689fab5mr114611195e9.25.1782542367247;
        Fri, 26 Jun 2026 23:39:27 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c285fc1sm79198785e9.1.2026.06.26.23.39.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:39:25 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2 0/2] media: atomisp: validate user-supplied buffer sizes in two ioctl paths
Date: Sat, 27 Jun 2026 08:39:21 +0200
Message-ID: <20260627063924.79491-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two ioctl paths in the Intel AtomISP staging driver share the same
defect class: one user-controlled field sizes the destination buffer
while a separate user-controlled field sizes the copy/store, with no
cross-validation between them. A local caller on an atomisp V4L2 device
can drive a kernel heap out-of-bounds write with attacker-controlled
length (and, for both, attacker-controlled contents).

Patch 1 (framebuffer-to-CSS, FPN / S_FBUF path) bounds arg->fmt.sizeimage
to the frame allocated from width/height/format before the copy/store.

Patch 2 (S_DIS_VECTOR DVS 6-axis config) bounds the user-supplied
width/height dimensions to the stream-grid-sized destination config in
both the ISP2401 and ISP2400 branches before the first copy.

Both were found by 0sec's autonomous vulnerability analysis
(https://0sec.ai) via static analysis; neither is yet runtime-reproduced
(Intel Baytrail/Cherrytrail ISP hardware required).

v2: add Fixes: tags (Dan Carpenter).

Doruk Tan Ozturk (2):
  media: atomisp: validate sizeimage against the allocated frame in
    framebuffer-to-CSS
  media: atomisp: bound DVS 6-axis table dimensions to the allocated
    config

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

-- 
2.53.0

