Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB35A25D535;
	Wed,  9 Apr 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190066; cv=none; b=HwjaR+82QiDcNGbTU2bb4+pzG9WYbnXfGg/kPFgxoUsKZy3eUbf+iguFYksSf+1GFJkjst8K52/fdC3H2PGdyMAkj9UYYNfHkwSrikAfRONscdaSxRp2uKtTh0Ed4jBSIlneShQg1dHdwYO92yXBskv8JFfkDX7AGGmMeS1kJCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190066; c=relaxed/simple;
	bh=7tuF8mS/RBiXqmBPIHQCKgLB4C5lh2LqoT+PdNMhZKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OF1uMPmYg92z/EqqfKZFqcptn3QfqLhA/6j1Jk+YaSxiIiAP0nQ+hJVrKBqG6JShdBm7CbWb8ow+wGibUrsdHg8iDv+IbvALd8rxRvqjwH4Cktu/quqrrQXQTWVQ5LPwhl9iWYodMSq6+3ZTEV2KO2hwK51oIuz+FQ3bONVt55k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FB6XfaMT; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FB6XfaMT"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4774ce422easo66218661cf.1;
        Wed, 09 Apr 2025 02:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744190063; x=1744794863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=FB6XfaMTi1IP9sZ0xImV3rleX6d1yVznOtMKR+NjKarueLlBTfQMZjjTmLhun3TqJd
         /0KeEiepuejrL/k7QdkpSxy1DJ9YsDHm3D/t2ppE47RY6Z2jbwEIIvcCubSMXSz1auh5
         3YOqwnU+Q9VH0dJXb6EGkn3X+/IFZmdqmPJVMrh/FDxtc8hgT3wiY6Mu+uvL7OYDoFSn
         W1tXZYmIlLZI9Dk0pHnVJ7WkdAUvYlHa+6rWWSNMNe5Zr4zq3ctAXGFRbYx6XxIPm7yJ
         4kHMRze/mOgCbPMDf9vCpCUL8TB7hYUXmSuCmMMrV7MiJ4AL8c/b+zpxoJujGRMRSSyq
         QPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744190063; x=1744794863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=otyJasuZaahA8wP7w2xBlNP7rmxONaeNifQlOgLg/46KpFQEK3nFVePA+Mnl9JKYOw
         mpMf26cftpYNieY5YXmhgkT6DKxNkO3TjGdkTDcRetV8FhkT3pjhnDh8IpeYvQxdH/XN
         cAW5He92rAd5sIMoc07/VeRO/WpHQhnq6dBpVfSI8MkavaZorXGA5lrvzEXyGu+INGQX
         MROmK5Gh7X9jXhzqt3i55AuL577KUsH6uf3F2GNT0KoZJty36WZLlWLBNPOw5W6rOnLN
         xxU1VaLAcvhkdmoB5/ru6R/meUsuBL2+FhlyGEOICVUXkRy3i6IqFTFmrCMYYBzbHvFx
         MTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/FNvn5JDCrMkcVrsp0MTbRFoSEF7IvC2wBtt15w71wrPf3YLhEoDUv2oEI0oBWbzZJmDPuGPPalT3jTSm@lists.linux.dev
X-Gm-Message-State: AOJu0Yx46bt2sG7ddGwxKEAkcCG6y6C4dqrNrenxWLO3jCoo1TzhxeQM
	49S1KdrXkdgw4BorX0KByJtRyke2p++77TTlRXzRQHsUDGuKP4J1
X-Gm-Gg: ASbGncuZvni0mtz98p3NYRUXXcTOMY5nvv8bGyFDTrXpyR3WnwTJ+p6wPoYXxrGhhRd
	PcTECHemOXl3OFpy7EoJZunK8+iQqWgdKv/5eaADlESDb4BMwTz/mxvR0Q85F7rxeXa61fEtLbr
	0cwV1SEZJT8m7kvUWgexCWv+6j/UNTKrg3SjSYpdeOhwBy+QtE9JW57vyMeOqG7VF/H7ukV1goZ
	C2VyddMVOwMp1T7gw4m3alF7UBSpqbAtVrXiAmziNDBu+1/wkbFHFp4qPHf9I8j2B9Zy0UOEy48
	q33gxHuwtlAGjfHqzwWLtJQWLE5Pu/AwZkZx6/6mim1n0bTOHKBEnajt
X-Google-Smtp-Source: AGHT+IGxXACYCWd8q0QSUfwe2C7F/fvpjaUMq7LuvpgmQ5wyXh+jaW1cXxA555291Gn8JmKjg23lmg==
X-Received: by 2002:a05:622a:1a0d:b0:474:fc9b:d2a7 with SMTP id d75a77b69052e-47960079a98mr21007151cf.6.1744190062709;
        Wed, 09 Apr 2025 02:14:22 -0700 (PDT)
Received: from ubuntu ([105.112.112.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47964eb99cfsm4677911cf.52.2025.04.09.02.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:14:22 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v9 1/2] staging: rtl8723bs: Add spaces and line breaks to improve readability
Date: Wed,  9 Apr 2025 09:12:54 +0000
Message-Id: <3b9a0572ad56699b095642fc169c9603e08616e9.1744189500.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744189500.git.abrahamadekunle50@gmail.com>
References: <cover.1744189500.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code contains no spaces around binary operators with long lines
which reduces readability thereby not adhering to Linux kernel coding
style.

Add white spaces around the binary operators and use line breaks to
increase readability and ensure adherence to Linux kernel coding
styles.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..5def2467f42b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -963,11 +963,14 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(tx_seq + 1) & 0xfff;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(pattrib->seqnum + 1) & 0xfff;
+
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

