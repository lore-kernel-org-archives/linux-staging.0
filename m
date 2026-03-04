Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744F039EF14
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 09:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615030; cv=none; b=s86yXncLZSy+UFnue/aY26Z+P0EvG3dQYdlySp+oXS47T24Hw+C6MVj3jGTaPTV+MCGxQihQ8Owt3s4uFXyghByVspeVL8e42baKtN2TEaI7or456doSij4QUJybIYBD870cQkH7c25qreySa2mUt2yyON3pu4r1L8Nb3AA77no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615030; c=relaxed/simple;
	bh=MCUltpFZ7WmEs+Zx30xfCDFOTCP7ddjGHJyyrYpihXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLDxbxLPCIzfGkD9yNs+Zitr26hOjSqKbw5MKWqoG5zMVV/34+GS4+ioEiz5czKpY9CwbF93nmxaFq8MccMoiFs1LyIVl8HHWV3HR6J/dieqtdfLJGzjD0bDW073u6L+71hrHa0o0HQKM2lG9JGBrG9KJW0toGCtCcBWyMpu9Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZ5ZeC1k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/e/l0rD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZ5ZeC1k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/e/l0rD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SPXn152531
	for <linux-staging@lists.linux.dev>; Wed, 4 Mar 2026 09:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=; b=LZ5ZeC1kqTnN1jFh
	vCca7TV1UKLuarWNNA4j74IoHQZeS4rJ8wyjWtEjFDwOeF5LL3i4PnB/RtNWZk9c
	WyhH4S9YFRvmPpc5DDWtNq0Lq7gVxrQuyl7jXzEbNBoJOvYqY4FEi2nhcWKRIYhc
	Zn0ZezifGODDAv6RguH2+n4lz6j6XJtVzi8WCuvy6g0/Rm2g1Za1QiGg18MnZsQt
	LxXLnZIpg4RalfuDBpF/CIraKi91ur9+sQIPVX3xDa9cuFhzDc9DYM+q8+wJzJlF
	TMjqx7cw9Gq5Cw3kk2q8+PQ+IyRTcHcTOFocmDDfXcv5qgLhgSrVLF0TRjDNjCBg
	YOz7wQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvjy0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:03:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71156fe09so4094916885a.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615027; x=1773219827; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=;
        b=h/e/l0rDdcRC9lztj19SD2UPVa2cGyNSy8s7iPZojnTufPA4ziMnv79hOd4eXKiMYN
         x2P15EBSey1q4XmRtUl43COinGaERbSV+LdsGWRc/P8Q0PHzqKS6tH/IsAOtqPAlCjt/
         YK6IUem8WhlOLwwxrBTvMeyDp6DIhimB5ofGsiuoPTbbpuiW3wW0aVetbnm/g6cbH0D/
         fXh+o9rVP2IwNx8Jl//ACfNto2n2wpO8fQsbHqAn8njMb8F7oLiSaR+BfAElQXtpBoJU
         Tjx+tXgdTjAw98Rr6YS2++OwvCgy+ouSmUTf9ge5CWe4HroGX5USgd2ySY4VHm4U9wqK
         Vwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615027; x=1773219827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=;
        b=TRrLxjLsM4y31hPBkC1RE/uSw5Bq8SpSxpBjJ5NJvg6h1C6kUfeaJ5KR4tSxuRCV1N
         ZF9VFpw2Y2jz2SoGuXFpHHxTPF3yQr2BWioC4KDgG10/msRlSjxtDpfFrJYf9bT0GVFh
         fTnPVmQuXT0VYMyKpm4dk32G9zs8+8URnSJ24kn8zG1zrpNui05VhXQiZHnhgItUuGxO
         4aI5Lh9IxO3r4hwTEbD/bcvb1aC2DwfiN2vTjOKjj/akN4t9dTPIEmJjjJVl8NOzvfdc
         SW3vuDL/33+G9t7bY6+MhXw9N49dyRLtzx3D2r1x6wsiJL7P6X2TuUE1JbXN8Q38WJB6
         a6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUkQAw0bQRQMbUmhqYg2myliVIJNazTODYLd6xL5+BqMUxrRf14bHfWQTEOUjkRf+QqAfLqRfwd9OND+0Lb@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7+x/zs/mErRqVVgLo2XBFRmVgymyY7HBuMFNJ1RnP/khjtoP5
	HUwHPUec5yjH3VM748WZ8wSnLzunh2geBKMSLlm0O4xW+9eXKH6m9aawDQlzge7xFkRDRhdITcu
	/BSwKVOotrgmdYvslQY82r1OMF5p80QAtnJJn0W5H7twkbo0fiTXX5U6twVpOIdWQe3wP
X-Gm-Gg: ATEYQzxMqQRFOG418w/BE2UDDJUuQJEjj9QhhxqWz22NjuDyIsSCIfzgt6eZ7KqK9gr
	QyYYW89OkNPHywhmVPo6zmT1EV4aUWPdoOj44KXL0bJ20no7GBjFspONymfpidmCfby2IuMSlHX
	lSSBWeb9WR6sKQJ3KNv3F3uB6MkiuCjMLVPQIZfsbmfEWq4NGYHGRyuzpy0sIAjkHSrqA9+wk3A
	KJwn5v9Je6q1VX+HYaKyDX0hT9di1TwUwaE8IxfmZcxlfHQe1cmWBhHJ0rcTL6hE4kzeGvfJeT1
	BY6WVIG2ohF2QTHgzmRyduBuVYIaB3zcGE/xvMzA+C+GD1BnOFPY/xAidyfczVdssJyEkgEuo8/
	2pK2ccNRZHxLem6cQB4qapi8HbVFAa1hvfIpvugsEfgIxTgrOf2JE
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr152244385a.41.1772615027083;
        Wed, 04 Mar 2026 01:03:47 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr152238485a.41.1772615026584;
        Wed, 04 Mar 2026 01:03:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:35 +0100
Subject: [PATCH 14/14] media: i2c: drop unneeded dependencies on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-14-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MCUltpFZ7WmEs+Zx30xfCDFOTCP7ddjGHJyyrYpihXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U2S+uVTRDUZjbW42G7Pde+e98yExCfHmKSl
 HuuGodjDTOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NgAKCRAFnS7L/zaE
 w04sD/4l9ifYSWVyk+wcaQpjTACkURD2eCeWi7XG5/uxKcFxPRjOjYbnVCNmKnRiNYQHTnOdZAD
 RHEPNL9Tmn5V/K3zGBvodWKK7DoWQJZcGQLrC8VNmiFODSfkjheHHtNx6K9SzWyk4fsz/3U9/Do
 uRHRJZ7f7yJAP3QJaZ9QxWkzuAC8If42NLay9hfVcfo+kS0TOu1NNRM+6gXMA5Y/pP4FlXYs8DC
 IsZC4Qjx9Hx0bhbmMqrIpAUFk9OaN3t+oV92DLq/zFIvuNHMy0/L8N/wiyzmLbnZcfTpsf6+Qgp
 4P2FgxgqxO9yyi+cm3IA9XfiOCzuJOPteySq4NcdBekIwuXhYMeYRNqInw0HjhWFwbiAeFthwO3
 DOQAqM86R5V0bfFnCvwu7MoqjY1SjVWit3ZOt/iTOhJSvBydJJ8pgS8/ULEYw/m0sZuvYNvGOV6
 lYD11td3ysN/HbFMLVs6zX9Rr75VDl7CdXbXSc4aQbBdsN1WHf0tu+5dKq1slodk3V/ZxT2jL86
 Ns5Z37xaPgZ8pZRZw86cfDDtlRD4+3qaW4Zkd8uc9TQlPBg2iVpIMvoZdChHXBocSpd4F921tHV
 NqGZ8FhAn8Awi3Dn3ouTs3qouRo73WZp98ukYqMVfXEjl4gbfeCP/mjH85au2MmJuJ/7PUDuHTk
 DzYrk83TwNVNPsA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX8x7w3QuXVNQE
 l8n/LR/e5UXARzZ0NFYvVWX2yYs3U8oVtccFdoUaRDvlZHFk/H4QAHAsC4V55+adb4I8rly3R6h
 yCXsbGr0ieFOjR2YSsIlApvAOFQJ3sjBW14HvWviLTWoVfvCgF3lR8CsV/cqRdTvCEE4HveB4m7
 a6opbENelIoaXz4aru63qtlqNB4TGRhZSq+le0aZToOwW87q4pGlao5M2MZcdiOsAgr524bw0vt
 2CiCHcAyh9LsReoxXfZfx6OxUA3ESu806Mfcx2OHnjjeRu5BinvB32RREqbbaHsPhjx20wglmZk
 vBurt/yCVIDlqsTsr606ruTLS6CJ29SiKusmBIj5E5XB/pwxflU/+CiiAqch/CKnvqckcEhLJbj
 8uuZ8cSiKAf2GIiZ+rvqVhQeVgn1G2dC9G6pom+VT8MwMB9u1NmvhoHyaifQC+j97PRipy3KJe8
 Q6lYW87/5Qa2d90J56Q==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a7f574 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jH2LZSAcktARuhmwcr4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: r5minmMDR4mQaVTgOkQKDdmOPxhQ6BTU
X-Proofpoint-ORIG-GUID: r5minmMDR4mQaVTgOkQKDdmOPxhQ6BTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/media/i2c/Kconfig | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5eb1e0e0a87ab350060567f578960c0e98940d6d..40b6fa3fe38b8d64d029d385f1acd1de4480aa69 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -237,7 +237,7 @@ config VIDEO_IMX319
 
 config VIDEO_IMX334
 	tristate "Sony IMX334 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -248,7 +248,7 @@ config VIDEO_IMX334
 
 config VIDEO_IMX335
 	tristate "Sony IMX335 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -268,7 +268,7 @@ config VIDEO_IMX355
 
 config VIDEO_IMX412
 	tristate "Sony IMX412 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX412 camera.
@@ -278,7 +278,7 @@ config VIDEO_IMX412
 
 config VIDEO_IMX415
 	tristate "Sony IMX415 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -689,7 +689,7 @@ config VIDEO_OV8865
 
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9282 camera sensor.
@@ -1244,7 +1244,6 @@ config VIDEO_BT866
 config VIDEO_ISL7998X
 	tristate "Intersil ISL7998x video decoder"
 	depends on VIDEO_DEV && I2C
-	depends on OF_GPIO
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1282,7 +1281,6 @@ config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
 	depends on VIDEO_DEV
-	depends on OF_GPIO
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER

-- 
2.47.3

