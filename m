Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793037605;
	b=jsT2bikwjplKdsSMs3EPyM4DYG4CEjg+cX68K9wzxTLHF9acKmV2GJSl7W0d8BUgDawW
	 vBJFxENylV1TqaOK3nxlvC4XDOHT2FFJ696XekoF29CSrZJU+Ek9NNs094Fq23Bj05CIp
	 vojIjw7cF9tAP5DXRnNZGNT7hkLzkakSO7H3YpiQc45kg47hmMhGDZtnhtJn1346J/vfE
	 HzOUQ+dthsB7Td4x48es2QNc0HxQZeM1vvhlGsfbaeqJjzijWHYKv27SpdVW+klrYDZXV
	 +rFFebLDK9RqvCDbkCpfqRyK7JWitPOruOwZEynBTr8UfBtuMI8dhq+twgI11aNKleA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
	b=BkoZKBRLrtzojD78qYSa1AE2i0/Oljurei2QqRVIeGM13PblJiCT3leHZpI0y6RkS9BE
	 ZqTPk0OwqsgbF72qaxxuqrmDrEPF9WvAv6b4518oU+UvKiqSSNE3OaUVJCiWAde3G5XIH
	 uAKTsIgHf15nx93cC6dogd3wZqxs462+SrBIKCQf/xMONexKeP3BpX1Cz+iUSwmxqsvZE
	 raO0wa92S94FSQUlPCu01QwSgw6gRtk0IUihWOV7AWXi7uNuh4RuX+EpOV9M4WQ5kDiKr
	 8aly3d3V8/HKg+CROD5wJqCjtMRcAz9gXqdPWDW6U2EQJgLVtQVWY8DHnB7h1oVU+8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VEuqSMaT;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD983606A320
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 18:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD983606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VEuqSMaT
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14fc585291cso1599487c88.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 11:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793037604; x=1793642404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=VEuqSMaTgpJ0RAzwxw0U5w+NxrQDYaDtRYJ+aBSYVy5YKSeL2jCT+gM5VFpL+t3rie
         D5C2M/L4z/PkFBKJh40iaLSdmcy463JZfRDz0Q1clbFyJ6EQdtBgKuAxnyleXi6bAi8o
         n8gjMWfmzd2LWet6yQEcpyU7EctZTfdMM3ad0WA1w1UehAUs95IT1yG/QcCT1K019MeF
         a2FxFaWTYEKabe6BQjLoulHmsAoEWfVmcYcn+ooMCyyrCzre1bW9xQUVOk8aNdEo7gXj
         jbHmIeniXw5DOZ5068a7aioY0BAYTCoRuWcWNhuNp16rGLPfxFhI/9+iiUgAOwpU6O7a
         eDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793037604; x=1793642404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=qU25mBALPIupqfsCJRvyPMQwkOyFrJBs1tsn3VMzhcGLx1rVypMfb6omZ4uuLsae76
         nZOMw+pSYAh17wKnsBEQJfZ55rF6Oi3yk3afYqWgZtDv3tCZfqwQjxLLu+lj3iwO2klS
         DabX/ICws4Cl11XG2UYUVkpPfL7KIgzHHB3U/hfURGp5FeRBNk4QcSUzvgb3uQegi+oy
         jlclJov4Rg35deAm6z1w1RpXrCdlt3cGRQRc5vfNEIXbm46UNqQzqK6Vzff13g/0JOh3
         SNpFxrTfjFsGo2yNXDKdRJBeH+lbQPCKKgb6pr+osz2TG3AW0CEaiqljYv4ADO1EVp5T
         21+g==
X-Forwarded-Encrypted: i=1; AKwUvBx1NhYRiu5MAcOWeW5iUFA32/qD/WpHBquzpn8hanMo8QN3id68WqNYq5n3XTZPm/0u2wXaJeF44iuj52wC@lists.linux.dev
X-Gm-Message-State: AFq9FYJU7DqgLzVPqVFwS2v409uTnoEaqPuiXDLeBQ4kNT+sOl3Up/oO
	7zcf1vrCzrNtlFcPaHIwQ3kO3LymkMA9VLDo6AaQ/GrIed/LTD4OtF1t
X-Gm-Gg: AYBFou3zCgDrNU7PLz68xLY81A0697gBv1/yRjHHVXTf7V+HIsVapWBHxed29SU7Dwf
	0PY/pGay8fTuE36jvAxMTfFOAmafEHC57FVHB8fDqFPLLq7JdzCXp61vJnGI851CU9rUpGXYPE2
	lHrUR78H57d4ZjcgQneJXzsJxK0WqLLX9NsR+MwVnU5Hvs1RFHADJk/rIBrpdlxWyfn5XBbMIlh
	CCeYBd+1PiFnPEfepNkWrWZPvKkqJ8NLU9KntYYL2uUcE8OKBj4BRIIaVk2vcsfIPBZaz8HrTRa
	HYV7iCOSMAnz4EM95cF6f9d6LmoekVhCLdsX3vboelxFnMSxEH3H5rzZv2eMZrce8mCT8ULLh84
	VvASgqM+Btkd3RZo0WGa295bXh485mdXoBdjFyEWeBHyIb5gnR248AeqyKi9FTVsPCBX5fZb6JI
	zJIML8fygazn4nkTEV99vjCKPIarascaHfKQ3P6E5Zf+Yy1YBhY8zfX08OWnz2ClTNk1TEBKd8G
	ai8LaKAUtFGYla3aWCGTE+yV7EdQmM5/NF9LJVe6h+cM9bVAFNVIcU=
X-Received: by 2002:a05:701b:4582:10b0:14a:a6dc:9ca6 with SMTP id a92af1059eb24-199292eec43mr10712176c88.3.1793037603609;
        Mon, 26 Oct 2026 11:00:03 -0700 (PDT)
Received: from localhost ([103.204.210.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm25310060c88.3.2026.10.26.10.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:00:03 -0700 (PDT)
From: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
To: dan.carpenter@linaro.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Subject: [PATCH] media: atomisp: Fix memory leak in atomisp_alloc_dis_coef_buf
Date: Mon, 26 Oct 2026 17:58:39 +0000
Message-ID: <20261026175840.13979-1-sifat.yt.2.0c@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Free the allocated dvs2_coeff memory if ia_css_dvs2_statistics_allocate

fails to prevent a memory leak in the error path.

Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index eacd7ee5c050..48196a358ad9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1373,8 +1373,12 @@ int atomisp_alloc_dis_coef_buf(struct atomisp_sub_device *asd)
 	/* DIS projections. */
 	asd->params.dis_proj_data_valid = false;
 	asd->params.dvs_stat = ia_css_dvs2_statistics_allocate(dvs_grid);
-	if (!asd->params.dvs_stat)
+	if (!asd->params.dvs_stat) {
+		ia_css_dvs2_coefficients_free(asd->params.css_param.dvs2_coeff);
+		asd->params.css_param.dvs2_coeff = NULL;
 		return -ENOMEM;
+	}
+
 
 	asd->params.dvs_hor_proj_bytes =
 	    dvs_grid->aligned_height * dvs_grid->aligned_width *
-- 
2.53.0

