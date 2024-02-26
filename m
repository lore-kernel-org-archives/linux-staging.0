Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A11CF83
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919801; cv=none; b=r0P7QAC2H79jEOa/XQdtuT6AHoKEdB9gjbZaQRwFub85yiviC40IcUqzCNZQKKrpT/2U7GYR3/wD9+8Qr6wgpRv46Bo52mO2E/LXHfqicM0XwqEHdeYzYrkmbFThmgER6FOU84IDX9pi7p3U3rYNUq57SMJ9DO6l/Biit5uSYvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919801; c=relaxed/simple;
	bh=5UTZENADYSafTSPQU2VUV2qEUU18GbFa5AoXANlDffs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BRahIVlF6TOeYr10V66twK0TW3kTyu+gbp2CVumpHpAbsdtHCzlZ2O0OuTDItJzzz/b2NIVJzDXmXzln2l1VBrGi14XmunTatEq1hvkXr1bTzcm/RVfuNsxOk44hFgNY+wkKFEdMjVRHvwDKeGBzuSIauMfD3hwcVBRgM5PQPQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ILTC+mRs; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ILTC+mRs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d911c2103aso11050115ad.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919799; x=1709524599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvEq/4HtoRyMkGAVi+SaB+InStERkdUsUVR8Hmese24=;
        b=ILTC+mRs87rh2Dy18aHUmqLZO2wQF1PT4I528QYZlx6sCRK2OzIfrX3ym+WJMoCfui
         6EkFjSCQ3Fscffzv30hstffTgceUqRseNJfaxSM5Zpok7wlDAbiBvBqoJUAxibhyvMNt
         NZb+CoimJZwE0pV+MbK9T6qXrvduQMQnK0XcqFM5HALmRJ3UK0fND4VGcnVa94dE4rZM
         8SjH4eYbIOCkYZ89n+U0wm/AFNM9anbvjUAJ0nyIu76myfEFclVEpDn4w8xui2zSzuRB
         Ki0AtdFmAPCM0sRX2bufqwAXtGOsz2zk/qu+tpeNfkcnpomCyx3j20EeiW/4+77cJKBy
         u4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919799; x=1709524599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvEq/4HtoRyMkGAVi+SaB+InStERkdUsUVR8Hmese24=;
        b=NygSyf8/rMPMjgUA6mtpy/Ogj/fCl4AWZwzMI7JbKUw8VnLFY/LwU/vBcYENktyKma
         4U/cQtGs6KsJBmboQPzmQsrdZQQq0jUxiwEAnQ7YCGc+pM49Knk1Lh5wjUINJA2Jemwc
         EjqwIQwNRMEJBchDcUFOLoYVjLTBmcORJhzOmZ0DFYOGYN9r5c3M8yFt4JiH+XguJOLp
         oEuklExhVPDybk+R3ccSCEkunf3l+YJKgPtt3PN5gRTpx5dg4uBA4v7FX9s/O5wiklyu
         3nUnhUExeSD/iKRacFtw/D+yaD47/7bRa8pcHBmtYp7bL5sw4jI9By43PAffFahL9GKd
         sTpg==
X-Gm-Message-State: AOJu0YwxEOXm1pBdo7i1jSJcT4pYEZM7rHX36T8qw2L1Tq/eYopzNq6N
	P5GNKR4jgo1vErXwlGz5VLbFuO75Xa4Cgwr0toZUw5PM7th/gS1EzZl0QcPC2dlvdBH27FUcYZi
	k
X-Google-Smtp-Source: AGHT+IFeETMJPiDj3wjN3T4WC0l1V7tOhDRDO/JWTCmHfPU45i6rPMKBMNEcqVnX49bFNf3fPz3XaA==
X-Received: by 2002:a17:902:d891:b0:1dc:6fec:15d8 with SMTP id b17-20020a170902d89100b001dc6fec15d8mr5065930plz.47.1708919799615;
        Sun, 25 Feb 2024 19:56:39 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:38 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 13/20] Staging: rtl8192e: Rename variable AironetIeOui
Date: Sun, 25 Feb 2024 19:56:17 -0800
Message-Id: <20240226035624.370443-14-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable AironetIeOui to aironet_ie_oui to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index e59cd2792389..ff912cdac9bd 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -818,15 +818,15 @@ rtllib_association_req(struct rtllib_network *beacon,
 	}
 
 	if (beacon->ckip_supported) {
-		static const u8 AironetIeOui[] = {0x00, 0x01, 0x66};
+		static const u8 aironet_ie_oui[] = {0x00, 0x01, 0x66};
 		u8	CcxAironetBuf[30];
 		struct octet_string osCcxAironetIE;
 
 		memset(CcxAironetBuf, 0, 30);
 		osCcxAironetIE.octet = CcxAironetBuf;
 		osCcxAironetIE.Length = sizeof(CcxAironetBuf);
-		memcpy(osCcxAironetIE.octet, AironetIeOui,
-		       sizeof(AironetIeOui));
+		memcpy(osCcxAironetIE.octet, aironet_ie_oui,
+		       sizeof(aironet_ie_oui));
 
 		osCcxAironetIE.octet[IE_CISCO_FLAG_POSITION] |=
 					 (SUPPORT_CKIP_PK | SUPPORT_CKIP_MIC);
-- 
2.39.2

