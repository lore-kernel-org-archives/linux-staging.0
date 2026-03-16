Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C149A38F25A
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654367; cv=none; b=te736x8d1SDG2+CQg8axJUr2L3T7S0+0NYf5TlfDj30BawZ30TkyK20RtWcpiNa01RrccxOqum51mouwoyM5xBTTJL/o6l2+lSnnuTM9h65FyJCFHg4xYuedHAu9mh3IziOgfEZWdy0gVnMD5fS1+ZOdyUrLjQqjs9+W8fclE10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654367; c=relaxed/simple;
	bh=ycfAg3aclT41fsBWRPRsJNKO48Ir9OozAETuIxOc+z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nj1+KMNkhtKi/7FTdW/p8aybl8Bfd93eqxwYZTBhc4rmW75msQfIzPibQk1aygJvltoWYHDqn1ajQUxeA9rGv87eg+lP1mCk6RY0nQ9/e1LZ16pFnqVWF5Gicw6JlokATRUDSwQVRuLZv8eyxujQxplf+Cu10bWttL9wZkbnoGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QU0Say8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2Qrb9ms; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QU0Say8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2Qrb9ms"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64adY3777541
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/8M92/apjmq6CGydOBASUnB0p6g0vTHMl9+aCEywdD0=; b=QU0Say8CoQSUyAkp
	JckFVBdAU4zPilowwEhJglY8sfwkbmvrMT9wYno9to0d7PQW1Cy+d8u0vHTri7HK
	l/uwb8jNBeeSBzTtyNeMwYHIcqFVwoouzrAHEbMWW7FrAzvEIMYVLi324lBRPKeB
	SbAPrvftyxr4lIq/U66rVl5Cjmf+P4ArQuPSnWu9BQS2jqxwgBZRypxRIHv0qXqP
	j5GOwAIuIjzdMbd9kc6RcJPgdbzfWHSaj0034I1OMOygbj2gP2sfnW3MqEy0wQ8a
	BkwBEwuC7ys0K4pcY8zWMf6xajJLpY/AuSy9ZJyEMKMuGVRt5vuUpmhsbmORE+A1
	ilYstA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7w007-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:46:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50900e9803aso294947071cf.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654364; x=1774259164; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8M92/apjmq6CGydOBASUnB0p6g0vTHMl9+aCEywdD0=;
        b=B2Qrb9msBEw4jJgQU+/tVt0aSSodMI/YkWYjQxEEZezGK7TlX62lvXSrfCYEF2BRHz
         OcLqaArVCiifbfINcDuC/2GBLm8nR0fp2xv7aQB/LXmvPsVKfmBkIdUjUtHyRGaKAkCA
         aldsqImONvGQNEJTrSSYSmaAd7+0J0mxWIXD+kwjskq9VTFgQBm8xzryehcfetSpnsEp
         km0iHaKDjojOCuM3t3Nub16HLtcT/WrOyvXyO1cW/HcU18Pbc0+Iiw90+/HG6D/Yg6mh
         NtEuDtUQK9JtVVU+4rblKC2HaVCm/dJ2ty2k4ousRnWbmkMqwgauvjPVBdbLoPyA4LAk
         fw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654364; x=1774259164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/8M92/apjmq6CGydOBASUnB0p6g0vTHMl9+aCEywdD0=;
        b=HSvJKLC65yRiSjvp0taDL5DEMdAqdnXa6fXP4lKvRdb0UModcD8HVMrV/XUPsCFvic
         CkxCVs+HQverlHb/yJWXhnD2H9fn7rxItdbF+Z6orAExMZNPrbcZ6bjKJqtpMLoTvYUV
         bPRTGNXjlHIVX7DiaHijS4GoQzTQLUwoprTEVr4BA4fpHgew7W+I1WT2sCVP2CL2Sj94
         yPmc3tyqOsoD+WNowNL8ARo1KbuBNNoR/dUJrTO/00J0wy5yfMcToRaJ0jFhELtxuuKB
         n3CAwuaNh6rGWr2staIVy8IXY/OrVjNvUcVzKPcBOq4/brcyF/5rv8G/zkrRkwHPeOmz
         AdQg==
X-Forwarded-Encrypted: i=1; AJvYcCWvOv4BvrhLLXiv4o1/2DrR4SsUaKle2AbIHV+eiXAsAtPD3X0UjHz75GOk+uoRelP/SbYPKLtuiLI/KdC0@lists.linux.dev
X-Gm-Message-State: AOJu0YxzWbY6htVE/a84EUhls5xq6xRxzl/PszYxdbXBgWjoJxDnbx8Z
	j0qLpHvlI3yUURmktCN23E9bNzgxmAStmWVG1cerQJzIIjsC+OcM6oXQ5P5KDlXtWPZ8HDoXTEa
	uTCFsSMIEmrIBh9tRLEaKUUwf2mG8uJWNE8fV3v7l/kfXp90JGHfEgqV3nRanWjsyZfg5
X-Gm-Gg: ATEYQzzyC1zX0R7V490pCLf3Kez3L7g2xIv63t5iLJhGsn6tXh8IDr9BIDrRV5QNLTs
	S9cSZUPSWsKS/+5dhXAF0jWvugQFWLQ+HSo4ziqU7ZVXxXiMC8Qm5u8psdJCy/8tTRxmxXLfbdi
	t+m/BN+EKXM3fIrJpnW3Kg8kR0YIH4cre4Aea5j7UvYNxgpljckZqCDfJAVU8a9SQezJRP+yIPJ
	Q7eVIYRvhaW+z8x9aX0Q35KfFoUzokyhsqZjaQ7U30O+iqv6D6UZVrxglVBfaG6XmzpFbpKS3oY
	oypJa2OKhdiDImPih0X3pVlxZszhQffdjyMM7PDsowR4scjPqMQqrctpUb59DX9BeBmUJ8+wq88
	lJkoy8J3l7Z4qTZ12vFlDSwAcZZjxTojic6qHMC2qgfVyeh0kvrNL
X-Received: by 2002:ac8:7d4b:0:b0:509:1795:a7db with SMTP id d75a77b69052e-50957ba91camr166152381cf.6.1773654364256;
        Mon, 16 Mar 2026 02:46:04 -0700 (PDT)
X-Received: by 2002:ac8:7d4b:0:b0:509:1795:a7db with SMTP id d75a77b69052e-50957ba91camr166152101cf.6.1773654363732;
        Mon, 16 Mar 2026 02:46:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:46:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:29 +0100
Subject: [PATCH v2 9/9] media: i2c: drop unneeded dependencies on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-9-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2426;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ycfAg3aclT41fsBWRPRsJNKO48Ir9OozAETuIxOc+z0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9FCsr+3ySzhvaFrDEu2jlI2ca2/VU0ZuUDRZ
 h/QHOkV8MaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRQgAKCRAFnS7L/zaE
 w8OSD/4xPlSKe6zDcXWGEo5YW/EA9uYpMpG4PAQmPnTEFzbMr5PpOZXrZzNFIreMNBy2BpYPII0
 FLOfvACMKHBEK/lMJcpdhUIe+a8tPlN/SBSZTqiQwHIETPhjhExIVinaATuY7HLkMDFOQTP0JNC
 J2BqkKFeHcgq3PUcgb9xiRvZoMPCkxnrpRTpXX1y835JSmBnPDReQi6vHK5ADP1/BPutdidnyvH
 9yZ1TYt0ljYws4J7lSHR/WMyOjESwqYlEV69fRKln2E2SAfyf0FntWujUoN/kBchRmLm+n85X4m
 YbbA5PdEEp+/gZnj+Uhc/xsNPFeVN4oM0buYTASV7EXs0LcJMEgtxr6D14oomGSC4KMgGouUlys
 H1oTd+Vuhlz1fdvmKc3+vuHNauM/axnC54bVunevji7HKnidBr5irLbip392znw7aBqbh1vEfEB
 fRxBTPwY3ZNQkwCPLBO4giaehLHs3b2eRR7Tq8X09vWEZTdKNeb57phqFPPRESgjdPh+HLCarEn
 W0ATTNh+lSJ29lS7HwMxD9K/AF/3JWHml4ukBQ9t+4CRoQo7QKNpOBdybXr77GQ8uPjHNfG3Dxe
 5t73cP8z/CU4814/6ae1jBKHAPzcm/YjxFBsAZKehYuWY02UArO7lR+KM0SGGBNTmQxkWquSutP
 kHQ0kr8eTmMfR1Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 4KnnYh4hECdpD5_Jjqg0A7BsbhvY6-0b
X-Proofpoint-ORIG-GUID: 4KnnYh4hECdpD5_Jjqg0A7BsbhvY6-0b
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7d15d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jH2LZSAcktARuhmwcr4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX6PbWpyBhr/+o
 VMdYGwut5J8/y8MONfFq1DLbaBOBnAIsPLomm9XibY1+vY2m/miuTwsf7UH0Ii/xKwXSuydEeiK
 ZErOg+oYmf69ENekI4yuYkUvy3zTWqGf9z8g8cEpLFTTJP44eALnsKIZ2WUWyyBjIwwxgmPYp1J
 kcpDsrslnQ48YN9lBobiQreWv4n2Gh6McCVgUorqoWw+HkeGcVtQlp/VdjT2YnUkU2iN/l4IxvB
 6Fd2ZE6sC8Rs7YywPQLuzybUOWNrf3KcF90Cnf2N7dh831MxsGfYrjtZCxdYjDlad5dOS42atTb
 iKf0pLfJMeDbztkf7L4E8mHpvoZdD3ddj9/xwUkrJN7LqhXMOHyMu94lT1tvjAG/D40WLavJ5Hc
 XHSS/O7hlYNK7odWNZ8C8dMOMNnlIzTSlfR0SA/0F/z+86hDD9rvfZ5SKOHXBcaFRVljlXr5ONG
 1bYNo4dcVurpU5jpcxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075

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
index 20482be35f268221b2a14a73f4cac107fa0ffa93..1bfc7f0f0fffd395c548c8ce36d4e31931efd093 100644
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
@@ -690,7 +690,7 @@ config VIDEO_OV8865
 
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -1246,7 +1246,6 @@ config VIDEO_BT866
 config VIDEO_ISL7998X
 	tristate "Intersil ISL7998x video decoder"
 	depends on VIDEO_DEV && I2C
-	depends on OF_GPIO
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1284,7 +1283,6 @@ config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
 	depends on VIDEO_DEV
-	depends on OF_GPIO
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER

-- 
2.47.3

