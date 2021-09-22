Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDBC3FCF
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:06:02 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id w17so10319950wrv.10
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X+dEWMM/zGaE6TM2CitTWll6Tvzxft0TYYb+WjePX1I=;
        b=c37srSmBpa/JZSZ5pPIA0nQ9FGWDlZ8OuG2sbSzK9sZxMjdpGXbOI6inO6LiYJj4kp
         sLI7zVE09Nry7nu0w+XcgjjYk34xYNEwkwsr19Tx6e0ofklLa0GVRmBOuXV3/b4iSzKa
         Wjr1pRz4WfrVVMcIrpGin5LtzAHCY8qK6eeAb7TOoocvZCv87bqqA9DkreBkc6PWxk/R
         s36TPltEjD+6iNeupzfMubvI/hBYytLPQV2+eDOz4cBXrdwxnsXCsc/wkc1hcuiRdYAS
         1hMnEkAZu1FbBweqBn5LisEXBEICvSZ0KR4KIDAyI5rzciCtJhGrfRTc0J8oLgTd5s6Q
         nwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X+dEWMM/zGaE6TM2CitTWll6Tvzxft0TYYb+WjePX1I=;
        b=J90660oDhiTLzTySWRJ8Dfb+dnORhNjLZRhegfDU3FQJ6b02DsYEObcRfKpCYX1YfR
         ipwLytgxU8mZB/CWueh9ATtoUpmRBiPk+qwXE/IUvRksXN8j/YZYLq9yOzODAr83ftiI
         mz/chAXcmGHNW+9k+Y49I2bMuBkxtk/Av7H/CvfJptZ60aFbMiQRdbgeI+LX7PdCu5Qr
         oyqeIah6SFtfoEMveXybls77Z8IG2VInODDGT7haHpajv/vVWiNVwTdVMSBBN/0BYpy3
         VoS9tc5zIGzGexb3Y/hKy5kcBJXITE9WjQahDrO+qNcETGncjlalHx/24tvd4yWehBR8
         Vrbg==
X-Gm-Message-State: AOAM533vkEaU7kLDxhq/iLYVkr1s+U/pAwScYI0MvVHUH/zMMo4eAnHy
	VdubJtmUl6N0iWzVimORuR0=
X-Google-Smtp-Source: ABdhPJwUct/TnzwO51pBxFwC0u4c2ToywlDl3bHqW/jqFm3m3ALLHQMH+VA2EU6sIAdLKdiWhUnzlA==
X-Received: by 2002:a7b:cf2f:: with SMTP id m15mr841214wmg.37.1632341160963;
        Wed, 22 Sep 2021 13:06:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:06:00 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 41/47] staging: r8188eu: remove enum secondary_ch_offset
Date: Wed, 22 Sep 2021 22:04:14 +0200
Message-Id: <20210922200420.9693-42-straube.linux@gmail.com>
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

The enum secondary_ch_offset is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/ieee80211.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index f0d5a640143f..b2b0d8ee903f 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1089,13 +1089,6 @@ enum parse_res rtw_ieee802_11_parse_elems(u8 *start, uint len,
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len,
 		     unsigned char *source, unsigned int *frlen);
 u8 *rtw_set_ie(u8 *pbuf, int index, uint len, u8 *source, uint *frlen);
-
-enum secondary_ch_offset {
-	SCN = 0, /* no secondary channel */
-	SCA = 1, /* secondary channel above */
-	SCB = 3,  /* secondary channel below */
-};
-
 u8 *rtw_get_ie(u8 *pbuf, int index, int *len, int limit);
 
 void rtw_set_supported_rate(u8 *SupportedRates, uint mode);
-- 
2.33.0

