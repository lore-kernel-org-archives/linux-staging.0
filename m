Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3FE391E5E
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654361; cv=none; b=Id9pZUvdTkFJOXUIPdhalEzkDmx3LzXQCZtBMFEjah/0r/biWHHBR1wjkHkHvDaq8+4GjEksUzgYpO1WPi6dqHkCFtl1P7Mg/OKWsTcBioHhGpFBeiIiBUpE+zp5m5DX+9g8EF+LuxE8Yc0+xhcBgcx/moBpSRb1OTJk1q7gCk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654361; c=relaxed/simple;
	bh=F9ytT2vvzgyeiU8WNksbCaFX6Hz61vWU6GkVZMPweL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alOYVMWnmaNUCJPZ3NZZoKaJPWV7RX6OuzPPQeoVUh/DGm+KNJ+G3MF2xjG2pLT3nELgR+rVH1cNGMiXPMYeuDR8L3r1pWrhyZ2SwNTAp48yEbeqPyB8ki+P8X5kw3qBFuRnvvB3SVkJQ6iK0FgyoiH4ctmrVOiReGdvURt5Abw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hl+Lf4vz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJ01jeEn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hl+Lf4vz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJ01jeEn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64ris1724971
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=; b=Hl+Lf4vzQn30io76
	uYKe/wekuPGHSCD0rDQuZCjaU4RRXLKlEdbTTQyBHIVcqcX7dyBk7/HSVyrShVuR
	VpFWb9CW5spylabrF+lL1RbHl3MOTCqyRaxjBGQbOSEdN0SnwIEmh2sm5PzLsa62
	wYsvkO5v03lh9l8NjrOoLRMHnWFZtqP9u1mRYS6I32QEan4yCXrDMbYVHRcqQ/9D
	3c/4TD5TMX4Em6ADmMb0SSLht8CvklmVQKEtoKxytufUza4m0b/FKpSXKadcJUzh
	M9rDc/soWG2pmcCGTGsJbllAYOym+wWcoRi07/Ric2/y8qIrlp9fgqcU44T8B2PP
	rAd+xA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udn038-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd84943c76so3973282785a.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654359; x=1774259159; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=TJ01jeEnnUYLaWkkm2kWB5eHT7rXXhGG6/S1NSEsVvK9zNwuVS0/WFYiMJowLPSvM2
         c3HIvT4eazFQCKjNum9OqpsGpqOf8mZ+gaM+TOCuAbwxU00xnobCiGrhJkcqOKJcpcew
         Y6WPIXxWozyqTWSWJdcDyN5a/4iYHWoF5w8hp18Rbk5Jm9mJnzTqHRewv/JLT/5Knw5U
         V6T2xTFyQmVh6+dJX7tVcP9ZmxjAyn1tNnS/1sqvvSoNBUlNCGj5Z3RCyW5upiLZ/cZr
         OUstxEq2faMgkQ/2XCR9syp4J18azYLjZ6RoRS+q69nyP3vRmmUzd7uGS8JPGbhKrdNv
         GuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654359; x=1774259159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y0W/aAHjyOJ2UAuyH9PergzDfCRCX5QEy6ZK0Vjabsc=;
        b=UqMPCrEYJ04kaU2vVwyrOoUyyeDXYG/a+AZcZRZftVjCYHrgstHPSKg9KDoyGQtfrz
         qSwIPDZG+pIUHB64lZcti7nTiDxS64/Oxh+47cMGog5p2oU1WPsZLos/0obQnZF7Ju+l
         qXedsxca0dE3fg/nfuxFOOfXL/uKwdkWqFy8TmMmEr5Mdoy8nu8UPt2KZRj4FQtJyH6e
         XoGP8qnxdxVu1Pr3Xi3xdbrpSZBXPFLv9ZdLbJdQnVNkWocoBIJ0pGBL+7yEwmrZs0NQ
         SuSdP9I50Mxp6ZKag0RHzIcImRuQMeZRysmyfKR/PVTEa/k3HWAldHEl2UVA5Tba+U/Q
         KKHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9SDfEYqofUb/zUDs9gUGmdJRAjgTR4S9E4keFG+CVr0Gd9lrgWmqSJHQZJBypReXH0z04h38bBlyU0gD8@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2j6T2W6RapDC05LMExyvGioiOEN2GrbN8+Npwu9asOlalzQd7
	AKZfbWqsJNy6HlzLMjojeJIiwSdVRhsUOAcj8JgNmNodZ6cYTEMzN4WM/FOiVCt0wqD/7VL5XRv
	aYGQ0+dCej9Ty3xUvgGZuvk95n5Y2q97yUG9YFr9Nd+V2oRkwTg0aiPm1ads34OW5cRKM
X-Gm-Gg: ATEYQzyOdgIcRdO3wRwc9kksjfNMGmtSwJLH4/uZEacPNoPjh5E+rkOjqZyPIRcuGdl
	xUA5yuBaBm7d1B9vn/n9vRY1m4Zz0ZAXVWFntue+B830r+G0u8G+uoyfZmj++6OJadlx57tOzZi
	5S+JAQ/9juh1QSNX0jepNF3Dpb5wkPZ4LZwqYnyW+l8TYXrK6mMCeESTHLY775h9XdjlV4eeLni
	oq9fxrPm3jX777hMs2HftLo/yXfeiAuHyGSBysH2oA4TJV+azOGg+HGoCmtJSKdIFDB3PcGSysc
	+gLWiOYDzQ/9hCFocVmaGpWyL3aVNABrAjDLxX+5cxe1o+2i2jjT1QPW/z8XxZVZ807U8w6ux1a
	8XpAWdOF5yw23vOSJAAKcZUe9CYtFCQ7kE7bfSSTVk1j3lJM+x494
X-Received: by 2002:a05:620a:4414:b0:8cd:8c3f:af1 with SMTP id af79cd13be357-8cdaa77964emr1854273985a.1.1773654358724;
        Mon, 16 Mar 2026 02:45:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4414:b0:8cd:8c3f:af1 with SMTP id af79cd13be357-8cdaa77964emr1854269485a.1.1773654358246;
        Mon, 16 Mar 2026 02:45:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:27 +0100
Subject: [PATCH v2 7/9] staging: media: max96712: drop unneeded dependency
 on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-7-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F9ytT2vvzgyeiU8WNksbCaFX6Hz61vWU6GkVZMPweL4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9FArM50N/90ynxEVRSFS/NTT+j+yQ+OqAswC
 54EDd8PnAaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRQAAKCRAFnS7L/zaE
 w2ctD/9MKhohFhmRczPRr/AMx2JLdR9z7oMk+n5G8a1FtSDO5CTL607Gw7uz2zxKSciC11ogeJr
 3zFe8JsK1XRF2Nu24Z+zpR/oPpteX5Wq4AbVhT9cpLvZ0xGhjDiRzGQ+DO2Tftfq/Wx9WThBg/l
 68zbOWyVB4guzZaqOR0Wabb2NW05sEPwZKD6OafKLL16116FzD3ed/5tRszdwWGmzWghLrXyFZ3
 0fuw+qk16knXb6E7eaesQ77axJsF1A4t9mcd57UQhz8w0XqtI/A5HPeIwyh0rB1QtIEqn2HRkr+
 1X/UAyAvVzsMY6Kl+rRhcm3Iq1Br4Bo8pTWdK+O7H0GVcD07EiyubKif8CfMj23d0yW+5Gtrj84
 P3tWw046hxsNQmDgqURd+8t2r9qYc9pAPjheMlmmRat9AaWR3wQ3KHTVIRR4Z3ERwYLL8laOclW
 ldVMK5v6r4kdzJ5TjZqaIaIEkEyz1qbAaBAFLD7wdpMFowt6LxzNSYgo0Bifuv4Ig2+mx4vAIUj
 hvzS38tFSOVfpvLaY7UvDrqXefDEVp+dLdreYmr4FST6+bS0CiB1OU06jOioi2zTNZfjAN2EwgA
 UTLqBZ2xh2wNrOyFKAkzkfa/7pA7VZ8GaC3f6FI9qcfZtKSnSTO6w8LzFzW1YhHntTCAf2cf/Ql
 qVTwHDK48HzVnWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7d157 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=lbdJfbWXG8Zdtkr9XfcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: caL34jQeP_FJXDWiPlEdtEJkyzi7vZ8U
X-Proofpoint-ORIG-GUID: caL34jQeP_FJXDWiPlEdtEJkyzi7vZ8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX+aUiCCkAQoJ6
 M91Bt2JryMlnLGEBHF+Q2e5LrgY6UEMcI/cSB80lc0rAglTBnJKmsFRtgDDPa7XznI/0inYSVj9
 aGpGx24cBtjB/3yKrfxbcB7qkRxMj+OwWo/hDOPqYzA7FF0oOPswPOXyrgW+igBgrg2/zb+BMvA
 dQl8yZ22VjignUQI9PxCKrLY9AJvzsg06AxY8pXnWF9ZkAf8aqUVWLRLYMzylE/b72qzu6no7lo
 8LI4SM+SKc8X42vfjGm5HAifqWHnmPoqWdkVYVcQrms3GHKnNe+nMvN+hIounLqmaVGfo2ujlsP
 mrDO0I4jnpZ1qWuYEEKx5BVEACXcCRC+6aYqwRnnnG+w/wXLm+OSTdxy/7mXxUlJGOrx9CLx1Ob
 tByl3rH+lVYhKdJ7TgMkDvN26ClxYb3SLwebW8ssoj6jFKFI16XluR6VXzenXiIyjjemA1d6DSx
 V1GjpJTCPWGZU3Msy7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/staging/media/max96712/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index 117fadf81bd086cc3e5e95210503000d9e4d8738..93a2d583e90ddb2b797c5167a6d3373836e88126 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -2,7 +2,6 @@
 config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
-	depends on OF_GPIO
 	depends on VIDEO_DEV
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API

-- 
2.47.3

