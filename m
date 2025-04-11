Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C81227F4D3;
	Fri, 11 Apr 2025 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400484; cv=none; b=o2SaCO1HVbKwU9fo5T8O8UkQm6OXpVthu98cylO9b4Npm1sE6u1bGvESHMRZOwnz9E02kQXH23U4+XT0xtP8LKb0+nKGOD9d/zisSjcA45OVE8KAgePa7tREOznjYcN/0laKIyexJmOZBL2eyTmvu2sd5yaKyA6Q8D1lVy1Pxpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400484; c=relaxed/simple;
	bh=7tuF8mS/RBiXqmBPIHQCKgLB4C5lh2LqoT+PdNMhZKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bjC0lZCitnQWnJMOJeqx9fS6bsQ6Z0QRDTeVaJ7nba73Lk7Eo3orDsbjYX7tXP/BeyAaLONIa7h6a1UUkaDkbAi4SeDntcv9ObuzHQhT24E4UjvEr7EaLU+9Jd0WMF8DJiohG8Gl0KHk90XzYsoavzE38BDqfSM3jHaB4/d4fy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn3Covgz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn3Covgz"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abf3d64849dso448582566b.3;
        Fri, 11 Apr 2025 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744400481; x=1745005281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=Xn3CovgztSNl1uwT7KdVEMnbKXTFL7rEGf3sbtOT6kOtcRkbQKbQoqzl6yGzwZEU2d
         JcbhyV4jQHyIp5zNkk4/i37nar4SVXxHK/72cLrkMSCbrDG4xXxuUDSixZcCVP3jujmv
         wBD4ot18ttZcyF8xU6b2I3z1OmPiaE23hTHW+iRfDnqVK66Q4wJe5Xtn5CgHPF0omOTS
         3eM0vKQja+GY/fa0w1sb0W5e2Pi5Uomc+v8NN7JLxkQ7RxpiuhUl+Y29c+vl2dzK+ocv
         uUKLJBqc8lsIthB/6L5eUcjdL4K5bk9262DMwJhUAkye+5EOuYQ5cfImbxoi2k1YMnTP
         F6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744400481; x=1745005281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=Ox9xkEj9qoB1eUb+nywfTcZXkeNx9KidS9dXM4gBmz+w9aWxxyZ2qZDMQ2kV47WgVM
         P1xQw89PZczyPFDD7Emilf7nET0G1VetLu0JimmNwHZkdSF0J4DyXpFA7tbNf3li0jRb
         w/G7/6FNQXlMgU270wrvKrFDkPv+owg/58qxqxbSFU3lQdm54hTL9bDBzmdDWDvUz8al
         o5+/HTGJpuCQ+FdpL75/AF+otmeGg19lQOtt5q/E800LbwV2pcJYpp/E2vWyGFsnKTeF
         N3v9cEt1YArH2Mt64pEUmxg9kfMKDflVmpY4qy2qLVGvDkXg7tfp9qBRccfNIEd4Piyd
         EhwA==
X-Forwarded-Encrypted: i=1; AJvYcCVi54vT32mDoe4ZPcaTWr09xAGSbdVFUmw5w4JkmMRYujxlMcQ7WMCp2AT2vBHo9niqeKfhQRqi77DLlDYv@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm9TV4Y9yhve+0+3dfvRvFxTIHUPNvjNcZ2RzX1zBZVjCnc0eW
	UJ5bo1zTDC/K4u7beR9vGzhANGSS+WoqnO/+oZRiypxyT/6qUfUP
X-Gm-Gg: ASbGncs66bjfei/GSlxiFpuQOhO6DgqcXU7eGHlfM0SEr8YNMsa9ITjIV2/gOYkn+Lu
	PP84VUtsk+b1n2VIY76e/NqpAo/gRaOKGMb4nbZA8/Z4cEHwvVAuFtcT/s2XGjV/cboJ1MwM4YZ
	78q99LpOk0wQLzy0pKZ02UqGVl01B7Q/IdNiRuBlFIFSENO7fn+mw9FGUeU1VDkUzikL0PTY7NX
	DFq8Xilz/nJEQhXc56e2UJt+mzVCDgjB4CMdtXYHa93Pej9Gk41MaWFS9NtaX74tb9IQuBy92WG
	UMZ8TsMjOkFSkEDQpjKNXOtL0SlFNqJf+IVW7Z+5jWsV9Y2j5Fn5+8Ee
X-Google-Smtp-Source: AGHT+IGt3AoRGVNPAKlc6uxxRB1jAKP+g/demaRn5UgtHXX3Ck+aUYGy4cGq1fINfFtf8iVY73M/OA==
X-Received: by 2002:a17:907:7b8e:b0:aca:a163:aa3d with SMTP id a640c23a62f3a-acad34394e3mr295387866b.3.1744400480623;
        Fri, 11 Apr 2025 12:41:20 -0700 (PDT)
Received: from ubuntu ([105.112.122.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd223sm493810166b.133.2025.04.11.12.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 12:41:20 -0700 (PDT)
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
Subject: [PATCH v10 1/2] staging: rtl8723bs: Add spaces and line breaks to improve readability
Date: Fri, 11 Apr 2025 19:40:23 +0000
Message-Id: <3b9a0572ad56699b095642fc169c9603e08616e9.1744399612.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744399612.git.abrahamadekunle50@gmail.com>
References: <cover.1744399612.git.abrahamadekunle50@gmail.com>
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

