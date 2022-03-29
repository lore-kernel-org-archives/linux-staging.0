Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9504F2565;
	Tue, 29 Mar 2022 14:09:07 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id j21so15336500qta.0;
        Tue, 29 Mar 2022 07:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=CadD3hhKKTwQgUWh8yT3Nub3Kin1uglS1pMurhgrLiQ=;
        b=p6ae6wHr5ltI75bmz6MP1kBq3t6Kyi7FA0hKJcpbDRrtN1+emiMtn9q17vk1zBV2zm
         BcTUziWYInXtVko7X6CC21lYmuSiw5tqdXlgZioMJV8YLSV1IMaoESQY+SZDRP7VTlDe
         38WEDcMN8YQQTmP3rVfHU7tJHQ8rbVJo2jq//xwKVDhaObQRGo5Q8ayGyB5ddYCUr8b3
         xRypqXfR/o5Yth4EzO7d+esndkg2Yv4mUxTvlT9ZOmG1HCY1ScQdVreeuOEEMBrXfben
         O21iSGpAkTrNI8F+UpmGqq2MHxUe5RbVa5BuqaGISd5QhIp8Ij/HdP4eey2j+khneDP5
         a5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=CadD3hhKKTwQgUWh8yT3Nub3Kin1uglS1pMurhgrLiQ=;
        b=59gFhQsn37QfVCKSVTEUTIYSXwG6aNihrdNluqnE/+CIMZIIPw/OXkK/JjLidu75iv
         mSWc4u+7/i2SEoEe8hyVvPiX+smNra6uoE9MnCjCGI6E8XMh2VYPt9nGeUqMANGw1qR3
         BECK3q9MEzhd8588WqIx/DxkXSs27vi/iaBuLLxGBSzAIGItBd68pQRm2UqGfo1hcHx7
         s2yHseRTwzN+MWrr+7KJWO+yTDYTvbuXXLQZXloPuZljjq3pynDfA7Ovu+X5m0tcQhWM
         Uoh5OKSdWRRfbgRUVZKhndK3wst9DIdvthgcsbbftH1Ukv1vQ53VS9GPn0ODDlLjNrd1
         2v8A==
X-Gm-Message-State: AOAM5305dB2EdjakjuOSv78AteLUQCMei/LPGNwag5v8fanLBs7R6sOu
	YWIdn63dE62GDjRJxlORk38eab01DQaI7g==
X-Google-Smtp-Source: ABdhPJxGl082pU/FH/JMQ3CRB0DA7rq9puCVcTW9raR8hcfYDGRaDgRVY0o8TZLm0KKmKMEopO7FZg==
X-Received: by 2002:a05:622a:1a8c:b0:2e1:d7b8:5c0d with SMTP id s12-20020a05622a1a8c00b002e1d7b85c0dmr27944510qtc.56.1648562945903;
        Tue, 29 Mar 2022 07:09:05 -0700 (PDT)
Received: from ubuntu ([104.39.252.111])
        by smtp.gmail.com with ESMTPSA id bm1-20020a05620a198100b0047bf910892bsm10194685qkb.65.2022.03.29.07.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 07:09:05 -0700 (PDT)
Date: Tue, 29 Mar 2022 07:09:04 -0700
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Muhammad Usama Anjum <musamaanjum@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: Remove redundant else branches.
Message-ID: <20220329140904.GA3566@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes the following checkpatch.pl warning:

WARNING: else is not generally useful after a break or return

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 32 ++++++++-----------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index b449be537376..27de086903e2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -94,16 +94,14 @@ bool rtw_is_cckratesonly_included(u8 *rate)
 
 int rtw_check_network_type(unsigned char *rate, int ratelen, int channel)
 {
-	if (channel > 14) {
+	if (channel > 14)
 		return WIRELESS_INVALID;
-	} else { /*  could be pure B, pure G, or B/G */
-		if (rtw_is_cckratesonly_included(rate))
-			return WIRELESS_11B;
-		else if (rtw_is_cckrates_included(rate))
-			return	WIRELESS_11BG;
-		else
-			return WIRELESS_11G;
-	}
+	/* could be pure B, pure G, or B/G */
+	if (rtw_is_cckratesonly_included(rate))
+		return WIRELESS_11B;
+	if (rtw_is_cckrates_included(rate))
+		return WIRELESS_11BG;
+	return WIRELESS_11G;
 }
 
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source,
@@ -151,11 +149,10 @@ u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit)
 		if (*p == index) {
 			*len = *(p + 1);
 			return p;
-		} else {
-			tmp = *(p + 1);
-			p += (tmp + 2);
-			i += (tmp + 2);
 		}
+		tmp = *(p + 1);
+		p += (tmp + 2);
+		i += (tmp + 2);
 		if (i >= limit)
 			break;
 	}
@@ -199,9 +196,8 @@ u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, u
 				*ielen = in_ie[cnt+1]+2;
 
 			break;
-		} else {
-			cnt += in_ie[cnt+1]+2; /* goto next */
 		}
+		cnt += in_ie[cnt+1]+2; /* goto next */
 	}
 
 	return target_ie;
@@ -697,9 +693,8 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 			cnt += in_ie[cnt+1]+2;
 
 			break;
-		} else {
-			cnt += in_ie[cnt+1]+2; /* goto next */
 		}
+		cnt += in_ie[cnt+1]+2; /* goto next */
 	}
 
 	return wpsie_ptr;
@@ -748,9 +743,8 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 				*len_attr = attr_len;
 
 			break;
-		} else {
-			attr_ptr += attr_len; /* goto next */
 		}
+		attr_ptr += attr_len; /* goto next */
 	}
 
 	return target_attr_ptr;
-- 
2.25.1

