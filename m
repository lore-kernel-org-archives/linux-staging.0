Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705DF29CF0
	for <linux-staging@lists.linux.dev>; Sat, 20 Apr 2024 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713614062; cv=none; b=Wb6n1AfoD9SO48xK1flFTnRaLN5GCAZkcONf1o/LQ369r8erR96boquH45j9f28x4ewrvcXM6xADhLKVGBomP7eUG4WLIwx5oJYR658I585zLFRwifT7CuQDpnMXEufTe6Eq7cfka5knBqvln5PNZS0W3YQSqgYDjVLhds7esME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713614062; c=relaxed/simple;
	bh=HxbExcBqD4shC4ZhsEbTqRiJMEmdS2BbmkwIQovFnrc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qzip9Rgk99xAcSRXKpsN9G+ZHWbhOttsDdRXtKiFyG0Bfwscu/vTAc3FjuLIM8XPinMC/31arPz6BN8/AXo5gj94EjxaI+bDiJ2lXGCj9f5CRMdasVUDrPV2N8PFIdA7JYWq2u9gp56P+8uK66zwhR+wjCcbvVdFarHK/e6cBb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=gBO/MFok; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="gBO/MFok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713614048; x=1714218848; i=wahrenst@gmx.net;
	bh=i8M70idR4lO5Bzt2GYCHZXqU7yRTtol4X29SW2HFgY0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gBO/MFokuZH+3Y/sN28kn2j4cKYRJU8cpoY3Fum+EJS7zeWIFdfPdAb/epVHDp0M
	 5lvS9UxXKT+1Fc26Z1bAsjdrNVQpATu0XEvI+Pmw077A1jO0OasYnkFeFp0fvQx6M
	 /XPiLbG/TPn+LRDss8YxSz8Utw8mUWyg8wbfG3jCY7S1DTovFI0LIC8e2xElK+hCZ
	 oj63lAbfmE7snFyboI2BgGQYP0c4agG+iLsS4qqyPWVHRmxlGphQRVMg5la8t9Isk
	 f0rengyJQm/LjEhr7pGTFldMIDsVKGBeEJudNqUTq2TPoUuXlrbouU2/yRlX1rwcn
	 yQ0noL0cgwwleFfHZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDp4-1svU5I15S4-00xfAh; Sat, 20
 Apr 2024 13:54:08 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/4] staging: vchiq_core: Minor clean-ups
Date: Sat, 20 Apr 2024 13:53:47 +0200
Message-Id: <20240420115351.27713-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Yxo9u2bLFLFuhC2DQ7/42Wef/UwYG0HfpAixdK01yVolhRtptjs
 PkREC2fPg71+9159vxf71WlsrRXnzmCqYaN94SbGNHmbYpDaGY8WUmATIeRrbsNE9d/USQc
 jjzMHrHMapb5UcuNCW7CZxm0csdQ0g0xm9eTyx+SRv7jT7P62K3eAusDksDYNIms7bnx0pp
 UYkVa/U8V1B1j+zGZutXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XmZLiurwvJE=;4hkkodWxpxETEBXYsTSLwlILBhG
 UxKXUYy3OCLbsY/nR3U/pQBa6klUVw9H1Bvo45+/ZFuATE5BV+pcQ2x6alKC6QojYOnJpRhaO
 x9oolC6IhjLbNHFh+VsGjCm0uEi/RLcD4Ny+gdewH9Y8xmM+gqbOLHDvbfrbAqSGI8iiKFQya
 SbpaKquL8XJ2BKF4dTf8sZ+NSCD30GqWfiOEx9K7WFpho+7I8mZo25t9dtsbPfG/VL4RxOaXu
 BSUN4HQZpKPHppihDGSHHMAASmjCGUyiyxCKnyMKmCr19wGEmFcMdRjUGoHYMd96dpbK0R9MY
 v9xjQ+UA27lmoOK72sfu8LnkO8mbOPxvH2T+yEXyKutUJvH0PYBDveCGWdry/sJDfyGT8LDuS
 2wrb+Giu81Z8cIz1/R06U8jMvjC8O++didTN+ckkTD35Zog7L6+RzI4ymyQlYij3Yx1Bvl4dH
 2wO5sR2GPpLwepG4EgZz9dd/Egk1QNHspjjiEFKgGb2BjQs9H7oZys5C6M8iVoeLuSqvZiixo
 LymrCXZxA1uI1WmYmxKryn48QAQ+KhwO4KfWa9vlu4j2cVsU4kI2KP8NMtcfJVfrCS8f852aH
 GrkufpHBS5iJhyn9C8VbJJ9iy6MKHKAiDc/uQo6ytlxE8JiKWrdYvO5nqu350REZriZnU0fvj
 88l/uUP/vnwhQU/P0czfSR9bn/YjaXYfw+aOFK4Zk635SbMB2Sup5qg2OifQfNG07/bWaP4y+
 cbkeBk0BNQMsd1eG9q+rK+UOOhLpR9Z1jg5mc3Ojpfd4nPgbzzWFjjBoe7wX/ddljEpartV++
 MAxeT4csACnbcso+etH+dn5JE5hWN7Pd2wpuktNte5v38=

This series contains just minor clean-ups, which were mostly found
by checkpatch.pl.

Stefan Wahren (4):
  staging: vchiq_core: Use printk messages for devices
  staging: vchiq_core: Add parentheses to VCHIQ_MSG_SRCPORT
  staging: vchiq_core: Drop unnecessary blank lines
  staging: vchiq_core: Add missing blank lines

 .../interface/vchiq_arm/vchiq_core.c             | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

=2D-
2.34.1

