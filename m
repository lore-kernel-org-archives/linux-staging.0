Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B334539184B
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614981; cv=none; b=m2OeRyPjQ84/aDyv9loDObLl/OT9rnLCUL80U/DdsXSxVugRqw65RmATP5JksCaQGEvqMtCy7BRxxPBAlztdTbIBNHDozf3mgkQ31rj+oCBIzv6sp+Xkj+3NWLHuCR68F73wZVyxDze1eHVf9lQkQSLyoA+/2yy1Vw2lu+excGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614981; c=relaxed/simple;
	bh=elGyJX6kiF5U80wwgrS1gevNlE86QtaFWMPcJZOJ110=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZ+QpolDK4wJ6FaNuJN80KgjQowgC5zsloiXwsqvx5/VMa74UmOW51XIbTBgL28CAyp0E7kDQOgX+qcev93A0r1WT0QeTWC/5vA6IqKhZuX9x9dKOoiSXSBokH6puShSVbsYmBVgqoOxAgj+yc7wfqK7hKbz4WdtgeWkRZLRXAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CazoV7ZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwGCnWfg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CazoV7ZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwGCnWfg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245Sk5p1073075
	for <linux-staging@lists.linux.dev>; Wed, 4 Mar 2026 09:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQFHrqy+7ET89/6DOEboD9MvIg0jU8dDQ0sv+yzIoZo=; b=CazoV7ZGoy+xYvkW
	cCJg6ClwtEdshtyKOluMNv36otWlt5w1TDCYQ+bImxm/DRWwpCmu07h+Y1mvNmO5
	+hM1wnV+qfEXZ1/g73CCmJlHqgibwXu1PmqpDsTIELhobC5+9kE23b0dgz5e+yCr
	a3iAYAZah49tETdO1Y3PEYiwldEgVdLyrE/ibxq+kMbix3Mu4I2pDDdr75h27WJ5
	p54SIGKrE+7OwsTZhT3+SBBBSdxU3nYE5q6p+ztUB+1ipIxADEG0ZKZwF/a73jRD
	bVp7G5Dc0+YxpHnqgBCeO4s9X9JuWTXzfAPJcvSzFQqIzoei2Vhum+GBwB77CHca
	f7xWeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfh0h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:02:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c711251ac5so4151531185a.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 01:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614978; x=1773219778; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQFHrqy+7ET89/6DOEboD9MvIg0jU8dDQ0sv+yzIoZo=;
        b=FwGCnWfgbSON2prtOAmCh6qFk104Wo3lHlSMpVq2jBqqFv0vqzrwWdVag8vQBEQP3M
         nKSKulUL4gmLYVpclfewBr41P1aazCNScHPwvl6HAazqHjcS5sN0Rd4Pvh3VoAsOXPnF
         ZmwSrfkp17Ov5kKJmKERpGd2OwVhcMaaa6KeCZ32ZPDyhEt6c81nGVI+cQkZpi4Xfc97
         ytZiHgPRZMo711I9LcbeFkx+6kBWoioqkIfL37cSMRAsN+GAB24FlfgeufQ/URiq7h7x
         WcB0iedtVspzZedxLKWRF7zxrT9ZEXXRwIgtSiRjXqnKfmIHq212/cIvDnyNK7rrg5CV
         nr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614978; x=1773219778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zQFHrqy+7ET89/6DOEboD9MvIg0jU8dDQ0sv+yzIoZo=;
        b=Vps7411bGq51HgfLHiPqKFXgnwDX2+Y4qDAXUQEhfDDCjpi17qegJUDotowZ2MrPcl
         2ngVtcWqkSSoJHp2JNQMahzPpi9V6BsiDA+9F2VSa4KIvskTUPwSOhdS9d8Yxp/1asQT
         BvdYnAdRi9l6INtg1UPK31y4EetrmaQvMksSMTBx2tQ4iNt84Vad4+njfsPYOcmCbkuV
         8neuQG3lDjFAc9A0SFh17Eh+KDBhYEm97T20IktCCms1SDMgSJE3oshqysiE0QG8R8rq
         mozYxvN3aNMc0egdVjLcFVucs7NzndvVnTWOg6X/E0I6AkGgdob1HBbM2s1qRr1dJ+hi
         Iqaw==
X-Forwarded-Encrypted: i=1; AJvYcCWE4R8g9/k8e5fQmYyPOL4ZedTN1mtHwtZiiTgHknmEU5jzMJh9QSn0ePBFofen4DW3tf6hZi5TpTq1c7r1@lists.linux.dev
X-Gm-Message-State: AOJu0YxtttGZXS85NIRwF+6OY4Fkq8OzVhdBxPDlxNVU9MZoKa39eJpS
	+aKQ0NzUTLbl3Aqwb93NA3k0u71Vj590AoWkLLZbPm83FKf7/6eiqgbNrcsLR1rs0bTiUVF4zdS
	q4CynmG6a55n6Q2MVYSwxNeR3kUeKyhxw8SJvvOrRtTXuOH2zzvx/tTTG6BxbZKccySQ0
X-Gm-Gg: ATEYQzzYf6D3Zb4tMeKXsYDxYwo717Lmihrhuk2Xn/PF8CUucZ25G97HoPbO+oDVYqS
	2rpsg4GiWpIy+11VTFQc0d0E+ctknQ3XazRYxPsQBAzNREnLX+Oy1msZbkGvgJK24YkB+olWLeJ
	iG80eyqUk2ZN5JKuHfd7rnjEn9W55bKPgm15PqdgrgvPqUVb493z3Vl+P+5XNRPr2RNlVcOmejo
	BB7y2i63vSt6fgCyErwdA+yDg/tl19m4zNKkey6XpwGcRaWQMmOJflggWKSGOTB3OSmXtFYs/zg
	+PAaiz0hxodySocpDQnbtG8S2y4XFJuJxMmXBKV3ez7xVsRlomFmZAcPOC+QRqboW79HXYKtQJ0
	T6MVb4nzIjoan+iXOGrIjUCQKEYqfqSzwOQ4Fpv9lIOQJ5f08EHA/
X-Received: by 2002:a05:620a:1916:b0:8ca:90de:43f1 with SMTP id af79cd13be357-8cd5afa5022mr134817285a.63.1772614978024;
        Wed, 04 Mar 2026 01:02:58 -0800 (PST)
X-Received: by 2002:a05:620a:1916:b0:8ca:90de:43f1 with SMTP id af79cd13be357-8cd5afa5022mr134812685a.63.1772614977445;
        Wed, 04 Mar 2026 01:02:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:02:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:23 +0100
Subject: [PATCH 02/14] arc: axs10x: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-2-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=736;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=elGyJX6kiF5U80wwgrS1gevNlE86QtaFWMPcJZOJ110=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/Ur8cTWvTe41Vx/7b1PfM0xlmUQmzL4DULT4
 JDfBXBxP0yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1KwAKCRAFnS7L/zaE
 w42GEACAPu61giLCN8WXIPA8YMaONEdH0iiFGuhCO5j8uA/ORhhiYa+GLkJFndF7gMOXfafU7o4
 sirVD8YRozigYhUq7uBAdHBd7B4/UHJOoPc7fXh9Zcdvx2SBGB1fiBt4QSB3axS/EDKoemsR+UQ
 DLvKVYIrR5QDkaMp2T9jmHWOY350AaCOtp3sHiR8ke6oTE2Pph/QRt4IGpI0/9OlOC9UGymPYZZ
 V9kNxnN+fwIpnHOWzrzWWogSxgiXViZOY+jxSICkkONwpIlPDK0NYC2+O4jSSRaTm7Tv0jF62k1
 prRKMb6gBN68zMJuqEUcG03QgCBiL9kBoCwpov1N+tz7EKkW1pf7hMC8wl0UgBVQE4o9HbcxNgH
 396JJAILS2c2NHBecEEEU2Hn8f1T8BSYw9i8kSsFkxUYMI7Iak84y0653B8+sJvEJClhtjw94If
 nN7CQsXkWQmElJTx7ywvoyf2wcadUGYpRDmEVjuVyBbVncjyzmW3aufyFzI9c7MSXU/APSPVCez
 aSvQrHyatWzFekvX3TSoxwnCVj0kmaY0rprs4Uc35rBn/67tkAOSCfs++1/10zmdEAqcO5x2a0T
 IAY+hMnPhrd0yYLskrnfs1+9zhF3aFsR9q8dD9rEVUVw+i9FXKcvXpP4AD7SNLeDYqMggqvcGQk
 6RvbjgcEGizAygA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: pl-ZUXhzsj7ctY5XhHabCrQ0ezHZdSh4
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a7f542 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Hmb-lenyu1CM-5GwpyMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX+/Kkg2FUlR50
 TEwkyD2baQ82NBaylVWDJlum3vvW7AzixFVRNuo8/RB8cgD8ul150vO4vRWgvtRfOOtVC0lef3J
 1JVb4OB6dAYQP3dUKjqOemy5rIJuHP3Q4G3zseTazeOTq+XP3SyEKRBUi0EgZcYdtBNjH1bHx+7
 DeLP+YEW6Y5DUMkuCnbkSWxlMEph4cagz0rFsrWEz2GnsYDCD/DI5IQcut1W+Objfduq8l+xgUR
 3f6eijLPa9tyL0zI/A7zK/ZVHWYdOlFVMXG7cYm1u1yRrtluFvng5s3VXXWcPbUwjQSEsY+gaS8
 MEKh9xp1RR5aoGymw0QORkInh/rl5moyj+7Cn7xiX7E2QjTwV1rgNaCnBghn67kKeCDFJrqRlU5
 IosJXiIuxZ94dTCjJUKG6iJ7yITED+2nlSNqgvGTiQMXYs9vROMYemEEcwr/gRF0iz9kwQjoIsW
 nSsVJxHcg2NIVNdPpHA==
X-Proofpoint-GUID: pl-ZUXhzsj7ctY5XhHabCrQ0ezHZdSh4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067

OF_GPIO is automatically enabled on all OF systems. There's no need to
select it explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arc/plat-axs10x/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/plat-axs10x/Kconfig b/arch/arc/plat-axs10x/Kconfig
index b9652c69d1b90e506f82b3b8c5be373c51246671..40f2a74d404ad9759ab9d6764c2496159eea045a 100644
--- a/arch/arc/plat-axs10x/Kconfig
+++ b/arch/arc/plat-axs10x/Kconfig
@@ -7,7 +7,6 @@ menuconfig ARC_PLAT_AXS10X
 	bool "Synopsys ARC AXS10x Software Development Platforms"
 	select DW_APB_ICTL
 	select GPIO_DWAPB
-	select OF_GPIO
 	select HAVE_PCI
 	select GENERIC_IRQ_CHIP
 	select GPIOLIB

-- 
2.47.3

