Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA173FC9
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:06:00 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id i23so10504234wrb.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QlPE3RMvxlu4CW/klh/oXgXUKT+PlUcuSMZPFLeDcKk=;
        b=lGkHQXbDhCzBgruzAV6/Bwpb75p2iqxQ/E/9t825lEZNbxTmXsVsfHN7ZRI5EPNiy3
         qHPzaqR7BEDcVMI2sdXnj2YAptFfEkjBzTVFSUJ4XNcLjCQKK+us8a88aJmVgVvlcRhT
         G2kBHtN2Rmr34WjKfs+IfDNyqSFK39QyIbWCWm5KQdZKcNGMU+V8emPH/r7IXAeRdo+4
         n3Oev9hwQ8PVNz7yiNKFImwFLxjWJMG/S74fJsqlxxzjFjLUMn3xs3CY5DIauLsT63NT
         dTwEo2gjz01Qb6LDAvBl9SqNxadQ0f6h4FGJxpHwxzEyFNy6EUx1nGLhTsKhBpwvgxWF
         bjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QlPE3RMvxlu4CW/klh/oXgXUKT+PlUcuSMZPFLeDcKk=;
        b=J2S9qFzN7kmsZYg7E2wW8Ofc7xxxQQ+6bKckH/KDPG7u+U1xHQY9Ouw4DYd5zipkTA
         xOoDvRZQdzuX1u22qSq5infzilW7QWubTRefRWjpnre9qnZxeHyJpjOMSLWmj0FVaotY
         TH4wRIv/XMtgouYu2G5TxAVU+JP8n3JSVBqArEnTPlhdxkwGLdKlvnV4CvyZcytnAI0p
         apD7G1cjAh96sMubcVQycXkBOWBQ12jEFMCCJuqX805SZJSuWKi9X5qE2vs1lNP+mE98
         wCm8UF/U6O+7cUx3tB/m6j0pn0bYngYNm5GWm2aIVymyFqY06zFgUDivec/ywlXbTjut
         odrw==
X-Gm-Message-State: AOAM531yJPC9eGUniIgvHzerz8rtkHK8fJ6fR8xGCfI2ODnA8dpWlo4T
	6/wldsGX6ARLGhCOFFYk0DE=
X-Google-Smtp-Source: ABdhPJwqxFVPWFtIysZe6rRIfbQPZ6Lkgj9RkrgUDdXc41Ohxlk1P2Uho6KkmEvq13CYWqQwjtyG3A==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr849486wmj.33.1632341158710;
        Wed, 22 Sep 2021 13:05:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:58 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 38/47] staging: r8188eu: remove rtw_set_ie_ch_switch()
Date: Wed, 22 Sep 2021 22:04:11 +0200
Message-Id: <20210922200420.9693-39-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_set_ie_ch_switch() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 11 -----------
 drivers/staging/r8188eu/include/ieee80211.h  |  2 --
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index b2a376867c54..06445a4192a0 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -140,17 +140,6 @@ u8 *rtw_set_ie
 	return pbuf + len + 2;
 }
 
-inline u8 *rtw_set_ie_ch_switch(u8 *buf, u32 *buf_len, u8 ch_switch_mode,
-	u8 new_ch, u8 ch_switch_cnt)
-{
-	u8 ie_data[3];
-
-	ie_data[0] = ch_switch_mode;
-	ie_data[1] = new_ch;
-	ie_data[2] = ch_switch_cnt;
-	return rtw_set_ie(buf, WLAN_EID_CHANNEL_SWITCH,  3, ie_data, buf_len);
-}
-
 inline u8 *rtw_set_ie_secondary_ch_offset(u8 *buf, u32 *buf_len, u8 secondary_ch_offset)
 {
 	return rtw_set_ie(buf, WLAN_EID_SECONDARY_CHANNEL_OFFSET,  1, &secondary_ch_offset, buf_len);
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 65e21d5d5b46..ba3b414aae71 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1095,8 +1095,6 @@ enum secondary_ch_offset {
 	SCA = 1, /* secondary channel above */
 	SCB = 3,  /* secondary channel below */
 };
-u8 *rtw_set_ie_ch_switch(u8 *buf, u32 *buf_len, u8 ch_switch_mode,
-			 u8 new_ch, u8 ch_switch_cnt);
 u8 *rtw_set_ie_secondary_ch_offset(u8 *buf, u32 *buf_len,
 				   u8 secondary_ch_offset);
 u8 *rtw_set_ie_mesh_ch_switch_parm(u8 *buf, u32 *buf_len, u8 ttl,
-- 
2.33.0

