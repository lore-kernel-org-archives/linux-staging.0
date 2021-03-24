Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DC56D0B
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:47 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x13so25460625wrs.9
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=blV6zKVYHoaDPCa+VZ6c1ek79FSqWhV4ju295svdnF0=;
        b=i6DHev9yjKtD/OVQpFpkXA/o+hRmMn7S6vvTEthBg34PE2Mk79qUXpAE99HbuRgd4k
         HBWtU4UdgyQPo7H3wR9rz5qbmMnrA1Lfb0FVXMfmKq2rIRZPDTsck+qLvX+gzAKwSOH8
         sddWpoDJtq+G7VwwEpbk3fbofrn9OCVgvH13Ia3L2slvpLh7x7AAa7npP5A9ywKMOdSn
         O/YWpm4PMdVdYEuHhFu8qYe6WtXH3WsWVJ5SjQ1iHrRIGf5nlOm52NZWEioNDL+F47qg
         PHOv2TRxODZJhPbRvIg2DEfu+X7Gh/BsQash5uVgDgjMechrdFjbz7dgnutp/8DRX/pX
         Olvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=blV6zKVYHoaDPCa+VZ6c1ek79FSqWhV4ju295svdnF0=;
        b=rl18ed9k/WH/6w/AiFOPHmdXXHbnCerHR6ZvAy8ahmhPy6QEUXPVNQyqxvhzz24Xr8
         +EerTYg5UJOwNIL6I8dDi6PxGkrTSbcdgqUEZnlAQQViJDpv7lGSXi4DnQWv90CrnEKM
         pP+CdWF2ixGkpejLLvVJ6oX5A6/DFEwCM81ySAo3zICCTswIT90JUsHNv5MCTa5h4o3E
         k0uoERaWHm4pTAg4NpqOazHHScctCis7rdQanIzrjQ0K8BXE4FA6IMWfSFk+a+6Knu2d
         7K2g/jlbL3tVU8kjIaX7gg2cf8UJk0UxPAqt7KcoKtp1eokrr85WFvk00Ly3dljglUU6
         7xJg==
X-Gm-Message-State: AOAM533+NWZETtzz0KWBhb/7SrRBVUhSIj49lq1wqn6+8nDFnBex9KhB
	3AfJGhSLJighLeXzoAEbCbI=
X-Google-Smtp-Source: ABdhPJxtf3EdFMbWYuSx3E2PACEDvfHs3J8eEfvniks6kYg0kN6C9gYJa2vA/ycSyevMWVM7fTsSyg==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr4975443wrv.194.1616611126174;
        Wed, 24 Mar 2021 11:38:46 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:46 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 09/21] Staging: rtl8723bs: remove enums in rtw_wifi_regd.h
Date: Wed, 24 Mar 2021 19:38:35 +0100
Message-Id: <20210324183847.5595-10-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
include/rtw_wifi_regd.h:

	enum country_code_type_t

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_wifi_regd.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
index 66bf3d1b1d5a..e611651cb40b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
@@ -8,13 +8,6 @@
 #ifndef __RTW_WIFI_REGD_H__
 #define __RTW_WIFI_REGD_H__
 
-enum country_code_type_t {
-	COUNTRY_CODE_USER = 0,
-
-	/*add new channel plan above this line */
-	COUNTRY_CODE_MAX
-};
-
 void rtw_regd_init(struct wiphy *wiphy,
 		   void (*reg_notifier)(struct wiphy *wiphy,
 					struct regulatory_request *request));
-- 
2.30.2

