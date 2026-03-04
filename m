Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAE339A052
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615018; cv=none; b=ENIpV9bPrKG6E7tQUUUbzqy+HEhVE97ACnkzu4hpbh/8uSIMb4HpDZB7vziKkm9c3kUJsLAqQCfPBV78vja7Wlz59OxiRkq0Jo+2BKrN0VGlj+F8vUv7D/BTdDLZU322EAChiJxssM3E3jFB4IXHuZNMH3jpTEh5MnEJ1Jw2Ze0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615018; c=relaxed/simple;
	bh=7Yu8AGLKirVDPA2TPrB0ciJheoHEe4QHGDZcNV0GmnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJYINct0Cw5w5M6HQtXB6dP4MZ5B5EIEJuW1mvNI4GR2WSN7g/8s+cBUcwy/JvzXKzHcAgu5/oTV8cQydOyJoB+BQFHJlNbBkyyoXk5i5hMnh0YXpZG1qV6TI8RcsHW8V9wlKRfIz+zKxAwS9X6O5s+lfRfyC1ciQe8Cxl4/4UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gss/iCg+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4pg3TPn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gss/iCg+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4pg3TPn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SOhX631858
	for <linux-staging@lists.linux.dev>; Wed, 4 Mar 2026 09:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=; b=Gss/iCg+rWOjO0XI
	FXiPOngq3YEIyQmyihV0ROxspnZCr/RZST8qpwokUZCARGNd0v2MZcqSg0NdflPU
	KtgbPek6xlYE0v2Yqm5iaAUuATqBTQBVQcGuHLEXoOqixaaxVkwdoPeoL1goc/Qk
	EBCDU6QbtqYmbjnruimWpk05rlzR7HSFB9Kz0WyacIQWoK4xchg/NY4nekGS0qer
	foPIQrHahLgMVT4qZjtx4adFTd/8Hv/LtVOiAkTNUYFdPeEf2ZzDyLmRyhpGK10F
	6UkSbMAN/pYC7L8nfVWPOWzCsuTI0OcapeVVNpjjy2W+CYkkxvaMcy8E1OGIf942
	q7/Qmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtucchp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:03:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca3ef536ddso1144704685a.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 01:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615015; x=1773219815; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=;
        b=J4pg3TPnhuqAHLAsA8EFxYDE8SMl+hj30GyyMd/MIT5UdWM3a1pFozzui7+FNNNGxA
         /2bG/r0i6B+pZ8opLGBoWgQ24J6OBhJFhLLShYK+gB93Wh4OIL3/3tHoreHG7gsFem+P
         6AavJhRrrq8KIotJnaZQGHCNJwBXsr/DmL2DojrbwrdexJqqfMAQSHLN/xyhMbXjM5GG
         d5kg3HZV+MXEtXJvlvqj2MhfTJPXXakuqbP2mwdjbyROVLaRNahcDYZGzZeBtMX5Vw9H
         p40cgyEpEqliT6n21fHRDuNSdbNqmKitFtXpfrLqB3Wkx4WLfxn+/861NXdGW/UWrIBP
         tyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615015; x=1773219815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=;
        b=oRdnr8rwqiBkXTtPPnP3L7CRMWtPJp8pKcPk9yQBDsdXf16maGfb2lzkx+aTpAWCMY
         iu6oTjW2iuuD0umaCTHdkWkKs554kOEjmS6xpXWIl1jY9cmgRVGuqJFoDWWD5nnL4pkn
         4KOuH7nDe7qLXUpcMLmVAa75odgMTC9ngwpZVmJN7jIF8Sf9u5AL7yS+C88zIQH5N2qY
         JrROjMgbcU3I3vU+WMQdIjDEHphckewGyBVcbok6myqd3oR0ECzLlXFwF9iZkDYTG2k2
         f2CUl8aNzbtS2K12AsxRLMW8WU5uCjiojhRMy0vpU9AhUaGZX/lV9OIZL2iC5+nn040B
         dHWg==
X-Forwarded-Encrypted: i=1; AJvYcCUqKIvkwNN+fzLohC5cH1ZMWN0z0+ANYdwRwnE6Wihx9e6fKZ2GJc68k1NDlcV+6ksFJHP+KD7dIbIqxN18@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ6zVQnHx2EtD/ne/4b3gQ/xiBHLTVwQ+HAFwYCy7jcwySg980
	gBIajnvcsYrS+VtouMEog32VokZ+tsHVJMI0CqAW4ur0ksoF8Is+Oo6BCSNyId3qgkIIUmPIPx4
	afaKJ2fY78W4l51g8JLBJgnYJ3wsUA8nVi5ZzjzgsNPrVfR1s3+OxRDRN0KLW5U2PfE/t
X-Gm-Gg: ATEYQzzf49dIurhhLKoghXWCSk4YHzaVO6B5St8YDBfM+d3+SBand+hYbU1h48tXsdm
	/YIGRE+rrutkltgQTYpuwSEES5smhLPF31m3WkBfiQFdN+gVuu2KCDe8OvhEj4lUy8mxK5ZkTDb
	RTf1beL9DWm8+agZDhQ2udjAKa7SSB/Oc/OIBjzSLnQiRlSEnE0HQA1/QsGag0S/oAr4ssSgdmu
	l5ol+JdK9p7vS8GUptBa9aPheK+GAluyTBTsNhwm0jDVKTnP8VwK5ymNLvyOehvGshi9WRgt3sA
	mDDT/m0vVEEqjH1YCqNJ5hZeaI+Y2CxlIQW8Z7Z4d7Jctc8nVNa4ISCCA7eRJjmS3SVqfnJ49RW
	TSgPFNL6PNlOokWe0kcfqqCjr2Z4xyTn7PfImLUTG4b2RfPPulVIv
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cd5af80331mr160326585a.38.1772615015389;
        Wed, 04 Mar 2026 01:03:35 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cd5af80331mr160323385a.38.1772615014945;
        Wed, 04 Mar 2026 01:03:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:32 +0100
Subject: [PATCH 11/14] bus: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-11-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7Yu8AGLKirVDPA2TPrB0ciJheoHEe4QHGDZcNV0GmnA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U0GLkuzkdEz+C3tJvMp4AQ7C/WH2/5dCKx0
 BCzpx6BvgGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NAAKCRAFnS7L/zaE
 wwhCEACKXR8hW1IiOwR5KrvLRZgVvnxKgGPrC7L6xvxbiMUnVqeZDdh88R5a2U1Wr74IbeHLexp
 rrr50hvFMkPBnqhcQUtaCGZFk4/IKdKBTRif0xGrxJPtzugQE0tbQJj4lG73Ur+ncT9BoVtw4hp
 FsLDV54dVcPs4TKwLyNm+WCt8rpMjkD/eXQbVEZrw/xKLWNEZX2oRJo+dAPmsuAOr6paT48MdnN
 94Ek6kcqmo9P7VNgd7eTUikvn5ZQgYLs2gJyL3S5zXxaM7zGsEuE3o3qzVL4gUdOVrHxAMH3Vvr
 wo8TVnlirQfO+VngnItzgph3Ho4ATc95hFNirM8vjoCYiKifg9cziAaa82BZJmGJ43sIM3KpDEF
 +B6l+y/Kiz0jWsIyHHEqWi8ZrS34Y9hvIaP3eMMQ7OQpykM8x8ZbZRBd/sbK30im2Lx4fQ3qep1
 3DFSIMuHYg5sCKcgHz5zat9wm/aWg1LRmAohRvpwpF7dIsvpMDjrRDh5uQ9ryTHDRC9/3Oq20RI
 UXfzyjkKqs76K/4BmBISIcEVedtzYk62EOzPQ6hQLumZHoD8Q+OB1CeFKHjn7rOa2xQMVjeaqrS
 HsXOM8riL1ke+k9oIyQPPiwLnwdIqnDlE4yYfagLgPQTn81GkMlMuuQ9AVIKf2MaYI34UwFxZiK
 rwNRQQIFnuJE0Kw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: xSiC9MegwMoeQSO9g-Q1PqFungWmLwcw
X-Proofpoint-ORIG-GUID: xSiC9MegwMoeQSO9g-Q1PqFungWmLwcw
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7f567 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=myaI65ZsvjZLdZNFwr0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXwMcMfWITWhFE
 /Ltv64HxRfU3UX6qCdbxArA39A0H7xu/fsZO9vT3sXppCjacJcZNlJu0zv0JZEz6matTGioOD8d
 X/qMLzuej8tnOjRga8nJXi4TcwRofTUf7lOeFL9zcohrt51CAQUeQt+m7s36sLup8nwsefhV47o
 //wafJB0u+/ey33pWTU7XXD/PNHWol9qSl4TM8OBcH4BejvNOGSh3YU2s1NhRO2Aj6EDU1JYrRK
 8hQ9ldulcuquLhLhOoYxfcDwQ5eEnBZLOqypLaS+r+JEOS/WkT/Kb5AiBhM7qmFfSldVGCZ4xdo
 F6RXrpxWPgPwstf2n6+E5eZBGRjiN4+A2duG88mKmUvAEvtJB86FHOxEoadlvGO9so/2RAz+EM4
 /x14TUYk/3w+KBsOY7qEKqZmqqg3z01YoI57Wr6GmCLYLHw1zAY/yOr2diTE1s0DHAMgt5Iyaj/
 30hUl5pPIPpJdEG27Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 2a1b46f07080b3533a9787254aec2e67cbe98310..c7dca0b5fb857a263e1ee730ede6002e88c418e6 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -236,7 +236,7 @@ config TI_SYSC
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

