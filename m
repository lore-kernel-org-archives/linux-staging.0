Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7496C10EA;
	Thu, 27 Oct 2022 01:26:58 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id b11so67779pjp.2;
        Wed, 26 Oct 2022 18:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GHA4PABhtEK1rXCzmMniG/pV1qITSZAaITYQ81bgOXc=;
        b=oZtRdUiV4y1KcexeIjhm5ZaiRVBbr/CjhTTKej0NGu1CTmnwmXu37d0Y24JHY7HEKt
         7s6XazoTKjYXoD0jedPfTjRl2jwpQHqzet7yg/RjpRRJyOjObRZXttCs4veLT3lIHD86
         C29pmXUHUx7AHZgZH5G/JGnL39YQdSckDLNy5IN/45+EFgSeF/gHH88qdut8K6fQiXC3
         VOaMOo5QbFS3Fnd0ntmFp1ZuMUUURgyHRHi4eJ3H+KC+toON1Pity1aBmGFLZBYVfxfX
         ymSxLypehov09orGq+EaXgAj54GIVn9L35j3wf2mY01wTIHVmKy+upRoqyPhG2h7uSUF
         FUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHA4PABhtEK1rXCzmMniG/pV1qITSZAaITYQ81bgOXc=;
        b=jnUxmBxOsZOqnN9TiR6O0rV35mGm2B2RNKYpegOmmZ9VG5Du73S4V7rRmCByTeUqNI
         +SZdAf2BeOnKwkKMtlEo4/jgk7SKgVEexI3Yq/vR/e82Ua7/tI4J4KdRE2685hfc4M6j
         kECSvPBjByrTteODZ0KmciSpQJf3Jp7bPIACX0DrawACBjZiHBT0laXXzPvBDMvsUYc1
         ogRpDgzqJGHdkKbxqTNMU5YPzmK15WQt1onTMGVrtb1WysaG8sa+6GSV/fD+Nq+VQM78
         3LqK/S+YaDUjwmSBiHPvsR9Ll7BIOdjq+reQLkvnrniQMziaDOJXb6pxAfcfsVxPMRYg
         33wg==
X-Gm-Message-State: ACrzQf3VbfmHFgC6E8Btiogac77FTaKOGUuzVj3EIk8DTnIskgUT+VJV
	fB7fu3/r1jGgbfGRimspY94=
X-Google-Smtp-Source: AMsMyM5iDQZ1vf+K1ir7PueOek+T8gwlbragRmvnz13FTxQqYHuoSKpX0U4SaMmHLduBrvhlMpefGQ==
X-Received: by 2002:a17:90a:b10b:b0:212:fbc3:e623 with SMTP id z11-20020a17090ab10b00b00212fbc3e623mr7386982pjq.5.1666834017847;
        Wed, 26 Oct 2022 18:26:57 -0700 (PDT)
Received: from marshmallow (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id q6-20020a17090a178600b00210c84b8ae5sm7533pja.35.2022.10.26.18.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 18:26:57 -0700 (PDT)
Date: Wed, 26 Oct 2022 18:26:54 -0700
From: Emily Peri <eperi1024@gmail.com>
To: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Replace ternary statement with min
 function
Message-ID: <Y1neXqVYZ8mq8jH+@marshmallow>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ternary statements that pick the min of two values can be replaced by
the built-in min() function. This improves readability, since its quicker
to understand min(x, y) than x < y ? x : y. Issue found by coccicheck.

Signed-off-by: Emily Peri <eperi1024@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 6aeb169c6ebf..0cf7d9f82b83 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1551,7 +1551,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 
 		wps_ie = rtw_get_wps_ie(buf, ielen, NULL, &wps_ielen);
 		if (wps_ie && wps_ielen > 0) {
-			padapter->securitypriv.wps_ie_len = wps_ielen < MAX_WPS_IE_LEN ? wps_ielen : MAX_WPS_IE_LEN;
+			padapter->securitypriv.wps_ie_len = min(wps_ielen, MAX_WPS_IE_LEN);
 			memcpy(padapter->securitypriv.wps_ie, wps_ie, padapter->securitypriv.wps_ie_len);
 			set_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS);
 		} else {
-- 
2.34.1

