Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D071E521B
	for <linux-staging@lists.linux.dev>; Wed, 26 Mar 2025 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742994828; cv=none; b=FWEBFehDIPaDWTAu8Hw97Irtx+TQPgBc1gXUi67T+j7vlbWfb0H6gD901KgAw6biJf7zoNKOdJnmcoBeHNoht+NsBjIVTRm1zyAo9YTP57N/u+8vQzSBqzeqdoSvy4m2su6gylp0NESCC/xfs5KZJMUM20rrzCKU6B2ZFtkHrzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742994828; c=relaxed/simple;
	bh=E+bCT//FoLXOZLmdv4Iouw925tTRa3ZfBhLAVQexUbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lx410okxSG4xuJUc0gR0oAaYb+TpnRX2St6QvT9b5tOn9NmOyea6Ng5XOC057dyyJ065IJkmUZz0JHZEQCCRsvyrAYAyRoIbbhUJGgUdK9WcC7Dycnx7LADbV5w+Q5Uf5RMt8zvKGkyikbK7+T3M5qZJwqXk/YgaMuWtUIVmfw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9lPW5cy; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9lPW5cy"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so11357549a91.1
        for <linux-staging@lists.linux.dev>; Wed, 26 Mar 2025 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742994826; x=1743599626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3yvLsBy83apkWOi47GV7xH4xs4WujWrUpgPa9E4Thfo=;
        b=a9lPW5cyie8clvyCcd9xU53M+LDMlo2oSXwyCOU0A4SLPR1ci9+wshf2CJob3JKXGi
         MSv4Ge4PWUxg4qUcT3MQ2pIC0EB7QOZNWXkD3nwobOZK/rS2OJjhMpVj7pDxF3yzsKLV
         +b7AD/S/rva/tQuxRhIVpBXz0Ke9exLOkg6kf1AHc3lrLzwdFzg3LCfJVyqRd3zO3Tq5
         67ccgLK+AuJRPIt8lHJvI6V+sxVMQeRZXDIF2yfhjwevnIY+DaveEDswaTlVgjVr1Szi
         RYSg5Iw0LLqzGUshax781ZNkJs7zAdwhFgkfy+1MN24wei4Os6/ctMQvr3dl4hI1kTAt
         IWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742994826; x=1743599626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3yvLsBy83apkWOi47GV7xH4xs4WujWrUpgPa9E4Thfo=;
        b=EsWqGSAwC38Gbz8iRYZQ3OCHcxEsQv8WCeAwIMAVriwoNt1kEufYtWclmqfApMjA8K
         otgp1syoL8LCS9M7VeLdqyVsz0Lp8QJJovnztNHc06izjMKzXjY4EPZ4p6Yt6+WpWxfN
         S0/0YAoDQciYGy3p0WGecpplvaAk7MLxBniUWo5fb33oQolQ0zlJ4dYe2M6J3JOh6+hO
         vEp14hIPeSRZNZPhKTsCxDplWjG7Aro+Szc5pIHLAxrZio3NnIXeOAHg7liWeQBQh+2F
         sY84ccEV7N8BMm5MaNLmAiW0kChFVrjFuum8GY2XD+7DZg+1VJerTmeSK90Fm5JbupCA
         hmdA==
X-Forwarded-Encrypted: i=1; AJvYcCVrfLmYck6UO2ujtrTnF8ASRBtzOvKW3QW/ABQXeXt0L0uS4q3XyAqPZlfjCSODo7ht9mDDtNGXCmLjFjvB@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1W7Wv+HGt2pbs+wbw7Mn9Fof+KQpYY4BmPx4dPSlasmbysX6K
	/tiCPGtH6+vNOByO0biKhrBGsbQUCAwIHEqfrghfuoHOqJr+SpjN
X-Gm-Gg: ASbGncsbf6Am0mrtNuH8LywKRSX7AGKYKAIDhsK3MFiSPobkdmAva4iqPAhQ6JfYnLZ
	tkzFYqRlEONV12ZSuNJCLpDomN4/ECIrYmrmi4VRXn/DzKTOUAnOi4FUvxY9vjanfYw3hT4BzXk
	CKZ0Vwi2vCFif22y8tCrGGh+jAKL88pItCzb5PEM/jcLfuo5w1bUxndhGpyyyNKqa/syBoFhufr
	WiTvnR+MGYOgjWahapxrYNIvJtlS2aKliuMRskhApVtwFrs76AVStg1y2cNg7tkLvprerr2u8gf
	j+CHiAehmF29xfWa90iAAk79QwZ4xLB6bYOqNusw48c19WKwzi7msxS/F+K0k0/DiVQ=
X-Google-Smtp-Source: AGHT+IEWBkKSWzApdTr0MVmRaWZeVxk7RItkZYRuhvEBSOeMT/OMOk1H16+lPFpTvmfRXpkhR+VBpw==
X-Received: by 2002:a17:90b:554f:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-3030fe94313mr38929560a91.14.1742994826172;
        Wed, 26 Mar 2025 06:13:46 -0700 (PDT)
Received: from fedora.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039e60f1f9sm108696a91.47.2025.03.26.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 06:13:45 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	Michael.Hennerich@analog.com,
	lars@metafoo.de,
	marcelo.schmitt1@gmail.com,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH] iio: frequency: ad9832: Update bit manipulation macros to use FIELD_PREP and GENMASK
Date: Wed, 26 Mar 2025 18:43:03 +0530
Message-ID: <20250326131338.21309-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update AD9832_PHASE and RES_MASK to use FIELD_PREP and GENMASK for
clean bitmask generation and improved maintainability.

Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 07baa574aa46..1627b0d5de8a 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -62,7 +62,7 @@
 #define AD9832_CMD_SLEEPRESCLR	0xC
 
 #define AD9832_FREQ		BIT(11)
-#define AD9832_PHASE(x)		(((x) & 3) << 9)
+#define AD9832_PHASE(x)	FIELD_PREP(GENMASK(10, 9), x)
 #define AD9832_SYNC		BIT(13)
 #define AD9832_SELSRC		BIT(12)
 #define AD9832_SLEEP		BIT(13)
@@ -70,7 +70,7 @@
 #define AD9832_CLR		BIT(11)
 #define AD9832_FREQ_BITS	32
 #define AD9832_PHASE_BITS	12
-#define RES_MASK(bits)		((1 << (bits)) - 1)
+#define RES_MASK(bits)	GENMASK((bits) - 1, 0)
 #define AD9832_CMD_MSK	GENMASK(15, 12)
 #define AD9832_ADD_MSK	GENMASK(11, 8)
 #define AD9832_DAT_MSK	GENMASK(7, 0)
-- 
2.49.0

