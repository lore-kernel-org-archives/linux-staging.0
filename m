Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EA0450903
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991835; cv=none; b=Q2DoE2PCTMs2HGYdgVCurT/0ywF1nEYwZ4LkLPKp6XFp+XpHbRLUfjnOQdJFw7hUxkfr8qOKl/cxJ2ZpZObbmUsNHt4+ImQOifRwQxfQmM4BR+Rgmu5F/2KCMgyOTkPkjEL7N8DUasztUcjdh8HvAY3zBZmb9V/iqhN9hDqXcqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991835; c=relaxed/simple;
	bh=3oMKl7iISXwsmQM0h6bGA4O5PSq8oNdUj4ruBdpAxdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxIcenIdg2KM0GOzscpuOxBc5NW63CrGf/Z08H6ynJ2na5DxMJZAGgYvvpILtRm//yJ6sNywXth1staxnkz0pBjI4smwiPfGif2WQbPxREnFeauaTmdAUJEFtmp7QTMUgrh6qRBPBNFSHFBUUeCRPHISlN6k174vy7Vu8xUpL3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGEXh98z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGEXh98z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483487335c2so66238285e9.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 14:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991832; x=1775596632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPr1msy/Uz93YOgoBLpvLRDM0Fch6NuZ4BU0Vlvz6Vo=;
        b=KGEXh98zzNr83qYLmwhiGc/R5UUm2aaW80LmXAJz8OkF9m8lxkjQCb1Pr+UNFeZku2
         Ao2NnFHlVbs6zTJi34smAr/1lXGyoUR+X3FChCgJx/hCUFcNnVGAjiY83IQFfCUYheSo
         Am5euNn0Dx9kVI1pG+f7/sP9DCRteF8CwTVmrou6wddckV/vB8hHvhmiI7wVw/QIAGyV
         vF1449KazMHkiVAHka2hs3nlU5RBDAdYoml9Wwew3Razh+IXqY9VwBDUuE3HigxihWJz
         zC1s1kxowS6GUyj+ui7pN3z3o0+CjSd/PsdWa6p5SFcpvPds830rkf5bseqLc93J7bUF
         r8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991832; x=1775596632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPr1msy/Uz93YOgoBLpvLRDM0Fch6NuZ4BU0Vlvz6Vo=;
        b=nNJXqb4o7699793TiyPVUKjVCKi4+mXuiXZ2P3Gw00mTudT8W8f3hquYV5LupHINdp
         yvV56zjsMMXL/VRSlbqTckAAwpQ6b7taQ2eiW4D+0x5tCZV1cUAA8azlqxTUCjRHu9L6
         K61zxmqKUFYCs4KpnoLaw4WvZC/saxyNu66J8QRLLqV+YzS491tiwTu9GuyR9C+EonoB
         2qFhfBhZ5z6M3SVdCL7CKLcIHGGy+oPUXeb4x3QkJxcyG6LZa+3I11RG4/8LMmlc4tyb
         FVdqKikLNLY0wpKfHmtFOMTjHyZeJH38qidjRXoxfYcUxEhyL6yHY6MV7QMR4r/JJQoE
         8NRw==
X-Gm-Message-State: AOJu0YzsucJT+CJ3Z61aVXp7KMqO9mUeiS2YYy5SsapMjrOKmnQ9db0Z
	imdK/whj3sfIvOPwEg3IZ8OhGGIzeB6wXsD2OtSPxB1VNUip3XCDnZeTsPCqRjMo
X-Gm-Gg: ATEYQzxIdRJDc0IdgjAIeRCpWTLBeZJ3WUhI1gPv4RUk4FU645Xt8wiKLwFjwKIKON/
	1XONPk/qAgCzoL7H6NhE14ojpr2fUyh9MeFcA6llkrM4aswjiuH3kUatJvnLft9dq9s6QEVKAap
	RepusbyvKiKQQhx8p2eDt1mcn13DBMPPvdPNPZwfQ5EpfTAiEB1/Q1kxjDvNA2hIMLZTSweTMPO
	llnpEZnthMI9qajFriQ6XpAAxdhHSAhHOS+rEl9DTGDxQQV8/+CuVt/ooZ0inHxy4MQWzjLiD1t
	CeZSQO76CCoBggfhpPpgLyGqdpFktFQdvnk5/BfMBROhwq/4ugB3hABk8EscdU0B7BdmXpwe3kb
	H2Gy6FpMOxfLOH5T6pgNY8g0BeiPN97qatLIbz+yVXKwyR1/sHmYLKOkWAS6aN2kd0yFyC8fqlh
	FXHBL85jmfalWINqVQ4mG2dIPeMrsY4RwsOFTI7sb4Mlkf2w==
X-Received: by 2002:a05:600c:c87:b0:487:13d:4e77 with SMTP id 5b1f17b1804b1-488835b790cmr13699185e9.27.1774991831605;
        Tue, 31 Mar 2026 14:17:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:186c:aad2:ccc1:5aff:fe8f:d494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e81a2cesm66051735e9.8.2026.03.31.14.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 14:17:11 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] staging: media: atomisp: remove redundant call to ia_css_output0_configure()
Date: Tue, 31 Mar 2026 23:16:12 +0200
Message-ID: <20260331211649.421777-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331211649.421777-1-azpijr@gmail.com>
References: <20260331211649.421777-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function configure_isp_from_args() contained a duplicate call to
ia_css_output0_configure() using the same output frame index. Remove the
redundant call to simplify the configuration path.

The ia_css_output0_configure() function acts as a configuration setter.
It populates a struct ia_css_output0_configuration from the frame info
and caches it in the binary parameters. Calling it twice with the same
out_frame[0] pointer merely overwrites the exact same state with
identical values. It has no cumulative state, either does its order
matter relative to ia_css_copy_output_configure().

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index abdffff41ae2..2beb7168517f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -792,9 +792,6 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	if (ret)
 		return ret;
 	ret = ia_css_copy_output_configure(binary, args->copy_output);
-	if (ret)
-		return ret;
-	ret = ia_css_output0_configure(binary, ia_css_frame_get_info(args->out_frame[0]));
 	if (ret)
 		return ret;
 	ret = ia_css_iterator_configure(binary, ia_css_frame_get_info(args->in_frame));
--
2.53.0

