Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C213B53
	for <linux-staging@lists.linux.dev>; Mon,  7 Mar 2022 14:59:58 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id y11so19797765eda.12
        for <linux-staging@lists.linux.dev>; Mon, 07 Mar 2022 06:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=VVnlaWLoAj4ztYijY1PVJxwx/BOoH/almjRyiU6VmRk=;
        b=U/2luno5Chz3HyhMJsWNx9qQ1evwDAUbNkzGgKymgJHrNHS4ZLz3I6xud1s1X+s6Fi
         rdyW+PV0npzc1qR0Z58dXus71PCDmTFIG/OG8OcDBZb3oYjqRTigMYgCH/DGf6A+3EMu
         It5Evf9qGVfZZ7TUMNPInYS4J7pXjPqLl78tkpt0A4BCOloWgGApEaUBWR8Yb36tfv/s
         OQ+lq3TvX5cjO1tygs0wkg9hQ+VqlgcH7D5sF4GZhXRO/w6gQNWaC216KkiYUMjszZ75
         bCHFzgqfuNE500qkjS4re6PcidMvohmAU6xeNyJ1YCC1DZESS68G5/Ji3mgHcRygrwuj
         X2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VVnlaWLoAj4ztYijY1PVJxwx/BOoH/almjRyiU6VmRk=;
        b=ROJaZmGV8lLLngEYMANSJUFZXJ84j9ZByyroqEo1r3cImD/TLuMYDs5jahZHhnn3iU
         FeaUzInF5or5YiC52vjiuExqNIW1NmPXnCaRix7koOHnc+X8Oz1ngKAFEtVIJM7hrKB5
         +SfgVx/wB9AY3CWYLbBWG0nz49NrqLb8MR8roOlGqqG7O6izzrXOHiW3Cj5r6MXX8ZQt
         FrDr8wpsC06x++9y94DOdrThGU3vRwG1XqNAlE2GWGBPK7aS4k+DyrlqIqzFfum1anfR
         9r+QnAMlBCbRtoLVZDQZTYyQAqovezQyeBJ8PbvMSz8t/i4zTmzZQAtqs6AQFPdIWgqZ
         n5Mw==
X-Gm-Message-State: AOAM5337YdbQaoKqPKvvf83fy997HMi3PbJF7IfiDK8dC2CTRFiXnlnV
	oyUOqv0PWK52wKR+Zy8o1Pw=
X-Google-Smtp-Source: ABdhPJz+iG+iwPoRYF1WfXSNBaaS2QmqI3mVJ9w/cDNyUryjnV1HzUyeATY108wz4okfIFkZMbHYWA==
X-Received: by 2002:aa7:c5d7:0:b0:415:ee77:d6f2 with SMTP id h23-20020aa7c5d7000000b00415ee77d6f2mr11542074eds.208.1646665197090;
        Mon, 07 Mar 2022 06:59:57 -0800 (PST)
Received: from felia.fritz.box (200116b826f87d0045da35f0fd1c76e8.dip.versatel-1u1.de. [2001:16b8:26f8:7d00:45da:35f0:fd1c:76e8])
        by smtp.gmail.com with ESMTPSA id h30-20020a056402095e00b00412b81dd96esm6218261edz.29.2022.03.07.06.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 06:59:56 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: rectify entry for  MEDIA DRIVERS FOR NVIDIA TEGRA - VDE
Date: Mon,  7 Mar 2022 15:59:35 +0100
Message-Id: <20220307145935.13178-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Commit ccc3016261ed ("media: dt: bindings: tegra-vde: Convert to schema")
converts nvidia,tegra-vde.txt to nvidia,tegra-vde.yaml, but missed to
adjust its reference in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file reference in  MEDIA DRIVERS FOR NVIDIA TEGRA - VDE.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Dmitry, please ack.

Thierry, please pick this minor non-urgent clean-up patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05fd080b82f3..2b96a22cf5ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11964,7 +11964,7 @@ L:	linux-media@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
+F:	Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
 F:	drivers/staging/media/tegra-vde/
 
 MEDIA DRIVERS FOR RENESAS - CEU
-- 
2.17.1

