Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8995E382362
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654345; cv=none; b=aMgtRwfJ4Q1jKEmigw8GmB66R/RUWbhbo2RLOGOfLKAVxu3odWOygq14hT0//OOUY3spemLXbTVsO3J/lPng8ck0kgjLxvsP/3Cg9/luA8GS8eQRBBzTnQBiCe3VpP16bV01VCwJ3vLVf4i2njAguG31bNW483zDM7lKfZbq0+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654345; c=relaxed/simple;
	bh=wNifxD/uVuc7NAbXzSxDhaJ7op2FNUcGF/+rEs7q8XY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=neQOiYXfZVAKFua2n5OOrLrnD/9F2g2yFnDhSg2C3oBmj7G39/h+LE3u/vI6CqrBG3T87kv54S88o3GFLYCZ0nGfscq3Bdkqt+4bB8ijgzxHLZf5EyoZJ74Egm5oa5Kb7j9oNWBrux7Hl1dLR3mKZHAl9QNxiXDMfcXdeQvTIic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkIpYnIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3ufHbUG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkIpYnIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3ufHbUG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64dWq662960
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eZX3+pV1mLh4qQV/ja7HXP
	0WPf1mmp2fnKR9a3HpTPE=; b=RkIpYnIBHca+sMT16Qy0AUvaVdmiMC/ZMaDeJw
	nudeVmDv68Z0PU1UJ1zceSKj5smRxTI/jOGS1e/JGesQ5HKc5B0m2kkd4cxtPsve
	qPylS5qhdkk7yzcgXLQ6XyDTDDwltTQ3yyNCCtB1zdjB84kBCB6yFULjlxlw/K4Z
	4uomx0/Idy6zBMQvuMh78Ucy1YqKsgfJSe4nV27j1XN0gzLlUmRx4J4KaWvWRQmE
	LiqZ2snYGLS2bpapFcpzTud9dxsxAvAmmsbDj5kbE6LrCDrLWNWCNaTjsTwcnCNK
	r6PWGbLNsdyqN7RlCw9rszhOJlHIKzOTSjAZdxEpwweJFa2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043n2p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7d66afceso3148239485a.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 02:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654342; x=1774259142; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZX3+pV1mLh4qQV/ja7HXP0WPf1mmp2fnKR9a3HpTPE=;
        b=W3ufHbUG/heVldBMJDPskDigZhuaP963sMR6KExWUsu1JSMtxi1l1cpDtqsttyhjS8
         Lxgz00SwMfULP5cFtPcUkF2/ckghxEHoZJ3+4jVATPbifFkZJ940zbaQvfWEH91NR98d
         dNbsPbulub3C7liLo9qdUFp7BD+6OK2PEVfqfy8Jxcrd30q32jB3pnZWqjsb05Bm4LWo
         rfslRtFUmxO9JqTt9G1WpDdrs6GgH4k1wRA8hXZ9o5C6oy8CCFH5lBlkgmW3ERLIQhdi
         dJvQcBYVUriSFlgKdp9X/ObAzlRiLAZfj22c1n5383Qm4VvuFg5uZrx7ha71P4wjLUgW
         4DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654342; x=1774259142;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZX3+pV1mLh4qQV/ja7HXP0WPf1mmp2fnKR9a3HpTPE=;
        b=ghMQArJo9nAc05kQnSB0SG3FDG/EJCZgwTbno3qHfMK1Jx2hDiagRILrcxkanGEa1H
         gA40/cl/ljknsTqrRiJ3YAjr6gE8csfmnXt/HMp1+fKYfNyL6l81REUPYFm283AdgcBu
         tsxZsd1GYu8mHvlp72qsH++QPHyPXp9U9XbLxEFwJmUNLyY6Srxg6JBk5AlbTFE/XyN8
         QZKSkZrr7MzrioUaPNqKoAQwesSCFDtm+pgMSIZwXsP1gkPa7jh9BlfldBa+6ak8xFUh
         ayAqLpbYbfowLiT5N5coYMpj73FM4IzgEnjZOfeL2eSiG7lciVERIbt/QNeKKzlNbcOC
         moTA==
X-Forwarded-Encrypted: i=1; AJvYcCVpCTskkglW0dHXi9xf9OHqvPKM8uzdJyQ3vFyufYmMXbaBuopzn/Ln9Cp1d1BrXHdzCLE8KpJVHQRIp+E/@lists.linux.dev
X-Gm-Message-State: AOJu0YzTfygn3gfbANMNCppQcZck0Yros+Ecl2jpym8abL8ptSBaIFtx
	EYg+pOnyj7ixZeQ2mywwL4gI8r9sURfMgl4LTeOSxS0zy6YKv3LYB0UZHop4o944ot0AYgh1L9s
	F6Z/DOQA4T94+xOxXszVYQoz5l9IWchKQhzvGqEXA+bLowm8Y59l0NPFB1mMxRN8f+pq0
X-Gm-Gg: ATEYQzw9btsJRFS8MA8cmjefFg4ItEoVLfldYMKRAOtmhb0jJMkaEEnobtb5AsOaO5U
	S5FSA3CUW8pmonvWXAydDsD/sl60uxo5gCGyn4Q4dv8vHQn2wMa8hIMWAwcxvnB+EdkLkK8peV+
	p+wQjyndIRcE6r1lDU8jiRAxA9b+dS4DHBVl+PZPuj67wiwATVfgp/z2TP5lPHH2NDmK2ooC68+
	ZTTQRs6BrTMuKW6AXcpAfvkASrS+O6m5lAFg9J7lnqYFiiHeymNhInEz0z33ZI2r1qQ2luceaRp
	BawTXgBNivUWVg6pEhG/lTPaxmE6MXRpwY4AUAf9z8i7jwpe2+nP4Conl6Pf3tdTmpN3qIWnHnn
	srmnVRQjjEpP1CcZaXBJ6kbI8KatB8wFaqDZWwWDWKoIILHa0+Bnv
X-Received: by 2002:a05:620a:4483:b0:8cd:942e:82dc with SMTP id af79cd13be357-8cdb5b24ef6mr1646095085a.41.1773654341673;
        Mon, 16 Mar 2026 02:45:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4483:b0:8cd:942e:82dc with SMTP id af79cd13be357-8cdb5b24ef6mr1646091385a.41.1773654341260;
        Mon, 16 Mar 2026 02:45:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/9] gpio: remove uneeded Kconfig dependencies on
 OF_GPIO
Date: Mon, 16 Mar 2026 10:45:20 +0100
Message-Id: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDRt2kC/3WNwQ6CMBBEf4Xs2SWlCk09+R+GQ1MW2Cgstko0p
 P9u5e5lkjfJvNkgUmCKcC42CLRyZJkz6EMBfnTzQMhdZtBKN+qoTjgsLCg93rzMPQ9IujbkjLd
 OWcirJVDP7914bTOPHJ8SPvvBWv3a/661QoVdbY2tGjKWzEViLB8vd/cyTWUOaFNKXyKp+Ia1A
 AAA
X-Change-ID: 20260304-gpio-of-kconfig-e257ea7c9a09
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wNifxD/uVuc7NAbXzSxDhaJ7op2FNUcGF/+rEs7q8XY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E0vDJ6dx7Ia4fQ84h8eE2etKlWvxV+vL3m+
 FEVG19udtmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRNAAKCRAFnS7L/zaE
 w6/JD/90RDo1/kiO8qCAJrcGU364A0L3DxLqgOQi4iAqM2tT6AZ4IE8R29waLnPi/L94XNMGssc
 6HxIsy7Y3Ohu7YbbfxiNadlDhwEg4QMApO1BXmGT7W6fGaMT2tujzIZ6P/trHTtxPCxSZPMbm9h
 B0Yk4F+ywcUCsz7Gfo2fflEKhwsAZwFbqUBajx7MdcfyVG06fLVTuOm0YcrxNs8H3zLk8TrRRLj
 y2vRZG/XYSoDtRBSaaaD2C/CEOPsRUnoKlqTIfgGwvhEmmek16YWzK+KI+sh5IRsDtq3H1lckrL
 kkVeGYBIf26BclCEVCYN9DImO9zVCx87bHDlap000sJ+jKQ6B7dNX2rzdnyXjOVP09M2LNo54nV
 B4mpWGWorOKR/74PzhcrIJW8U4jBDOtpXy3wN/CcOvAmIw8gkOXa6SKZRmqQ4LkNyfX3gvtPaR4
 XMzn8xIsNQfoXqRA4MMgKnuKvlTUwohMokVN7fSuEouA0y32kxCZf0/HKcLxr3pYphztnqNr63k
 iRLkyCoSuqmuPq+wBr9QhvOnwt9s5ralyNijLmHZcfnl0BJcKjESTvYqKk2onuu5C+5BFSun/M/
 A668YboqoN3Qf3s/yg1NIYO6jISfe+v7bKqUiWThxSvIU/hoSR11H/omw20ui5GzM72/Mv8Y8Tv
 BB/HL11BpfULi5g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX9IQtLTnB+CAG
 j/90oIE938iHK89nEWHV9RGGlHpz9YGlFBM65SVvUajVRf+FNUn8eYuqUrw+tuh9P7Http6BeLM
 1BFBCC/v/wt8TF3TY3FNla7iD/CrXZgJ3ulS9aa0CV0ftlG3VydYHXH2is+lPkDCGImdN2ZaFkf
 9xXw2gXBpgtOr5cNwmM1WRMrFEuW1FZ/zXK9kB7M9UnDbNRrMBitzAPdIUROsiQh3xm5CpGzVEZ
 Bc/UCcYkQ0UtsrC6O8CXLwzZ62punBgpEIdWmdUQzrwvT4gQcnM7zRLMB/9TCvBYbmaLpeEnlSw
 Gm+6R/KlHs+GvrooukeFOKl+tHoIYiFY/QeiKivfhP21jSw+5lsnC71KG9+sCel0TVIyF84QpTO
 aBVMVW9QCtet33uA2KmEGSULnvE3SZPUZHdJiTRZkp0LqYlswuboXVeiKrkejCCZwRC9ruMdWTb
 6faMZJzQshyycdJD5xQ==
X-Proofpoint-GUID: NKZIhPpyYoRvJMjSd9qiF_m2qmIZdO-t
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b7d146 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=RbMT-lXscSRh0E1VkaUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: NKZIhPpyYoRvJMjSd9qiF_m2qmIZdO-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160075

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
Changes in v2:
- Make gpio-watchdog depend on OF && GPIOLIB
- Drop picked up patches
- Link to v1: https://patch.msgid.link/20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com

---
Bartosz Golaszewski (9):
      arm64: Kconfig: drop unneeded dependency on OF_GPIO
      net: mdio: drop unneeded dependency on OF_GPIO
      gpio: drop unneeded Kconfig dependencies on OF_GPIO
      leds: Kconfig: drop unneeded dependency on OF_GPIO
      watchdog: convert the Kconfig dependency on OF_GPIO to OF
      bus: drop unneeded dependency on OF_GPIO
      staging: media: max96712: drop unneeded dependency on OF_GPIO
      power: reset: drop unneeded dependencies on OF_GPIO
      media: i2c: drop unneeded dependencies on OF_GPIO

 arch/arm64/Kconfig.platforms           |  1 -
 drivers/bus/Kconfig                    |  2 +-
 drivers/gpio/Kconfig                   | 53 +++++++++++-----------------------
 drivers/leds/Kconfig                   |  1 -
 drivers/media/i2c/Kconfig              | 12 ++++----
 drivers/net/mdio/Kconfig               |  2 +-
 drivers/power/reset/Kconfig            |  8 ++---
 drivers/staging/media/max96712/Kconfig |  1 -
 drivers/watchdog/Kconfig               |  2 +-
 9 files changed, 29 insertions(+), 53 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260304-gpio-of-kconfig-e257ea7c9a09

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

