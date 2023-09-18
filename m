Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9E810E5
	for <linux-staging@lists.linux.dev>; Mon, 18 Sep 2023 16:43:08 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-32163c3ece5so53516f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Sep 2023 09:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695055387; x=1695660187; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ruq6IMO2lTDXcNQxdpreOyS38HS9l5XKxLPIpBNqQNk=;
        b=KEqU0M4UADCeeeYT5ztDanOCW4I3Kpmfp0ji1z0Du1xtOm8qubh/vlloc4WrZB96n3
         5WvuqbX6m9Ir3UAgXS2JNSUrKrT/g+hVasqGKD53Jg6A5rnr6NV+WfiBYdmNMeAyuExC
         uLAZB5dlM69guKt7UzrcoERhAk0hGnxAjV759Lg/lA/E10/xp92JFvfXjTVvmFHs06BY
         +u6QeI9UdP7DpuYi7h+jaOUSSA7BQf9bDaHwSvwaJw5lxWGzSPZYMcK49dTJFlRy6tuD
         nxK0poT5+PktM2hd3uT/x9StFUN0Y1xZgdyldjJrRqzEYtrq4MzZgxLPsLCH6SQ4EgPM
         mlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695055387; x=1695660187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ruq6IMO2lTDXcNQxdpreOyS38HS9l5XKxLPIpBNqQNk=;
        b=diMmg5JsVf+oso8FOQUQO62sNEpldjtNzLTPcFJNeWrGa6DF9i1bMXXDDVU+AL3ClZ
         p30mWZ4NkZlB6lPzDzKi9lCz9x3URV6ncbaEV1Axi34VZV3U49LehyPD5n6DzKZRvBOa
         CdrHTmhow218H2QYEbLPQqr/S/kXLlYxPRkRvP5RxlNkA4A6cAiP4fDhtaepLP2oUr5V
         FVHloKxjAlO/xVPT00aRo8/mD7HN739BFluRc6gYw5gNf+DJWVKekF4szZyAPmvE33bH
         vX+7rXmad18Sx0FWj/XDct35JOVc0usP4NRxb0vkdzpWWoRTRfVISZR++aSdXJ55SLKf
         lQSw==
X-Gm-Message-State: AOJu0YzDXlomi68XfWc85Zr/ZHFrnOuI+vPpsD20nSNNSEdATgHoADGq
	TWE1ylcSCynjkEPqi6XNLXc=
X-Google-Smtp-Source: AGHT+IFPI+l/sh5ZJkDOFkf7/cvVILK9nAx5PDkk9MnFFcbVlcO+ZIQqqW5+6/M+xIJQV71rmF70Yg==
X-Received: by 2002:a5d:484a:0:b0:316:ef5f:7d8f with SMTP id n10-20020a5d484a000000b00316ef5f7d8fmr7602213wrs.3.1695055386501;
        Mon, 18 Sep 2023 09:43:06 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id m12-20020a056000024c00b0031989784d96sm10957489wrz.76.2023.09.18.09.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 09:43:06 -0700 (PDT)
Date: Mon, 18 Sep 2023 18:43:04 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8192e: Fix alignment of structs in rtllib.h
 to two
Message-ID: <3140277dca915a1af9f66b1e7b4b47f5c7f6cd77.1695054044.git.philipp.g.hortmann@gmail.com>
References: <cover.1695054044.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1695054044.git.philipp.g.hortmann@gmail.com>

Fix alignment of structs to even addresses to support all architectures.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309171733.Gl96cmYd-lkp@intel.com/
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 5517b9df65be..7d26910a0b16 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -642,23 +642,23 @@ struct rtllib_authentication {
 	__le16 status;
 	/*challenge*/
 	struct rtllib_info_element info_element[];
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_disauth {
 	struct ieee80211_hdr_3addr header;
 	__le16 reason;
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_disassoc {
 	struct ieee80211_hdr_3addr header;
 	__le16 reason;
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_probe_request {
 	struct ieee80211_hdr_3addr header;
 	/* SSID, supported rates */
 	struct rtllib_info_element info_element[];
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_probe_response {
 	struct ieee80211_hdr_3addr header;
@@ -669,7 +669,7 @@ struct rtllib_probe_response {
 	 * CF params, IBSS params, TIM (if beacon), RSN
 	 */
 	struct rtllib_info_element info_element[];
-} __packed;
+} __packed __aligned(2);
 
 /* Alias beacon for probe_response */
 #define rtllib_beacon rtllib_probe_response
@@ -680,7 +680,7 @@ struct rtllib_assoc_request_frame {
 	__le16 listen_interval;
 	/* SSID, supported rates, RSN */
 	struct rtllib_info_element info_element[];
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_assoc_response_frame {
 	struct ieee80211_hdr_3addr header;
@@ -688,7 +688,7 @@ struct rtllib_assoc_response_frame {
 	__le16 status;
 	__le16 aid;
 	struct rtllib_info_element info_element[]; /* supported rates */
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_txb {
 	u8 nr_frags;
-- 
2.42.0

