Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F79A2C99;
	Mon, 29 Nov 2021 18:26:52 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id s13so38903157wrb.3;
        Mon, 29 Nov 2021 10:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2CK7ksNUp8Pg2echFt8tqjUwXozzVDtckwrvamj3fR4=;
        b=pEsFxY9XJrFlt6w2FqEL8BefM39rmQUeYseKPXfyn+veqbL/hRrUetlSFEWrt4TdLj
         DX4ExO5P48trqilumGsGHydlasQa/b7e5WG/go7ES5HhH5tCptdJV33z4hjXq1I1jOK3
         iHaLRuU9pMnJkf6EcuXNyVnwfkLZ0D/+GL7mpAazNG+hGkzB75arjFF1VvAcSRKoTk/+
         Kn89bNMTOoi/rjcGdr8KTPpfK9Qco6+bskGhIzw1gcGe/m3sg2JBEcLfsb3WmXDFawNW
         7XGJcr/4MuYPFN3uFCZK5lGieiQpH7Rf04o+dmd9RqixpCbvpKzd22Cex7zlMaBqgcEy
         mJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2CK7ksNUp8Pg2echFt8tqjUwXozzVDtckwrvamj3fR4=;
        b=oFcoivjs8LnW/4bJ1rIgFSNBDlAWv8bf6N1WWWihHW5npgiaPE8CGQnGxzpAxiI6en
         zwIWLNHJhNWBNJARxgjOdeb//cYoJcLQ1MlV5PwrWOBcFBSjQKXeITVYAwxG7/9HKhc2
         gUxo/Yyk3mDKxPI3NpIH/ZoBoegHwTSdA17H9chsHpc39yZcFaCGkqxk8b5WQ4AKszmF
         wnmq32F1TnTz5Z8N6U0sIoWJ0kAmj7QL7rapDvnjo5+mb3MNl3dMwKlM6N1lxwEmpcMO
         cnhe0a3dTCY7na3Nh/cb/r5IMJnNHTEBtnygVkfBd1li6tfUx6FBt8Mv77DIopEmiFTw
         Z+Fg==
X-Gm-Message-State: AOAM533nFCZU2majvVih6QTwfySYn1CTt5QIsvMBqGiDZmTMoYOFEzvs
	6uwr2IS27M1lIhW6scmXEuw=
X-Google-Smtp-Source: ABdhPJzN44NyUbZ6t3f0zWKxJtGZkXmmaeAOLVx4Xb2YyJrvOhxilgJVC5Um8UxWuCf4ryumst6epw==
X-Received: by 2002:a5d:6351:: with SMTP id b17mr35204542wrw.151.1638210410731;
        Mon, 29 Nov 2021 10:26:50 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id o12sm85907wmq.12.2021.11.29.10.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 10:26:50 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	nicolas.dufresne@collabora.com,
	mchehab@kernel.org,
	robh+dt@kernel.org,
	mripard@kernel.org,
	wens@csie.org,
	p.zabel@pengutronix.de,
	andrzej.p@collabora.com,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 9/9] arm64: dts: allwinner: h6: Add Hantro G2 node
Date: Mon, 29 Nov 2021 19:26:33 +0100
Message-Id: <20211129182633.480021-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211129182633.480021-1-jernej.skrabec@gmail.com>
References: <20211129182633.480021-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

H6 SoC has a second VPU, dedicated to VP9 decoding. It's a slightly
older design, though.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 4c4547f7d0c7..878061e75098 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -153,6 +153,15 @@ mixer0_out_tcon_top_mixer0: endpoint {
 			};
 		};
 
+		video-codec-g2@1c00000 {
+			compatible = "allwinner,sun50i-h6-vpu-g2";
+			reg = <0x01c00000 0x1000>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_VP9>, <&ccu CLK_VP9>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_VP9>;
+		};
+
 		video-codec@1c0e000 {
 			compatible = "allwinner,sun50i-h6-video-engine";
 			reg = <0x01c0e000 0x2000>;
-- 
2.34.1

