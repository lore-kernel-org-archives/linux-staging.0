Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4503932C2
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614978; cv=none; b=bH/g9N+6w6WyzBeT4chZDFB4+0Gelgu0XNfBaEcEL7Cy3Ib3TiUgkl4hJTRxXRH2WOksPwliO1w4T7bMyyxs4TIEx7hpKfdC1+ec65d5udqYmHC1R/yyakU11+OSkf5umM+g0nBsBBR0tU2Dn4YSuqcEJUsY63rL1P5XP0V8JfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614978; c=relaxed/simple;
	bh=Et22qRZo4fsW5XM2dyTAA1YIF7lG8E4lUkHkWMi4kdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQywmrXUWtuQMkiuNNzV++MuvtoYeWzKZsOwqkRucHjWQGTVRwx8CCcK1M8DrLNH7/xveCxiVulsnIJN0EqlmAM8ndoZeOCGhcHaCshvZsCuJRQD1WU7HzSthW5fHAX+uu/zeQDxYeb6y39hH6X08pV6H3pyqQuuywoVVqcEs9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etSmu2rr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mtcr/yPb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etSmu2rr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mtcr/yPb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SZT1945266
	for <linux-staging@lists.linux.dev>; Wed, 4 Mar 2026 09:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=; b=etSmu2rrizN+QK3x
	oG7GvtW+6Qa6phJi8triQQ2AQrl/vKvaOX7QkhxjDj+PgYK76eLlK0O7E6S9MNks
	ocnckIef5kk0uikiMLB+SwSLDjUl7dN+lgIAdcG8UZqEjo+Wy2/70jXjOgh6nwdJ
	ntxj+1KIps6UyUJZ4VfLS7suCNmvUjjQlppHRsqKp9ImDshNr7MtQMDRg2dJDCw3
	eJt6pf7Co9aKbhjX9iho+fIKxMGZlr7H7upL2BqnlPqlkhdSs522mDtZbX18LyUk
	porvDeHZKJb/YKz9hTqiBP6bjambYy3iQ+L//r4c89tqHMdrYo9vXU4rUWbYYksi
	M6CNFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfccv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:02:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70d16d5a9so3929880085a.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 01:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614975; x=1773219775; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=Mtcr/yPbnjVKMbHOwAGZ+k2/hbrcBwPgvZtrRv4JUN8qsgaVqrNeY7ISORx++pNjSn
         hPvAYiUqqfF20hdf3T6iDieimV8Gag61pw/m8jq0rVxsqJ0oMI3PXD1b2gxpxxWSD3Wu
         ImpV/88+8MbQy/YYKukZx5wCr87bOpuR4o7zjAGTTfkF+BQIu4vWuD/s0tpv3U6MAAeD
         5B+adQu+4fLGzECx4V5+KmgxWIAwYvr9Qwh0vlzNoYwp/ZY62Om+1CW1nhub4sdMrWyN
         L4goO698dWNKvnKFwC1IJZbxwX7rYf3JTxQOp/GJnXl3L/KXZKo3lO+4OdOMKeO+srMK
         ZqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614975; x=1773219775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=U/YqYGKfo2YMSXmU5q+GQTJHbWSk2yDc/uSTwafxl0Tus0OIllDeEujQSRl4NEyG9R
         mL7vmAk7BEsn8N6m8cbS3O2aiMQiqy+w5nOymbyESXBNIQHWjTqbpGxiZOmsdbTrtI6M
         5uUlLFeQoqnFqPzbymUXhB8xolW7IDNBmIu3BQPNAINeVv64ijLJ8nTEqqmoDQtqr80t
         G27WFxOBdur9LhTz8VYOm6enNtJqYuDnCahBZ9LvU9D3f20xTVghDZo9RKxk1kaOvhGT
         raXyGaVXf1ztM6QE8Ogw0AsLeOFsVLaFY7VkFC4dBownWWFFUx/ooWsZh8eOmo48XTUw
         GSZA==
X-Forwarded-Encrypted: i=1; AJvYcCXXBVMf5sFRYnboEUY50o+doxfwGSCSK3O5LWQM4mGl7/5ogPzlpmkG7Qtk1vwo+cuUKOIkKkqVVmnZMm9X@lists.linux.dev
X-Gm-Message-State: AOJu0Yzchhvksasjc/Xny0Q9U1dOKZctk9JpX337+Bjze9LfPJ9Juheq
	F61fb9z7spld94Jz+nrc7QsEwqp5Uwcm4PX2DwkekkPGRtGh0YIUMxNGDHPhsy36SPLwk7pOrr7
	0bhY1RrzCv5PF6RJkyJVtiLEFOxBXrGDcFtYwYPEjfLmwf0okmb0pGyH4eK9jQTz7vupY
X-Gm-Gg: ATEYQzw6wilK6Vx7its0qaThVSQVq4n2etPRzU+lFkhx9wsVw70l5J2SH76EyiF4ZeW
	WECp95YiOeRJ3MDMiDpm6Ci8tk5BOY5WB7MGKh3cS4oY3jjZlIAFWmFMh9jCauxzp5s2qm/LZVc
	Z1yV5o9nmMg4YZcc2pN371EVGUOj6tvXSF3SK7rtNCD3CpPr5k/oUucR/JyY5vrsn+SsPhGbAjb
	t74sELyfWawA5BTUO44vOCnx2oaJkovQpl16KAGQYSz3VvJreTbbHnuFa1D9H30+PWWwGAIm2D3
	vE6colcybFpC99JYB6+hGHRLiSc0SPcVVKa/dyBIOHYvy8LTHC1eDH3kEp3YSLMtNbZqpcFBSuD
	wf7H3+nh4l9Y7UxIExkLzb8hUSg8rEyfsVUXqPFPbzwGm9nvUfJpG
X-Received: by 2002:a05:620a:1912:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cd5af817a2mr154595885a.38.1772614974713;
        Wed, 04 Mar 2026 01:02:54 -0800 (PST)
X-Received: by 2002:a05:620a:1912:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cd5af817a2mr154589485a.38.1772614974225;
        Wed, 04 Mar 2026 01:02:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:02:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:22 +0100
Subject: [PATCH 01/14] arm64: Kconfig: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-1-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=760;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Et22qRZo4fsW5XM2dyTAA1YIF7lG8E4lUkHkWMi4kdA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UqST44JLf/6SC8h3if++ARk5Zk1RSnf/wtu
 ShX2ySz2bGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1KgAKCRAFnS7L/zaE
 w04zEACcM3xXYrildZ9Wyvzi6zYaS/VDWOtU52ZMAJ4+Wh2B2hAS8Ih/mocnq33rCiXxhVnXn/3
 jnAWPg4G3R7DoGyEHeKDhMtmgbuf+jQVeAJqXqpmKhxp1YGO0zbO3obbcoiG5HbZFINoLT9orm9
 m2AhCFbVWQXR4UeFBxYhCgU5rVmawWHimujZPt1ZBuL1A15sbzij8JAQexq/MoxGo4aaPgAMDmY
 fw6cQs3xFFznZvVllt7nNUn2YxgcE3z78u9VVhIjIndc2R3WVBC6MuvUm32nZL5W9ClHj+Ex0K/
 UCWK2PKYjOpJUxgWz0CKq7UfXSpUtzkSEM+P/a2uVUbsRhCOhDeWpfbk9nG7SMDzJlB19hOVyc5
 Y8lZFm90Nm5za4kaqvWBqoJvNQe1rnfI+7adzD29qg1ZlSLV6UuR1A3hSVSisghrGZWDw5yPZ4P
 czcoRMGNqHkbYqZEOZIAvOOHwbxJPQYy458HZ1ql/esQ2Z0TQkznLVALIOmk93TkfN1QAOAkAgc
 ZBIdqoJF7fm6NacBK/5k4vBM1unmCOOYUr0KG4Jfz1FI5DaGBXyMhcJQhdPTUn82XhHarg1jcgd
 +KFeCTLnphuVcl6AsadJSAd7+sUhnviaLDXNK5MD3jGhJ6Wb1mvqIahEUMjDv/hPWDkvqwepwst
 CXWpZ6tcDATGOpg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX4d7K1RdetLCW
 PPCsovFRPVrdD5V6GePNSgAfrvaHy08aDrQA/B9yAxYV0utSl7u+Og0g+9DXsZILaOpbkhdDEwK
 4COn35Allorq2urD8M9uI9PJM4We8a4GEFl7adWA8orSWpIttK3srk4ye8F0EeKVaq2Jy8LzvcM
 MRXog7QStf/ii1Fi1lIKE842/1v7K5h3Pov0R0E9Ih6stgJu6CtKKpOGvCzqoZ5ndE9J8G0nXCH
 z2qbZT4Ep0pza9Jh8S1+AFlOb+xOlbR7J/nkLhkvivRDZEvO5Alj9sdcyP4fymyJSDfwv84xIPq
 DkIcIbTCuUXbtGGx6ncF8k+LL4/BZfbksQW6xmQT0sGU/nGNP5wKyb9C+6gt3PhraRqLz/7QsS/
 kX7pFCyEcPzyvr0B7aqVIENyvNnAEPZpwMD0jsAi+e8nj1Wq7KYN930Cr5td3PHmGZd5GDH5lhR
 vmGP0SMo9egY8FWqzrw==
X-Proofpoint-ORIG-GUID: wQCCx68n85IFG1TINcwOOlKSL0YxdQpv
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7f53f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=nExzm2HfQztilrPChXAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wQCCx68n85IFG1TINcwOOlKSL0YxdQpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 54eb1d7fd419b4249a6860357da8b3dce2e2146d..9441ea827524df368f5aa1304b0122bebac3d245 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -245,7 +245,6 @@ config ARCH_MVEBU
 	select MVEBU_ODMI
 	select MVEBU_PIC
 	select MVEBU_SEI
-	select OF_GPIO
 	select PINCTRL
 	select PINCTRL_ARMADA_37XX
 	select PINCTRL_ARMADA_AP806

-- 
2.47.3

