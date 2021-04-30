Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5758E2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 09:53:30 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id g14so22219839edy.6
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 02:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d8rYa6uc2lMrcOYnMsUxtzNfzc4dHA6oZT2T6vUtpxM=;
        b=JYCxRRsmeZwUeuImQ6GjgOoTvXLEiyjGQjbjspl0jWf5cuSeF3n7EoVM2d5sASHdBi
         4jOzo5h8eTlE4WyingaYDxYZgRCo0rCoD71a1bQz5dSlQ1lyBtEcroHBHGyLx42C+54F
         ulxS6ja3X9Vf6yLglEQjq3BFxiAGdzz4LYpmHVN3ipiOaSCPW9Mi5SZ1dUsFGauSx9sB
         AO0SC193b/YcT1bFtyQlnLYvUMqz0WMqxguBh0OezzdXpEW9bvO43MuWHO+CdHuwZWTG
         IadOx/DYLxZaGjwfph5p+ru8yUlt8bdvduXcpPmz7mzZrdWS4YoMtkQ1fXFfEaozDtQB
         HJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d8rYa6uc2lMrcOYnMsUxtzNfzc4dHA6oZT2T6vUtpxM=;
        b=MKXLbg2Jx4+WIC/E5EXxc8uhJ3JMliLtaltC86ki7NLSPMKBqouqGY8ULw73vhMoab
         goPNBiBNWdVPYKLdv3/h/KOUEFWTC2NzqC8tMRh0z3zVLyxGbia+SdiPKgxdp/8FAarr
         VtO8idUm+HlKJ366wHPciCX4e2lC0O9jzI/2GwzWrAJv1FmQnpY5Tparg7YseMQFUBqM
         WkP/F+fjknqzqpdzGMU5LW/CKQKFTIX92yGevhBERgg2MZY5Fb+kpOVHhLGJviNdhHaw
         DdnJCQqq7cxtajqE6iPBWgu68pIExunBdHuRG55sKIvlkWQPKuM2PW0iYH3SIKJWdYzK
         XpEg==
X-Gm-Message-State: AOAM531ILxsJVMev0+hmircahoIUxxI2MpXnj8yq9yHYBTBI1GuI415r
	n2DtXxD09brRZGyKtTR6ZWs=
X-Google-Smtp-Source: ABdhPJydtdabmCx6hBAui52nCvSWUFHSCHT7XdphNM2V6GUHblMsa0egYvxz2FVyJKbu0EmTnm/itw==
X-Received: by 2002:a05:6402:17fc:: with SMTP id t28mr4833221edy.283.1619776408947;
        Fri, 30 Apr 2021 02:53:28 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id f30sm1626861ejl.62.2021.04.30.02.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 02:53:28 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v2 2/2] staging: rtl8723bs: core: Remove set but unused variable
Date: Fri, 30 Apr 2021 11:53:19 +0200
Message-Id: <20210430095319.23226-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430095319.23226-1-fmdefrancesco@gmail.com>
References: <20210430095319.23226-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused variable. Issue detected by gcc.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: As suggested by Dan Carpenter, removed no more needed 
curly braces around single statement blocks.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a2fdd5ea5fc4..4df03f0a1242 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1019,7 +1019,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	u16 capab_info;
 	struct rtw_ieee802_11_elems elems;
 	struct sta_info *pstat;
-	unsigned char 	reassoc, *p, *pos, *wpa_ie;
+	unsigned char 	*p, *pos, *wpa_ie;
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
 	int		i, ie_len, wpa_ie_len, left;
 	unsigned char 	supportRate[16];
@@ -1039,13 +1039,10 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		return _FAIL;
 
 	frame_type = GetFrameSubType(pframe);
-	if (frame_type == WIFI_ASSOCREQ) {
-		reassoc = 0;
+	if (frame_type == WIFI_ASSOCREQ) 
 		ie_offset = _ASOCREQ_IE_OFFSET_;
-	} else { /*  WIFI_REASSOCREQ */
-		reassoc = 1;
+	else /*  WIFI_REASSOCREQ */
 		ie_offset = _REASOCREQ_IE_OFFSET_;
-	}
 
 
 	if (pkt_len < sizeof(struct ieee80211_hdr_3addr) + ie_offset)
-- 
2.31.1

