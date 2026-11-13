Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586741;
	b=kwMfoZuuXFogOpVGB+fiqFYnhbyZNupiRF9PG7vtJ4aQPBn18gafQbgEVXJbDvwoRk3i
	 EiPry07nM/dhskgYjMKcmCEkkdOYxagciYrjXNjZYG+NuCpri0Xr9Sn1tQHUD7xBg0wC3
	 8v73j4yYKuYawk5r2/lDlXglicZwjoOTYV54O5eS42SUXelP4c41MEcWkt/rw6r2UODa6
	 6vOgrYbA5U3QcioxVBJADYhNXCXdQv7d616EwAfw/zhA0FAjxCBlbS6SVjlrgc7GVFbbV
	 n41E91lxhA+0WSDOWnML3NhE9CP9BWId6zvLgHVesPJC88/69m0zOOSq+WEe4GIrPeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
	b=CqLl/HW9RAR9cIs0yXFzHDl/aZr9GKpZ3zYFXfopqLd9y44ccbDC+bbwih3la/5mSY63
	 GU0rozJNhcK1+AyKq9i43M4D8qTOJPjFk1UGwuQ15JR+iA32DmYYdwKXUkW0rNnacpDwR
	 52Gh5FewCtCex1glbRM4BIqO28R2w97ymvR5dFT7hH64Mv/fKYtlH4f4tItwJp5eqgT+Y
	 YNyw30QBQvs6XGLoSMKs1tBeklN4si47a8g1Ag/F7DK5YtlvaL07VzF/ILui+D8sdvH8r
	 CHJHI9NB/WWjHsCLI6H0B/dDNUpEKiCLz94nckAZHolRLMSNMQ906STMzCM/bBfCITw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s31v6XSH;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CBA60A5BFE
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 16:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1CBA60A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s31v6XSH
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d30639709so216227866b.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586739; x=1795191539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=s31v6XSH4sexB4d1EE7ySWE0lgA8BzgPL+DVa8rVg5Jy6M/nY//5KE1Su/DXssz/7p
         3HOp7ok3PzY/g64jQRsZose4+M2em2AyZ6uqe5SdjqWty00OPK5FNNcpKP8Emrn1KPId
         OaTe0325EHCr0GltPgW7vKcBS/Hf67DrV38bgQxiUox1QWQBFa7JNvOr0h+VLiLEUAV9
         3zpb0hHbvWzwBU+tVSGTWt1TZxJwrU7rrnt9Dx5Vd7Y820NsjWMlm3pTkUbIzLCmMbo6
         XQViGXiAs7iXSO0VhghS6fsg6nLQrurdmB5U3fhDVbHq30YhmA/LUtvIEzg6B1f/jg/3
         AbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586739; x=1795191539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=NGoN7oRYaKRal24FBvVe66BmkeNEs3ylBMQSz2lD+BlMJfUafSqhunrQINRSGvsqIg
         8J34urMf4zmONAg/cY2wlPeFeRfRs1AkhC4clwwaRebAxpozuORuhkehms6pdwkjntch
         67CyAO2J+Vs12bu5fCpsHsZ05WAcaUK47Lj2M0MDTIpPqPC3AoAm4aFeYIqqKZ6YtCaw
         9jXX5JLPxV7Ra2vZ1XQoLi5SU0ob8W6xSOM+G8vSRswRZhk5R3jiaqi+JgWvdSJhoLaN
         A+OGnOvmKP5vqf5/d8wRSrnKgYAUwc7fEpEkI0TX/z+h3ouja27zMUw46kcJ39h+1OQr
         h1TQ==
X-Forwarded-Encrypted: i=1; AL+hErG7aSRcA9b1kiqJ0W+WDWEOFu22xeS6QDZMuDgizFU8pWuzrHsHpvYkHePX3Ma0951yQ7bYN49XhryW+FZv@lists.linux.dev
X-Gm-Message-State: APuU4Z9oWp6xkuyn1AgUCQ+s/H7tWmtWE/0z3DztpzOpX81K23YUelbz
	ofg1ioVFfl5cUzvgrw+CQWJg5Af/NcDOJb6m4qt/Nbb8meJT8MKY44CI
X-Gm-Gg: AYBFou3U/3qPcVySAG1uxPYNttFD8i8VUqXIMgQSXAEJtE0C2RIAOsVbnTXyPBCQ1O0
	NsAzLaB2s9z5hqxA9yB6SreTJ8qkffassyKA3MD8G9kdfcqZNpJrsEe4AxGSbWZffj6nroRvfBy
	hRjPtXO91UrYvxgpuf7G841OvNcdS7Cbgf5vejgo49bDesv41OaJCtTPDE1UqKQ5VRl4DMuuRhI
	gL+VZ5JfedFzI6gItskFtmNXJUzoHE4TlMAU+CNh4ktEmsy2s9vxhDBc4Zb84O6e4c+wY0JomSg
	7CS9g6+xF9Cgec645Y3zlgaUmkDd64ahWOmAOB7FviunVp5JX51jxKZnff+7XR28ZngPt5w8HI8
	hmxvzv6tBbHrUPmWbqHjCZ0Hikj6rlJc2jDc0gKUbAPRgZfDdLwF4sBXMHlxgFcKwUIq87RugEV
	TgYoFYDFJICtPvNre98fXQnaAaGEdNwz6LulT2WrPlIsT3LqMX2mIzmju60DKAAoOr3V2qujkEW
	BIel0aoJukg3FU0zJaxsWmogshyMbuQlMBgq8kOR04WXBu+1OedSljoY77GCz5+wXu4VnItqhG/
	JqTfGr+y7ELgQoFPUnq2txGIqXUuE60z4y77JgsE492FTC/yyl0YHlp0VFRc8LkE/G626Ixxo61
	0RKtSWfGoag==
X-Received: by 2002:a17:907:9304:b0:c46:9ee4:8f0 with SMTP id a640c23a62f3a-c50963d470fmr299547666b.10.1794586738923;
        Fri, 13 Nov 2026 08:18:58 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 10/10] ARM: tegra: Add CSI node for Tegra114
Date: Fri, 13 Nov 2026 18:18:19 +0200
Message-ID: <20261113161819.36847-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

Add CSI node to Tegra114 device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 34 +++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index f2766c11ee6c3..61120658f0687 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -53,7 +53,7 @@ host1x@50000000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra114-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -64,6 +64,38 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra114-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA114_CLK_CSI>,
+					 <&tegra_car TEGRA114_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA114_CLK_CSIB_PAD>,
+					 <&tegra_car TEGRA114_CLK_CILAB>,
+					 <&tegra_car TEGRA114_CLK_CILCD>,
+					 <&tegra_car TEGRA114_CLK_CILE>;
+				clock-names = "csi", "csia-pad", "csib-pad",
+					      "cilab", "cilcd", "cile";
+				power-domains = <&pd_venc>;
+
+				assigned-clocks = <&tegra_car TEGRA114_CLK_CILAB>,
+						  <&tegra_car TEGRA114_CLK_CILCD>,
+						  <&tegra_car TEGRA114_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>, <102000000>, <102000000>;
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.53.0

