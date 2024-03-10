Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644B416FF23;
	Sun, 10 Mar 2024 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710087274; cv=none; b=lfP0f7qaqOf4q6l14a92N1WWH4QXklyLjC3ttrFHD6a+sI+LRle44swprRjUinWW5J5euFg1loAWZQY9lVcfHE5HrOoBsXmzLc6qSl9nOgQHUqjVUL6OmyLDQdh5K1ITI4X0f3F4xW9Uk24eGG3hY0k77LP/y9yB3XRrbha05F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710087274; c=relaxed/simple;
	bh=/VmByi1VfKuvEI8OjV/VbtIUnAqViA/QXRlMXhp121Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LOmA8fCNPbI/whMpr56v6yOaeCj+Vh/5pgXy4H/dBdU0u7KZk8/ETmL9hdkOC6p5D/SW3ySlyUX9EJ31ev1p0cXRVf+CZtDULCXKWVecqYSy6NjhADvaSgxVdmm3LudpNpR3ApyYIcMo08At5Kf4XMw4hiQVlm99Drq1pQsfcns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pt+RtfSJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pt+RtfSJ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d27fef509eso57738411fa.3;
        Sun, 10 Mar 2024 09:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710087270; x=1710692070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2FIf3d+r+3rWOWl/JDDjGXGh9AMQqkQdv89D0pt8ZM8=;
        b=Pt+RtfSJsSHkydOZliQ40dkoPPVE3H144wRmIi+sfuxZi2V7m4mixQ5hXfAPAiRMy+
         KuOxF9feRLbdHL0E0hXJPq0hSmUJXeJuZNqeJZPjhHf5g/j3nXrwPNJOZhPknQR51x4l
         03Hkd2hTA661SpRrBuNNVxMcgDiIGsD6kwW9ig4zTD4AsJpPZZQ1iywqf+WgdbJ9BcWI
         rXSqtgiYqHXkIxTVoQtSpX+3XrurvFn8/hBlJ29wUXy/ubunGqG+Zl7NkrCbsu1jwZEA
         utAxIFETKastLMAYh2oNK6jDwAuHcV1kub7W2li3kh96y07/hxPQASDAtV8eYm2vSrqi
         BR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710087270; x=1710692070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FIf3d+r+3rWOWl/JDDjGXGh9AMQqkQdv89D0pt8ZM8=;
        b=IjwcRKUuTaXrp+dw1CPM/wAKjuJgU5SYlvG2/xSdLnV5tx+qfcukVbrtS4+6GN/A3K
         7rqr9F6UAEHsNpbLi4jlEupJ9XAK4HqZcKFX/lgTQxCq6/CbhPnxKOsbHHMKjszj148i
         qmlI74T46byvWXXDwE2zMuCvW81OXE2BqpBQbGkLLMZ9ZvlqBPeD1Ue7z5v3QzmbjXex
         I3xsKfc3+ylTG02PLqmYla2GVC1PkbsjGz9lIkOh2VBVSg4f9FFMD95Ec1CKj0dYO8GM
         Vjff88q3jkfR3krZDn3bNYDuEaKM45V33qGff8JBppkYVvOkpajN9kSVG2xp5U9x7E+3
         yn7w==
X-Forwarded-Encrypted: i=1; AJvYcCVgm6JS9LauR8PzK0xd1BmDKPo+qDlswIAmjybZTbOSms97uinTydhrpEHAbB//ZKnoVXgYddZefrWMnYGx1pyCr0NdhvadRtFRRgP2UqDjo7O+oQfW6s2FQ56+VPvLsIBugZPXujky5g==
X-Gm-Message-State: AOJu0Yy52v4VGLC5eE2w5apS+Ll/l/luXX0FqB+wyD+8uKyeGWTD7Ibr
	R5qMTIMoXask2b5vO/dYUDjLWLZTl5RVvgPaksn9rGa9V8zYlirN
X-Google-Smtp-Source: AGHT+IFu+oT4EuMimhwzsH22F3QpgmDXfpK9BUgz43LvLHTMOtGPTMwCI0uAWwMmIGiWIbYamH2HJQ==
X-Received: by 2002:a2e:968d:0:b0:2d3:2a95:6ebe with SMTP id q13-20020a2e968d000000b002d32a956ebemr2323161lji.36.1710087269701;
        Sun, 10 Mar 2024 09:14:29 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id d4-20020aa7ce04000000b0056470bf320asm2039489edv.43.2024.03.10.09.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 09:14:29 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] staging: vt6655: Fix line length exceeding 100 columns
Date: Sun, 10 Mar 2024 16:14:07 +0000
Message-Id: <20240310161407.3345-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Break function declaration into multiple lines.

This patch breaks the RFbAL7230SelectChannelPostProcess() function
declaration into multiple lines to improve readability and compliance
with coding standards.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/vt6655/rf.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index 6f842ac00526..057860a5e100 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -69,7 +69,8 @@ void RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI,
 		  long *pldBm);

 /* {{ RobertYu: 20050104 */
-bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel, u16 byNewChannel);
+bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel,
+				       u16 byNewChannel);
 /* }} RobertYu */

 #endif /* __RF_H__ */
--
2.25.1

