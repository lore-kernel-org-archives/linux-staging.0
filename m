Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A30B1841;
	Wed, 20 Apr 2022 12:23:31 +0000 (UTC)
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-e5c42b6e31so1711328fac.12;
        Wed, 20 Apr 2022 05:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=TIUNz0EBmXcqRPlOdyGN4ICv5GdtKevGFMV0dTVCKRM=;
        b=KN1EH+ZkU67vRFXgDO4xfqUjsgFZyKpCOMKnhjRkjH16Co9PlrgjbBEy9UTyOLeelA
         BGzYm53QGEti6u/01jPf2J8shH0+mxiJ5IrtOsWmul23Wl1NXQKn0U7MLdEs8YqUExF/
         YlmLgtWchtqGNs5FMe7MNnrGWjh4sf8woOiql6m1NlDZG5y+gVAvno9hT/9tJBYCvh1F
         lNegr90SmksTyexOtEt4VVCnDy1af3PNP3MYZc/FdPy/JSj25LqEdbi60G0PSWLqjSsr
         Q2s8R9l2Vpfw/KXhycFZM3XbMkCBSU1hLhdtOlUeTOeL2BQaTWbvVebKwA7rbDLwx8q7
         sw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=TIUNz0EBmXcqRPlOdyGN4ICv5GdtKevGFMV0dTVCKRM=;
        b=Nth+o8ztIXR8LGIzKtWUpz5qwI6QQA7u5P+wTq/MxhyrvrGwcp3t5fSpRrjFzyuRFD
         QvgTASqwyXSLMQ3N8VCGiBJohNwe+1DfgNR9sk6d8HhnaKxrX+BJH6+iDmdGeURKpW6O
         2o8ClELha8YkhR984r0xbqKpJJiDUmjoYXLct4uN4FMQiW1yyl6M2wOG6eNryUHIsXcq
         ua8L0HdbAdQVAw1NXnaOyLcLPk1iH+snh1KsEsCB80ZjjHyEpCxZhyur1U3vESjat9oW
         3Tm/RyDF7AAGCJNzBTSReBtdnB2ftdibtYxhUXfcIBagH6z0aQ6HfLeE0yUSNC4rS9Y/
         YeYg==
X-Gm-Message-State: AOAM531ZFgP7W0/UpgXHnRwDsJcnwdpVEuoKdwgw7KoVLKyHqEUQzTjh
	y0tiUE4eL4X++T2pczIkG6RHIjatpRKcHA==
X-Google-Smtp-Source: ABdhPJwfZfjdD7QWExbNx3daNAWGm7vWiwN/GrOXV6HfntYFHwxdgyn3VeFjMqXaPJJKA284z7plkg==
X-Received: by 2002:a05:6870:c151:b0:e5:bf64:38d with SMTP id g17-20020a056870c15100b000e5bf64038dmr1389721oad.8.1650457410282;
        Wed, 20 Apr 2022 05:23:30 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id q13-20020a4ab3cd000000b0032830efe365sm6541879ooo.43.2022.04.20.05.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 05:23:29 -0700 (PDT)
Date: Wed, 20 Apr 2022 07:23:28 -0500
From: Rebecca Mckeever <remckee0@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8192u: change get_key functions to return 0
 instead of -1
Message-ID: <Yl/7QPKXer7YtXOs@bertie>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Currently, these three get_key functions return -1 when the provided len
value is less a specific key length value, which can result in buffer
overflow depending on how the returned value is used. These functions are
used in three places in ieee80211/ieee80211_wx.c:

  ieee80211_wx_get_encode() :
    The behavior of this function will be unchanged.

  ieee80211_wx_get_encode_ext() :
    The result of the get_key function is written to ext->key_len,
    resulting in a buffer overflow if the result is negative.

  ieee80211_wx_set_encode() :
    The behavior of this function will change. When len is less than the
    key length value, it will set a default key of all 0.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_ccmp.c | 2 +-
 drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c | 2 +-
 drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_wep.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_ccmp.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_ccmp.c
index 101c28265e91..f17d07dad56d 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_ccmp.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_ccmp.c
@@ -362,7 +362,7 @@ static int ieee80211_ccmp_get_key(void *key, int len, u8 *seq, void *priv)
 	struct ieee80211_ccmp_data *data = priv;
 
 	if (len < CCMP_TK_LEN)
-		return -1;
+		return 0;
 
 	if (!data->key_set)
 		return 0;
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
index 689d8843f538..7b120b8cb982 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
@@ -637,7 +637,7 @@ static int ieee80211_tkip_get_key(void *key, int len, u8 *seq, void *priv)
 	struct ieee80211_tkip_data *tkey = priv;
 
 	if (len < TKIP_KEY_LEN)
-		return -1;
+		return 0;
 
 	if (!tkey->key_set)
 		return 0;
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_wep.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_wep.c
index 8a51ea1dd6e5..a2cdf3bfd1a4 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_wep.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_wep.c
@@ -201,7 +201,7 @@ static int prism2_wep_get_key(void *key, int len, u8 *seq, void *priv)
 	struct prism2_wep_data *wep = priv;
 
 	if (len < wep->key_len)
-		return -1;
+		return 0;
 
 	memcpy(key, wep->key, wep->key_len);
 
-- 
2.32.0

