Received: from mail-lr2-f13.google.com (mail-lr2-f13.google.com [74.125.230.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141E83E3D80
	for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270344; cv=none; b=r84PT4PlybbOeF80m5l1KvL0EiHDUIsLZRcns0KEEe+rDsmU+MDRvUuJE6/Ayqy8LeXZP9/BHmiZE5Dlke1Rz8U0HFq+sMADmfBN5MFYzPTX44M+vLn/WoeeHVigT0NaaoxjFIdLIEDtsZPlcVhbwfQkPfX6pyOpJ8wYF3gOaZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270344; c=relaxed/simple;
	bh=IzOSQ5PgShuwmISU178ZdszugMpsD5D2m5PTctJO2LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJrZNz1GswvG+p05+FFFULYZRxoBzppf4eL5yC62gFJTVXMPuA8tXxU8zzGq9xlOPecT/Pl6xJZOsxalqogZplrBwme6V5EXlSYOUV+SqpGkype2KCnn1muy69F53xuHCknrPeKc+Q7fDi3RT1viqCF9yKqipVRYSHC6rA5yL9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnDFU59G; arc=none smtp.client-ip=74.125.230.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnDFU59G"
Received: by mail-lr2-f13.google.com with SMTP id 38308e7fff4ca-3a302c06eceso19513911fa.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 10:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270341; x=1790875141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEg9sPLG6R2rCCs4MQKovEl/ls6n0s+ptG5DL7CC2NY=;
        b=nnDFU59GEGbHekFpInCus4bnzLgQD/AOG05VgFjaDPlXgYFvHYezttB3hdGJ1m0aNt
         uD16TQJ6ctD+mK1S9fu0nGXdgA/coHsDNne7G9idljJ3kiKG7vL9T6pyHcL/a1GhW2b4
         XHWssUvgFtEynqY+RHAFGFvpwzb6bdHkZ6o41OHmfVzqCr6z7OnUtK2f9FAUIM2Lt8gj
         1QayFIeVP3pnbTLp2qURKrcGtZoCGCH2+Q9GEy+/RSreIc00zfhK6G+em/4VpVTMfgio
         PVWt4ILSgN5wmdiukjCF8NNtECufbJuPKcH+gJ9CtNotgH65yoLRIujCmtlBbE2EcfNR
         TunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270341; x=1790875141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IEg9sPLG6R2rCCs4MQKovEl/ls6n0s+ptG5DL7CC2NY=;
        b=LqFK4wmVP8UfOcIwZ4n8EMA9F4ptq3wslgNB3C481nk7khv4CcnltNL/3SoBQ5/XOp
         lhWheoSoSbjpB3YX/jXpWa5lSXi6Hmz6ql4qVueZRGXI1swQjUcSFk28nHfkUSMtWvbO
         5DFx+BHgjQbp/VoH9qZDNyGX2sr6FDtwFBJ1gSTG+13ZyIst5HCixI9dEuXuCbzxXqw1
         EKPvxfup/udxjavnyW7J13jXXirooh55956M1Wil17f3EeZUdx6qrRJpUOxCah+miYe2
         qpAQCsC2aWIvY2IHhKoCP7RRkfLDaQq/1XsfU0sT2/4VU81Vqc7dGmLkiYi1CEcVaVzb
         wEmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCgDirRt1LTxq1iOeMKwhHzmLENLpEo3cgmY+N1fKYxWnoNC05C1YnQ2l1rYQtC+x0zAR6JB+1BY5rQFUP@lists.linux.dev
X-Gm-Message-State: AFuF++m30Z2SgLD06CEgJXeskSwE3oAHAhxWqsk1uyVzGWtW1u75Or7z
	wEE+kdJMPta3iSHNz0DiXttbLBK3vN634bRDb/HBEgGb6iI42B0WRAh9
X-Gm-Gg: AYBFou0Kvhed7ZYXCf96fcrrvwjuQq6F6xiC6AVZU1iOelo+zvPg8qKmzNuaWSOSHpX
	qVH1hMe83+VsskszBoHAkJNHWGe/s6jQ2lcul81ZAyXUYAQMmsgkyMglnELNKS/jOB3IIMJ8Oit
	qQggMvM+Y+h19tW4BwCsP0+ewBiUZ1oZdBgH0ByjQl3WE9sMX6XNyZAheNd5GDAtBGKWc0wYwcb
	wDXhE4pQkAaEIStQ5AXM094bouPj+Itoa79+mh4L9CVn8wJCDCz3jCeqAz8KwyFIA/5pAs2avwH
	JYQ4yddLLrO8kcXD1eO3+cP+7k0rfxq3zwk3QXB+wtLUXW/nOw4u/rRSRtwNb235KPaPS5/btME
	LvWxeX9hJ8e+Odl3USuT3+dsgU/6ZImGSFsRi9CEDGVpIJAmvqq+1kpzfCg6MkjiCCR/0q3xM8c
	QanZ0xgC76iPyKx2MTNFyu3mYcHs9pRNz6kzkZt7bJOmhLZB/cpwkFGqh1xNyDz9XarTAtXPElw
	BbA573+lxpi3+8=
X-Received: by 2002:a05:651c:b0f:b0:3a1:f4e7:a820 with SMTP id 38308e7fff4ca-3a63bf292bfmr8906191fa.4.1790270340690;
        Thu, 24 Sep 2026 10:19:00 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:19:00 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 1/4] platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
Date: Thu, 24 Sep 2026 20:18:17 +0300
Message-ID: <20260924171820.1179823-2-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924171820.1179823-1-koreev.r@gmail.com>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo ThinkPad X1 Carbon Gen 14 has an ST VD55G1 IR camera, ACPI
HID TBE20A1, behind an INT3472 discrete device that provides a power
enable GPIO, a reset GPIO and a privacy LED. The vd55g1 driver names its
analog supply "vana", so map the power enable regulator to that name, as
is already done for the imx471 on the same laptop.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 6c729fcfc..d005595ba 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -130,6 +130,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 static const char * const power_enable_hids_vana[] = {
 	"SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
 	"TBE20A0", /* imx471 on Lenovo X1 Carbon G14 */
+	"TBE20A1", /* vd55g1 on Lenovo X1 Carbon G14 */
 	NULL
 };
 
-- 
2.55.0

