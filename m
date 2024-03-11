Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010B411C8B;
	Mon, 11 Mar 2024 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710139749; cv=none; b=S/X4KI7Z4w4jW3zmv1/I2aakm4AUdevFWOPdAaex/XpBF1EYw0Vl1j7rAPvhqTOBkHZkSDlGRyBaUQrWAKl69kDrKPTtvuZ1+igcRA4tMPaXrXIJrYVeIrfecsFJDKa58uWSCAvpC1iv8m3fRLqGkHef9RnnSYBDquTze76y60g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710139749; c=relaxed/simple;
	bh=DnrfZzUJftu0b6EZEqqpAmXgZZf3kIZ4uDyrmTYog0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W49x/VXiilC4SVENzxYNr5XonAojIr9A3o3OXB0ZDjBO08/edLxRy4tX7eLKqlQDniP/0MeOjjzRdhz1X877+XqDWCMDR+ScEmXGcFpJDrVpYKDMJB2c/nfmB+zy6pXcZ2TE7k0IHhbNdQonK7m/f+LZkuUJoqpyuZgueEK4inM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gr7PqOmh; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gr7PqOmh"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a45c006ab82so458261666b.3;
        Sun, 10 Mar 2024 23:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710139746; x=1710744546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctQfKrAcksRfuXqIJV+JdBJBY81zeUKJWfVLUaA6s0U=;
        b=Gr7PqOmhFq8m25jIyRVG6MAn1kyCYTzVUmFff4f9sDKc3skru+fASNFS0EMwNBDOcU
         PrGBbQwAyRaSETstLF9+5ITlqI/lXAAK8HpOMd30OOKRCA7aYeVeE7XP909LyaFl0WN1
         4MqqqmQigV+szzt1cXnU3/LbKEXso0buMsUOyQ4w1ZKO2l+orkSjuagO1xaJN3v2NRzf
         3kH/TVSdq41uD4c8CYCxSogQbup/rNQMCU2t1HALrLZSWxRziGoEEBNWwa8O05LJJOt2
         iaZAtVLWra+vUvgXf5OgrrkTK2MC6ZcgRk+b7kW8phFutNgZmWJC2YOpR/PRgV6uXQ8/
         xvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710139746; x=1710744546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctQfKrAcksRfuXqIJV+JdBJBY81zeUKJWfVLUaA6s0U=;
        b=ElufyYUME51jI0orB4ddRE5G3cxXFTFi05IxzhgYX/dB9FDpUrp72oUoTcIVu6bwq5
         m734K90f6nGOBfTm1mZtS1eJucpXaBdv+UnJOXcQ2Wd/6EjdWAlqir2LVl0iwf8r2BHC
         rozU8cIEGFpsn8xDXCBveJ/oq3MrF+iMN7MjxVbYDrYBwWptbFHas0qk0lzTZlaDeyv6
         6NJm8NprQ9U2mpKuUS0cxziXdERNfTo22IaIW2fyTZNiQezYECXE08pKLD0BWsXCa+/G
         17joHMulvLGGWbQxLc6ZsTwxnyIimSDlVdJGv163iCMQFWl/YYLxRERwSFKH8+tKwP0F
         1U5A==
X-Forwarded-Encrypted: i=1; AJvYcCUEbspbCwaAedy8ZntAQI4rAjF7CCofiV4hti5w7dG/OHVe6/tyPhmrSChWkYfZMimPlmG/j4JHSp2c0IH1+fcoJoFcwX7ShJd5E9FwYlTKjKvjodkaUHQuOUIQ56AEbKfEN77VBhQRdA==
X-Gm-Message-State: AOJu0YxCH1JtGTOgI+IMAZI3Kh2CffwhxPW+Mp/IbGcorvA1gOxKnGyS
	dGkgfB/XRvqo/a/ldt/nZlQDpZpTIHv//NRet3OhkzU/6QaM0Uq86x/2JKYaZPM=
X-Google-Smtp-Source: AGHT+IFaPuAdlo7MaQHOZsuo6KRQGk3wKl3V3fBbqdIK5JBSfAbvsF1qfP2L246MAp2wMWnYAPPxLg==
X-Received: by 2002:a17:906:22d5:b0:a44:dc35:df19 with SMTP id q21-20020a17090622d500b00a44dc35df19mr3024324eja.67.1710139745945;
        Sun, 10 Mar 2024 23:49:05 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id gc5-20020a170906c8c500b00a45a09e7e23sm2581864ejb.136.2024.03.10.23.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 23:49:05 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3] staging: vt6655: Remove unused function RFbAL7230SelectChannelPostProcess
Date: Mon, 11 Mar 2024 06:07:47 +0000
Message-Id: <20240311060747.32876-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240311035649.25043-1-dorine.a.tipo@gmail.com>
References: <20240311035649.25043-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RFbAL7230SelectChannelPostProcess as it is dead code.

This commit removes the dead code to improve code cleanliness and reduce
unnecessary complexity in the driver.

staging: vt6655: Remove multiple blank lines

Fix unintended blank line introduced after removing dead code

The previous commit inadvertently introduced a blank line after removing
dead code from the rf.h file in the staging/vt6655 directory. This commit
removes the unintended blank line to maintain code consistency.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changes since V1:

V2: - Removed unintended blank line introduced after removing dead code
V3: - Squashed the commits for V1 and V2 for clarity and to streamline
      the patch history

 drivers/staging/vt6655/rf.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index 057860a5e100..8eef100c7ef2 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -68,9 +68,4 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
 void RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI,
 		  long *pldBm);

-/* {{ RobertYu: 20050104 */
-bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel,
-				       u16 byNewChannel);
-/* }} RobertYu */
-
 #endif /* __RF_H__ */
--
2.25.1

