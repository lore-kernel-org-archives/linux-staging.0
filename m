Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AF85F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:50 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id 14so2250721wrz.12
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oMnWeNt+8HKY/XcCc061eINq7mLFVa2tXy6YaO07BpY=;
        b=tj02xlASzR5oMaVyzPJ67SwAbtdpHJAhDH7SpjZqQBgY/ff/oMHE3V2O9gWu4jAY7W
         6ddSBsqKR3CEuBLCGbphoc5yWn+xXZftydIP4skG8Ahl/ofG2NBuH3nhuAM1N/d/pZYn
         Rt243nydVDAqF8umfpv9QXh88wvxe5BOhgILguyCe/d/CYcJP4vsdCHtxuMOGKVsMkHS
         EFzA0LPGXijSkCsSLpcav90DWC40jsosuR8OEyHLlYoLbXUn+1YrLUY2GpvjbYtroLYv
         TSnsfbg8+s8GZLtQ/BARCdSiUMb5Lup56MYqZUYLDxJ2f2SST82TqlRBo3VkBbvECHLB
         hbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oMnWeNt+8HKY/XcCc061eINq7mLFVa2tXy6YaO07BpY=;
        b=kgljaIg7WuLYEm1RV5tvGMhx524T4xxTiJ9HoQYMUMdaOs7Z18wWXxdaynZWhjMZqj
         tkzSZ8mbf4lLYFNZPvuknIFMZU9o/yOtU6kqHYFWUBkPPZ2KTxpYD8o3EpYL+d614jap
         J5qZtQoz1E0Z9UFReabdfRsLuitX1bi6axiajvGz5PasYdairtGmICSp2v4AsTtxsj6c
         J2MrFbBcaSRDrREUpjqwzxgRyuoNOXfxYgrdBvEsryaACLubffh8ePyKqift7LdXP1o7
         Ib9qiwRLeL6bzQTZ94vVO6ESoPhgAebX5P3ZcAbJ29LnhhkmgQbXoxaPP6+Mmme7tI8o
         jcQg==
X-Gm-Message-State: AOAM532rOwG5YokjcVainj13eN+yi2MXH1TmFD1q0h6w3T5BruRSYsdC
	DN9MNBPxJjL3msxeLg75G4U=
X-Google-Smtp-Source: ABdhPJyLvhdycNOtGTddn/QY0Sx2S94MeyXPEmbJAwkdOMRY9pn4RvK8+YQ5etRT7TOhMUkw3bXoYQ==
X-Received: by 2002:a05:6000:2c8:: with SMTP id o8mr4935260wry.407.1616611129534;
        Wed, 24 Mar 2021 11:38:49 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:49 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 13/21] Staging: rtl8723bs: remove enums in rtw_xmit.h
Date: Wed, 24 Mar 2021 19:38:39 +0100
Message-Id: <20210324183847.5595-14-marcocesati@gmail.com>
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
include/rtw_xmit.h:

	enum txdesc_sc

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 4d4fa157daa9..73d020cfd0d1 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -83,13 +83,6 @@ do {\
 
 #define TXDESC_OFFSET TXDESC_SIZE
 
-enum txdesc_sc {
-	SC_DONT_CARE = 0x00,
-	SC_UPPER = 0x01,
-	SC_LOWER = 0x02,
-	SC_DUPLICATE = 0x03
-};
-
 #define TXDESC_40_BYTES
 
 struct tx_desc {
-- 
2.30.2

