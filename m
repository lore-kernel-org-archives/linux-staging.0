Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D42308F1F
	for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765360882; cv=none; b=F6kAJjgJiknj9RBWcyvEc35Kem6/WHT+5GnBKngkHwnl7F6E9lpUvTEQ1Qj4ZcKGj7Zsclo0IUMOXAhZEtK4dLRA2yr45ZfWaVlwKu8/0PmaW5c3y4Ed55142kfdPYnIqDHNW5Pi8qXLiuZOJJgN6z1cOzvCFv7jqunHsY1Nxck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765360882; c=relaxed/simple;
	bh=UjEnzoPrmTkPkVAe6WxOo+pApZ3/c0EoApU/AryGhMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TOyAgXfkRCU48kQI8FQ8z5iAsRzEk3F7btsx9N9fdgYGhuMycoSeMrQeCiVqIGiU018s6qM4mhVX06XkRKeZXexqqfe3ne09MTzoVWE5WJ8hHzJda5jTZvM/1OTWCLeP0J9wi5k/2hl40qAfddJyLPC4KJQlyzkixU51Pg6ZD9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhd4iWIu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhd4iWIu"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-298144fb9bcso67879975ad.0
        for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765360880; x=1765965680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/fshd7X7uki2whPgbyHXdLwERbC2fRt/X2iMSKqiUc=;
        b=dhd4iWIuTquk8P0HISfARbSfRrqCwjsYEV1RnxiZxgVpODubuREkNDIBk4/eQHAoif
         Kon/Jaey1r59vNuYD0YdcCval01zFnrAvsIwU9PBS3WzIQE2sc3xje4Jjai2banX4dmt
         bTPhjj+5WvJ4/8fgSLYWKRmeusRYJxYTz9mODj9W+fzCzG9JAZ0vvwNmcRRScX7TKHLR
         rN0t1TQl123lN5tIaa8QuuK5LBAQHlEq1L6MIS4L6hA4DSpLfPNnB7nIqDgQfC0msDDP
         odIDhm+aXiLychOkp0zG1MqklU0I9ZPs/leEjHTwK6+OZLiA3bAiBByoLCcV0APVBeQE
         1yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765360880; x=1765965680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/fshd7X7uki2whPgbyHXdLwERbC2fRt/X2iMSKqiUc=;
        b=slCM+9ONUsCGMD91nNNfLRSHxmYS/wFYBTMh6ooDyYxb43r4RLa2N+QGmc96XeQlWI
         mlGo9pZR6B+GpQAuiSdvpZDdUTxLT+cbyUybUonLx1hP4UQw8pUem4omRu0dH3Mn5P8q
         pZg/qrBhV3JStWScJ80RlODzsuKoZH/zubAcGlxtOd1PXcd5YfcMjcptYAtdw+ZcbpYv
         kV5rrKRZq4hNhl13f4dEo8G2rV3tY2WRdMk7J+nd/m8w20lLP9g9JV4qQVOC//V5JJhs
         +MveA1RWLYyluCT6Bkl0Ua0O2eJAlwckLXctp4VgJzgYMFrLlqB+DFXzpQ+Eohtu/ggA
         aTdg==
X-Gm-Message-State: AOJu0Yzd+iSzCSjUuSWKd8MUqbppI2L+ZieAGyj+7o8a27HYqCibaJWU
	ng5amRPF5sHSMRtJ39z5G/QCUbxSzrpeYDRdkoerOtieb74yzWbagV03N7/g+lpM
X-Gm-Gg: AY/fxX5Mr8fE2jscDbpkGZgMUCjsU+724M3pfLKw5Vq1+EKeB55PSotH44lidLzn8/H
	XcDFmJIDwJEsRVunas7TvbrUvsnlwG8yG/09e/F6oiVDTBU/69Pna8+pHafYBUQMQQTT2nAy0Iq
	dQSUD8pycomPMRLiDh6B8SUGDinmnQrtRi2j5QSnho+Q/watwgj65q5ALamhiF7uCkkGdqNOLOy
	Gc8LernjwEpQ+w8nhsMFBiwDuwgO+gQ3ij1gWO+JDhIVhVH55GraI+DQR9uWKKu4RZrDuRXPVXA
	VX42cPaQf8GohBg4BxGpViMJYdGP3+H0lzQjpvcWgjVvlfTJ3fsp8getYjqSKwrEB+XyBnZzhaU
	JdHl789+8ro9HKc2jSpSpExxxJcNnm8wTIhOcwgLjDGiow3XhenRWszyXkBpd2wVCRXRWikJC5c
	dB0u1hTXE2ItS/gpN8IyDk4z+YNw8kFKJX
X-Google-Smtp-Source: AGHT+IGlAFwVNmFR4OozRE7y9JbL6Erh1jOVM6v6qblipw+WFGHORbKbKPwSEc6Q9/boHVvKIxyfXA==
X-Received: by 2002:a17:902:d588:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-29ec26b9c3emr20869245ad.29.1765360880446;
        Wed, 10 Dec 2025 02:01:20 -0800 (PST)
Received: from localhost.localdomain ([38.134.139.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49ca50sm177163105ad.20.2025.12.10.02.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 02:01:20 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dharanitharan725@gmail.com,
	david.laight.linux@gmail.com
Subject: [PATCH v3] staging: vme_user: simplify bus number allocation using ffz()
Date: Wed, 10 Dec 2025 10:00:24 +0000
Message-ID: <20251210100023.33753-2-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

David Laight pointed out that the loop in vme_register_bridge()
is effectively searching for the first zero bit in vme_bus_numbers.
Add a check for vme_bus_numbers == ~0UL before calling ffz().

Replace the manual loop with ffz() and use BIT(n) for consistency.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/staging/vme_user/vme.c | 15 +++++++++++++----------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 2095de72596a..45381e677475 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1765,16 +1765,19 @@ int vme_register_bridge(struct vme_bridge *bridge)
 	int ret = -1;
 	mutex_lock(&vme_buses_lock);
-	for (i = 0; i < sizeof(vme_bus_numbers) * 8; i++){
-		if ((vme_bus_numbers & (1 << i)) == 0) {
-			vme_bus_numbers |= (1 << i);
-			bridge->num = i;
-			INIT_LIST_HEAD(&bridge->devices);
-			list_add_tail(&bridge->bus_list, &vme_bus_list);
-			ret = 0;
-			break;
-		}
+	/* Ensure we have a free slot before using ffz() */
+	if (vme_bus_numbers == ~0UL)
+		goto out;   /* No free bus number */
+
+	/* Find the first clear bit */
+	i = ffz(vme_bus_numbers);
+
+	vme_bus_numbers |= BIT(i);
+	bridge->num = i;
+	INIT_LIST_HEAD(&bridge->devices);
+	list_add_tail(&bridge->bus_list, &vme_bus_list);
+	ret = 0;
+
+out:
 	mutex_unlock(&vme_buses_lock); 
 	return ret;
@@ -1787,7 +1790,7 @@ void vme_unregister_bridge(struct vme_bridge *bridge)
 	struct vme_dev *tmp;
 
 	mutex_lock(&vme_buses_lock);
-	vme_bus_numbers &= ~(1 << bridge->num);
+	vme_bus_numbers &= ~BIT(bridge->num);
 	list_for_each_entry_safe(vdev, tmp, &bridge->devices, bridge_list) {
 		list_del(&vdev->drv_list);
 		list_del(&vdev->bridge_list);
-- 
2.43.0

