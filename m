Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FA4394797
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614985; cv=none; b=mgqEMbpugmjmq0virhoCExfBxKzHsDlcIQO4Y7odeSLDLvTXfUwS/KbqzfFvw867wQgpEK03KulJqmqsqr5Sr7+I0FAlYrk4nFlp2Gncgro0POFgrJ8E2AvE2idyvt54S4sALmlrJo9TPI/BptxsbIm4m52fcnhB5om7I0gVDbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614985; c=relaxed/simple;
	bh=25/jbEOYGOkc8yufidh5ln2EbH1f7N7ePyjlT7NMpnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWbIj3Blm8OgU/Y47/ZLcIKsVktzCcQWPwpkF5+MzR/qGYd4s1xjVqA3CvIxsuqgIaQacEKNcck5pRmAggm420g+8v6n4OJEq/a2Wvav0XpCKWhzxcfV6Mlc9iuE28u7tRI6J16Qypv6r4tVRhxJneYl/A6y1bmJBFcKg84dwBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUxvvGa6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkvtufZ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUxvvGa6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkvtufZ2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246DEm61203324
	for <linux-staging@lists.linux.dev>; Wed, 4 Mar 2026 09:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2M3XV9YCtC+hAJ0aUiWtgAH4zxDrUJHdwUvvL8ju9A=; b=iUxvvGa6AHVsf1CE
	cIAp40KFRSxzaMK6tRo/Ot89r0FLdjshWY1bHp4UoR+oLQgLfgevmBmFzcrZzI+S
	MAYwCgG+1Kw6HklcYcmTPb9wnio6Mmmu+KNfOxWWI68ssxjEMOiht3K6oHazTm7d
	k59m+ycliFGezRAiNrZa5IQD9eNfQm1ux5umtdteTjH4P1BmPua270CY7X2LVHSz
	ducmX6SqIi+BprB0v5a7ITYi8Y+CLpwkBXlolQnD8pkrTK7mL8+KtWu1BOV5TSZh
	hxYUisIwzg/oCq9VRTY5RUf7H0eHiPu9dmGYvMaD78EeNmc+IFNqqelijKxcWMdf
	yxzJWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c0jsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:03:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50340e2b4dfso9647031cf.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 01:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614982; x=1773219782; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2M3XV9YCtC+hAJ0aUiWtgAH4zxDrUJHdwUvvL8ju9A=;
        b=dkvtufZ2BcpEcHYQMr7XTxEgFB1dyNLdUnSCJmBB1reduJJTRrKFu8pIHeTlW8rLPW
         NhApdLi2MzBKXdjgvKhiNuq30IswmiD1pMNDNmqnMEVHXzaovqJQRfX+pfa/L0HFtQBn
         LxwAT0k+f7X4DRMvKlhibFdpsZutgkEWJCbKSeFlFCdUJK6EanREpRqCWJ70KvRxdfn8
         MPq6ScvyOs6cwKrvEN2Re9C2LkOqAMBTUFEhtambe0vqw49IXzy5kln46tUFck9/Lkfz
         RFr0h+JwRck+Wu3NCDYOr6MbpaXt2Y6WLHtmxrypoEXsjAG72nZV2RAdi0Xwz/wTMZ1A
         fC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614982; x=1773219782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G2M3XV9YCtC+hAJ0aUiWtgAH4zxDrUJHdwUvvL8ju9A=;
        b=I4xA1daBC0zPpa3IhiMG1KqPhtx924fFNJGVnMOaXWmfhYTZlSb0vwSmQT8GgXHE9K
         HXH3QGqDBwSS4hp6G6/+clZoqB1WCBnhw5IpGzYh8wNXXEDiQ+i5ZCat8A2PaiGTvMxG
         pwAcatcAqUQh5Jn3jS7VfXIBKnXJn3zjjlkaRHmSXVMlN8bOHTrpcASVDFNi77o3RS7w
         hc/hmp051oFRq6VHi1EARVAQhZL1OtTjQqwEtPUFfC2DYjBlGsmyWJ12k0bJiC71sc5K
         Arv4yR5eFA4XZ7pftEjBl66Y1to1/n+bmv7HhCeMuTVqCNMdGY7S7ZMgmRmzLo5BC75S
         f5cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmNNuhZuihHKJCfzHjekT9XzGViKr7a6SB+ABwsteoEPTlgbGjZwl1r6SWgDdWKasN0jjjBOyplvlLNWiv@lists.linux.dev
X-Gm-Message-State: AOJu0YwEpBkaSd0u7MrmTKrDSPACODKv13DqffacJREK9UY3QBezMkPo
	Ho93pwP5dVrBGf0J76jdNMevEKaKesYU4/AONR2yGWOB+is8nS38jZ+JNAkpL7QDll1E7oyQ1iw
	bE2d2iNiFmO/23CAM43sTULmhMYMciFLleRmdxCO2c0Se3ulLFkfm+5uModjX13OWDSNc
X-Gm-Gg: ATEYQzwh42jszrKPHup4otFaK2k3hVD/UxwS6pn5+v8MVhUJ+uIlzBs/BWYin+HLwP9
	XowlDn+stIIFum/3mKP+h6tzDk+1sTnFn+Lu/XtWliZgvSHIlFfqozvc9BKScU41pJFh7HpCChL
	hUDp1sIC2EF+U5qbY47MJva5WPrHzlyzkapLm3DcPJJc1ATeuvwyhD3OA8cfoxWOAyL3qjYs/3Z
	kSNyg0le6UoJXBvMwiHWTHbcgNcyBr9/ETToDUpttd2FeXA1GL1VrgMYRbTUQZQUoyRjVMMAMT9
	Pshj+TAC1bXVwG7EfAfMCGIKdtBjzrlT/vLm0hJXWBcNmupsJXMAmWaIlSXFx5WykuEjWLuqgZq
	RJuEdPr4uuNM/rbMd0QZmsuawWZnz/zl2i+Pv7XJe77DV58KIsTrd
X-Received: by 2002:a05:620a:199c:b0:8c9:fac8:c256 with SMTP id af79cd13be357-8cd5afcc900mr147424485a.77.1772614982509;
        Wed, 04 Mar 2026 01:03:02 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8c9:fac8:c256 with SMTP id af79cd13be357-8cd5afcc900mr147419085a.77.1772614982041;
        Wed, 04 Mar 2026 01:03:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:24 +0100
Subject: [PATCH 03/14] powerpc: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-3-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=25/jbEOYGOkc8yufidh5ln2EbH1f7N7ePyjlT7NMpnI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UsS6j20gNdLUQ+uz+/FXiej3C67iz8F70QU
 ojaj9vQK0mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1LAAKCRAFnS7L/zaE
 ww6REACusP6I8XHqjA+3Yae7NeDqnzXpc6CQ+RTZzkcMq6aAfUEFS6xnlAen19ugyDgZQXHMarL
 2otsWD2rzmrQb2HB224/i2HmhrzTdbDRtBcATi1drYJWZXJq8Tc0tiILUbI8u+PUscTUJo6hOqo
 LLNyADlnO6/+12tJR0Kqga/FIARCLH72kRa+lJ1ioUe6rOG9rJjhYXcRbw6pZs5hNB9ccVw1gJg
 ok+/f5EYeeaHxbcGOMdXBmfgCELp6K4Z4GXyJ7+kWaJsxpvsG68R8kFZf/sUqZ6bysAp9KoUwES
 vstNFoLcRpgQGqBTPhi1BiKUEIAyfSWeh1Sts9nhRiXhe8GMSiRexRJ7xdDe+5eNhsNZ9iiBB+y
 9A3PzpJxACN6XNe3ieW4gmP9KV9xqdeOkCJOI41SgiYsrsjVvwXpx/RIzZTINJ3VOp6NYNRhqZZ
 5i/EvVw6gA7ozjKWgwOJeoa7c4FA6O5eGpg16Of9PXIHsU+p22FJhpa1uJxjQPCRoNW407R+LlN
 BwA/WM+f6L/iejzY7jy6mKzM0GzafixchYkMgywGkJzyPW4BXrvxclKdjdkMWqydECbBSpDUGdh
 7kP659V3emuNeEifz+/sDkqbSwB5RFmpXCadYNNP/SCDu5RVP6K2Z4UIdcTMXSlT6UB4HYSuush
 EJBC5HRypdQ+c/g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX34PTnWDwNuIn
 7TVFLufxGW6vG6nUMXXYVetqQsJ08EYJ6VLyQkgtefAHVimOiwi9H6BqQQdgJj201x3mM/ajQan
 n3a0kjALC61pmiRryY7eeyBwE7Dx1/Ke0yv+Yg5nWmqJJPq0MMRh7Pw+HfYEonzL9z6jTehBKqe
 Oagc4w7CfvKxsRIWXN3U92KFy4BeEk0gS/5Wr1k3fufxaG3bNLMHJd8zYY71dfQmLQWhE/z7o6h
 98SBd6w+2tKN3B6zhcRmU0CvX35WZnDvPgycKFxsT4b6HOemCbuWgCNMMYq4MewbUn0pKy81Q85
 SYTeFR8Xn5DOPOJBMQpmF2fdRAV50exSNh9EhD7haoBLBZ4PWK7pw78PwX1opQkpXfSD4NoJhqK
 kSElC2nhUZ3VRbxx0EItIU76eKpcWrJgdy/KH9UQ2VzbwkhMDhFRjGxbDqoG6FLBZax9pmxssw5
 8ic1oSqi8MqKAQ1/wEA==
X-Proofpoint-GUID: hrljQJkXelFwnyXl3wuuvzsbno_XiKd4
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a7f547 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=CZix5RWMGGMvBx25UzsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hrljQJkXelFwnyXl3wuuvzsbno_XiKd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067

OF_GPIO is automatically enabled on all OF systems. There's no need to
select it explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/85xx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index 604c1b4b6d45c11dc3149ee8b9adabe593882c8e..6805c19ac8a915dae1bd24b13010a56cf1948ad4 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -217,7 +217,6 @@ config GE_IMP3A
 config SGY_CTS1000
 	tristate "Servergy CTS-1000 support"
 	select GPIOLIB
-	select OF_GPIO
 	depends on CORENET_GENERIC
 	help
 	  Enable this to support functionality in Servergy's CTS-1000 systems.

-- 
2.47.3

