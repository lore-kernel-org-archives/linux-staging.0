Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40DF39656C
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 09:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615011; cv=none; b=AleDpNfatlMT9BV8N9J6MgGAMiq924ncrNeeufGCSiuSLOtJCssm7bCUaYgzxghNN4ksbjfuB0yaa6NAg5cSMfT1ACPseYWpJmD0Omg9qgSid1fr9AR5gOxbEpVcNYtm1dTYn/1x/bAEco+tms9XcQbZIA/h7IOguYW9M/MUNeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615011; c=relaxed/simple;
	bh=BZ0gBX6ApkbfQGAvIdrTK0HNC5TATefci/BtaAEAScU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyjNcQ9izjNv1qMfZIZdh+o/q4ggdh2Dujtuvdv5PbjGSCwlDQCk1+mIILLtvGEHrMTIUpzGAui5f1f1O36g41jZOt5qGdXqKblpgQlg1Xy/x7TK37WjoC2SRP7+ZfywHu0ZT+JNZFgTzc2gs2xkks8YXj3zhKgNm1iVEIfOtwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8DhNi6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1AEdqjx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8DhNi6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1AEdqjx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SxRN2306688
	for <linux-staging@lists.linux.dev>; Wed, 4 Mar 2026 09:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=; b=O8DhNi6iiQ0wr6Qm
	XLgu0rlhFSuVWEQJkPbXZmZ9JD0AwZqTH8m46nANsRAK5ZixwpLI4VIEw8Za8BCw
	d4WiUqgPneaIhP+Ubju+TIK3gQ2rtr/xMZVAsMGU44w6cZ+kxjd4e/FlWaQiPO1H
	BR2NcuGvK08bm6aCDi8fbg9vt4ty/wRRgG3R3lMHBoVhwBQLmvzkLaw1B5gLozE9
	l58MB+oJBlSMflR1Uzzsa7vjJiRM7ipJrU/Bd9Wa0PWEfNFOuppvZiDZQZ43xps8
	qIS/mrDUT0yrBclJLPfzLA3bR++4OOCwfWGHZ+RjwPOufd0zashYK1qlwHOJ3UqD
	3ux1Vg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpau8sf2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:03:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so828639985a.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 01:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615008; x=1773219808; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=;
        b=C1AEdqjxRJb3a7uTso0qwfSSrgBLUjMlpCRufC5l1+Y9feEUNvK3+TsvXcX0Ku8eW6
         OgAnfl5Y8eQ/Yce6Z4qy6G2UCaDKMHGDutRRAYiC+2EmV4weMfBxW+SrzSnynopWougO
         pe3pxkSKgFV89kx9dKn6FaJoMW0Hwvpr9BCdyNHMobVY4eFvM5OrjGMB5YyJOZfWUwwW
         8MM/hVfRLkw9AWMZooLaP6g3jbguaIMTvXx7hIssLCKueQoCAjz1qHaDJoPWzBBmdI1n
         XIKB7XT9f8cvvM0rwu/ridMSgRhVERKrYFe61ew73LhMwUsTCCBCervdW3SQ5/TjzbQ3
         4R7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615008; x=1773219808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XxApZrj5x0d+xFAjK72RyeZ+8kWAT47gmD209wuddiM=;
        b=qUrgWzNB6sdjk68TwEMiFsqPKiWKZtVMWghzYBasV1ketwdRM5fduN9wAK7JJFwERt
         sqG0ItUBvJDrcomkX8kaQiT4pRL8CPd+BZdP46p+M/0vtlD7IxOobAL0pvma7NOSb1BM
         LJdmeF4JSSgQh41zJMD12lxHQSxx4SsvUmPbsuUfbRI6uYc0WJ9NnOP237ou3NKC9zXO
         NwMeLboPOvNliZs4cog2dRNXoYS+IhkdV/m/EoPNHatZ+mqEKSckVLRFpFJqIAXIFAYN
         g4D73HqPb+tlMtVHEdagBGB9JSiNaFh3SQh+LsXMwLVibhe2P/LngpadvkgPfREI+vay
         OCjA==
X-Forwarded-Encrypted: i=1; AJvYcCUnJy6JFYeJvfgY8S9NiNg0mCrm8WTuveiu/QdU0gE/xuWCob8lkh0B5c0IZJqvxN775b8cu3t3vtV/GW/w@lists.linux.dev
X-Gm-Message-State: AOJu0YxdM8Y5vr5J5SVN4eHnO0w1W3K0W+6StD8w1/LgJZpcvMLlDvDq
	UbaqJ615t7cMY3lSjjtafqZ0umoccor+dxON5H8iUbp1NT75O9YsW2kj3BtuaouUJ548rcfcMb5
	COSzwIaDsUHJXPF7JmgC8epP0FYRguFitZHdz92fhl+XQKdAK/JIlbf2hEfQR97OO48L9
X-Gm-Gg: ATEYQzzas1+lWp6X3HWlszceY+QTN9IB3lsx24a8UOJUb1KNUPByI5g4BUo0XFdLpkd
	0Cyuv4ALzn71/nCP5EAm1KElfVGFXNxV7Udt4uJKTxdMyS0Kn6oja3pqcT/G7bgKcgYwOmKbnY3
	AkEd1Dj58gZEgPjIY0z6HaClTaJ9muB43ItEP62xOxkdOTE2+FYd0sY97ERZanPdenDng5KrMRe
	1m/OnE+q2p2anUYtvFCplmdaa5FRIHe7BZnVlPbeLcBd11ipZl8GMgG6DvB9Iyp7mpiiOFMOzmn
	jgtuHrmqZOI6+3iwoKJoBPe614ZIh4ZvQiqiEZn3DpgxUqzy6KHVGe2hwoiXH994050Hb94j7ox
	7B5heD0Xjb/qR6E7BmHvrg9/t+8w/R93jGPa/sfz+U6bBnKAClTOr
X-Received: by 2002:a05:620a:1714:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cd5af843f8mr148863485a.38.1772615008133;
        Wed, 04 Mar 2026 01:03:28 -0800 (PST)
X-Received: by 2002:a05:620a:1714:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cd5af843f8mr148858285a.38.1772615007620;
        Wed, 04 Mar 2026 01:03:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:30 +0100
Subject: [PATCH 09/14] hwmon: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BZ0gBX6ApkbfQGAvIdrTK0HNC5TATefci/BtaAEAScU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/Uz6yqxw+9I2xsnrbiXWkb1Q6qa6KwlYI8TK
 d9JejBIMTWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MwAKCRAFnS7L/zaE
 w/3aEACwVZCfqTwZVPWkHYhO8Qy3o0ruCZnb285a+Ylf7yiCsvgYQn0a+sJ2Arc7KxxU/aPIXGv
 0aCZMBstfCGSxehuCnwhBer6o8ip4bb7kyIIkx0dm62T4QqKQ5L5QA5G4ciTBJ8EuvjtnSMeGuJ
 95epXjl8sR026uh4KZEYZYxbOgIWvV2Ug4vquTWPnO7T7/frpn7ujJB7EUgTMG+EHBSM2FIE+0v
 HWjaX7Q/qKobdkdnrFIva7tNsWe8WCAiSmYSvQGlWmDU15f/4yihAn90zQLK14jwUIIvbqKCRxW
 bhf7+1haXr3TsZRioTZ5+sP9XAFSH7Urm6a1oEoHKB06fJnOPAEawTfp9MNx1DfqPO3gvgmONrV
 yrSwl3IpJ3ld2yUQuOFT9i2nmkedupRNvQtalNFEPOpJtbP0bakZqh+KnXuyhvNKScPwT4MVgHu
 Lr4cvrNkmt//CI9a0nV0Wx85nantYCCTBfgiWEr5WrWOVDtQIL0JTuP/KYxN6KWjgf2fXehFdib
 dWGeFHTIp/lY4HrTk+4tQ6oetpUDkdppOiusjNeG9zYX5WjnV48wsSXaXvsw9gkjpeLyJAf1lNV
 3dZw5ihRTGrkMUJYU/0S567LpMEIQZfQetG+3NuIzQOs4p3djYvv1xGRysT8SVHkZVcA3vjwKfu
 YphKNug3FwuWLkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AJS1/0o2 c=1 sm=1 tr=0 ts=69a7f561 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=DLk2I_icXWleI3Wn6BIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ZaPbHeUaVIH52FJAjbYyISl1T7_9C7sh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX1vjcqv8JzEWK
 GV0JzPbCUPveie/ag250jAmJTu/wKQM31LWcBA/eXtZdwXtKKRHt6PROLFFfxHMdaEPkSo5qmEC
 s0xeobQfvpkbcJhT8sedr0sknKGl6tVNOqwKTlVb0jpsFnZEnVvzxJXjEVPsTQx+zeuBItouZau
 uopxTpKzkka93aaN0EbGAIBqEv+pjt6lB5YL/A5PwE8B0tCN6VxPZjEAlPRYHTItInAxAZniOyr
 um7fwJ1FQZJQ56a9/33RZ40rZwhOfNEs/QkLiuxD/QKlUoKQk9qNbA1Rue3hHe8dkYPGvoo7kGi
 gk7SCgX3vifGP3j76GCGX0ZKMpeHiEspqiYD5wrkQ9M/4OsYO7vHjOn+ONWcnK9jdTpCqGl9jX3
 9u4AZR0iAilDF8NZTs8MzJ5chsTisdZR9ujcFqWPKXVjzHOEwu5wXMs9VGAYPqlBx0Cc//+BtjV
 VCh39uOTPMEJppCYasw==
X-Proofpoint-GUID: ZaPbHeUaVIH52FJAjbYyISl1T7_9C7sh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/hwmon/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8f7ce66ae3a258ebd439ed97441bb087dc01c76c..fb77baeeba27b9ec51142040beccc953df0a1e3e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -775,7 +775,6 @@ config SENSORS_G762
 
 config SENSORS_GPIO_FAN
 	tristate "GPIO fan"
-	depends on OF_GPIO
 	depends on GPIOLIB || COMPILE_TEST
 	depends on THERMAL || THERMAL=n
 	help

-- 
2.47.3

