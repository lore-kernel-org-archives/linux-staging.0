Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F96823CA
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 05:29:28 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id p10so1015051plf.9
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 22:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs-iitr-ac-in.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=SU06F0E/6Ll18cOJ9kDEcDAQxtLOOYiD7ubHubdxNe0=;
        b=3vY0gSvqWMFvxn6KV3wc7Bzm2I95jgL/u+CPyit8Ipnp+Ho2OSB0qKPkOSpzQ/Usm+
         paTwM3ejrn7gx4wl/tf7yBTFm/SWy9Z2liddnk/+CEEYHbwaOUS69rYx7DyBEAArIRTl
         IGV1Syn8DTU/9fgdYcsV4jdg4/vYGmLa/N0+Hkt+CAc9yzBZdR3PedSRKcHeIAsPmIN/
         3CEVkJU33SnNpuvSXsH/pNdfXiCYiO3VhD1b6FQaHsyjaKi2AnJkDY7TADV3vVctMcI2
         KueQkbhkYCwRclPVj5j1k3F4zzhgf+0cM+gJsb4VejpZsYYmPZ4+iYc/RJxYXiOB6OAI
         g67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SU06F0E/6Ll18cOJ9kDEcDAQxtLOOYiD7ubHubdxNe0=;
        b=YG7bJ1KljO8Rn+txO94+ceYakoROyR6L10LNxvS/DbNHZ4lno6vGxM3mg3lVNBgMvY
         1h1BrJSoyPVJJWfLaMor+mSo1knviTsr2qb/JTIFxQ2Dxafaqee/8E8qFm2dJ5hPnZCt
         /BnGldZyr8EsP8XgKdlfJOZ5KXh4IsFDqYB6nTrq2XRm/qsS41U6MZt8x2V1BR2zS/KY
         X2KYnIEZOVGdiicWrxqucG6EYlwDxe4bO1Vg/vqxhz0F2IqzSMFvKnQVjtkJyin/L2Zi
         GVa2us4MgzvV8Qq4n4bkWcCLcq5nSsyKfVu6JTPjaS9C+xgWAVPAmxK73tVREUVoClS7
         Da8Q==
X-Gm-Message-State: AOAM5312RcSDswcuJnUEj0OBrRdpV7vOp0ot8uJoif9CVgq3xAL3Sf/o
	SXunvLgyJrjfaFGJpR+jJP/iYQ==
X-Google-Smtp-Source: ABdhPJyQxQdLowSvjbpYkkU+m4HF90WkJwTriwpzv1EWIMGWILpZ3y5IUSCf5vDKTD7+FXca7wizwg==
X-Received: by 2002:a17:902:8490:b0:156:9846:240 with SMTP id c16-20020a170902849000b0015698460240mr40326932plo.141.1649827768340;
        Tue, 12 Apr 2022 22:29:28 -0700 (PDT)
Received: from mahak-Inspiron-7570.iitr.ac.in ([103.37.201.168])
        by smtp.googlemail.com with ESMTPSA id br10-20020a17090b0f0a00b001cd4fb89d38sm888748pjb.9.2022.04.12.22.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 22:29:27 -0700 (PDT)
From: Mahak Gupta <mahak_g@cs.iitr.ac.in>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: Mahak Gupta <mahak_g@cs.iitr.ac.in>
Subject: [PATCH] staging: r8188eu: remove else after return and break statements
Date: Wed, 13 Apr 2022 10:57:58 +0530
Message-Id: <20220413052759.4859-1-mahak_g@cs.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Else is not necessary after return and break statements, hence remove
it.

Reported by checkpatch:

WARNING: else is not generally useful after a break or return

Signed-off-by: Mahak Gupta <mahak_g@cs.iitr.ac.in>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 41 ++++++++------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 5a0e42ed4a47..bb4c9bc864da 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -97,16 +97,15 @@ bool	rtw_is_cckratesonly_included(u8 *rate)
 
 int rtw_check_network_type(unsigned char *rate, int ratelen, int channel)
 {
-	if (channel > 14) {
+	if (channel > 14)
 		return WIRELESS_INVALID;
-	} else {  /*  could be pure B, pure G, or B/G */
-		if (rtw_is_cckratesonly_included(rate))
-			return WIRELESS_11B;
-		else if (rtw_is_cckrates_included(rate))
-			return	WIRELESS_11BG;
-		else
-			return WIRELESS_11G;
-	}
+	/*  could be pure B, pure G, or B/G */
+	if (rtw_is_cckratesonly_included(rate))
+		return WIRELESS_11B;
+	else if (rtw_is_cckrates_included(rate))
+		return	WIRELESS_11BG;
+	else
+		return WIRELESS_11G;
 }
 
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source,
@@ -160,11 +159,10 @@ u8 *rtw_get_ie(u8 *pbuf, int index, int *len, int limit)
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
@@ -295,10 +293,9 @@ unsigned char *rtw_get_wpa_ie(unsigned char *pie, int *wpa_ie_len, int limit)
 				goto check_next_ie;
 			*wpa_ie_len = *(pbuf + 1);
 			return pbuf;
-		} else {
-			*wpa_ie_len = 0;
-			return NULL;
 		}
+		*wpa_ie_len = 0;
+		return NULL;
 
 check_next_ie:
 		limit_new = limit - (pbuf - pie) - 2 - len;
@@ -558,9 +555,8 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 			cnt += in_ie[cnt + 1] + 2;
 
 			break;
-		} else {
-			cnt += in_ie[cnt + 1] + 2; /* goto next */
 		}
+		cnt += in_ie[cnt + 1] + 2; /* goto next */
 	}
 	return wpsie_ptr;
 }
@@ -604,9 +600,8 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 			if (len_attr)
 				*len_attr = attr_len;
 			break;
-		} else {
-			attr_ptr += attr_len; /* goto next */
 		}
+		attr_ptr += attr_len; /* goto next */
 	}
 	return target_attr_ptr;
 }
@@ -901,9 +896,8 @@ u8 *rtw_get_p2p_ie(u8 *in_ie, int in_len, u8 *p2p_ie, uint *p2p_ielen)
 			if (p2p_ielen)
 				*p2p_ielen = in_ie[cnt + 1] + 2;
 			return p2p_ie_ptr;
-		} else {
-			cnt += in_ie[cnt + 1] + 2; /* goto next */
 		}
+		cnt += in_ie[cnt + 1] + 2; /* goto next */
 	}
 	return NULL;
 }
@@ -948,9 +942,8 @@ u8 *rtw_get_p2p_attr(u8 *p2p_ie, uint p2p_ielen, u8 target_attr_id, u8 *buf_attr
 			if (len_attr)
 				*len_attr = attr_len;
 			break;
-		} else {
-			attr_ptr += attr_len; /* goto next */
 		}
+		attr_ptr += attr_len; /* goto next */
 	}
 	return target_attr_ptr;
 }
-- 
2.17.1

