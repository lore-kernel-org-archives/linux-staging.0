Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BF4395DA3
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614995; cv=none; b=JHh0FFkP+HBA/JHVqV2U9wwnQNuqGnYBzbkoGkM7rfOJos1xhnyakzRzp1GFnAXPXgL8yf84kEaBzBLFVe3HQ1wXDbwKpqLGRmp8sXosHDhGZKTgVQ7KWlQ22l5LheHNK/QVB5EsRyiAP5OnSepHbYSDbue99JRo5LduWqRmauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614995; c=relaxed/simple;
	bh=PtPN45Tp6Ia7+N4Tukr0HxNpokkC0paUCqcZanVagK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PURs1N7xJzvKJTgiNmGv1RcRCpwa9HugBob9vM/KJQBC4nBdjA0ksush88NDrTjW3E4Sc7c3sF2YRhqTzrybBCEbkAHYsSlVCApufxBN2yLjnijaKZWmeDio3OyAPbuA3QjdfmYehU3ZOND4u7n911VF2Eubk/cwNBFYbaILvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3YmsvRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/jKsFe1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3YmsvRR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/jKsFe1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SOr6956993
	for <linux-staging@lists.linux.dev>; Wed, 4 Mar 2026 09:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=; b=D3YmsvRRJYmERCKJ
	Ber1vJrUaYB7CCxhj0HWv4yL2e/W8h0TGa1fDv+p8/E6wNljNQ5vRXeVyFAIS/6d
	8HApID8vFDm6JKOvETA8E3Ei7H97jllJBaFRrkIz4BCNr6UUZZ+5aFVMOlWorFQs
	3bg3lMFgfBd5etlzYjZDpFDqZLwDwvFl3lxRpJVbgVi/nGLtW9AiN2Jsv29aY0ft
	ufBP4NmQHKYv9gjNdVkJH1hx5YWxFJWMRj026Vfd2NGsyG4Me5S6Ck1Z4owihYKD
	2rBl7Jgo3b37LauA5BiYKhAsg8BsDF1ZUi4ENA7TBa0q8I3XZH276dCqTUQQZw6j
	ZqS1+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qga71e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:03:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so3929938085a.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 01:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614991; x=1773219791; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=;
        b=G/jKsFe1mys9LXXz0qGxKLWbrLc0mJvHHPJ7wTO1yYEBhctlYy2o0TE8saVaAE4EgC
         MpiVuugbCRUTzpNO2KIbKtWfLazdpnjPnc6u6eADIE2LW0A/7qZoyUNgMn3bKwNyEFzl
         +RKCncqVnoC1wGVn7+ACnu5asai/9X45Nf/DJXXqkntNogEOXuqS8j+njJcc/WhLXV/1
         pFaNlpy/GzJOp13NfS/1GvlMbeuLfZUHIGepzMy4qGM2dWZh2JGsrj1HZMW+Agn/sc9z
         9SOnJYmmxqfcUd71J0kTetxIQBdFJFDP8+xFxN7JJEbnTJfqLsMgZQhNp22G26XJFLzT
         dRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614991; x=1773219791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qdf4w6VuyRTEjBvuhus3SpdwxqzLc8TMdGWXxxUkmY=;
        b=Hs1mnhOkolepvspsYEHnrpSOcd+nl0RsTj87IRZWeA0f+n2qkBkfSbVDvXYn7cb7ha
         t7jTO+vzm7lafm9BVPGA5jnheaWlCmsWYnuLi1hOOUIHjE/YS4qnKgP5X1Kjv2qTTMts
         Mb65IQ4DOYHe5FK942K3vwKmDId6OIlKpN3JQM7xYilkICX3Ohda/DELV4uE9p5jbvTx
         CTpBA7g3JVWEaQH26rgCscNcWFxxxHwtI/meW7aBnuL2ULQPUOdXny+66OQVpjRL8uYJ
         kPunBuGCtzGcoIpNsiHbLl+PNtZZjWGLJJ8VzogtuWC/DUWEeiRSGnuJdT6qSsCLe8+2
         61ww==
X-Forwarded-Encrypted: i=1; AJvYcCXE5VmEUBmQxak+f8sXeHzZGlxfr+v/hEtYYmubpkWBFKvbqq93AIqxZ/sYviNvk5GwU/UIPW3dTfzjK5j0@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5UVLLAn78Ucgm/W6jaBQxOzs7y7AAFa6nZ6MbxJrTe4rJDZoh
	c16m2T5NxxahOXv2hXj9bUx3/zxR8cNxO9uM5Gzsen7J7XKUMOIkTH95hhBcYFGywJT+Qnnn8pD
	2WHAVp4OiOXjuVZZmRZ2qRvVKvC6Bbo4WK2St437JL92jikz+LCXUR3r6h3duSOY9XKRq
X-Gm-Gg: ATEYQzxVs5yaj4nbf8LfspDH9vxsJAFucERJNrm5+ZhombtNyYzAMLnaK7cQyvr+JsY
	pToBN7qWW0f3+We9a6hYrMqwUhfK/fj9R3kAxHA8GmBrH/A4SFQkw8Mj9K7ia7QYlBkJJWdLPk2
	WEPVf3MWgDvvPZKUSCmpmFKXoHXnNYbFC4tzojCHoasb6gyorFpoRA7/jWHs07qhYYiTxd/UaBa
	i/QOmqISSfTRvOKXVNLt0QcRGEHWHORTygtglKLDo1+vd6mgD1KLMERy8RBf8vKE6zcUaPsfVPP
	A7Sp5Ybqu4cRkkRh3LCOT75i3oQXIOIRSTuAynsAdZA+lIijp0tw8XGPJF6LgKzcrdf0SsZm/HV
	3KmZPInO3lwdNPOP9GTYIlRsduT0dnUXZy5eCKmY2+phpyTqLZzUs
X-Received: by 2002:a05:620a:2556:b0:8cb:43a3:8b6f with SMTP id af79cd13be357-8cd5afac027mr137830285a.67.1772614990730;
        Wed, 04 Mar 2026 01:03:10 -0800 (PST)
X-Received: by 2002:a05:620a:2556:b0:8cb:43a3:8b6f with SMTP id af79cd13be357-8cd5afac027mr137827585a.67.1772614990300;
        Wed, 04 Mar 2026 01:03:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:26 +0100
Subject: [PATCH 05/14] regulator: drop unneeded dependencies on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-5-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PtPN45Tp6Ia7+N4Tukr0HxNpokkC0paUCqcZanVagK8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/Uu+2aQcMQSqVOqNgCut0t832TSfkkbw1j6R
 7W5/bLJkgSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1LgAKCRAFnS7L/zaE
 w67uEACvJxSq4g8szPu73sGCAqP37wmvt9beKk/jsRxx5m44qR3EiDbwd68jXBA77Dib7kUNBYS
 0F+pzXOFqNgMYbxl8MYu2FfZ89VtwWnJvWTklsjrxfkTyBiMbaDpiMci5p/Ca/7FKzj66snZfT5
 Bs5h98gRyoJlKIC0yhh+HGcCsKaG+uSPf+moAaZLIl//HuCqTMbapKqpJVQbss1r3/EtmXPQ7yb
 gt414Gc3mJb8IFtZhO2retB6beVtnH3OFmgTYXV8uYo7XfEObejOJScfKNCsI0mxXwtW21PSg1B
 HQzEWFmLV4eRlm1O7ON4sv6HUlmZhRgq2G7I/fF4zV3n3/DGOKMeShWLgRr+i3r5V90Px6k5ZKi
 MForZCflbkS9MoozMkRB/ZgO6ZVGSkU6fYIyWNsp/NbSomEoBrkzwxkkE1Bt6iA5qDlyLui1sJQ
 Pj/0JVHFTS4ucYiTjc2ofCFYjUNZMOYnFst4YARZ6+imwg4qXdjbtpZnAzcNi0+GVH3+zgL1Pm2
 zGZ9WLaNbVkPiCLrNcoTmOO5msz+KmtnD+MSprvKhYJFr2o8dRIwq09sgeG77cZUl6wHLQZjn8u
 g8l1Cv8pxFNm7CDr/DeYJ2Rp3SuwN9pLohd33mIVSEJmw8Y14XfYsop8gHmHkFGbofajDzN84iU
 yluMQdaewamYX5w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX0yU5/5g4CsJi
 FfnVyaJ9gQuCHbrbACZSIg/t2Fn9KG98/cVtH3ljxAs2nOIC14TCN786EpmzP4FwANuR7SEOzKE
 yWdd16o+4BtpLsajoDIXGSuzgVZKv7zERG8mxKc4bLSDeGos6DXor47Fxo3P3fkjWOx0yWg87a2
 yTejicURrOaiSg/mpa+ADv/hMsTBlQ4rozQMh0ZoCcbNuL88c2cf8a8hMq4FZCbEUHF/CYZkfob
 5VvdkyrGwmcrU7EG70hGVqRG6JTaDZJ0PK/yXnMym+su++l45fEjNUx8esCZqJV8sLaGUN7iy19
 qZVU9w3cj8eOYO0T1i83ZM0A8Q3dTIUZHbkytk1F1wezXSo09UBomr7+QS6pfsJ0LdgNA/d6+g4
 XkweWYMA4CvsfBnij03wO9+Fng65m9qY1gHGQY3UUzdmclBj3sWj1EiroM/opb5qvItCjO45RiH
 Qakr5Lz73UV/ynW6wjg==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a7f54f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6oIPHyQYDuokVZevvhYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vviigv4IjqTiDbqXS0RXw9XURIy8up6U
X-Proofpoint-GUID: vviigv4IjqTiDbqXS0RXw9XURIy8up6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/regulator/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d10b6f9243d51574a9ac662b93d4678cd7d94a4f..10e64e3ffb1f5f60e0b62b16ab513f002a42fa1f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1232,7 +1232,6 @@ config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on I2C
-	depends on OF_GPIO
 	select REGMAP_I2C
 	help
 	  This driver supports ATTINY regulator on the Raspberry Pi 7-inch
@@ -1332,7 +1331,6 @@ config REGULATOR_RT5133
 	depends on I2C && GPIOLIB && OF
 	select REGMAP
 	select CRC8
-	select OF_GPIO
 	help
 	  This driver adds support for RT5133 PMIC regulators.
 	  RT5133 is an integrated chip. It includes 8 LDOs and 3 GPOs that

-- 
2.47.3

