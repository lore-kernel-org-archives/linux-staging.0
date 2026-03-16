Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B498B390219
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654354; cv=none; b=HTGpJBobOOA6iXF8k+jIVFaDXCCQfTt/5y1hRWf2BhwALf+kb1vEE5E+FK0DMWe4sgqJpQkwPrRf2+0ypdA6H0Y87G093+3WwRHu1LKnwxXyxzLa4XZaIjXUo0xDm5U9uEgB+r39MEsbB9WayL5d+ETc1FnIsF7nle/rD7g07dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654354; c=relaxed/simple;
	bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VANHyF+CRUnhwcRDFVLd8CJ9jaoHTB8/kUBenk7H0SpCU2AbEr61MU8rCgIvGn3e84TLQMq4FLY0WIKHhDQrN8N6YorB42eJyOeGTuWJvVyAx6koLaXdV50CSL5CDlv0K/AoN1wV1T+gftdLPRt3c4f4GDaAmAq+T5KirUIfvQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNm9uV8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBBwc0qq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNm9uV8w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBBwc0qq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64eWl1282082
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=jNm9uV8wa7esxl23
	r9DP5HoqaYHcDUIqlxJHYWwY1Fp3Jy6Wi0qaxhB/TZ1RCg/NH1fXtASxjZs8D0rG
	NvE6y938E9UPgqduAJ7tocNKi3+OTDm/wE+wYT6ywH5m9dgZ3srcq3I8+d64pzvU
	svwgMKlCJKEEiOJ7MxFht8CYa2STD7z2OmO1EW/RXaLq6hyxZp62tTeX8xWs1A/H
	95qD7oyG1nHjMJv+CVZmUVNW9yrEC2WGIQdE5WcX7Qze5CIaHqokyJernc4tNBmo
	w7DEh0EurOSrrjn7+E4qw8gA2PAUb1rO5HM5GEfcgqjbsTgVxYLdyeYjTXVn0VAu
	IiL0yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc50tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd80bea54dso2779818785a.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 02:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654351; x=1774259151; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=KBBwc0qqkiV3eyuJ8vMLJak9k81pEc/p9ipZHI+W1PzMR0ZY/zkSvTTCYcBRyuNhvL
         mxG7QHU/A+9I3O/mYvXu3+n2y50HP0FBDKcuwZIWzdQaLiWTy64O8b0tWiTkkDBBUpIy
         0o8XNjjiibq1HLwoFdEF4KI4Yphh6jxp7L5ZRQg8hsVyJFrBgljcbgyQc+58Gi5jUhHz
         lLbLAQV+DrdLzNkt19ASLgIz8EVuLL0/8VkQQu6dIh1lT9B10cGf7egfnWJFxfGr2ydL
         WvGl/1WAcF4VTU3Z3pA+amIM+x73VzDAfReD30y+Rdg/la9UzCzLdFDkPyfN1BtHZRJ7
         FgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654351; x=1774259151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=TCC1NrbrBi/v/JqAjRDAStVo+FrWUoHF78F4HrOulAP+hp7efiUP0ezYux+o5tKxmR
         RvsHw/YsE8tUoJUsXwAf8AgNKiO5Nh9YlIpvTXVf3JK/ea8+zONz2XU8RUtwfKR8g6nd
         ouFs3nnNHx5UavLpx41/cHre4BUxaFmgMHq/fimfsCSf10uASnSJtxg16eqxDPTzWhcE
         XM8NNXY0x12Rou0ay2wPOCgT43pt5H6Bpsf/owOf2zTpgBc9BpOJwX3xLEMANY81gQb2
         /CIbkfwqIcuxx3k0KTspXxL3zHF6pmyFzYBF9xAFUi0tnz5yGQM0moyHi+atPUx5BQ3K
         6IEA==
X-Forwarded-Encrypted: i=1; AJvYcCU6sPq8RYNEffe7oV22a4u3aTmJRxvmzHVf4FYW/sc26UqV3Ya3YUYiGpcc827UiTCs6g7RUHU/JNeqFRuT@lists.linux.dev
X-Gm-Message-State: AOJu0YzobvTYbeaTZLh7m/k6kIm/fFfHrqu0T7uiBRY6CvnYHvQ2xus0
	YbQKb6ewAFy9vxMWd3bh9ilLXfXKWj1lEyGyG6GZLsa6kCYgIg8NkR145b7Pz/YGv7KT/iiPJGF
	F/1VQub+Mv0i8k/olMwFEQqCAKgzT2wSFdgdaXzcxiGl0hM77RkA6S4VBEnv3DYUICBnW
X-Gm-Gg: ATEYQzzndp9iXjN9V5oa6Bdi1xLiTR4t+F9qqgdBQKw2dIbtCNWX7ZSJaqzLyNtT7Us
	7zrQc0XCavhHTw+9xEZ5/FV0zq6zwMSnpIFCUz7/Iu56reXcKl2w0RhWEfRU9SNiDsiSh63k/PC
	ROXnHHEP8tUxKwGkXGCQhCOfXyAh8oQorJsqpepk8W3VHAVvNZHrXRZ++HBaLUd4YJqPOYXC+DW
	2pay8V9WzBHYovZmds7UzaifmCi+pR62cwn6Qnpr7zXC1UcNmuIoNcsdDZaVju8s0mq7XOWSHBT
	MNJpQjRADjNg89cxIlb07R8WpEhqb4IRJxJtgj460ClSBFkyOJZz7mEER4AHTsx8SpS1itpPTeB
	O3xiSpT3MOdPAh9MzsuNGE1lxoYyDBbYGdtHhDya/OrKb88K5ylKv
X-Received: by 2002:a05:620a:4153:b0:8cd:91f5:7a29 with SMTP id af79cd13be357-8cdb5b2598emr1635909385a.53.1773654350996;
        Mon, 16 Mar 2026 02:45:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:8cd:91f5:7a29 with SMTP id af79cd13be357-8cdb5b2598emr1635907985a.53.1773654350529;
        Mon, 16 Mar 2026 02:45:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:24 +0100
Subject: [PATCH v2 4/9] leds: Kconfig: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-4-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=808;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E8i6aEL4piTNPBuxvNyhkggWe1e3NVYraN7
 Ks7jiQgHs+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRPAAKCRAFnS7L/zaE
 w/ZAD/9owgYgilZp+MsY55UDQRktGsR/H7gu25ynf1yhU4AxMzntmbgKtI8ceNacGdL80sij1rd
 BC1afcEdcSeocPHYhV8XrTHz09iBj+gnuOx806Aztjp7T2dAIN+2iEIjUM3kaBCEgSnqgV4zQr6
 KP800070rOt+5F9egqM0Lv6yiQUDNMAn8zKj1lHgWzcRAX+/m+tJCaOTvMQ+lfYmN8RwfNOnafG
 cDonwS9X74nEm1gLh3vwBangOT0m6NA/CaV9RZH8/DXyYqAIvvCpV8Jz3U2D1pRdGxSrHe9eRup
 cbjzFzq/LgbVkxDXxoTu4i4o1iNuhn4k1/feicc2rZzuUySztakWwWWSm5acHzKR6Ptz1WMQI89
 Hai2+hXihj3LpxTO/VnuyrqwkfChDWqcIYxw3Vsn9nZdRi4NraVQGY/AjuFi4NDRw8E0I0oIZ0V
 bqrdOjurKqeApM8B3x+pdjk3MGTlDbhn/AQrLzGeiWpOHr5yNZeuN+E8BiBQFvka6LJRALRFKtN
 lpy5tTKnZuANqh+kbu8XfvN1aim+wXkG0r+mrAX66Sm6PuUCfDKrXHz5NKSMBkBfTvAtGmGzu0s
 L0qw3k6k3RvIxBjnOdCxgcNf83bKNrudGRNJ53TXD5F7++vEy53ZASRmatk5lcOn2fdcam0C7NF
 v/S76FvWP49WAfg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7d150 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ULgK7OEL32dECu8VbM0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PPv_2di_6xi01uUKr5X2ZX6ZuaSLpnib
X-Proofpoint-ORIG-GUID: PPv_2di_6xi01uUKr5X2ZX6ZuaSLpnib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX6S3Va9b44hUa
 Hs65BE/IxSBhXnuYWlmQlH0f8SAa8mdvPu6m8RXn+R80c2xJop4Etmi4DE5zwi4zJDj4wVSam0K
 zpal2TvCzOwphH/G8fNRy3nVW1cJstmR95O2Wjoa7UbQHSM3c/ozg6MEerZ/7TO7O0ecfbunSFl
 REJ9faEuf2z8Oggbpo9z6f9ehFD7QXvuuK5QMJKe4qDKvgQjoArgtUz/oJM/a7rBayUSeEAzaBg
 i8pNeBUxDS4mWygh8JKUSGOKck72zl9hzzX7DnGgrluou0RlbXYfWZqJQNnvBUCU4HYtGvKqBOi
 30gcOct0+zGINqxS1D7LxkqQ/QvfUn0OZf+7scqDOg6+vNiizRvibTxz6Sad/B97q4s9rm1O1ra
 YlDT18lvGrNAZiqIwyUhEXjrGNozA2f5qg0qVTS3U2iQM4pb2rouzvqHMmSdvkqQloQ9A3Jgciz
 ktgKOBsQjKwIfeUHpYw==
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
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/leds/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988b35f304e953e873af3afe2ae04b8..f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -765,7 +765,6 @@ config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD || COMPILE_TEST
-	depends on OF_GPIO
 	default MACH_KIRKWOOD
 	help
 	  This option enables support for LEDs found on the LaCie 2Big

-- 
2.47.3

