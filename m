Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160D0168
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 03:45:10 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id g2so14122240pgo.9
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 19:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tb8ev88MIiS9qrS2N39+coBDw1ZgKiiPgwQGLIy8NO0=;
        b=gh96JrdmAPsc3vo6qQxKFADlpyd8LFLO5olb3vqBrStdF45pW+n0QcSP602gA3hBEU
         vrwHNLqoYKQBonkebuD1MwqDQcyL5qO1lMYU8hbac8rcOJHbhlsZGyKRw+UODPSXTTZx
         yCgf0I0vJxh7/bI1SDb3TmNMuuVdaDWgvo9TTXFDBl/sn+Ncl6wsufslVow0wP9nMiMh
         GxlLJ0NuIIwVTEWrjWm0kcxMfO8saGIbGaCK/ZrHSvfcWFqZsPXknCCsbK6B4Hdk5lqu
         ZYMv5wGvg9DWSvUzW5r5/6l+e2mjtDfIYe6Z15qR9a9yRKBupmIY5i/JLxnWUQeeN4qq
         GgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tb8ev88MIiS9qrS2N39+coBDw1ZgKiiPgwQGLIy8NO0=;
        b=uk8uRzVkaB9pOnROov43EvA3pz8l6aQx8Og6gi8lns7dtFBNdoP6ZHApziPReZ19zZ
         ui5SUCH7yYqO28V1oi6amx65SFxTeq90l/zJhlQm5lvxWeAUwzzlBhXG5Tm2ibYno3en
         IQCq1I5O2Lb90NHUg0SyuMpict4LIfrSG4UcbSibYigfASBGRTm3NrVlmsQbif+QAirR
         +ALS1ylztThqzUcgsnNeuNgCIM1kl7c+vhYVGU8XO2agjWWFSaKNkwOyA/BR833LIPTg
         yq+xVWKcAVAJ4CiHlPDbOr3nSBXyqrraCP7xC+vDlLCN79PqXUPuXP16QWU37HdSt1cx
         IGBA==
X-Gm-Message-State: AOAM532f0iNGJMFeAkJFHBavUZIsd/nh39FOr2Uu4S9dwL14q+rVG31G
	cRDupQifNCUjRtS8NwQHVUbKUmvdq6fDPQ==
X-Google-Smtp-Source: ABdhPJxNnfREXnof87U37sNWFZ2xiV4qj18RlwYBQyDNpnGgxu5CdKxZB8dkppEQ/4BfzAznDv/Y4g==
X-Received: by 2002:a05:6a00:b84:b0:4c8:fe03:94f8 with SMTP id g4-20020a056a000b8400b004c8fe0394f8mr3563911pfj.33.1642995909597;
        Sun, 23 Jan 2022 19:45:09 -0800 (PST)
Received: from localhost.localdomain ([27.7.142.194])
        by smtp.gmail.com with ESMTPSA id p38sm9853390pgb.36.2022.01.23.19.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 19:45:09 -0800 (PST)
From: Jagath Jog J <jagathjog1996@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	marcocesati@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jagathjog1996@gmail.com
Subject: [Patch  3/3] Staging: rtl8723bs: Inserting blank line after declaration
Date: Mon, 24 Jan 2022 09:14:56 +0530
Message-Id: <20220124034456.8665-4-jagathjog1996@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220124034456.8665-1-jagathjog1996@gmail.com>
References: <20220124034456.8665-1-jagathjog1996@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Fix following checkpatch.pl warning by inserting blank line
WARNING: Missing a blank line after declarations

Signed-off-by: Jagath Jog J <jagathjog1996@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 4868a69cdb8f..94ecefb9113d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -181,6 +181,7 @@ void rtw_hal_disable_interrupt(struct adapter *padapter)
 u8 rtw_hal_check_ips_status(struct adapter *padapter)
 {
 	u8 val = false;
+
 	if (padapter->HalFunc.check_ips_status)
 		val = padapter->HalFunc.check_ips_status(padapter);
 
@@ -209,6 +210,7 @@ s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe)
 s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
 	s32 ret = _FAIL;
+
 	update_mgntframe_attrib_addr(padapter, pmgntframe);
 	/* pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET; */
 	/* pwlanhdr = (struct rtw_ieee80211_hdr *)pframe; */
@@ -299,6 +301,7 @@ void rtw_hal_stop_thread(struct adapter *padapter)
 u32 rtw_hal_read_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask)
 {
 	u32 data = 0;
+
 	if (padapter->HalFunc.read_bbreg)
 		 data = padapter->HalFunc.read_bbreg(padapter, RegAddr, BitMask);
 	return data;
@@ -312,6 +315,7 @@ void rtw_hal_write_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask, u32
 u32 rtw_hal_read_rfreg(struct adapter *padapter, u32 eRFPath, u32 RegAddr, u32 BitMask)
 {
 	u32 data = 0;
+
 	if (padapter->HalFunc.read_rfreg)
 		data = padapter->HalFunc.read_rfreg(padapter, eRFPath, RegAddr, BitMask);
 	return data;
@@ -385,6 +389,7 @@ bool rtw_hal_c2h_valid(struct adapter *adapter, u8 *buf)
 s32 rtw_hal_c2h_handler(struct adapter *adapter, u8 *c2h_evt)
 {
 	s32 ret = _FAIL;
+
 	if (adapter->HalFunc.c2h_handler)
 		ret = adapter->HalFunc.c2h_handler(adapter, c2h_evt);
 	return ret;
-- 
2.17.1

