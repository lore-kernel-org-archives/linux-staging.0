Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FB81119
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:52:42 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id a36so1958468edf.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=B/LkNIri/1WQtL+Q7NWsRVHWzRnp/SVBkeL4p3lzvpc=;
        b=UmGoUW84f46bOOkqLOrVsz1cuIelpw1AyuKVUsSLOuGDx49DKX2HTCfP9L3NRQfAtw
         nWG0XzxJysDol1nrBVzg11l8wvAsKib0aopEWwPNEvFS+L7bNykbDBdbqcoyACogYaaR
         5Z8+AkYIgYRjGpKDfW7FNOBNoSPhvl6FSyYiY/8bZmVtZDGc7Onnk+YCyqLGNTUIuMNs
         4q2bqwgIz8vXZt+C9m4aa8IQIvpIRbDamSqp+1YzTg0fsfQsw+0cJlTHzMkqNkm5+OvH
         j6zfwlRhigMXrNSgFHON5TrRBgkUEV4KZ7Df0se4QhFJT7s+SCfpi8B6B+dnvn3Pbsi+
         FenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=B/LkNIri/1WQtL+Q7NWsRVHWzRnp/SVBkeL4p3lzvpc=;
        b=OUVBNgcaFeXLkskCynt/YhGE+0DEs59yQkTgqFSt8LjiXpQcv3wug3eMBuyyrXqNPA
         PgO2xGNNSvATRU6gAGjECPRXl2N7V5+lWtjwOuwlgu9SozDznk89OVO8IqawWHqHDtpu
         6bvVHvBy1+4S4g6PT/FtigUW3zBIyjMRkYYyOkFG36X0TXb/Wqo71LP29JBFJuXBw+2E
         kQgNOp8r9qKSjcYYTDxZWHgW8zA/gcu91FTt2HcdOfT7IrKWjQKzbybep2/kua3Rry63
         9jtNuoefQeaMHzIUINcT7hB+/X5abGMalc402O1/hmzdmEwXizVOpPR2APF/3V4oR+m5
         aqJg==
X-Gm-Message-State: ACgBeo2tdNPsufItf+ahUpy3jQwzPB1aW/oEf085ks4cGt6aMCFefzkD
	qU4DOR1hvzIqTIp0E+bp6PE=
X-Google-Smtp-Source: AA6agR40Enx2VtA1BLjCCmzHZy2HEipEPMqS4wC6H84sCs4J8CSggN68CqgbJCTcJcSaTw52twxEIQ==
X-Received: by 2002:a05:6402:f1d:b0:44a:ec16:df56 with SMTP id i29-20020a0564020f1d00b0044aec16df56mr5793191eda.74.1662112361386;
        Fri, 02 Sep 2022 02:52:41 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-83.ip.prioritytelecom.net. [217.105.46.83])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b0073d6234ceebsm959601ejx.160.2022.09.02.02.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:52:41 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/10] staging: rtl8723bs: remove rtw_is_wps_ie
Date: Fri,  2 Sep 2022 11:52:00 +0200
Message-Id: <69f128559008c94e29eab511a92964810688288e.1662111799.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662111798.git.namcaov@gmail.com>
References: <cover.1662111798.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function rtw_is_wps_ie because it is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 17 -----------------
 drivers/staging/rtl8723bs/include/ieee80211.h  |  1 -
 2 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 68e41d99679d..3d8a64f69448 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -634,23 +634,6 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 	}
 }
 
-u8 rtw_is_wps_ie(u8 *ie_ptr, uint *wps_ielen)
-{
-	u8 match = false;
-	u8 eid, wps_oui[4] = {0x0, 0x50, 0xf2, 0x04};
-
-	if (!ie_ptr)
-		return match;
-
-	eid = ie_ptr[0];
-
-	if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&ie_ptr[2], wps_oui, 4))) {
-		*wps_ielen = ie_ptr[1]+2;
-		match = true;
-	}
-	return match;
-}
-
 /**
  * rtw_get_wps_ie - Search WPS IE from a series of IEs
  * @in_ie: Address of IEs to search
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 1e627dc0044d..9041d8dc5fb1 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -746,7 +746,6 @@ int rtw_parse_wpa2_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwi
 
 void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len);
 
-u8 rtw_is_wps_ie(u8 *ie_ptr, uint *wps_ielen);
 u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen);
 u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr);
 u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content);
-- 
2.25.1

