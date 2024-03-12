Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AED2B66F
	for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 05:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710220735; cv=none; b=CeVTYjpFy43vF84KDkEQo7ONEZLv4jnhTxoaT+pFlFt3fyOoMGeI1Y7qKFDeZ4q85O3dzmjR8tePhPwWaoow0B/EQmHKlfwfiRcvJwcB+TMnCGLkm5+ZY85NHlr3L33AFRwOEdW47c7YkpusxhYlGGg/dnew/BJzwWO+KHOLGWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710220735; c=relaxed/simple;
	bh=RP1j5F3ilhjJOWGmbsI2diL9/wVsYVFld/rkiRg2fKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j+nj7UKktKUCYDEWjMWDCP3eyTjkPsFUfu98AkVXxylAIRmWpW8uB24DpgDipF9g3p5313TZmy/iheWJkcl0TI8Q3l+giCdXfYIZ/4yu04Wy6pM8/dob6l/KQzo2wzHaMifEN7jW8AQN9GCOgNAOMLNrdJ43TNXvF7EqVP15eN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=habW3a6R; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="habW3a6R"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-563bb51c36eso5591652a12.2
        for <linux-staging@lists.linux.dev>; Mon, 11 Mar 2024 22:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710220732; x=1710825532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+/CMcUQ+LYVcURKBiUi24bqTd6PybV2hkFC8M0WQ7cs=;
        b=habW3a6RgnQUDukKW+fV/HniC2X9fSyKp1X7D+/EMrYJDh9y2P13DaIqOGvZ6B/cqP
         cI1w6Wl1awsCxZhwMqY3mBpZkbkhNCg5Y/gAS2v7ZoHs7SdF3LxUAqUHde2Rq0R6jmFC
         ilY2uxAAyLQEaoxvJm6KTjup6156QCh42Lx+rGTanyJapQUTC08RH53rpk9vb9g3/ljQ
         DA3LFkGwEyfWtOJ+vVgOroD+/6p5CojJzpzv4+e3jEek0BTR4Oeq7JEz+IgC+R0f7X35
         JS1esH23QySckjYQVCUYro3SNAzqEwIQGFk0iPJkdNVlgta8Y8lRtBLRIae7TWlHnjk1
         Rkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710220732; x=1710825532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/CMcUQ+LYVcURKBiUi24bqTd6PybV2hkFC8M0WQ7cs=;
        b=EK0rIdAxfNX2CE8+uLOXSqDJzABU3wqEwXeqS3xKcbLM2bVq/ofiwsNCGjOmHm/umf
         OeZrG9Z8app7GPjOpPdbEfB3SxTKTOe/GZEbwU4egw/Unbp3OVpj3Aajmht+uNRh9ecY
         XbydMvxuj0B5xrk81bGgVVHWmpDchnUQF1sGIW60QHLwQuiW9adNdKNTa5bcIRllhPoh
         pwI3Mkxfgyl3P64Yz30azYRuwWaQODi9N62rN7hkHZvnAYkDNKFwfEakEPV7yTaEfnbx
         6M0VSn29UpWQN7YFeuvP4YamvucPPGET9dcBuFyZYOfwTqPwMPydcxrmwyqPiZ6HHPdm
         0sDA==
X-Forwarded-Encrypted: i=1; AJvYcCV4WIzUb9ZV99H10kYn2TFIptql1u4WaBS/loyInOT3J69hXij47WyoCCagekmbOKR8zbVgWs+rCuboktNDpX6aqfBaBP1o4aNQN0ZtQw==
X-Gm-Message-State: AOJu0Yze1rTrlrWQjQXJrSuN6ag86wvB7Q2vdyj+H77tBVUIpF9Nbk+1
	nX9zfWvtAmKB8ZmnLdnd9PApHH3qyu8yr7+cBj6KeQutpUpzNAFO
X-Google-Smtp-Source: AGHT+IEZ12MTVUKMwELi5EBVmBR7dR1eUI8jrfC3zV1xIOnKsEifTaxOj60tmS1lErnhdEFg/FSL+w==
X-Received: by 2002:a50:8d5d:0:b0:566:117c:cfca with SMTP id t29-20020a508d5d000000b00566117ccfcamr5567856edt.4.1710220731643;
        Mon, 11 Mar 2024 22:18:51 -0700 (PDT)
Received: from localhost.localdomain (ip-77-25-34-17.web.vodafone.de. [77.25.34.17])
        by smtp.gmail.com with ESMTPSA id s27-20020a50d49b000000b0056729e902f7sm3791578edi.56.2024.03.11.22.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 22:18:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8192e: replace variable with direct return
Date: Tue, 12 Mar 2024 06:18:16 +0100
Message-ID: <20240312051816.18717-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the variable rt_status from rtl92e_send_cmd_pkt() and return
true/false directly to improve readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
index 7f0c160bc741..e470b49b0ff7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
@@ -11,7 +11,6 @@
 bool rtl92e_send_cmd_pkt(struct net_device *dev, u32 type, const void *data,
 			 u32 len)
 {
-	bool				rt_status = true;
 	struct r8192_priv *priv = rtllib_priv(dev);
 	u16				frag_length = 0, frag_offset = 0;
 	struct sk_buff		*skb;
@@ -37,10 +36,8 @@ bool rtl92e_send_cmd_pkt(struct net_device *dev, u32 type, const void *data,
 		else
 			skb = dev_alloc_skb(frag_length + 4);
 
-		if (!skb) {
-			rt_status = false;
-			goto Failed;
-		}
+		if (!skb)
+			return false;
 
 		memcpy((unsigned char *)(skb->cb), &dev, sizeof(dev));
 		tcb_desc = (struct cb_desc *)(skb->cb + MAX_DEV_ADDR_SIZE);
@@ -77,6 +74,6 @@ bool rtl92e_send_cmd_pkt(struct net_device *dev, u32 type, const void *data,
 	} while (frag_offset < len);
 
 	rtl92e_writeb(dev, TP_POLL, TP_POLL_CQ);
-Failed:
-	return rt_status;
+
+	return true;
 }
-- 
2.44.0

