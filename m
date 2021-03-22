Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8CC6F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id x16so16819730wrn.4
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7jdgq4PE6Vkcg50nXfudchII0v9bFw/tRIdLoNKNDnI=;
        b=pA5jgN6PO1livjoMmKLlOXMwFvNVLBEo13kIUXVbsyNT4z7KahpqA502Qkq0bC+2zm
         eph4zPZ6bgY8XP4zq6rh6ZGZVCXL126zBxrlKuYdpnJ1q5QO4Mt+lI4J7iANbs6wgBnz
         FGQIK9LRK2XIiW4dzbsPcQEcoiExGyzPHBN0O6tt80GYc/kMCc/pPDkQSIA9VRIN9Mft
         gHgKnhEPFEfe3+3nwJa2hmxPVUjTmcXBAVvKqfYG7lPDaaQbwxp4VmKxbt3v3Q545AP+
         PYkFXOZpNDwN/eAsXnYUjOH6QiwYr4/zNIqCGCr2WSmmzQF8dDE/ctQHz65+psXPFcDl
         azZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7jdgq4PE6Vkcg50nXfudchII0v9bFw/tRIdLoNKNDnI=;
        b=p9+LOhDG3CPYJj6543fU69wyJZugamgvAFiWpuRPF3XXzC3RJN9BpcYkBum6CyFohz
         9sYkoyCCeSu7uDQr2czpp7TZzAWT/MEOk+pF5eiplWgGqBM5mhNTY2rpviMAtAxa9AJH
         sBgwTjASdQkmuTJY+Wo0aKh6dHowGIqhmI02gw1aSvuTYnr5HRL0Ewoa63WOGpJYkTIP
         ThCIpGiwvRkctfi9iQ2kbC2Px3S0Doov2m9ZTvtKGf1tJoou6ot7rbUnVvGPogz7qquC
         8ZsChvYXm8G2w/FpInN2gxPtLNSc3+TaZkD8oWi4/BorUpLhNpJ4hh/TEqgaMw/KkahH
         PMgA==
X-Gm-Message-State: AOAM533bY2MEIInlD9s72HLpyYoJ7AHbZylfGdQ87zWYcQkEhMZDLAop
	KHn6xppCMkZBiYmlx2GUKKY=
X-Google-Smtp-Source: ABdhPJwpgmOE/JDa13ikNZfs4Fets5yd6eOrNNqkojOKS/dkjnWlsXDzEPZqlxKiZDeosoW1rLT8Ag==
X-Received: by 2002:adf:b1de:: with SMTP id r30mr18752539wra.125.1616420235388;
        Mon, 22 Mar 2021 06:37:15 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:15 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 06/19] Staging: rtl8723bs: remove useless structs in wlan_bssdef.h
Date: Mon, 22 Mar 2021 14:37:04 +0100
Message-Id: <20210322133717.17797-7-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct's in include/wlan_bssdef.h:

	struct ndis_802_11_association_information
	struct ndis_802_11_key
	struct ndis_802_11_remove_key

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 .../staging/rtl8723bs/include/wlan_bssdef.h   | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 259835386597..9d63dc003795 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -127,38 +127,12 @@ struct ndis_801_11_ai_resfi {
 	u16 AssociationId;
 };
 
-struct ndis_802_11_association_information {
-	u32                   Length;
-	u16                  AvailableRequestFixedIEs;
-	struct ndis_802_11_ai_reqfi    RequestFixedIEs;
-	u32                   RequestIELength;
-	u32                   OffsetRequestIEs;
-	u16                  AvailableResponseFixedIEs;
-	struct ndis_801_11_ai_resfi    ResponseFixedIEs;
-	u32                   ResponseIELength;
-	u32                   OffsetResponseIEs;
-};
-
 enum ndis_802_11_reload_defaults {
 	Ndis802_11ReloadWEPKeys
 };
 
 
 /*  Key mapping keys require a BSSID */
-struct ndis_802_11_key {
-	u32           Length;             /*  Length of this structure */
-	u32           KeyIndex;
-	u32           KeyLength;          /*  length of key in bytes */
-	NDIS_802_11_MAC_ADDRESS BSSID;
-	unsigned long long KeyRSC;
-	u8           KeyMaterial[32];     /*  variable length depending on above field */
-};
-
-struct ndis_802_11_remove_key {
-	u32                   Length;        /*  Length of this structure */
-	u32                   KeyIndex;
-	NDIS_802_11_MAC_ADDRESS BSSID;
-};
 
 struct ndis_802_11_wep {
 	u32 Length;        /*  Length of this structure */
-- 
2.30.2

