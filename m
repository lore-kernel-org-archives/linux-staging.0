Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AEA394498
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 03:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860914; cv=none; b=EfsQjgR1yyzyivt4mP2NMbfKMsiTEl1KrFhSQ79R4vxOuU9FtKeKTAX16Y5yw4PFhHRoeDlZozA6kelquxOwWMmFLdy6U51BujUElFHMJXGIvGrkygYHOJ//sK/5WDFV9OCFyK823cRPat7ffQCjMyZEgxAXLBBxYIMNR+yU6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860914; c=relaxed/simple;
	bh=alXKlejZ3rjbqbavz9evBznlUeY1CvfBnpw+hhl51Nk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WBxRTDetF/fPeL8LX1K6VzEmwKiikoV82pbrj+V3epxolTkE1srX22SQLIO6hOqTg/Lm+M0fi+r5Tz7RlVrxn6so34OXUnEbUvkM8J0DOBXrj6OHXNcjh5AoptX7yzFurUbIxBdWugzAZs20db/+e5wJNUd3KmyCxmObIvjPQg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qXjuTFmH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qXjuTFmH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso5048295ad.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 20:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791860913; x=1792465713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsQluREAsaidaH9yxQg+zSsmSWQvjbWvelg3Usb8Q7w=;
        b=qXjuTFmHZpCNiawNnUbbXfFb2DoZken0ZG6JZxz3SaUu9EgHVfipYEH2Qd8lZGnJ8/
         U/29bd1hJ4494MEkRKZdNDn9WdRECBNMRH00pz841DBH0uOO5OSy66HUQT+G/nB/egyU
         NoHciAqlsvm1x5hKyf0RgfyuDR9v3zeBrFWMB1LHRxk4OCluGclK6O2Au/hiBwHc0RLV
         FLRI5SRK/XW1joWuvAcoE/JfOAWRL6ArSFrdupCiLmNxSWMF8M2L9u+YNlLsbHWR7ylp
         A11/tQzC85qIY6D24B9U81SAdBLc/yHYwyh0nDlapnYF4+yJo0E4tymnfkuWGLSvHB2v
         S29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860913; x=1792465713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsQluREAsaidaH9yxQg+zSsmSWQvjbWvelg3Usb8Q7w=;
        b=QQKtawcnPq++WwpflsmDxZAXWDzjFr9uVm1exljGx/0AJdEImfy7BJ/+Xrl3ze4/Iw
         sECLtKCT4UGVphmNALWq5vS2Wp1FJrzfJS84SVqzOElP6K/+dQMrhT+4zByaofCGj7rs
         xju+uAmWMDWrXWCrbEzn6Sn0jv1c4J3O9SkYAObOlAetum9ilmGazGqQykBw+NajRqc9
         z1r3AkPyv1VoLaZbUez+VBjNAsjqTe16pkXGasQsx8mIQLoh4W0qW2mPujf4xDKhWT0s
         rZuUFm2uhsvM7FndDHZmqciqIjlTkxck6sSlzP+fa19tt4HISRGgdZ6/CIR+uZoK3HQ9
         z9+g==
X-Gm-Message-State: AFq9FYJRdAWFA3L+/xaSeZE/fGP8ya/QfWQSzYZUhs68AG2mZ2kQhEwf
	v234+dNULLigF3WlaTIJVLmmPXGXlSXjtqPQNVR+RaJYiQ+p9g0aWgQ=
X-Gm-Gg: AYBFou3IH+p2K1xNjFT7XNX/WndsipKMzHGnMaCUiNz3um7d3YZT7i5xBfoFedlwufX
	ce/EWU8O68hKVfBqDfFjXeYypS9EMEkQeiaI3cLWUYNgrMK/YoZHG246kwI4HyKT7XvNVYavG8I
	z98mE0isT9f5FCGwPuzEeCqSVZnCu7D6mxnQgnihZqE0dSIy19pd8dogurWsEmsEw8QHsFWil/M
	HXzLrtdBZ48+TNOjLO/8LKW9qiD/Nt3Ef/2NVuiwvN7AABm6deRgW4vcRnzyeGsSnBCnsQvzUVQ
	7q70ycs2UKKTUCSdBJ+AIjTyMgAE0cOAaIm1QzO62sav5RJJVx2N3LAB2ucHorb1dOHaTvUOmUD
	0VPDKp1KTObNOkupXCclmUdJrFofe5l/AdgLWgwB3JzQ/F7YqgnqasO0ei/gRdaKWttPi137Eaa
	UAxqRy4Isv1PBZ1r8vOBT30fIL5vtMbhO3n4mj/7/EcoPp7vJl8DUR4ksizC3/Qq7Ov0XqvmqAY
	Rc6oBBS9w==
X-Received: by 2002:a17:902:c941:b0:2e8:486d:fa00 with SMTP id d9443c01a7336-2e8486dfb5dmr98051075ad.29.1791860912306;
        Mon, 12 Oct 2026 20:08:32 -0700 (PDT)
Received: from localhost.localdomain ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e2511sm48584505ad.76.2026.10.12.20.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:08:31 -0700 (PDT)
From: wangyibo <szwyb123@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mustafa Karamanli <mbarancemkaramanli@gmail.com>,
	wangyibo <szwyb123@gmail.com>
Subject: [PATCH] staging: most: fix typo in driver_usage.txt
Date: Tue, 13 Oct 2026 11:08:24 +0800
Message-Id: <20261013030824.329969-1-szwyb123@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in the ALSA component description of the
application layer section: 'can by used' should be 'can be used'.

The same typo was fixed for the networking and V4L2 sections by
commit b114ef1efc49 ("staging: most: fix typos in driver_usage.txt"),
but this third occurrence was missed.

Signed-off-by: wangyibo <szwyb123@gmail.com>
---
 drivers/staging/most/Documentation/driver_usage.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/Documentation/driver_usage.txt b/drivers/staging/most/Documentation/driver_usage.txt
index f1b6977f4543..32a2e5ecb48b 100644
--- a/drivers/staging/most/Documentation/driver_usage.txt
+++ b/drivers/staging/most/Documentation/driver_usage.txt
@@ -109,7 +109,7 @@ following components are available
 	   driver via the V4L subsystem.
 
 	4) Advanced Linux Sound Architecture (ALSA)
-	   Standard sound applications (e.g. aplay, arecord, audacity) can by
+	   Standard sound applications (e.g. aplay, arecord, audacity) can be
 	   used to access the driver via the ALSA subsystem.
 
 
-- 
2.25.1

