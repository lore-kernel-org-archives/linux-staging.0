Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0AE2FB1
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 15:22:53 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id l1so47948469ejb.6
        for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZLkyDyqWj1CZiuS0iYizljfWHH1n3/to3p6LvPj6158=;
        b=jw7y4JYPCW8W44lrRsqYaEQnU5CeQlrs+LImSYZnPS5yhxAuFDdy+siVIp7F3Frdnz
         ka66/Zqdm+626O2jPve1O1Y0jlu+siGG7E3mckiLIXAbUdRtZbPjjqZ1G75MkybmazY1
         rP24AQIJxWx2c/4sUeFtX9jK+4bbYzxIeZhMyjCjMjcudjGCGcohjCCvWQvu1ZAvToVP
         QpOAbuV+lRgu9lyxRgTVBePi6Q0QzxM5XNCaxmSDOgm7Yet77o9/nHlAgWy1bcBc6CNA
         +5uLy4icLvrerIvsk/3f+ZdHPJBjWZJmC1lKj+hwsV9nlbWjRxT/JxNy856e5apEvgcV
         atpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZLkyDyqWj1CZiuS0iYizljfWHH1n3/to3p6LvPj6158=;
        b=FgTxLq3Iau6y3Z8LX0pD34+Arm+vMRHWAE640FSZFbOi+dfawesWUREVaQgkEW+2iQ
         S0+7iefSaTVag+BPgSGX2AJ1+K16mQ6MQ1vcTaA1zzAoIyI5cO3pSYwlGArStAkpvN/W
         Zd0JALDGX7WVPCt3rlnxobV12hGjpWTooSXOPc4ek0k/E+Vo4Qb/zfkj9MZik6th+hY6
         QfwiRHaSFU1Z9XfRNBxw72+h0FuXrQxcz/l4HhxckaJDdsKZiz3caqf3zwfxwqpsueX/
         V0kjxta+wKRwA4kQmhfiWHznWXLCmEYfqWtN2i292+IcI6ifU/cNpuZcgmqsUAjIQrZX
         vXHg==
X-Gm-Message-State: AOAM53218XeucY3VDZ+coqJrY+Xv4fEDMbtImRmBlK2D1sAEDnteptgw
	1wK4TDdZwOav8O7ugm2x3w==
X-Google-Smtp-Source: ABdhPJwzCu+InKX5nF/IaZU2v8nNyrs5B4uj83Sq8mWbpWSrBmmQZ1nLC3SWyNJew3TsZfv2s4xGAA==
X-Received: by 2002:a17:907:927:: with SMTP id au7mr30004348ejc.267.1621956172296;
        Tue, 25 May 2021 08:22:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:52 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 03/10] dt-bindings: mfd: syscon: add Rockchip RK3036/RK3228 qos compatibles
Date: Tue, 25 May 2021 17:22:18 +0200
Message-Id: <20210525152225.154302-4-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checked with:
make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/mfd/syscon.yaml

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index f14ae6da0068..ad1121620e15 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -45,7 +45,9 @@ properties:
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
               - rockchip,px30-qos
+              - rockchip,rk3036-qos
               - rockchip,rk3066-qos
+              - rockchip,rk3228-qos
               - rockchip,rk3288-qos
               - rockchip,rk3399-qos
               - samsung,exynos3-sysreg
-- 
2.27.0

