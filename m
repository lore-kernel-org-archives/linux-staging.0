Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675739150F
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654358; cv=none; b=NyR6aEaCqdkNmdkwu/SjJZDU6N+lBiVi7Mn2rGZSXK83DHTW36SSzJ/LRi/clcgq8E8iVVZMNGTW28a8bBAIgK5+vizeLhnIjVyCz6ynpoEQUzASb6MMfyUd1WjbLnagL8Xy7xiWDOsBSaSUpphC3rbnCHO/s1aio0/HQY4AnPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654358; c=relaxed/simple;
	bh=Vpj7XblcOBfhTzLdpL+R0P+2mUUD1VQIJTUYQBBtQPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cu4sr+ieDazqOH4QZf65OEjAeomcQAwRx7/KDOvVlZOefkfMUdKZad5lqYIK2t3DI3hADS9p3Ik7ZmNggbUds//6kUWHUr6pxtk8seVY0vxlMCFQ7FWXzG7u98m9IagXmCDC/gPjmuc5uFWQtgJyYssFZQlKOItQHfQNivWhC9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F52FR0Eh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrEZNSex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F52FR0Eh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrEZNSex"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64qVP1724895
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWPerG47//Rh0t217I+PdOiAOICa6opjKtGqqyPqftY=; b=F52FR0EhvI080Bw6
	ZAJNJx0a8UcwiT3pF4CZaST6zvv6FC8R2WEUPwGU+gRdeFs0uVCgYR0x2hqAuiLq
	GIJPeQG7Jo58rFBq3l6pxK1KOXmL1nNKvQp2X4lK1ud+bBmUI2E1pj7K4OrxUUj8
	EreZJmGtfRbMrEwQsViN3qglzA3t43jI+pdjhZ1Y/0y4aDYlRKhDWWGw6X/9f3gL
	EImt+siXIOQQXUd0q6gCYCKY7EXGXlB2sCDkSi9xP1qBslke5TS+K6Qogxl/lb0F
	fxkLqOuUO8xl6aXBNz+gJU0vXnhRPkgLnhTM2E4mq5EuExlAd303cZSBrKJuyyj8
	uiS9pw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udn033-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 09:45:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fec8d44so3137488385a.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654356; x=1774259156; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWPerG47//Rh0t217I+PdOiAOICa6opjKtGqqyPqftY=;
        b=DrEZNSexxKIxsnNcJVajx5u6090VwqF6HgbeFX2DvwUPWoESKl0ATT+DEScLZ4NkNP
         8DtRQfucsOu8efK+4gW5Zk3r3NJtPqNtzXivk3G9QNoR84VAodaxRkK/lpfHoqbwU4o5
         Qll/n75vufgbL0e2FbtUnWtdo6zpGRLmjY0pOJNy7aQFYkmsBbZibt7UcQ7jztbEtRME
         n6lsnhz9e2zGr1r4g0i9M3AvCN4h6HULZpOYal6hs2a+D1QyPq2UUx+UmKmo0gxZqIWM
         JQ2pgiwOSH2UKQtQObtQ+wzGdDjl7usYTQWAgq2wIKf31cWwkDjI+swBXi1M+gKqKHcb
         PROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654356; x=1774259156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWPerG47//Rh0t217I+PdOiAOICa6opjKtGqqyPqftY=;
        b=gSFV2MI9DsLjU78PL14GGEEHWwsVZnV+++yxl4nANISK1kldINxJUKKwGUTlKnCUlP
         AAeI6dHNk+0Xx9dY8Kq4uQaW8rcrv0ubmCVsBbB1wYyalVvZJnVPKlEFXQCdpKliQ2YL
         pnL/c3/E1TCQNYqf5YMLJVrqqS73ywWK1EzAWuxch1AJiU7Yg74P18zWM23yuyWUzELc
         qgcyiShJk7pRVrwBZWlxHxQaUPjH5dR3dEvTYNeZsSwb+G46/rd2+vTXlsfEdtJCRidy
         N2qwE2WJmAAJAeIb+B8ZBX0GIyhsouIJryi3h9DvjG5tT1oFiokiQWzeZVbeARIT0Vlv
         aWeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO6XzEFMrb3b9Pnh+vGti+a9rxCW+WGqgGlgzygrWHo+PtnmB9/M3W8QUCpI9/gJr+DW9wcRcWDrW1KMqw@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9yTi4yRTTJvbh3o3imicR8LjPzl6yak/9jQzTtBkVnv89DYJ5
	gVojkMTqzWN1+BhnyizYHl2Fr5Ey8w8BxsvNPvB0XcgAPJCQ4+5+kb5phh6xnRhanGev+pPeD6A
	1Oy25LyopzAjbUSvTy3m6s4DxyHgpB+ypecUYkc8dwCb9gyOC6n+TXx1FgIOnH4vNSWKx
X-Gm-Gg: ATEYQzxyrpky1YVjUXfr3yWbiJcpu88MeIUDhhy9Nfdnbdvr2/kldz50kzOJb4UOxCB
	2SEm5KacKMr1rl8NPVkIpJYdvwgdjxHcRUjl61ixD7XzTfMYLpO7DKPy9IZbm/ky4jb4j2JIIwv
	v6l7L3ttdeV2wXZIyoxI2+TYBb1ao1u6E/ODELhpdkd6e5cP846DhAYe+AuuOEs2/HAqlhyrHOU
	zPLCInDKTTeMvot1HuKtM4r8KjGQ94mqUksYyQvaGPqeWOSCjCwzDRnwyCE4MioLUMik76S0qrM
	YqUsmRQV7vIgeqHdn3r5C0RgJ/Dm8L3wEq3P4jsQp5oRELKsdlDvZ/r1lfjiHPQoXxIDyM4LJCk
	gvc1N3FjuFiiHYPG3kBWptn9un3pdeR3MIfxkrrxgyqYzWQhiKWEZ
X-Received: by 2002:a05:620a:7103:b0:8ca:4288:b163 with SMTP id af79cd13be357-8cdb5a05dbemr1624639185a.17.1773654355855;
        Mon, 16 Mar 2026 02:45:55 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8ca:4288:b163 with SMTP id af79cd13be357-8cdb5a05dbemr1624637685a.17.1773654355478;
        Mon, 16 Mar 2026 02:45:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:26 +0100
Subject: [PATCH v2 6/9] bus: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-6-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vpj7XblcOBfhTzLdpL+R0P+2mUUD1VQIJTUYQBBtQPc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E/BPk3re52ZJWSY5xhnCOBbXVxjU7260Fk+
 srsoMcqMFmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRPwAKCRAFnS7L/zaE
 w7ebD/9C5UxsVXbQ5n7GRcwj3aymQcwnmyJt5yL4Rjo3loecX6xlAIkCw6qE4wVvwlikpDiMICH
 Hlu6BqVViA68+gFZjra+HVX4cOzmIN5Etdo2UQVZnpgLkbtFl0aVyfjMXq/KEzefEF1MQ5xW+V0
 8P/5vVxEo/wTwSEUeXu91SjctdqANe9rV+yw8Y7yvO7/VxdJs97L7trXK51vWRpKzzeBGFLwgSM
 6BvxbcfOouG1wqurT5mzb8ndXlGrBBwkK3bL1VwPLaOpprLSCibrFFUHcr/Z+qWyYQOxPjfipIK
 C1PYQRPoXpfYokNYx/wtSlLunVdWAgJUBCbli+AGoHcqL+7B016/ejjMfBXYAMj3ez9oY+Nx2lX
 g63HzmI5tbWpMzltRMaOqJvZ742jn6tUPwfmbzhUwRKb/vZd2F9cQ7xcL5JS5j7QO9OXDQW7Kwb
 bm3sTzDWsRqJLEgbM2zLYkSo5Pm2sUoTFTndNwjNCY1r0+ltSAz2Lty0J+erC8vlj2FyHUIORQu
 4morlORo1RMu3RvdZ1tDEpXN4wof4XKnugvEhbsmPlsYqNKUt5XbyCFJP0/LFquiiQWRfXgPI+i
 Kzs+Uv2OCTkDZo9Oq6IwDVn/idGa4h6W7vMhuxVUixG0QCg5T46K09qvQCgBXcwz06G15PzWuDb
 Pd1gyza78ZAtsXA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7d154 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=tMvFuq0QiVTRqkuSJkEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: f00D4yqOOgYJydQYLdOeMhK0sYvlSzAI
X-Proofpoint-ORIG-GUID: f00D4yqOOgYJydQYLdOeMhK0sYvlSzAI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfXz4wDC80PD6ZT
 yQyo6UleDhK9V+qpkSMZ7DoNA0dFdh0SjxTD7FgRUwu69Tco0W+FAGFUXk5nk+Dck5oEGdobdQT
 O7R7EkpJkh/hxUjebauPYiN3CtpEFTCGwFSZB3xtKkYJunQdPZS/UIYFtmZFyiIDKLDM1zdp2CD
 31bLxyRSRESHKfeNE0l2JsFfsyNNgrhkWCONmind9EHFdwXA45bSG9nxwfGXeVJDylMdbvhApZI
 HGHkk/m+j46xhVXKJnK3ui7JsFzS0fVIxdfd8P/XXuNLNVXWTnYlgCxQTbaF1aUTJ0Q13C67OFf
 2syen+pWMLdmCZVwHJieHod5mFCOe+ZfyV7f2AlRvuQ8lJq7ALBzdl8mMosK1knlhyhfM+nbKlt
 BQ+pNimtL6/aFVJaljDDVvSsaCbOxowQL819Lpf9S5FPFGzRMSXyyEzMHoR2Cx2UX3NKnJbeF29
 mMGxvXAaRTXob7i7pNQ==
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
 drivers/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 3181d8aa32a3e3ec26935afdbde1ef647f425fd5..e4b1db809187fc5f8b39e3950776df94005476ad 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -216,7 +216,7 @@ config TI_SYSC
 config TS_NBUS
 	tristate "Technologic Systems NBUS Driver"
 	depends on SOC_IMX28
-	depends on OF_GPIO && PWM
+	depends on PWM
 	help
 	  Driver for the Technologic Systems NBUS which is used to interface
 	  with the peripherals in the FPGA of the TS-4600 SoM.

-- 
2.47.3

