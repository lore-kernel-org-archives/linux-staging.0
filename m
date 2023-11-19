Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49719BB0
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jb2WIAmG"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32fa4183535so894336f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432078; x=1701036878; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4GBQ+8VOCybaBixFJ4dT3fSyoQYw2g31FmVcURyPmuM=;
        b=jb2WIAmGlnkJVRiIO5ZGkal8hUZj1d8hqel+Ceycrn/YSm4PFXA2vMfzf7fQIvJoAw
         dA7JYurNNVoXj2J7+Qfae401nS4TxlBpUABx/u1n0PizDThSp6EbLp4ZN0bndWyXF4rq
         WIfZle33ZOwBIUVpYYu1RDVBtztMj8O0bA9RvlMN3ss6iU0hWL2BnSWuL63rQ275cERD
         zWJW6i5rfr7aP0F39QmSjUuAsD3luBBWk6523ssPlJ8KNIuiBy9hwO2J39zp6rEGIUH+
         wfgBv7XHqx2CqAMcUOnPQPnh0XIa7kZCyTdtaRarTxaep+wv/w/LRGL066FB/uxYwueF
         spZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432078; x=1701036878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GBQ+8VOCybaBixFJ4dT3fSyoQYw2g31FmVcURyPmuM=;
        b=DhCNxkjPJhXOcufzhaRWoj7X1JJSsdpcePBBHcTYJB/hoqPuN717DYpcJsrP5lbuQU
         TJQu3XRqFEg7wY+n+I/BMiyw8sp8MxwkLsi3kGy3POoO9W/4sEyplOzun8TbE+CoeQa/
         QHo3hIEFXhWTXFDnvpWJfbL5zaVpN2pxp8uSCpXJK0ORSIsHWoEPrjCmSIJZO9lxRIHh
         TE2I3jqLOYJjsgz1aiic/WCr/rocBPireBxvzvomaOLmzDch7408yHa1codlqboqaMKv
         B/UNweGr7h6kSFvLuMP3WtnfaiYhlCjAKMdEEMu8gc2chYAIWh7maAXErpabR3LLamGB
         2oBQ==
X-Gm-Message-State: AOJu0YyPA40WoexGD2yTZwmGR1v04j3OvkWN3VVDQQv8L+xOLHXWEtuC
	lb5txOVQf7tYTajAVkym+WpAuwPZG+s=
X-Google-Smtp-Source: AGHT+IHqraCUCVq10Sx1RbuDHA6IvH9HLv1tm5G2LD9uSOxzqC97kc2D+HbN3v89e5eoSybangA25g==
X-Received: by 2002:a05:600c:4590:b0:40b:2078:b8e4 with SMTP id r16-20020a05600c459000b0040b2078b8e4mr1748962wmo.1.1700432077721;
        Sun, 19 Nov 2023 14:14:37 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id h18-20020a05600c351200b004063ea92492sm11356777wmq.22.2023.11.19.14.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:14:37 -0800 (PST)
Date: Sun, 19 Nov 2023 23:14:36 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] staging: rtl8192e: Remove unexecuted
 rtllib_extract_country_ie()
Message-ID: <7b88c62d3cc5c3fb670b5448c7381c7c099b3518.1700431464.git.philipp.g.hortmann@gmail.com>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

Variable "enabled" is initialized to false and never changed. Therefore
IS_DOT11D_ENABLE(ieee) returns always false. Because of this all code in
rtllib_extract_country_ie() is never executed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 31 ----------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index ecaa4dec3f94..d9517dbc5593 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1663,35 +1663,6 @@ static const char *get_info_element_string(u16 id)
 	}
 }
 
-static inline void rtllib_extract_country_ie(
-	struct rtllib_device *ieee,
-	struct rtllib_info_element *info_element,
-	struct rtllib_network *network,
-	u8 *addr2)
-{
-	if (IS_DOT11D_ENABLE(ieee)) {
-		if (info_element->len != 0) {
-			memcpy(network->CountryIeBuf, info_element->data,
-			       info_element->len);
-			network->CountryIeLen = info_element->len;
-
-			if (!IS_COUNTRY_IE_VALID(ieee)) {
-				if (rtllib_act_scanning(ieee, false) &&
-				    ieee->FirstIe_InScan)
-					netdev_info(ieee->dev,
-						    "Received beacon CountryIE, SSID: <%s>\n",
-						    network->ssid);
-				dot11d_update_country(ieee, addr2,
-						       info_element->len,
-						       info_element->data);
-			}
-		}
-
-		if (IS_EQUAL_CIE_SRC(ieee, addr2))
-			UPDATE_CIE_WATCHDOG(ieee);
-	}
-}
-
 static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 				      struct rtllib_info_element *info_element,
 				      struct rtllib_network *network,
@@ -2146,8 +2117,6 @@ int rtllib_parse_info_param(struct rtllib_device *ieee,
 		case MFIE_TYPE_COUNTRY:
 			netdev_dbg(ieee->dev, "MFIE_TYPE_COUNTRY: %d bytes\n",
 				   info_element->len);
-			rtllib_extract_country_ie(ieee, info_element, network,
-						  network->bssid);
 			break;
 /* TODO */
 		default:
-- 
2.42.0

