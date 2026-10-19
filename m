Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508434FFA5F
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418253; cv=none; b=j9DXdrZfy2pzOvHBDCoHLKjEuQFDf5Z9FYoQqvoQvO/XKsIOregtTOrt1XzpsAEqftwLAjeW9DQvhbr/jK1vVJeSqvPrHstyWc6jF7KMrEQJYFrfm4yfbVcovYYRSpv+PSDP2C7tSoRVyhthWJPlH007jbvGWz+t9ifqtm0NiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418253; c=relaxed/simple;
	bh=fjvAi9gBmKMfVEEh1GwhVjdVvjqeXeo/SssrFZSAIlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/gnFAoNX7miaAsmHP0Awefg+8FDo+RTlOpdmT1VVDtsXkqE3dzDb2I5k7AQ5g/0QC6Qg37QPNG01O33yRRgoIJjiqB1pMC9FfstwKZ13vy6nlD1NAEIsnUjjG2cKYznCWqhV0gfk4ciqZzYnlZxmqr7FKln+KrvCf4pQmgSyTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAvcLZ5E; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAvcLZ5E"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3874690eec.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792418249; x=1793023049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHmwVRXgo6cTlOspH9FWDod09fxFDoidqai/OyNIW7c=;
        b=ZAvcLZ5E7dZIw8GXOXZEvUJYejGCxlYorZomf041S6JytZ8lRTsrpJiButwSFyEsMV
         D62Ba6fvtaaWYLX3eLACEJDVN+IuxmJ6pJrtDrrnIjGfACEVHdoKTL5/VvJcZF49tkZV
         kSTaJPlUhHnx2k9tb5orqdi5Idyte4FtxfUYORd/LQWf9nvVnJNBLEw4dG1C2IOqYxs+
         a/XBB227xh8oYeBjr/EbKPiHqtlPqbX2Lg1cs6AUBIM/JdPtGq9W7aksWzb+LBn4RiSc
         1AJKuilVMSvBKLkCQEcYcn/E7WgXFAnWQEnDDf/PbSYS0md/u072dVoTLAmd+MPIYRyS
         9oCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418249; x=1793023049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHmwVRXgo6cTlOspH9FWDod09fxFDoidqai/OyNIW7c=;
        b=SIEt/1yD4bWFMSE0dslK1eQVbM2bbnVzZSgZWc4zxPFvj2lt2aD+MC7+m/wupcVEJp
         8DHQAk6U38Vto9yIxO25KEUhsaBcBxr/gHMi6Uls7YvNQoYjeBSi/FQ1txOiKbHB5/dt
         dt/CHACa1lD1BBT6k0rGJ9hyiIOPVg4PyfPo1bLQYOLZMuOuqCwLGRyKdQBGtFs6gvLm
         99MCUHs87CWvgkVjfnbrMYMLpW6641Bn10Ql62LmEtZHpOb/k1FuCHEMfyucpwoEobjJ
         /RF4Dqy3SRXxiyWv/crBc6XT98QE2XT22ZqRpT04IZfyNLjPuwIBIalW46D3d2a/uqrG
         oL1A==
X-Forwarded-Encrypted: i=1; AKwUvBwCm/m2VfOCY9QoZndoWsfRCD0gvxc8DUf1kKX3McXYblfdSn+f3wi+YbbyuqtsEKfEr7oIY4Gyi3ok7+5A@lists.linux.dev
X-Gm-Message-State: AFq9FYLtY5KaUZnG93ggLSD4lmWt0gY3pxBVkw+DNQljxGxMJa/n9ItW
	ZUkPFKsfweJOuSpMYlYlo6QKiwey+MGUpAaOgD/3k2N/mIzOXWhRp9cn
X-Gm-Gg: AYBFou2kvvCY5IxHjDehTufqdDv3ukzhtZwfyrRo7nylZrkZQn6GiRv0PoD/16pRIAy
	Bemd4Ga2zRq5f1RBg7QThbreA7yAZybVjmcbxjqlcUL4IRYDgvPiQmsRlqFGPOaX+ExiN71DXUm
	r5PjHOmfpiMmM28/stqNjk2EXSP0AvviKSkLkmsoPrIUpW05rUka7B589jxm/LPK+LBSIKoYsZe
	9irpKVK7D0smxhuXGeEtvjOl77g9+CAcL/vjM9Lqsc2UxeLJZbdWTqn4k22VSA4pfAjp3wubk32
	KVI7I/x3/XP3Ca0DTgisLDHpSxcRgSWrG0Kg4LJNjz6C0Z0kYhETfoHAokuBY1cLLuMOjO7Jero
	qRxsGTWQvWwQS3LBRcbTjNBI3BhDA9ixT5XSJY1ZULp7fFGt82vEqnWK2fN8LO6EPpileODYBda
	lwXcCJhBoLqrIe4FKkSDPqTfFUBR50yY81gVBU09wrNPX/6oi2IIYInKBTcEsehXWo8QuS8o6iA
	BOEEds=
X-Received: by 2002:a05:701b:4559:20b0:144:eb46:c31 with SMTP id a92af1059eb24-185120abebbmr10668293c88.17.1792418249139;
        Mon, 19 Oct 2026 06:57:29 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:5c3b:b91a:15d0:4481])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm39831494c88.13.2026.10.19.06.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:57:27 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v6] staging: greybus: remove redundant error message
Date: Mon, 19 Oct 2026 19:27:17 +0530
Message-ID: <20261019135717.40979-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Remove the error message, as tty_alloc_driver() returns -ENOMEM
when it fails, so printing the message is unnecessary.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
---
v6:
- Remove the redundant error message, as suggested by Johan Hovold

v5:
- Drop arche-apb-ctrl.c and arche-platform.c changes because the
  files were removed.
- keep only the uart.c change, as the fw-core.c changes are already
  present in staging/staging-next.

v4:
- Return error codes directly instead of storing them in ret,
  as suggested by Julia Lawall.
- Remove the unused ret variable.

v3:
- Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.

v2:
- Use %pe in the firmware management case, as suggested by Jeremy Clifton,
  to match the other cases.

v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
---
 drivers/staging/greybus/uart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index d47f00751e7a..4de61fca6725 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -956,7 +956,6 @@ static int gb_tty_init(void)
 	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
 					 TTY_DRIVER_DYNAMIC_DEV);
 	if (IS_ERR(gb_tty_driver)) {
-		pr_err("Can not allocate tty driver\n");
 		retval = PTR_ERR(gb_tty_driver);
 		goto fail_unregister_dev;
 	}
-- 
2.43.0

