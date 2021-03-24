Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F39E5F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:41 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c8so12574262wrq.11
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r7apWY46fVAV3AL1ndZvt9Ffal8HHISUKKhDuc2/2RM=;
        b=iBvoRSEZQRsiCRIHSt7VomYT9bS4ySQKPhzoGbHN8E3707wpGG7r36hpBqBlmqxa7R
         ZkgE2gZ2hXHobnQHp8UkrELXMf7f7cE+d5y48JUWgLQY+J7xI2W/3mmHMtnJTjisFKsV
         TwwgExMgypdzYT9rIdFaRXLUxX5imtORikhO4Pv0Dv57Ea+5Qx/JELMA+7gxHH5WkQzh
         kLTqKvB0pW4lEjuBaZZsZr/pAOkX9WEcrGnV+G8tyOVEONNMlHTCFwom70QFo6lnUxqI
         8u/MyiCt5He23M7qtiaTT3qGoSb6GdUC579qu0MxhnnIh5kgaOL3TnvxU02gZZWv7QLL
         oY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r7apWY46fVAV3AL1ndZvt9Ffal8HHISUKKhDuc2/2RM=;
        b=mn7uDoGDgRa1/MnAtGXY8V2kZzjkyVH+w/tnihstccWXneLPXwtv7kylw4Fjna1TJ2
         6KW5GXtTW8uSq3rHUWRPHGQBxrpXACI6v8FxOGkIaRCR0+uHqtP4/TK9mZHwPQSsopkB
         4JL4ARwRYqlHr8+chhb0l+D5iDjIIX3JH+iTJG6cVxPTMu5Yxb0aPwvF5co0W73KNv3Y
         iDdhXoGd10hwj9RUXJJCC0sUZRA/aQA/2NrP6QuFzEODtwTKXpJrZuUEf0kMjHKd2ph0
         m+VTiVkcsOFaWYSDDvZ/y08zdhYH0Rw/Wr767zKpmhfszKG0jYF7fX5X4h8Pz3B4Wlyp
         kkmQ==
X-Gm-Message-State: AOAM533DLw2Bsvea0QBPAC2H0zdA6T4dCv/kq1T+ae1fO9QM4lc0Ru9m
	LtdI2VX0v6eR8D3EPBxlqlA=
X-Google-Smtp-Source: ABdhPJzh6qcsLJWBEQIRM/RZ0WqIU4acC1YVSxRzrVIzNtrr8ObyQXasFHBvKuMYQVSMalvIUVNqNw==
X-Received: by 2002:adf:e603:: with SMTP id p3mr4972205wrm.360.1616611120085;
        Wed, 24 Mar 2021 11:38:40 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:39 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 02/21] Staging: rtl8723bs: remove enums in hal_com.h
Date: Wed, 24 Mar 2021 19:38:28 +0100
Message-Id: <20210324183847.5595-3-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
include/hal_com.h:

	enum firmware_source

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_com.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 28451385dec3..3629b912698a 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -171,10 +171,6 @@ enum rt_media_status {
 };
 
 #define MAX_DLFW_PAGE_SIZE			4096	/*  @ page : 4k bytes */
-enum firmware_source {
-	FW_SOURCE_IMG_FILE = 0,
-	FW_SOURCE_HEADER_FILE = 1,		/* from header file */
-};
 
 /*  BK, BE, VI, VO, HCCA, MANAGEMENT, COMMAND, HIGH, BEACON. */
 /* define MAX_TX_QUEUE		9 */
-- 
2.30.2

