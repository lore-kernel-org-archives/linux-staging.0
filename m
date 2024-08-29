Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022918A933
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 21:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724967640; cv=none; b=UQdLOdDvTuucX8A+LRLCHQ8q3vRQMrUF6cLm4fxf4rCIj0BtOiSsiuzpFUZ+ArbHivCLqYmu5KHHwKf02r2Z169Dbap00VLx9NoKc0aPwd6LIeofzGlEg4SckVcBjLrm5HzWe3dDyEmmigslAAMrx6TA7IxKsfKWFlUiBeCR41I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724967640; c=relaxed/simple;
	bh=LieYg7NH1ZzCj7/f6QMWYqnUg0Vc/d1N3HRBdyagslY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=hwKbNgu2zZNu7FoWqDyhbBdzRw+z30aOjFX0A21ezSCOzP8DLw6vBSXu3MmxI9am+/ljAQ3gwsg0vhpbcubWcBrNmDzCW8Avf0YN3yEn4QmorZbyNtOuHdm3RYEpe1YjTl5VoU7qa6VVKK5au4WyNBRpdzavXnVdDttutESwa/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRpUICh/; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRpUICh/"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-27020fca39aso753110fac.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 14:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724967637; x=1725572437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz6Dy37VCv1sN/3hRrn/LM1TxSOkjRrN0Y/enN2q/vQ=;
        b=VRpUICh/ODdaaHhe+oxVza/mFebSndealvJ2+qqeTWPnVTYWm/K/vystcgZjNM3gBb
         +rmPYC3XtTHHVa3/YaahtbhDd5MLXNd8NbfMA0AV/pMsgVxGCRW+deOze4TbpdXnWmgT
         eh/jRI9FTKNvr28g9vFzm9RParS8WX6XA5eKNUO3/XBw2GfRUGOpVr4m2eaDmXvqlNsD
         9msc5Ohz40A+ed1+94NMHytKfd1gLWGM6SJORz6ehJwCXhIw3fowBoX32NYcEPo8NNb2
         rExkJ4C3PdQ/JLt3WY3S8/VMQnR+4PrcCjENF99iIpf6yuB9u64fxSaAso//8daud4LP
         C/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724967637; x=1725572437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz6Dy37VCv1sN/3hRrn/LM1TxSOkjRrN0Y/enN2q/vQ=;
        b=ve82tAAJNfdngfDr6DYVlqP3EfDJdd3AwxGTiBN+GnlEsCBzPx5RceEctvFmYnwA7w
         9hDLG3OaHr9hJ84DKYRBXTVqTD1yw5hpWpOCByifXO/sj0JCCC9DgUgG73V1OllBiyOU
         qBcUWQd8K1u/DmQR69DxF2raN4Wbx3t/XW6ZVSGqNKKtU5RbdPIgUEkEmgGtn6bcW54X
         N2xdDGJyh6vm3BsYOP9g9CsRWCTQe5vzY7/Bev7X4d3Si4rdMQl/WTg7U9jHIsIyK+tQ
         eB3H+TQYBccZaHEaPe8dXF0oaxTBLN0ZnhzHPTzv2knxHHl+QNm7wkg7iPvK2uCo90Dh
         ClCA==
X-Gm-Message-State: AOJu0YympG83/Q9TnmhNaN8aAAFzua3lqFw4D6Rqz9veuMuIZocQ+bCT
	u0+l52JAyXnNACyb6KN3og97LMvLhDQrg8fb71pnekl2qDgKkBFsZ2Xfpg==
X-Google-Smtp-Source: AGHT+IHwNTYA1EbM185xeo3YV3aR7BQP15rLTFxPgrpH08ju+uTm5zEA3NlhSBPILdEG4y4/FqZBIQ==
X-Received: by 2002:a05:6870:fba1:b0:254:b420:5ab with SMTP id 586e51a60fabf-2779007556cmr3808030fac.8.1724967637637;
        Thu, 29 Aug 2024 14:40:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:4b0:1410:400:9408:c7b2:31:3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e742ca0sm1480841a12.7.2024.08.29.14.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 14:40:37 -0700 (PDT)
From: Gabriel Tassinari <gabrieldtassinari@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v4] staging: rtl8192e: Fix parenthesis alignment in rtl_core.c
Date: Thu, 29 Aug 2024 18:40:31 -0300
Message-ID: <20240829214031.4893-1-gabrieldtassinari@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix parenthesis alignment in _rtl92e_qos_handle_probe_response to
silence checkpatch warning:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gabriel Tassinari <gabrieldtassinari@gmail.com>
---
v4: Remove line number from subject
v3: Adjust the indentation by adding one space
v2: Include the modified file in commit message
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ad21263e725f..75192041008d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -322,7 +322,7 @@ static int _rtl92e_qos_handle_probe_response(struct r8192_priv *priv,
 
 	if (network->flags & NETWORK_HAS_QOS_MASK) {
 		if (active_network &&
-				(network->flags & NETWORK_HAS_QOS_PARAMETERS))
+		    (network->flags & NETWORK_HAS_QOS_PARAMETERS))
 			network->qos_data.active = network->qos_data.supported;
 
 		if ((network->qos_data.active == 1) && (active_network == 1) &&
-- 
2.46.0

