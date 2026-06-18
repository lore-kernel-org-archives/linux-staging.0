Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE70302163
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 20:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781816183; cv=none; b=a1KeKwcXZCNxZBUfCgFwm2oE3ZX/3Q2FzcCYCJ6B3SAlLDaFaNQnR+UiR8iLeAI1e5jQ8UxJ621F8huSGZU0WUKuuA+Pmi+yvf1wiksWPkdgb5dBgfs5PnsnS/ve3qBPoVyJPZJz3CNTE2jTtsnK8Gdcbe0/O0m7xNNRlzOxGSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781816183; c=relaxed/simple;
	bh=884AjtxMMiHyR7XCkrUrJsjiqdHsdHANO9TPFFaLjbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eGVv38+uu/MPZ709RoAcA7ek+UF6o2dG86CbgcnjFMwtkkE3piGeVtXwR+gpfSy8GopAJE2Trh+R9kmzhHp+pscOFFbBhKGa1wuqdPwePBITiKm/1hJWpT6sNljCl50WzxnyI7ciB5V6eUZ9GbtM6GYU0UlR2YDc4cp5UgmTVIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8sNDiFq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8sNDiFq"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eeba68948so1050937f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 13:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781816180; x=1782420980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Or4D5AyRFoyvkt3wUSKLlPJze7pnaI3dvq6LNJ6/x2Y=;
        b=O8sNDiFqemFRjUMrr0JizGXnxC53xdYNvHzcd8HimmC0jJQFsPgZZr/CWtxqdWb/q5
         6l1Eh4Z+PN+ELE853eJnpShjQy+K5z/czF+QvWs+h9Gex8NR7bMLOzD8yGaeAovb+AxY
         twHumXq9YnPzJxfZon2MkcCHIROhFzxwhDMsh4h42KRyNkPXUaacAB8cwjkEl03qHUVH
         eatFgk3Ps2Dax0aeR63qaymJbY1pMusfw9M8SfntI1mhZf99rvriGxdTu3k7joDzZPX1
         4Hbv2HopuD1QMp8AxwaJVTg14NSrq2HyntN6mGzgXSm7nXl/ulmFwTDH9BoNlvp1nU1g
         VVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781816180; x=1782420980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Or4D5AyRFoyvkt3wUSKLlPJze7pnaI3dvq6LNJ6/x2Y=;
        b=I5GhfMLsPNY/KbvjnA+fAZphCYyaG/Yc38jYyVs3kjA9LWsvpT3PP0mf0GQuZlQnTe
         vLH4Tze1sq/zF3KC0VgB134tvPpua1hM4MtHwhli0vwx8JUkwjHZYyP8FVb1IR23dbIU
         t/LBckrEMICkI0JcTMSddIq3gsn+T5OpZktU5adkZDFxAdmpO67HWxInSpmUsC8UU5f3
         SFBlb88I9JEf6AWotSS2ijI7oZ5TVFsPHEaSJ03sg0+THQVfRRPKiqS8IFIgjz2E/Uox
         kyzqT32gjaFbhRUzTOhx/S5jx7zjndHV76t4kH3RR/Mq6hJT3/vAuAh6S4WpK7ZCV3ch
         sVcg==
X-Gm-Message-State: AOJu0YwqKcrzJIoPGx0BsYUzqu0G7hPQgGi0W9FT9FDs+YKhvJ4MfEs3
	vZ0lU5Zrr9LTYxSy6mfghnyJl5+knUUxqwue1X25iV4brSCFmDmapmp0dACU3qXl
X-Gm-Gg: AfdE7cnIddD2DW3qrWsWTAxf29xrc0+XZsTOZ6/SKkX9wttoFHnWX1SePIGNebjAls4
	Y6WMP3kXHzBG0YOaXvMmxKa48UUTRQwJ15jrpjh/Vbv/M901jimAPjPs1ZBhrbU2s6APJGLsLZ7
	K6poWE38IAaM9TSrnvIhe0Q4Zv7BN2LxtsrkofyfNEKeQFHnpQxHMYYsTwS45ZwVyfSu7n3owJg
	cqwW+Pe6wEZHJl8zvwzLJtSJ/NOmBbpvoH4HI0cV39/zjKBmxb3+7WhDR7j54JXUIW+dp2zLYzp
	65zzzo1NvPgscWC3BvO97TspvWpfu9P6uhscpUAo661h+HsjKjL26ZzSeuzs0McZi3tgROwNgZu
	PVf65zpbxcEGJPEkm/VPGwIhQFbFBAUkuTMjsY2aZvkHIaXQNMTlSMjE/zpCP17qfTKtaxQX+zw
	QRCZGpwAzzqjUsX7bAdYY2BZ8hs7Tub/iTMHNmWY93WEnh3h8y+jG4ojIEcH2/cZKuew==
X-Received: by 2002:adf:f48d:0:b0:45e:742c:f195 with SMTP id ffacd0b85a97d-4650685b880mr1364861f8f.12.1781816180060;
        Thu, 18 Jun 2026 13:56:20 -0700 (PDT)
Received: from fedora ([196.112.75.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc42a3asm1674015f8f.31.2026.06.18.13.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:56:19 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove unused rtl8192c function declarations
Date: Thu, 18 Jun 2026 21:56:01 +0100
Message-ID: <20260618205603.452858-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove two function declarations from rtl8192c_recv.h that have no
implementation and are never called in the rtl8723bs driver:

  - rtl8192c_translate_rx_signal_stuff()
  - rtl8192c_query_rx_desc_status()

These are leftovers from the original Realtek multi-chip codebase
and relate to the RTL8192C family, not the RTL8723B.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index e2e9aa03ffdf..b63625ab4e45 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -30,8 +30,4 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
-
 #endif
-- 
2.54.0

