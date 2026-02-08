Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F122D6E4B
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 23:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770591608; cv=none; b=VvsvfkQngPS8ZDN6CxF1DAxLlIxwU3us5oAyYh3r92M36hV3b3iuEj7PAu5IrcFw2MnvlJIXvkQrrqbHJfKrQm4DJnQi5ioLmeyG4Ul/Lj7iujTQKXHtSSG2uXvrhBjjTAbToiNAItzT4Kfuhq6/37aVbqO9sNUvrzvMOJ0fFOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770591608; c=relaxed/simple;
	bh=8boJS24mO3zonbL0BC7pk2a3YxKHZinJCp+u5DPPW3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nv2vC1gahT4Q80M3zWNStkhmd3Qetf7u8Oj69/Hj27+6vtQWBIdCtDPsvb9qVtroTASQmfo9FQ2y4eHjDlPHsNW248ZIrkLZXAogj52JQZboOcOnvT/kQTZb+Ebs+8ki+Wk+AqQz6tDR85UB4qb7+PPZhej3UYH0HlRjMy7MbYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8cZuRgm; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8cZuRgm"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-503075144b7so2475631cf.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 15:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770591607; x=1771196407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OuFF7rxni+/CykSIGc0rWDOU271qI/6cHN6zswBXKuU=;
        b=a8cZuRgmamm9X5tPKUdcK2uozXHo6IkNxS1G6jDWUZen2zzeLCExo/awN1Q20s0Myg
         Gs1PjFMPI50E6qMMgrOWO5/CgGAFdx2riFpuGBttpfgkYgxfMyZdLAYOFjE4Ib46PMTZ
         2UWZSW8ArLQBzzl5LhBulVqxi4e8i2kIVTmp26/0jy+iZQHKDblBtEbXJW8F1kcztJtN
         YwY2iNDpIPFoaSNQc44kU9mYBoTtMUQjaMKO86Hm/ZRaZ+QU5DhxiUHqNWqcwVW0SRng
         +l2oR/o8CnStSDmrR2aBPHsNQ3orQjoginvzZwXVQpgX6RoP855LeqbmIkXT3wMWy9In
         GxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770591607; x=1771196407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuFF7rxni+/CykSIGc0rWDOU271qI/6cHN6zswBXKuU=;
        b=rVWcbyoBW42T6WLBzm6HPqbgthS9zHEXgtMbUKBE6NWrtaQ/uUU+uG5xuyY67pdlcA
         wINPAGhZFcMwAZQa7QAfV827CA5SjuzYHtoNJHTl1uCfQegkNyP7uV+M65PTZneZTWuR
         6/HquiOeFHdm3LM3ZLyflWeE0AwlPQZOZon0j61/tYnzjBILAMmAs4jUVYLSTxqNazIB
         aji/X2WrXZ3dZMeRPZ1NAQUyefOVankKUYkN1DZgnZS0UuSxfNJM6ox1jE7YeeLaZ94K
         iXDtB4/olUpaDOFY8zuhC6QfqJ0NSa6bcWyKZulkqaphhKqvHrpeXVJIeicX1nZuFhys
         mOmg==
X-Gm-Message-State: AOJu0YyANTPUIFW032wQiTthfloMK0FpjuQOJhgyU1wsDEhGPQQs9whO
	Ld/bWZ98/HI1fd1Mwro8mPGpX7GjoOfKiqnNZ0v75PJuOvGywVDnWlh079Ma0g==
X-Gm-Gg: AZuq6aLN0G20A5OdgRp5j4eJAqrCtM9HIsbaq60AW3xXx6S0K6lBR3TYvq7wE2AkKoV
	ZXEyyHVeW0cE85kLJQRqEoEYKGeT2l0vp1eP/wC+77v36I0TpU1Bsg0BNK7CaOmdlYxAVvk776J
	ogPK+OCFSXEuI6ztkJ8NJz9+Do/O1/QGpx60AGDnQs+OswXMd4KOm/A9OvDHrVxy+H9HHJmthJG
	/BxOiwCwYRDyl3M0xjYSz+3oCvvZ7Q2bppI2G/+uRvgCzxpiMV7PSPK5SZ94X1bdqREAAwfdhUR
	vxBWALSzS874MgmHkiTSxRbhIwkEsC3SbVi28M5p1Xp3+WPFA2GFaAbv/Ql/v+J8pKAwdXgwQ0q
	l8epKAxdT2CgKDFc1dL7TBD1f5LV7jagc+qu9udhaamiojDRtujjXSUsz5b633VLzbTsANOF9MD
	aGLkb/FsSntBgVWUvyE6T5nN+3Cg7x5GY9/L6gz4wv/4TIJjFyUPF9eBY1ipiKXsxXBpjWxxgkZ
	zMF
X-Received: by 2002:a05:622a:1654:b0:4ee:2339:a056 with SMTP id d75a77b69052e-506398e8dffmr104893861cf.2.1770591607042;
        Sun, 08 Feb 2026 15:00:07 -0800 (PST)
Received: from localhost.localdomain (host-221-73.ilcu212e.clients.pavlovmedia.net. [68.234.221.73])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392edfd7sm63383781cf.30.2026.02.08.15.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 15:00:06 -0800 (PST)
From: Matthew Marsico <mattmarsico1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matthew Marsico <mattmarsico1@gmail.com>
Subject: [PATCH] staging: rtl8723bs: improve comment placement and readability
Date: Sun,  8 Feb 2026 16:56:48 -0600
Message-ID: <20260208225648.11207-1-mattmarsico1@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move trailing comments onto their own line, preceding
the referenced code, and rework them to improve
readability. No functional change.

Signed-off-by: Matthew Marsico <mattmarsico1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbffeb..fa3b4be11ab2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -174,7 +174,9 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 						set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 					}
 				} else {
-					goto release_mlme_lock;/* it means driver is in WIFI_ADHOC_MASTER_STATE, we needn't create bss again. */
+					/* Driver is already in WIFI_ADHOC_MASTER_STATE, */
+					/* do not create BSS again. */
+					goto release_mlme_lock;
 				}
 			} else {
 				rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_JOINBSS, 1);
@@ -310,7 +312,9 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
 		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
-				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have checked whether issue dis-assoc_cmd or not */
+				/* Will clear Linked_state */
+				/* Disassociation has already been handled above */
+				rtw_indicate_disconnect(padapter);
 		}
 
 		*pold_state = networktype;
-- 
2.52.0

