Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4318E38DC8
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 18:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709489569; cv=none; b=ESZrLGDnnCzbEJwrcpJ+J0xrKoU85XSNgEXu78zxVN2CIvkUtrJoWnutUtVi2LQceRmefkLohWBxJSbJ1mtCuWFDtBYZTcFvXrNysrrNoFZpFmvy1eI+Pld8oWY0FEN2lF1PNuM2lRpgitJIZVd/3oQqgVLwLDjHPu7lOSpaibQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709489569; c=relaxed/simple;
	bh=sQOciL9Xtv72K7JEHQme2eD4lfx81Dvk6E7ieDdMGY4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eqc67aFu0ZN6ZD93BeVxAzioVONXr3W6bOoIemol5C+BXdteBJF8sbuu1vnrNMZlLPyOBJxnxH/jHQATlR6CDvJE3HVoXrS11TjKx956weqAgHxQs6GY7dnhtH9wK6xV962Yh8P4X/lrFwPM9htqgkevoA5m/kxSDKlVJS1z71c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+Ux9JLb; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+Ux9JLb"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-564fc495d83so4587579a12.0
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 10:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709489566; x=1710094366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79OMR4wOxLvhi5xGG1CLKzLpJS0QwRDhHANxP2Ga6Ws=;
        b=N+Ux9JLb2p92VhbbVKeoanyvhADilsbeq2LxvpTMzEJOdIE+m96lzfdjXApgYvoFDs
         CPcvDia4dyQlhiJW1DjFL6Sl5rMT33S+XiGpLFq9IXX8ignazwKBpzsquYorUyMzxzQW
         AjCeY1kw2+tW7aPPptZqNbwrlkRdqtbTfPihmyCfAeOUFr4f5f2IL5uYJ6g1YpoZqUrL
         FrjelypjGXt445jhmXyMZOxuU59Mc4ZRCyRevLVbKVqcloBLyQCMBvhcD0O1ih4wL6GA
         k595zKo9djrbpJigJVlS1o4N01cv+ExdB/LkPccHhNZ6XQA7xsozir3HmcoPBUTQMp+B
         6AHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709489566; x=1710094366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79OMR4wOxLvhi5xGG1CLKzLpJS0QwRDhHANxP2Ga6Ws=;
        b=iscXEijhigAktwGzzp1SC4sBrBSgkH2iREaxGg/wPdMMhusdhbshOmWBgL8MtfozrN
         55g7KLrMnNG99UyS96e53eoNXNhN+48+7757lD3iUjkYrri1D1IAKfnkYIzQAg9L+CEO
         10f7eBW6qem8Bp45hWhRpn4yPfSTEhQ2NRmyXocGzsp9cvC/3plQZdzSv4iDTu7Gamfz
         RRx3JCjvStE2EDY0y+xerSAYxtVbhLV3CV0UrSGfVp/Mze1bn9hE0242jMAiRMYc8Sl5
         CtRbl0wtZG3cr0hpZzvWQfOt6g1joJeoh78n9bja3nhyVNaaFPZPfkuAzOVNf7U+ilmU
         J0sw==
X-Forwarded-Encrypted: i=1; AJvYcCUHgpZiS9nK9Akhrml2RWLKLJzaGDnQczlGu3o/F7xBPitMq7CQqouLiAjNmg3WY0+efwunLPJvy2QSRjU96dHsgISAfRzCzz330GXLXA==
X-Gm-Message-State: AOJu0YxCANFxxplmH6ofQrunvo1XGI9bXnnXfWbniqM9vn3YPWP/EAjM
	jEeJbDOEmKCN+SdI/Lx66XS03r/7OLHvYz5CQyZgmDVV5cM8ngRP
X-Google-Smtp-Source: AGHT+IG3nY5/RbFnnRlqCUZ8a7mLdlwpfsBh/RyCDBMuypOTu8Ma41DQOjhJFQn/7tiRL9a238QA7g==
X-Received: by 2002:a17:906:5295:b0:a43:b50d:1074 with SMTP id c21-20020a170906529500b00a43b50d1074mr5443496ejm.23.1709489566341;
        Sun, 03 Mar 2024 10:12:46 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id qb33-20020a1709077ea100b00a4410598eebsm3893543ejc.67.2024.03.03.10.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 10:12:46 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] staging: vt6655: Match parentesis alignment
Date: Sun,  3 Mar 2024 07:40:02 +0000
Message-Id: <20240303074002.14777-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align parameters in card_get_tsf_offset()

This patch aligns the 'local_tsf' parameter with the open parenthesis.
This change improves code readability and maintains consistency with coding
standards.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 2fb2b1da9136..94784b5c0402 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -297,7 +297,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 
 	if (bss_timestamp != local_tsf) {
 		tsf_offset = card_get_tsf_offset(rx_rate, bss_timestamp,
-						local_tsf);
+						 local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
 		tsf_offset =  le64_to_cpu(tsf_offset);
 		iowrite32((u32)tsf_offset, priv->port_offset + MAC_REG_TSFOFST);
-- 
2.25.1

