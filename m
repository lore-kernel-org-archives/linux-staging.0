Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AF638F252
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654356; cv=none; b=fQDBcYrxm3PUp/iHO+uJyWOUxSCVEGuA/IpZrrxJIDNRzKz6xJJ7LgbHe+gUBb251yEMXi9owk1bvyj100Lns8qTB69o7SZJfdlkX9IeduDfZAZJioFsmOBI5qAtTeOs8dqwqWd+Nk0Qtx49R3ywLj5MR0wrUJtyHtEcrC2sE8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654356; c=relaxed/simple;
	bh=zJiRRZHOn7YqYQ+LwAzSJIAhBCW3qgcwJUw7el36TcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5GYdpGl6VSYCIS5BHdL/CLfHGKOzPXzd5cG5srNPZUxwssG/zd1258WEIoSPdilFsTgKPdsk6Rh1cGJcupJpY8uApF4uJQ3qNdlZEHEOQVlT3MDxYwxCj1t6szrC3yQWXOacONu0cePx++Qma9a/U68QBMEeBGEV0n7NX5YTG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ah6jhUXp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fj6dj6yC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ah6jhUXp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fj6dj6yC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64g8d1282148
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V77ZeRO5gkyRLxJmGfiVvPBzaaSm4qWfHkN94gbvCVQ=; b=Ah6jhUXpoBakze2y
	2w8SGxWQtyIX1qayUBDXigwddz8W/9QJhjLlUh0bV3q18J80OrfPQMFWSdfoGXGK
	Qq+AVFJJUFKI/dIkiFwNpqLSh9yBZ46GlXE7CP7SeHZ2e/aLjXodfZorqDK5nRPf
	OuA85HORY8DDw3pzGERKU26bAV9rzBW8eKmq6Q8+CQMYf6KKb7KnuWRGHT6llzy0
	MRWGzlwyQbJC2SYHpN97KCRd+NgvsnIPQim1aXWSOCoqdF052iOQaMGxU4W/gpqX
	qoBAsxcuRca9afQbM32Nec2Ro1LaXlML3mqQOHfb10aznyfePYELWQ5VIGmGpaOk
	Rig9RA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc50ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7c4ab845so2121298185a.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654353; x=1774259153; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V77ZeRO5gkyRLxJmGfiVvPBzaaSm4qWfHkN94gbvCVQ=;
        b=fj6dj6yCt67V+Dr7j9lN7N+hAzAVtVOpCDrz9wivMqILXXc22UM18WpULgorsrPKLr
         qOzpqusS1aGufgExtl3t9vZAJJks0oaIU8JBNNIGk+HZWJKc0j0H+mBkqKoNqd+ki744
         G9+PpQbCa2JieXSOQYds86ATgOPsQ1Sv2o4k47wVq4tNOWmdhJMEPRp4e5gC2Bbz8biC
         OfAMWCeV/EwlAotKFqkID+3erZmbB75cOMh8VuqUDeRUAH7GQ/lQiGp9EIIxA83ywUKZ
         9feAiR7lUYtBo0ry12UFlS4Vsnfm8ANGnwnG5m0RRhvVbBCUtAI6wkg7we6YKhNx756T
         1xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654353; x=1774259153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V77ZeRO5gkyRLxJmGfiVvPBzaaSm4qWfHkN94gbvCVQ=;
        b=d/TGLu0G42jauTpK/zAPWbO/ogB1TTmcydFZR7jlfolKu6AUKXZYlUDicQk1ShgokW
         pageku0tZXMCpGvHsEWzG3T9ZV4R6tl6ieDFB+l8R0dXGxRbU83VV/6QtlkfICHbPXJt
         UlxjEzJYH83ZZ6rTLbchQhUIKPkH0J4PEyCJDzywa6DgqyBj8kVpWOn6pkAwIiXG9PzH
         AODYye6+SwCPXyy4k1smeg8Q+znA19nGqKj/sogSn9mhjz0dwQPocWONqj6PT2peQxfd
         bJnsrW9JrL2kyYEDoxGIBKHaiIBxGxwvqu+eHsIRRHy1yJhZ+c+ScdSKdijR5gl1Aazy
         HeAg==
X-Forwarded-Encrypted: i=1; AJvYcCUFm7S+Is5eYL95naswWMgj9Fmprt21yNzlxiqwROGBNSyAF55xyatNk6Twlj/uce1/ovfcv4Lse+dHFKlk@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8aE3RFIWl2ahxvo7H2VYGowRvKE2kHDa3vL2DXFikyMEZcknD
	xjg3S4qFPsn/7cPGjw9+FKdjRl1j3BMp8tR0kINmzFbL/dq3xCqWN1s3CvQzZBwkTHHFIPBA1Ng
	B3xpKgTDJKYOJCP9CrxD3sfW+MOuadqSSu9N4l0DTGFaMnQKZsvK2U6FxCJ45tdPesfl0
X-Gm-Gg: ATEYQzwpI29BpfG6325zLrUyXSSWYe2cex75fn5jVUh9e83us5YEKxKUIdJ1gkB/bid
	6/4VIRXmq1BBzU0KoLE6Ejb7s5zWVIw57RV/XBDSTZxptEg9bqfI2ngOcOjyJMkFeN+TZLuDLHq
	3TL6GnZDR3NtEPaHfMAdyX6QwA0LBEZ/wOEovJJ7cFzYbZs0x2uwRvj+/MAJS/mjrUokADFqFG0
	J2omUszDwirPGG/7wLZHnW6M2xFfYZ+Xmp5sURp2G1e6RwTMN23SDg71UkwXKyy80u9P8dfROLl
	Z6QvDY/z5WMydH1giB8U7/qVCHOziA3vi8Sp5Ueb1/UX1fosapoPVd0hpRrBflxSzWCi/v2e790
	31URJbZj4d+QIO4ww4R4/WVq2H8Aqf8aM8QHJMA0HnERyXzKRJw+3
X-Received: by 2002:a05:620a:4044:b0:8cd:8447:2438 with SMTP id af79cd13be357-8cdb5ac4741mr1453870685a.36.1773654353300;
        Mon, 16 Mar 2026 02:45:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:8cd:8447:2438 with SMTP id af79cd13be357-8cdb5ac4741mr1453868485a.36.1773654352832;
        Mon, 16 Mar 2026 02:45:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:25 +0100
Subject: [PATCH v2 5/9] watchdog: convert the Kconfig dependency on OF_GPIO
 to OF
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-5-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zJiRRZHOn7YqYQ+LwAzSJIAhBCW3qgcwJUw7el36TcQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E9Wjg25U44jwuhf3siwRv6gc1FrTGrZYCag
 DWx38GqUKiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRPQAKCRAFnS7L/zaE
 w8FnEACjGpR8zaC1w1NeBaLCJvktzj4NhYyW2Td8DUd/H42BEdQFLueq4ukzXtCUXnHdHSdYlxX
 5u85kdqwdApTbieFxlcUadqplP0P27zARAEwj8BjR6bXmDtxbyL9zA5AskPF15evHuAhtsb0vLp
 rWJ/hPriZFRMOTvoiz306zGosgjHeo5b7IFdBRXQKj9pWZu9KC+6nj5Dde/Ek3mIsw7+7RlR+uL
 QLlJnoVNjOKlMMbwrMF8wLuyGxcetuCLacwTtrAUIPDb8Wvg+XSlQ61HFsVAI+6edYFrdWNBKZO
 qAuA/aWE+2oLqr2TcjOEd9gTRLahdebgddcpyr3CudMSPfCe0ZsfO7omWEYO+mh4eu4gObaIOFi
 rSbIFdwsXpTDZyGm8d1I5QasUJ3+T+m5Xxx3yz/Xnw5U+5ch1XQ2oj8rtwYXR4/xPwKE+PhAyev
 EfAmjkak0AwcGfVxvGVwN2Hsn+3MujSJYtzJKGNWR7FqZcI4vanexFwbfhQUBEab+O3yPbi9B8A
 /L20/ccFo1EBkUthx1vFD1wCRe5aIuUQ6rQ3XskhBK7QPd07CNiGavrvpP18ZsC13Tt+iPg8Gd3
 9cZ+OAZ9R7FbhBlqGEwWzhdvmPW/KCw3MbJmuyMjozO0JiauqgeMASM0B722UCBXMoO1nFINRbo
 DDxY+Xizi+tKYMw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7d152 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=_jlGtV7tAAAA:8
 a=EUspDBNiAAAA:8 a=KiQ1yeRyPa_UOXqLYlIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: lwlXcoedn-CHi_jkXkGIjkGh3WvCkWef
X-Proofpoint-ORIG-GUID: lwlXcoedn-CHi_jkXkGIjkGh3WvCkWef
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX89cL553u6wBP
 JRRZbg2KuBlJpD5xk+S0Xpg2xtqRLSICGegnMxuiS5ZE264FFkVE/iWksanUfj6cVopPk8nSS7N
 5Wb6CqBL0L325yr96RK2LXdRV2/wM//LwwgQDaOxhCPumO3s3XOFRDFRgfSVhEf5jKmobwSLGBq
 IBAWWIZLzOVV1EIfjBQ3NHruRXDs81mjsdsebQuoCFvWuFkL8UrgnhVH+tBhQMaxRcUlGWMhJrV
 oWmCQhdfLVKVJxBUrD4P5hRBGj/BRiQJop5VH7gSkPINf1epgeIHlLLRi2FJGRVRyh/+whshFpY
 vOOBAHIaVbU68YnXT+1cq25Fvlc6WTdZ0n9/AGzepWSCtXJcJxofSL6psMAVPgFF5zMNcLyPxk1
 Me8rHbaaa+lJW7OZhCqjTM5CEqrCj5UzGW/o7XiOqEJmdjcJE8QscHnf68C6AKSCLRuaVk+KW+g
 JuXyMP6gq6eXbmTdkCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. We could simply remove the dependency but in order to avoid
a new symbol popping up for everyone in make config - just convert it to
requiring CONFIG_OF.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ab1d5d6df5f32f084c893a7af54d040082a3b6f3 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -250,7 +250,7 @@ config DA9062_WATCHDOG
 
 config GPIO_WATCHDOG
 	tristate "Watchdog device controlled through GPIO-line"
-	depends on OF_GPIO
+	depends on OF && GPIOLIB
 	select WATCHDOG_CORE
 	help
 	  If you say yes here you get support for watchdog device

-- 
2.47.3

