Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117B390C8D
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614978; cv=none; b=L6Wy2/YuOy9j2hKbvoNLKyjLMgNDwaERRtnrS/bLEOC1Rs0C3C/TDjUaC2DMZO0LOHkQMS3kWNHHkGq/95d1gxHZV/38MSIvKdvKVRs1cQAuxTuKEbsO00CV9/Bm5ZY2p9hmZwYVnmXHJDgfEaWvnVlgQiaWjOH3bPgOgFCcfSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614978; c=relaxed/simple;
	bh=vzKg2CmRZRz9tDx8jerfN1FNHIadNDJlHWQvRijQXa4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dfNDiH9M0rUq69isVh+hqQrPkOIu3ZD2DPjKZUdkw0C32r0vyR6uYZWuwoSfjUxmdVLlwJt9i+13oOo5T9iM9wSrh3Z+V56HvcJ3No8rzc/gB9gcoHycdqVBpOtfR3hRjMYXSEERZ+99KNIAPxsQ6DhjWp9JiuzhgyphlRXjyos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P11c3pKE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKMuC9Pu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P11c3pKE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKMuC9Pu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SXrZ3110522
	for <linux-staging@lists.linux.dev>; Wed, 4 Mar 2026 09:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oemXeHFiAD8fwC6Dvlocm0
	aqSqueWx/Mi2JGUCBaDkQ=; b=P11c3pKEW59ZBshwgxJxorRIb/Cvzay+2NGICC
	TUIUByAaAlcJ4kZ2u+UQRh4xlir4oUZ+Q4bGcQlsbPpUNxvswgzYkQGeGnf14P6Z
	cQyRSBvUq28fC5gx6GVvkfsI0fZSqw/uzBYgsGj4SDJoTSWaerzUDMO3bOVZa+GO
	WHl188CFGvZ1icutpN8PmB1fhnMHjGSISUiSpwMVEYdAcjiiBfAlQiuod4toeHcj
	O0r8mK1uDg9SCCe2nZPDDCy7UP7vKNiEqXPDGeazBlvFXHErYyAGTVHX6OMBYVqK
	snkDYFGNPNyWf9q16AhJCZHo6WGOQbvwCO3SUEWD6ILYkaaw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2agr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:02:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a08e6cd15so119268846d6.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 01:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614971; x=1773219771; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oemXeHFiAD8fwC6Dvlocm0aqSqueWx/Mi2JGUCBaDkQ=;
        b=IKMuC9Puvf//EhwbuywKYrxbgS2AkD/ICioxG5Xyic1SPysDvJeN3ZmeuUlItFbI/y
         AQX2uRkWhJRXvdYdlnTfN4Ak31xESLF9U/5lV4X4XsySRkNrYGlZyPpZ4+3BV+VEZPKw
         PgEZq9jxAt1KdiDOiHaDiHbbQDcVb871PWXGQPBgU3spvGHy1Yd/VLkwHLwIIrOv6OPv
         sfExKYrqmM15FVwh37k79G8sAcuH0HK3R+g65kFIXw5fIqIuW7VISgMvQ2p51fpyfMWr
         ZKQGyN/Qqire2T1kDY0yIJmXawkJa/T6BLPpBn5OTkjkKa1SKEMO1KPUFHHlO0rZ0uKk
         rJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614971; x=1773219771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oemXeHFiAD8fwC6Dvlocm0aqSqueWx/Mi2JGUCBaDkQ=;
        b=GBhBb/JtjFqo6JlHytsz8WTVO1JOmuVT+AN/biX9xsFBdu1cMoktsNz40XCfPHULha
         LziKW0xd+J1+OIVWoyMIDNEJZyAp1IQlJvz5cLp0nX32SJ78dLqgC6oZcSVDcZp0qvGC
         DytbJ6ucA+AqRPwssaNdsyCv+8EJfPAnCrwoFfWOUxeFWfutMqJRBA0X/rrMsiBsWHPj
         h7dDoCqrazAzQk2JMH3i6ari06C6VTOdxdJX8PPF6RKJybWWs2N2wQw7n+wcF7qqaNTd
         2wIvMUpZoiUmOvDdqCEQH22NADu4n7vJCYss4TV4bhliUabzIbbsvec5uJLW/GC8b0/Q
         p/ig==
X-Forwarded-Encrypted: i=1; AJvYcCW4lgS8gaBKBTfALunwDXeUBLLIKsVeDkDLeFVysw05e61fRmUvERjzk3Evfa+76nQs9YF2vchlN4In8ssB@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh8BFM/Mj75S4lnCS8Br4PTKR7R75V9+pLyDisFwhvKxP5m/QT
	D0DSdoAyna1UkSi+f62ra4AXSHX5PEhv3ZNtuR5k7jIsf1vyzvJyBMrT9lwmNmj2OHULxJYLXe0
	el9P54AoCjUVsMHB/NgzMOdHUlenoN/nJkYQVih7Uxox/EUtwqQOV1X26PUDOX6ckoKtb
X-Gm-Gg: ATEYQzwtUROkIxTHWlyvLNrycLWcXuoAlPu0DdpLMGFGqcukOVnwx27ztA3Z9qLqzyR
	W/q7dOCH4uFpZQWPo2SqUsem8jgHc+rAFCpcxoSXHbdcQ4PDMULb+4BzLyioE1VGx02JjQZbXMi
	PUOVvX4xeJr2MMeG2izaTTlsUyZb9/Fahr19ePWvvddvx6GY4qCoUGlIfs9F3trXSjrGJW1otXG
	eH+jvuFHYIkqsTc9t2Smmq+mbifWysYJHi7cAqTizB1H4SLyIqJdd6tvcoxuttoxwNrGK7v0YjO
	7n2MPLioxE7nLK1ZxNSXlre/1y/E6462FB2GCXpvA7NQmoiVK6cvbpyOeVKmBdXCATb4QJgUL7J
	gDZ8Fafo3gtJldZemcuLQaKufwlEeKOPsxQcdeGdYTmntE2iBfQPa
X-Received: by 2002:a05:620a:258d:b0:8b0:f2bd:4762 with SMTP id af79cd13be357-8cd5afd3c5fmr156641885a.75.1772614971123;
        Wed, 04 Mar 2026 01:02:51 -0800 (PST)
X-Received: by 2002:a05:620a:258d:b0:8b0:f2bd:4762 with SMTP id af79cd13be357-8cd5afd3c5fmr156638885a.75.1772614970677;
        Wed, 04 Mar 2026 01:02:50 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:02:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/14] gpio: remove uneeded Kconfig dependencies on OF_GPIO
Date: Wed, 04 Mar 2026 10:02:21 +0100
Message-Id: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB31p2kC/x3MTQqAIBBA4avErBsw+6OuEi3ERhsCJxQiEO+et
 PwW72VIFJkSrE2GSA8nllDRtQ3Y0wRPyEc1aKUn1asB/c2C4vCyEhx7JD3OZGa7GLVAre5Ijt/
 /uO2lfCyoFdRhAAAA
X-Change-ID: 20260304-gpio-of-kconfig-e257ea7c9a09
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vzKg2CmRZRz9tDx8jerfN1FNHIadNDJlHWQvRijQXa4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UlV7KEbnku5SM6ln9ww7x/7ZvkbRgT9akwX
 ZTKY7PzrYiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1JQAKCRAFnS7L/zaE
 w5VxD/sFAI2igPWylEwWYYIK15BDRKiW+6YYGAfBqLpYl9ZCdmVgeZD06r7JMW6noA5hFzEkv66
 pvwjnkkl7u3DFOw8V3GJsnoNOOowaj6Scqektj5r5FiQwuHc5I8abfSLEsV+V4cO0v7ZKq29NWM
 Slk6AkPOz4Dk9WvQW94bOEYC8bLWudd5dgScZ5sDtsXB2ZVkOU4Un4t2pkX+8AD230La5Ao4gHq
 2nfPT5kU2Ogk9EZLOE66LyX5r1zO/Vj5OAtjgB62Cm3oV01ZLErMP+entT0fo8yY5ScmRMaFpUo
 3lszEgJlDfA1/ZDe7YGcx1Iqfxnt3/YFva8swh9EU9K0fTllltoiemPhEcDsQa5L+CR683lH/5a
 FVYvSL0skiru5EDCrTdHr9OUO3u/OD/twdunXvFtT4F/LzO3iDxvE4CEGqlnI+tyOOv2IzMGGGv
 vbQtrKM8lRKn0N/IC77/tT7IX4aqycoE1lunxb24p/sgoxdJc7e5jEgkPRPmXIOB76VxKbGc0+n
 1F3iiZCY9qL3lsySV+j+61W3cjjIYoI/L5iDJbnwnolQDGAK7PEXv6yL4e4j8aGyXOwDd8Gq1aO
 avM0vTJekP9BWzuxJMN/Y9MbMnlPvTbKHGY0BPgrchdO2JNNJztzOUyRDL4+1lGfij7PFp3V2kf
 qVTMwUWNMgBvbzQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a7f53c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=RbMT-lXscSRh0E1VkaUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: pRjf_My8d96lq3m7_i7PMaAlbM2IMCSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX4gsfuWJwMlsF
 aAXZVGguRUlmuXfyPhNaD54zJi6TJosylALOlHiVQMEAUXWkigkHZA6pzRTwGXHtLq1T0xKokdi
 o6VfQP7Rg0tGqQ3+AV0xzxFxa4znk220PPft/GidNVK85QoCdCfRgAYqYSZ+h6iShZIziM+wOj0
 GL9f09HS2s2VcNc3I0X2YrVC+Wy9xbGFtsjxOD9kmE2aUfPxvO9isATCkOaVBth7WPbn/wXcVUp
 8nXkJ68Xw9Nm/ciWAfyYY4uAj+BTqs7+LLOY9yR1hD//d57cdt5Vy7BWTvzCRZVGvhOkEt3YhdH
 YnvcN5uiS0r+4Z/ro7N+YPNjK2oBvFhSdjOCD5j68bjXCWZ8FrF+Xufm1Y9U3s4bAqJxo4OrMFA
 XNnmX9zAowPyhj4Yg0nqtpYvNywkyUy7DqeRTfHcLt/+Ec8ncKst1v5I0krmFdrEyX/C/EMYy2E
 WQbvXX2BFKNgusKEgzw==
X-Proofpoint-GUID: pRjf_My8d96lq3m7_i7PMaAlbM2IMCSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067

NOTE: Each patch in this series can be picked up independently into
maintainer trees.

CONFIG_OF_GPIO is a switch that enables the compilation of the gpiolib-of
module. The module itself handles GPIO lookup via the OF-node tree and
is automatically enabled on all OF systems. It does not export any
public symbols to drivers. There is no reason for them to select or
depend on it in Kconfig.

This series removes any such dependencies from Kconfig. If a given entry
has no other dependencies than OF_GPIO - they are converted to OF to
avoid new symbols popping up for everyone in make config.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (14):
      arm64: Kconfig: drop unneeded dependency on OF_GPIO
      arc: axs10x: drop unneeded dependency on OF_GPIO
      powerpc: drop unneeded dependency on OF_GPIO
      net: mdio: drop unneeded dependency on OF_GPIO
      regulator: drop unneeded dependencies on OF_GPIO
      gpio: drop unneeded Kconfig dependencies on OF_GPIO
      pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO
      leds: Kconfig: drop unneeded dependency on OF_GPIO
      hwmon: drop unneeded dependency on OF_GPIO
      watchdog: convert the Kconfig dependency on OF_GPIO to OF
      bus: drop unneeded dependency on OF_GPIO
      staging: media: max96712: drop unneeded dependency on OF_GPIO
      power: reset: drop unneeded dependencies on OF_GPIO
      media: i2c: drop unneeded dependencies on OF_GPIO

 arch/arc/plat-axs10x/Kconfig           |  1 -
 arch/arm64/Kconfig.platforms           |  1 -
 arch/powerpc/platforms/85xx/Kconfig    |  1 -
 drivers/bus/Kconfig                    |  2 +-
 drivers/gpio/Kconfig                   | 53 +++++++++++-----------------------
 drivers/hwmon/Kconfig                  |  1 -
 drivers/leds/Kconfig                   |  1 -
 drivers/media/i2c/Kconfig              | 12 ++++----
 drivers/net/mdio/Kconfig               |  2 +-
 drivers/pinctrl/Kconfig                |  9 ------
 drivers/pinctrl/bcm/Kconfig            |  4 +--
 drivers/pinctrl/meson/Kconfig          |  1 -
 drivers/pinctrl/starfive/Kconfig       |  2 --
 drivers/pinctrl/sunplus/Kconfig        |  1 -
 drivers/power/reset/Kconfig            |  8 ++---
 drivers/regulator/Kconfig              |  2 --
 drivers/staging/media/max96712/Kconfig |  1 -
 drivers/watchdog/Kconfig               |  2 +-
 18 files changed, 31 insertions(+), 73 deletions(-)
---
base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
change-id: 20260304-gpio-of-kconfig-e257ea7c9a09

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

