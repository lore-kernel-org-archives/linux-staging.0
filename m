Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B9329378
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774021661; cv=none; b=ugZ8klaOyyw98L+nAjpjiHYnoQK8uCG8rBv2ATZCZjgcPK40izmobtE2qY8cr35Z7idOobB+plgU4pIJaIKVPXowseRbEtWt8gQdxMUAwZpzqz6BhwfB58OSAVRCqS8Ihe23FofVMhc/shV9bTfOfTIGTiHKQs+zy6H66+zjX7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774021661; c=relaxed/simple;
	bh=yEpPwgyBxD7sIdsv7my/I0dfUfuyi9Dj8NeT9iVU9RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3b5HEPoSQkt1yRm8pmsJM2U7zegidWz2xQ7+PSP1stiqDdgSO+UK4mvGO9UuYBJJCfP/BmFgIUTSGMCztDE8e7aRXaewc29hPwZs4noXRN4aRg9wPiIEtOv8r6lcxNYn5SHDlGSvpfcRtdhb0S5qXqzGg8nObIdeIzgPfLJzFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BB4w7Wos; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BB4w7Wos"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b982a80317fso100442566b.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774021657; x=1774626457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IOpdoJzrDoAcStRh1bUJ5D5IwMnDvTuuElutOtBLSoU=;
        b=BB4w7WosCpuP0EsnsS8V4QRCkzdfmmJ+aS2+2wVcP/Q/k60bBUV3R/kSetGGOU5ZdO
         C/PxefodZkixok4mN6MOokD+ZO6uA1aAh8E2fqZvpB7GWXv+8ry/CkhW/nQGR6FWkOyJ
         a9/xeBV86Lwdh+9A5tSZhgam46AgBtUgRrEDxNThkS5HkzjT/fisT9DDuNVkqaPVZFAq
         uV/C6hL2fodJzuxbMnKwCoBgJX59xfJyy9XdeaCe5YJpn8Y9iWpZgxb349krQl+2t5EU
         9Mni1AWCdMyGA3gTUR70GQrAT8VN9zRZxqRoVyL32n56ftslF9Qu4PMuz1z7MbMGQqwT
         MHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774021657; x=1774626457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOpdoJzrDoAcStRh1bUJ5D5IwMnDvTuuElutOtBLSoU=;
        b=o9YJ/dWnRMKhNOxQarwe5IjcpWTB9pCNOnUuytSDitD3PNVyputNEO8hU3z7rrEnT3
         a9ddrxmjlJp04EVELAOd1pQmBvFpUmrhpQ+frvD6lx53urXGE6V0vh6RkF6V46T0vxnA
         QRKg890S/IFZ+p5d90Bxs9qjXrxC5ml2AaK5vsNV/+m3LTZCA/KOm/gvhOZRkUYu/VxQ
         iGdaTveoCTfJkz3Ccf/tBsmE4N2zgsPgW3f9RjWWSfC/204/abp6VxDiHExrsDe5xrPN
         7N5Fblvypba0Q02cSMufMpQ4RAIpS4LqzvGSYnm0L080RpxA3921JafwWVdnDxSITNJ+
         xyBQ==
X-Gm-Message-State: AOJu0YxC4EKjTtRkFWoWy7Y3D7iaORC1mx7ywEePezzNt8EP+Wb9qToi
	dYvPGqzy4FqbHkkqpSYviSPDHP/KPHfSAVgzYvJnHMzMkN+CAM+z9j01FhsicuMd
X-Gm-Gg: ATEYQzxKUZUQeVjNjqmvRHgKJfHtZPejt8W130YQopXFHUAb3AVfQwh9BvzhVuw6ldn
	bGbNJWfkTX723ocfRMFQdOXE6i5i9tN01ojmQIl2HYhrcWy7+YDGQrd/s4J/O0jSvOWuHsZM4Gm
	X64W9tOEe5ghz3XkPrmFpOTQ08+hixMDqlFxnL9P9mxQ+4R66nVsdy4M3FpJEt54dWBwShz+JCH
	XYSWLceHWrbrZIgj6ONIyacFjd90ptcmEmnRxupjUhqGU+RCw6MJi7ZFAxsiyHDYjHoTsVWJ2Nb
	a/JomU4Ht966N8vEKeZxByiNpzBKzld9K+I0SmzLMNYm49GSO+W4NqPK4jAX60UGGlatzx1YB0a
	Liamx73ptdYXyCx8rgwf5jO/WCN7fnOrop/VwjlrxsZS6brXJ8nlwsgapyTWeRtD97a7iOmoAgg
	Q7B4RFwt8oFnE6UkN3MiPcL9Q/XQ+5B8HrOPtYDWpUz2UcwQ==
X-Received: by 2002:a17:906:6b09:b0:b97:b93a:981f with SMTP id a640c23a62f3a-b982f3ca508mr213816666b.54.1774021656713;
        Fri, 20 Mar 2026 08:47:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1cd8:5427:4c74:c4ff:fe18:7da5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8d3d0sm173658966b.19.2026.03.20.08.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 08:47:36 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Luka Gejak <luka.gejak@linux.dev>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] staging: rtl8723bs: clean up rtw_joinbss_event_prehandle
Date: Fri, 20 Mar 2026 16:47:15 +0100
Message-ID: <20260320154724.603847-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the rtw_joinbss_event_prehandle function in the
rtl8723bs staging driver.

The first patch removes dead code guarded by the REJOIN macro, which is
never defined in the kernel. This simplifies the function before the
subsequent refactor.

The second patch refactors the function using guard clauses and early
returns to reduce deep indentation, improving overall readability.

v3:
- Removed the 'retry' variable which became dead after REJOIN
  removal.
- Remoed the 'ignore_joinbss_callback' label and use direct
  returns.
- Preserve the original comment for the join_res <= 0 case.
- Keep the original newline for the netdev_dbg call.
- Moved the 's5' comment after the spin_unlock_bh call to match
  original placement.

v2:
- Split the original patch into a two-patch series.
- Changed the subject line.
- Removed all REJOIN-related dead code.
- Fixed a typo in the ptarget_sta comment.
- Avoided unnecessary changes.

Jose A. Perez de Azpillaga (2):
  staging: rtl8723bs: remove dead REJOIN code
  staging: rtl8723bs: refactor rtw_joinbss_event_prehandle to reduce
    indentation

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 156 ++++++++++------------
 1 file changed, 69 insertions(+), 87 deletions(-)

--
2.53.0

