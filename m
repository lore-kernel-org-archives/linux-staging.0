Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DA52D73A7
	for <linux-staging@lists.linux.dev>; Tue,  7 Oct 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759828412; cv=none; b=XwPyT++E/h6XkJXOKqc8bjwpCljptUf7zWAjAiwjqlxjt8scTXomQffcg2qmyEc6YCrlDs7/BgAWYgnoJle6yArMZdyHVieg52SP4P+qNWSGviXSSD3UmLmCV7KjysMdByZUtmhW8ju7krdIv9mSvxWp7ZZzBBuj48rBkwtwe40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759828412; c=relaxed/simple;
	bh=4jY+le6EasXP1TQgY1JwK4qzgMhVV14ctQrElh0wVbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwFS8UZ33mfMD6ilhk2yIMWGMPVlW5VrKKifoQueRtswiAyIkMBQtC0aFowuYVwU6ScGzDVv9t6nmVUSWbWEej46pPO4vOV111+Rov1tuUFgJivh5FAD3iUz/PzjU+29yCAzee7qTzhgijIMC/XAkhD1Hue/t0FGO4uQsJOjqtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHf5CtL/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHf5CtL/"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso5718012b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Oct 2025 02:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759828410; x=1760433210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=he0x+ArGIfe9sei2xIwGpd89TEm+/O7WdTY5n8gdRlE=;
        b=gHf5CtL/uOpvPioaAiLsNRCDiQyZ2v/z+whCinrKF5BqJjRGP5YV3mW6kR4qYrsdtA
         uudgE6ULQ7NigrjcFwVFBKMfyXlJ6DPrvRtprAstLThh+/71Bc9Fx3zit/zBrQVxLnXW
         wO1OMEsyCXu70MjxdNmtZ6JAZKP2bcqSTc9M6uzxEHbgdfsLjXZEDvr22DYH350ynNN+
         X1I7i9F7W5fNokyO7kn31KozSERAWQEhe2mCxLI18wq1Zm4ml6dAn4Pa9gPXcllhyJ/6
         ffXjd1NOgSx/m+m/up3H+Wol+tzfztDeyvVOopFqnNHyDJIOrc2ZG+Gp+kkNRPbZd+A3
         Jw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828410; x=1760433210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=he0x+ArGIfe9sei2xIwGpd89TEm+/O7WdTY5n8gdRlE=;
        b=EU100p9Ng8hdQmW5HNwZZbW+F+PE+zmF+cP1osEV/twqknAS2081k+e5F0av0TyP9u
         HInA+qWARdmvsjfnyWvd1rQO38HkOQBH2rtB3cqusXT03gKLOkrWVjHDtPJstbRXhpB6
         BV6NnXs20q0UWvgrASzF2gAv+YGcrlkHrosJW6OWJBXDhFX3CRKdTvnKZxpcySbQOW4F
         OJWdlIJLOFRUGGssBFhb01aQfRvXcskbx/3uol0ZKoZ2TPgA+qquaMxsmAKP9IK51BTV
         7gqQyTS9wAHM/3RUqEfbNcEuye2GaHA91YPEDWvYdFumy+u03nqTn//HW5m6NBtDG/q+
         m4dA==
X-Gm-Message-State: AOJu0YxtP+XudyptgygeM/XlRnZGl3rOrCodaXsoszepZMg/8HjDRZJr
	n38yWIUxn4iH8Gb6TpaKbSj5jR87qLZdZ8EAlA3s8qiL7dCqRUt0CBz2
X-Gm-Gg: ASbGnctgMpmzAQunpWzwvXYW+G1ILoj5aZ2rmXwVkyhomOjgOTH63aMAqwsoF6wZQZp
	GJBtjCLPdA6xJpXFwbUOuCc8nfWqO4MB4PjhIzDOnCxSGuic7vlGJLGeuOp/dWyaSDha4g79M7U
	XBl4VF2dXRw7qbj28QWvlkbCt76KUXhZGDqgcfPxSYpX0UdHNPqIylOSnXXFTbRa8pQcfUC6lYr
	JPkS2EcIxM4bHReMvdbMXc1lIIUSZbZU5nvHMk65dsabYoGicypMo3OxWFODhfBkMG1ZOTgwU2h
	8zhEs4lJBIYFpA6rDax877K5dswt2t3Dh4qd9niq7gdOoKGTfFYgFIXqbSioALUcSAFAVGz/fRJ
	iOiAy7UrvreXGfNIOChV178rxMjgIY4qqb4nWDwdwEMO12UKLW0dMUCqV7FNe
X-Google-Smtp-Source: AGHT+IFIq2Xtg33AaO+XWR66x0UiKmUHmFMF8ff1XYtXgQsBRzi6FeDK5PoORmJG3qQgIC7vJngOzA==
X-Received: by 2002:a05:6a00:8d3:b0:781:1e08:4459 with SMTP id d2e1a72fcca58-78c98cad8e6mr21721027b3a.18.1759828410250;
        Tue, 07 Oct 2025 02:13:30 -0700 (PDT)
Received: from Deathstar.anonymous ([172.56.42.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9cda9sm14941784b3a.13.2025.10.07.02.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:13:30 -0700 (PDT)
From: Rohan Tripathi <trohan2000@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rohan Tripathi <trohan2000@gmail.com>
Subject: [PATCH v3 2/6] staging: rtl8723bs: add missing blank line in rtw_ap.c
Date: Tue,  7 Oct 2025 05:12:59 -0400
Message-ID: <20251007091303.491115-2-trohan2000@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251007091303.491115-1-trohan2000@gmail.com>
References: <20251007091303.491115-1-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds a missing blank line after a function to improve readability
and follow the Linux kernel coding style guidelines.

This is a coding style cleanup only. No functional changes.

Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
---
v3: blank line added as a new patch
v2: previously addition and removal of blank lines in same patch
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 373718cbd6b9..4bfae77a5fa4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1991,6 +1991,7 @@ void ap_sta_info_defer_update(struct adapter *padapter, struct sta_info *psta)
 		add_RATid(padapter, psta, 0);/* DM_RATR_STA_INIT */
 	}
 }
+
 /* restore hw setting from sw data structures */
 void rtw_ap_restore_network(struct adapter *padapter)
 {
-- 
2.50.1

