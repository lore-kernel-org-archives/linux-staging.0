Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9CC5025C;
	Tue,  5 Mar 2024 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709630075; cv=none; b=dAI9rT6GoXHqtbX6U7Emb8ewEnBJF90NyNe4VE/PuzYYdKoy4O+tJ4gfL1XPE9h5dGf/Gqo+Au1JIDQJB+p9FekWbiEEDXtDdkOrlJcgqrER9uJX3pubbj1VNGISl5KUsgDt4j5k/nRdTytWfCxXKmnuAba/8DOe+idNE+GwgGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709630075; c=relaxed/simple;
	bh=74325vu5j9RLyiXVNesiBYtpIeyX7ByYhflq1XqO48s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=An2gG1Qsz5o/UIDeTQNcbFZakvyqojAj3dQWKK87DxaCNY0joISNZXeFQnKfBpNBsxwQJUzf7GMtaQAgD8bL+8SPPlphHfM1z2NZY7SuLY6eB7lVqpRPnEOhICJgVUpyNhG9QEx7wARjAjlen61xEGqsNhzdqLInOPjyC6xyRt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8oE1Hih; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8oE1Hih"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-565d1656c12so9584100a12.1;
        Tue, 05 Mar 2024 01:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709630072; x=1710234872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKDqunHSeZKeRfB3J/WCAgzYcHJnsj5UcMMwptz3yYE=;
        b=O8oE1HihkdJ/7/sL/YA2lNxd9Ikkl2eVidxwfecdujw+J9I1endS0xdQlKTPmKacM6
         fjp1XQQlyAGmyfC8M8IaF7AVr3Y/w7nimkTPBpFvklDa/9GVE0a44UK8B71X6w+ni64W
         K9hO1Hg4MIBNcPMYDSZMuT0Y1408YePe2EHP0gKvStAdJYELvmNAMeN0xIxu7pZX1QSu
         rUEBVEgRO70gOV3A8aUW0D14caM2yfHldwIOdOzp+ftvAjZTRIw6m8IwAPRyq4ruLBfS
         ziY2kuVoqa+jZAj4NjI1RgMWM+t/CV1ve9tfMeNzJzdziD4mpIppp66WKiJKr1Lk9E+L
         gR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709630072; x=1710234872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKDqunHSeZKeRfB3J/WCAgzYcHJnsj5UcMMwptz3yYE=;
        b=IKcFkcahCz2Zz8fL/JvhWgCux8PGpa8bPGGUjZXaQ6OqTHX26jhd8gltrlxAJD8kvW
         Bvb7UfwMzSqSRk5hEmudTitwrjkLSqtgF0qdqfzBcipW4ZTDKR+ugqJyMB6O3V3egSYq
         50iL3SsaglJh+dSr9ebFUXFgFvOMZgRdvHiUDRlyZPJBL3QoEY4VX7/obcNcEGTgmE22
         Nubw2fb/RpUDAldpHvtdUkkyN3NilUGHa85o2FReUy/u0HFaxMGsN5HhObz66KVF6I5e
         m7jUhs260Kv79UAtHeNA3Ea251bHeRaYGECJkED9QKXtLCP/vy+eR7CBndYsvP4r2gCJ
         4pEw==
X-Forwarded-Encrypted: i=1; AJvYcCW5IDGpjkmWgUbjUEpH2xuuPXxpPH5RhMJGe9rnjGZByGezxLqbwOOKLW/hM6BwO1DtFE+ZiXrcTQhz+8X/TlttuFmxvACPfzHNG0Wr3OeAJ8nofxjzKYV+PtfiglTD0o5iQPqz00LbWw==
X-Gm-Message-State: AOJu0YyXTd37AK2D7wFnL0YhkSTjY0PP4Spunp8saOU1YPNHO0uZfQ0x
	c/pPqm6DG2U25q2bCIWS/kwAShha5g6IWruswiktX+0clAEi4kWa/7L+DxtlwHM=
X-Google-Smtp-Source: AGHT+IE8RjTL22NGd7pnLwV1C+dLDcyiK/GIOUoF4eVFcNyHyBgiK0NXq/GaJP2kKvwsoLWsWy3D+g==
X-Received: by 2002:a05:6402:22e3:b0:567:80c7:33bf with SMTP id dn3-20020a05640222e300b0056780c733bfmr2054932edb.7.1709630071641;
        Tue, 05 Mar 2024 01:14:31 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id g3-20020a056402180300b00566ea8e9f38sm4120912edy.40.2024.03.05.01.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 01:14:31 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v5] staging: vt6655: Match open parentheses
Date: Tue,  5 Mar 2024 09:14:10 +0000
Message-Id: <20240305091410.2798-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304142603.32982-2-dorine.a.tipo@gmail.com>
References: <20240304142603.32982-2-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the function parameters to silence a checkpatch warning

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changelog:
V2: Modified subjects to be unique for each patch, as requested by
<gregkh@linuxfoundation.org>
    Fixed the warnings in the patches as suggested by
<philipp.g.hortmann@gmail.com>

V3: Combined the vt6655 patches into one patch as suggested by
<dan.carpenter@linaro.org>

V4: Removed the multiple signed-off-by as suggested by
    <philipp.g.hortmann@gmail.com>
    Omitted the cover letter as the changes have been combined into one
    patch
    Reworked the patch subject to be concise

V5: Fixed the commit message to "Align
    the function parameters to silence a checkpatch warning." as
    suggested by <dan.carpenter@linaro.org>

 drivers/staging/vt6655/card.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 36183f2a64c1..3f807d898607 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -81,9 +81,9 @@ static void vt6655_mac_set_bb_type(void __iomem *iobase, u32 mask)
  * Return Value: none
  */
 static void calculate_ofdmr_parameter(unsigned char rate,
-				       u8 bb_type,
-				       unsigned char *tx_rate,
-				       unsigned char *rsv_time)
+				      u8 bb_type,
+				      unsigned char *tx_rate,
+				      unsigned char *rsv_time)
 {
 	switch (rate) {
 	case RATE_6M:
@@ -288,7 +288,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  * Return Value: none
  */
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
-		    u64 bss_timestamp)
+		     u64 bss_timestamp)
 {
 	u64 local_tsf;
 	u64 tsf_offset = 0;
@@ -297,7 +297,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 
 	if (bss_timestamp != local_tsf) {
 		tsf_offset = card_get_tsf_offset(rx_rate, bss_timestamp,
-						local_tsf);
+						 local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
 		tsf_offset =  le64_to_cpu(tsf_offset);
 		iowrite32((u32)tsf_offset, priv->port_offset + MAC_REG_TSFOFST);
@@ -321,7 +321,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
  * Return Value: true if succeed; otherwise false
  */
 bool card_set_beacon_period(struct vnt_private *priv,
-			  unsigned short beacon_interval)
+			    unsigned short beacon_interval)
 {
 	u64 next_tbtt;
 
-- 
2.25.1

