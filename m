Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF422C81;
	Mon, 22 Nov 2021 18:47:22 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id t5so81599270edd.0;
        Mon, 22 Nov 2021 10:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OrAz2qSS0v6VrYhP03ydDVHSa28f05qdX2rEWeofBjI=;
        b=aBwbTm8os5gysOh9BjYaJ/KuTUKCj4tXn/KHFS6T5lt1KoTatn8M9t0R2mpFXh+Qzl
         AvxgkKXym1AXPSo+sKCLQ3UsO2JpJM41A8QwTZ5/EyTSXp3Y4jYQ5x05xaJZvqTO+gcM
         ifWoqay6i2F4ozO7jdpQoPMP41qsfmFfIGvmL52JNhlJLQKMejXeAM1o3C0KFxpByBgQ
         M4Mt+Fq4OhK6GkQ+TaJkGO54CRtZ9zo+Pq71HtYX/8paiwt+MogdOkxQ7o9P/c+cGvO0
         V6V3/HSuVa7Yw8+xjpHCwKbk6gwffex9wM8peWGyzt4ycSCxuanD2j68W65bFzNgNd7v
         GzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OrAz2qSS0v6VrYhP03ydDVHSa28f05qdX2rEWeofBjI=;
        b=uReEvqUdXTegzskkxiaUVxDM0IMj+Awv+aUMUVipCGR0tOv/XLVKzsJK/8OFBpsjvf
         dk3fgITTlZrgXKQ7L6cKpD5ikGI/Xfug3RMr++1lTWXPOe0HnrLseMOGuVLQiz8zO9P3
         GhjqglMmpSXZOCTkL2NeTJjvxbZMkD5kj5uOPhLN7Oq3Ha1p4uaRNxcAkKpfgTYzmlcb
         zxzATu5JqNRJ2UwcqtKlL84ytFQ/inD9Ed9UvuFmODc2JDuvfQhp1oVQD34J5HZlK4jx
         HdWtWxWYUHWQ6y8y6EIKU6BJxnycGyy+Q33Cj+dwxpmw922npbCMAMiPRy0m/OZt+4hH
         8klA==
X-Gm-Message-State: AOAM532WP6SncHPdQQF1y6sqSYHIRhiJjufTm369oWoDEcjrS1EKh//K
	kg9LdZZb2UDEHTZaJn+Fb0o=
X-Google-Smtp-Source: ABdhPJzTkCP49CfK8OCN7Yj69H529JSNBRlwwEGGRuoxwaPQq1w+6+n7Bo+zSmFqF8zimlUpwdtfmg==
X-Received: by 2002:a05:6402:5194:: with SMTP id q20mr58077323edd.250.1637606840774;
        Mon, 22 Nov 2021 10:47:20 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id h10sm4512312edr.95.2021.11.22.10.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:47:20 -0800 (PST)
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
Subject: [PATCH 7/7] arm64: dts: allwinner: h6: Add Hantro G2 node
Date: Mon, 22 Nov 2021 19:47:02 +0100
Message-Id: <20211122184702.768341-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122184702.768341-1-jernej.skrabec@gmail.com>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
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
2.34.0

