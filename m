Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F2259C
	for <linux-staging@lists.linux.dev>; Sat, 22 Mar 2025 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742603568; cv=none; b=f9E/lnu9deYuGyRSyzD0xls2j0YzPff5EfeHDgynJiTNwCzeYc6pFmpIemTb0XgF8Z1inMteJdEpTTwXUJMpdpHEavEuaOJ9g8Cb+G2aVPiPMr3NM8L4UnNLiZA2H5ed6CWQOywNVXhZD9KhZPk3Iw8gJUcy08zlkvjnJG8h2vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742603568; c=relaxed/simple;
	bh=KpilHOOJo67Z4VWOQXgm4x9QaziC64Nge4Tp+ZLbApY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GsDZoIAb0VZVq61U7BHl7oSTEhaeZ7D/jm0ie6BEYt2s+N25F6uv+Z63+TZqqd/aKki5E7nFzpcjyaONdaiSIto0xjXXd1VpYwJhCz5Y3c82bgIIS7Hi9N5QSDZ5CxwtI5tpfiVFZHdiZt2rhDkxuHfuQ7LA+0kw2X77cMJ+/O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5Mzy5C0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5Mzy5C0"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso558458966b.3
        for <linux-staging@lists.linux.dev>; Fri, 21 Mar 2025 17:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742603565; x=1743208365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUyR3Oe6iYVQ9/r3ijgRJfklg/wMi4nHhN2lq9dus2Q=;
        b=f5Mzy5C0NDGugIVRHumdu57TzXn2Wjb4j59ymjFxxKsoNU7qXdURMSnziqGA1PoNS9
         GO/xplB7CKXmv3LDsbrlSG3ZaZYzdXPfyMBOtmJdIfd7E+OSg4NVebx9yNa6VeR2C+9P
         zotafNYWhZjdQMV/XQw0mpRIPre5NFFKaLWWAXKAfEJGh5lgmX/iS7mBj+a5WswtFj+5
         jYtyHVq3Q19TVZmBiRlUH4GEZabw6eL+Oud63TaraoQUCVJcAndKo6AyOld76gUl5kk7
         vycoQX7gcequtyhC0K/y1+hymKfzCpeLyeTFZG6f0K1PlaVUhwy7GG7vrO+Ib03UxREY
         q7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742603565; x=1743208365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUyR3Oe6iYVQ9/r3ijgRJfklg/wMi4nHhN2lq9dus2Q=;
        b=Z66Lcx8E7WJh6cVGyWqpdWdicVZP7RoBF/bkIS0ViSKDBeBVqOneiBUODgSy1RKp9Q
         i/gExFNt/vhYOa4TqCtG9rbSMxcjeqMbmS0LmD8BkeiZksPWdJ4sdUDrS2EWtyWYeZfL
         lxu/Lyfxhi9b1J+ueRkvFwtXCdWkVyX9sSwMwo1PP+fs9ljPPxYJ3O5lCJ8SbdB2JIwJ
         +bTZinhBnr+YSWJwF5Se5k2v4AxWDqmgbKoe/yX/qwndtv1mAbLkOHGgU4sJH7rPnwY3
         7ChZE3rF0GwatOFSNXvNx9jdOKMer9Q2SSyt91ILsfDgGY3TqKpImKMBCJbP0PhRmfBK
         r88Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpksyoj20Lm1aWOmGjzcazVsjREg74HhS2MPHwHKs6nzNEV4bGfyXjmvS0baOu3E/B4shYHv1sUvRBBUEt@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6IFfF2JFDaoLEPX/c30FpQuAIxiP/K2rQ3cVDINO0ngMkhNBO
	XfY/3o2xhmxbJBbcx+EOnXwItlvap8eDOAPOFlQ1h/Q2IQH/xA+V
X-Gm-Gg: ASbGnct4og3R8A2Vf7irNiktN8ijK2dI7pqEvJEoPxvM5im3B72TkH39ulX2kXm7wJp
	jZaxTP3mB6nTThDWqpY3s8NR7uLnGww4GYNMfqgsNsCI1Ln1nmlrGqy4fq8MC9S1lwP12ZWXHWv
	/0ANfddStzMmc95lZLBOd+3/oZ2IeK2FypcP8kjQzaAKk1Ms2YR51RmDJnVWl+YRzzvKI32Glo+
	zb4sKu6LFM0sWevpCfo7IAuhbGvUCxscsbt0uCSngYbSG5xHXROgL6JhZLl9NGvM9qcIa4xU3QZ
	41Tnu1cDcH4wVRvgU5aPDJIFOQpYkM1ziaWywmHyDMN6+Gs1tJdzHw==
X-Google-Smtp-Source: AGHT+IHIkZl1HZ3bargOGIgRuUMDY14pB1ok3aEaaqULlgerkBIsFuLlNFDNNZ7Ob1Cav44bb3EPlg==
X-Received: by 2002:a17:907:3e8b:b0:ac3:d0e4:3a9e with SMTP id a640c23a62f3a-ac3f251f1fbmr502782566b.43.1742603564527;
        Fri, 21 Mar 2025 17:32:44 -0700 (PDT)
Received: from localhost.localdomain ([41.90.66.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbdfcc7sm236983166b.146.2025.03.21.17.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 17:32:43 -0700 (PDT)
From: nancyenos <nicymimz@gmail.com>
To: "outreachy @ lists . linux . dev Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: nancyenos <nicymimz@gmail.com>
Subject: [PATCH] staging: octeon: Fix unused macro Argument 'x'
Date: Fri, 21 Mar 2025 17:32:18 -0700
Message-Id: <20250322003218.14134-1-nicymimz@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

warning found by checkpath.pl

Signed-off-by: nancyenos <nicymimz@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 44cced319c11..0155f3c41657 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -8,8 +8,8 @@
 #define OCTEON_IRQ_WORKQ0 0
 #define OCTEON_IRQ_RML 0
 #define OCTEON_IRQ_TIMER1 0
-#define OCTEON_IS_MODEL(x) 0
-#define octeon_has_feature(x)	0
+#define OCTEON_IS_MODEL(x) ((void)(x), 0)
+#define octeon_has_feature(x) ((void)(x), 0)
 #define octeon_get_clock_rate()	0
 
 #define CVMX_SYNCIOBDMA		do { } while (0)
-- 
2.25.1

