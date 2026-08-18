Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1582A42123F
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 08:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041623; cv=none; b=kKmjJR4Yri/1FoIVkgobIFOM26SrSqr5vZqoHvoayxM6sfKPELTEBwBrmAQJUaBK0ZIgqMt+mObrU1gxDQK1/9t+re1wvsCCY0TYKEneT0s/5QlgQ1N9BopeEjjb5TdwI8b6His5STSPyNiE1aK4l7RoELtXx2w9d+bs1NcNjx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041623; c=relaxed/simple;
	bh=DdkxBG1efUNekmZLsmzv0eW4BSv7Dzt0M646ZpAiFG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VEYQQzhKwr/S7wsv2fL9uujCXMLdzb5nE2MApPTFVlDprW9GEHYyW5UR6MjsoF9/yFqeof5OLgRbdxoOFR2wxdhzkuuWle/MnzBNHxTAk4VvmIF3PxBLv43NL9NKAInyZ+bvq0q3XJNddKRG1JOzJFTPWMDsl9FZAI+2gFm5Gms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baAPAwra; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baAPAwra"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceb096e675so49089635ad.0
        for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 01:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787041621; x=1787646421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJzBXVHnv2vJbFm56kn0k+bdcitJZTY8a+XW3Ig4bDI=;
        b=baAPAwrarsZ+ROfAyK6WcydYXy7AiSYyRINynXsnUtdT6iREQic9RgSwAXDcmP9Gp1
         aQJIvFjFyostNnAb8u2XtU5onydq8LEqDvOVNxxMgnHhkxzBgPaNOrlZGsAb6/LjCKsD
         TRM8bykokdzJjR/lIp+c7xgnyOWPlf3LVrHEPHE5mBIQNz3RN1T/MExfpbXqwwzHjm+9
         hSjzCZESgVKRiBPADONaqqR7jQ2Ut5vvMUm45TwSvzswzJ83JaLuBbHTfDqJyir4KPR+
         rXfoV/rTt7fRCHWphJIFGgKMbf/Gj4UGQ5WqMBkF0CXUqJLC4wUuuY9KcdNzSrvrIFA8
         dL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041621; x=1787646421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJzBXVHnv2vJbFm56kn0k+bdcitJZTY8a+XW3Ig4bDI=;
        b=fSryXmD4fJPSrLCK+6+4YTv6MYs5qlLzrh+RFdHT8bpSEa/9dXgaHviuDqClS/mqj5
         BY83zDnj8Ma+bcHAboJPJBjXYCptTAnfxLftYwW31U7TPSnTXaWP4K4prPzXC5PWE2b0
         sRvE+C+aV4wbeeS//zFwz5RyEyDA3T51cEdPTOtFYd4WaPQKOpbgB9FU1lJF21ZxkyVA
         YSCxuA9F+aFLI/kWs0seKjL6k6Z7MN7Kv0MuLehF1AhMVNMM/tn/QMhRvKMmdzPqcM75
         2auL5Sl2WzzMZu7HGUU5DiiVQJFl73BCIh1JU49R0FezXmkgH6C2WUU8I5Z/xZux0kcB
         97fw==
X-Gm-Message-State: AOJu0Yzn3ObMb8MfDHzdjxUey3sYcqVWQPAbi4XYKLtBX235FO/FnTzO
	UeoQIGArDPFUCo3beWIreoxdQorIGSCuK/9WXz47THS1bxgveux7jjDJ
X-Gm-Gg: AR+sD11rHUHUlfSgLW/avRpHjqPDNBnOv9KK6FLutWtF4M3D7RbWD8+/3Yqqw/pk/vA
	d8KJCI2VUZBcl62zU2jed+onI+t86xlG/Cnp+ZIPbkvrqH23QiN8DtYINni7BIqrQsd+qSY+/kT
	nHF1fGO8/p0lWuMpd0lgc9WWqCBglU4c5lQKMF5Geaz4k+CSwdjI+/VkSLXzUHL+lOM86z3CTZm
	+2SAVtSxdOyhc+/3tYDA5YYHzfI4Xb0tExQqGA7S1gBYr9f5qwAnCNK9wSxeVXNhd7lf35/rof9
	ZJI9ecnwiHqvXFInxzHleO1kqLzx0L9ywKPT6kcMSwcA82G0Gb8PV/KGKxlzOofS6lpogkZOKLd
	T9W8cQ1R47KJHkz0sRnqcbME8CiL/3zxcTQMYOmUhGrAD6Tcf8zAvmfKedPB8J8Q4ZxcdXcgPm3
	nXbCysz77KAfmMkegTMUvR0wuKp1XWyQhYAOthQab+rqthD6YUBBnybewjewIYmFkTjt1ptiGew
	8dIjtdrzRxWROXo2GWS5wDDTgY=
X-Received: by 2002:a05:6a21:10a:b0:3cb:853e:850e with SMTP id adf61e73a8af0-3cc71b7acbamr41789411637.13.1787041621355;
        Tue, 18 Aug 2026 01:27:01 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm15480740eec.16.2026.08.18.01.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:27:00 -0700 (PDT)
From: Malathi <malathi.a2000@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Malathi <malathi.a2000@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unusual 'NDIS_802_11_RATES_EX' type
Date: Tue, 18 Aug 2026 08:26:22 +0000
Message-ID: <20260818082622.1186194-2-malathi.a2000@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818082622.1186194-1-malathi.a2000@gmail.com>
References: <20260818082622.1186194-1-malathi.a2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'NDIS_802_11_RATES_EX' type and replace the variables of this
type with an array of 'u8', which makes the code more understandable and
gets rid of an unnecessary 'typedef'.

'u8' and the 'unsigned char' the typedef expanded to are the same type and
the array length is unchanged, so there is no functional change. Also
update the comment in wlan_bssdef.h that referred to the removed type.

Signed-off-by: Malathi <malathi.a2000@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 drivers/staging/rtl8723bs/include/wlan_bssdef.h  | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index cb23c6939bfc..61ce0f8708a6 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -253,7 +253,7 @@ struct FW_Sta_Info {
 	u32 status;
 	u32 rx_pkt;
 	u32 retry;
-	NDIS_802_11_RATES_EX  SupportedRates;
+	u8  SupportedRates[NDIS_802_11_LENGTH_RATES_EX];
 };
 
 /*
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 4b14eb0caa03..791eee4e75b3 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -14,8 +14,6 @@
 #define NDIS_802_11_LENGTH_SSID         32
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
-typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
-
 struct ndis_802_11_ssid {
 	u32  ssid_length;
 	u8  ssid[32];
@@ -64,7 +62,7 @@ struct ndis_80211_var_ie {
  * ETH_ALEN + 2 +
  * sizeof (struct ndis_802_11_ssid) + sizeof (u32) +
  * sizeof (long) + sizeof (enum ndis_802_11_network_type) +
- * sizeof (struct ndis_802_11_conf) + sizeof (NDIS_802_11_RATES_EX) + ie_length
+ * sizeof (struct ndis_802_11_conf) + NDIS_802_11_LENGTH_RATES_EX + ie_length
  *
  * Except for ie_length, all other fields are fixed length. Therefore, we can
  * define a macro to present the partial sum.
@@ -160,7 +158,7 @@ struct wlan_bssid_ex {
 	enum ndis_802_11_network_type  network_type_in_use;
 	struct ndis_802_11_conf  configuration;
 	enum ndis_802_11_network_infrastructure  infrastructure_mode;
-	NDIS_802_11_RATES_EX  supported_rates;
+	u8  supported_rates[NDIS_802_11_LENGTH_RATES_EX];
 	struct wlan_phy_info phy_info;
 	u32  ie_length;
 	u8  ies[MAX_IE_SZ];	/* timestamp, beacon interval, and capability information) */
-- 
2.43.0

