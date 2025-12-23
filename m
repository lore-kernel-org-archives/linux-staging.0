Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E70E346AFF
	for <linux-staging@lists.linux.dev>; Tue, 23 Dec 2025 19:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766518034; cv=none; b=XUM/YQGrNVwnQ6jiNjCrd1MtSSZXBJhdnmbTjDbpOBqr+xv3P9QD6MuK/D9AOIiJJGUtIQa92+ryCs9/AOnjk16MtOyF0eoz9aEjMtZHV+ylbbUCdotlI1O7S34dzx4WGykEEWTHUknIlNqlMFXq+B1Q8OF6wstO6k/P3IzdibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766518034; c=relaxed/simple;
	bh=Svz13no7Ji+bCzqqG+VAYqznHhuJawGZwtywOvf/dOI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=meVbPK3nd/KwZ1vXGIvoBOp15Q75HxAPFBCEoaBregnrPRqhEclQK+Yk+Lt7NmNhv0Baqe6/vwaoBEe56XBTWfNgyl6QedTcDz6aoq6NYuEIExUgOGDN+a176qwOoe2Q4pNaai7PZBBGU67C10N3aCaPLATWEC9ecRd7SHzq6RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCD2ui9Y; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCD2ui9Y"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34abc7da414so4500109a91.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Dec 2025 11:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766518032; x=1767122832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J355jvWq3/NjdApMIDzGb+6LceMfHS1TaMoQRJB+idQ=;
        b=dCD2ui9Yyq11ktMV8WFRNn7PZWwMpOFDTxe3xR/ILciSCvWAmuRzaFQgWQcGxkz5iZ
         8XRUtX4iZhIcf6qx25BCwhmFjHI5NQ7Hv31gJujuKqlHEpgEEyi2+c27IT9z1NzDP9bc
         aIAYJ94Gi5BpDlm/7Dwx48kezmF3RPAH2v1BhjLE1Sugtu1GDNk6oNOJcCbunfJVEb/E
         B9db4xMhZto0tmRY7qwAFWAupmnpnU4IxKdxx/8mibaB6V3aIyfJjOnLF6Webi8Tyuv9
         qMCkCGJUY/Df7S8u6zLe5JugNbgLjkM5C3R5o7q8yoVZOkDm/ip6UK22g7j9Y7/ssm6h
         WLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766518032; x=1767122832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J355jvWq3/NjdApMIDzGb+6LceMfHS1TaMoQRJB+idQ=;
        b=U2Uv/0a3XPYgzcQFaxSypPU1+6cPYDXEELqgRg00lGnbQ5WIK6exDMi4H6xxPwYrCM
         CGOItKf2o4GAu328440Olg46VK3NkRBsjzZ1YKYVnasIVSDORIxh/uvjtwyi+aO9IUdy
         mr+JXpQ1vWXff6sY5BH4HkRwCZFv/JISdiUFRZMQHSv7W4COIEzIT4DtoHCbgMWSBION
         JzZMOabcg70/EztHJ8qiJ7IYZJtvXNar5QN1ZIsgI0+BxNdc/0HQBJwNhXQeSQPyH+za
         +eXGn8aSrsj8HtYxdWnIX9mKAYRpxkg7l+lXnwd2idl/AOTjWKzi/OEEvQpDXPDnK4Wp
         v61Q==
X-Gm-Message-State: AOJu0YxmB4Eia3xAmKb8jUY8oWUDv7NXztzUEFR+VIa5aPuFK3/tvJUQ
	ZKwYKwRXJF7imYjcQ718DN7AIy+1kB6RYdSGVHxTWqzARCZkVQrbhx70C4/XDA==
X-Gm-Gg: AY/fxX5k2K+LfYtBUlQ1QtOd7PnkkUDmm5ifuh2Qx4wMfVIMhEEDTGwySpC8vI87ugi
	O7+DZSzJd6HPIgjOJUWsUMJQJT7WgFvCvH42m8zR8UDASdn6oGlsjRdwRWLE0ZQK93Y5/Vri5Ge
	wN26byDHHbH4zXLHrEFxkr02+CurX8TUuUkZ4cc76klMTuXHI8PODvGm4hjHWnJ1NO181ECtSP8
	HG0bMRzDs+l52xE0DrdSIxKKQ2/bTzHkSSAWNdmiZR6mT/qyT62KLZ7TlcbRyaWwHF+W1H6KN89
	ApDWBVA8vW5C9eLW5QRDEB0xgsWXyfXYvXGC/7xI68lt88NB1ptyTYiboiN+eKL5U4qnV2BgDvz
	KYEFJEzEZ5gW3bMs0HHO2Z95maGllF0Dk2RI870z3AD1cld4CtiGwdF2nyiYvHk0EjG/b4MAkn5
	/G9WvliHylczKA2O09C7C/+hZjIC48FpSEQy4qzXvSnw2pRkgkLc1j7UM=
X-Google-Smtp-Source: AGHT+IGdnbW5Jp8U/OoPPmNzlF8Qxi8K/UNYf+BqIxcTuxX0qAIWv7ytTm6Qo9/hP3yu9sa0Tpnprg==
X-Received: by 2002:a17:90b:580e:b0:340:c179:365a with SMTP id 98e67ed59e1d1-34e91f6c085mr12620504a91.0.1766518032386;
        Tue, 23 Dec 2025 11:27:12 -0800 (PST)
Received: from localhost.localdomain ([2409:40c2:1052:c28c:d56c:4c53:fd22:65f7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dcc4dcsm16518473a91.14.2025.12.23.11.27.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Dec 2025 11:27:12 -0800 (PST)
From: Tejas Chaudhari <tejaschaudhari038@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-fbdev@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	Tejas Chaudhari <tejaschaudhari038@gmail.com>
Subject: [PATCH] staging: sm750fb: rename fixId to fix_id
Date: Wed, 24 Dec 2025 00:57:03 +0530
Message-Id: <20251223192703.16502-1-tejaschaudhari038@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the local fixId array to fix_id to follow
kernel naming conventions and fix a checkpatch
CamelCase warning.

No functional changes.

Signed-off-by: Tejas Chaudhari <tejaschaudhari038@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 15b5de33b..7afb58561 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char *fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
@@ -862,7 +862,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	fix->ywrapstep = crtc->ywrapstep;
 	fix->accel = FB_ACCEL_SMI;
 
-	strscpy(fix->id, fixId[index], sizeof(fix->id));
+	strscpy(fix->id, fix_id[index], sizeof(fix->id));
 
 	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
 	pr_info("fix->smem_start = %lx\n", fix->smem_start);
-- 
2.39.5 (Apple Git-154)

